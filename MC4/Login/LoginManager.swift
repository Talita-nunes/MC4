//
//  LoginManager.swift
//  MC4
//
//  Created by Marcelo Perassi on 13/12/21.
//

import Foundation
import AuthenticationServices

class LoginManager: NSObject, ASAuthorizationControllerDelegate {
    // Singleton
    static let shared = LoginManager()
    private override init() {}
    
    var settings: LoginSettings?
    
    // MARK: - errors
    enum LoginManagerError: Error, LocalizedError {
        case loginFailure
        case credentialFailure
        
        public var errorDescription: String? {
            switch self {
            case .loginFailure:
                return "Erro ao tentar entrar com suas credenciais. Em ajuste clique na sua foto, vá em \"Senhas e Segurança > Apps que usam seu ID Apple\" e remova o acesso deste aplicativo e tente fazer login novemnte"
            case .credentialFailure:
                return "Oooops... Erro interno com suas credenciais. Em ajuste clique na sua foto, vá em \"Senhas e Segurança > Apps que usam seu ID Apple\" e remova o acesso deste aplicativo e tente fazer login novemnte"
            }
        }
    }
    
    // Método de callback usado pela tela de login quando chama o método de logar pela Apple
    private var completion: ((Result<User, Error>) -> ())?
    
    func logout() {
        // Garantia que a alteração de uma variábel Published será executada na thread principal
        DispatchQueue.main.async {
            self.settings?.loggedIn = false
            self.settings?.user = nil
        }
    }
    
    func signInWithApple(completionHandler: @escaping (Result<User, Error>) -> () ) -> Void {
        self.completion = completionHandler
        // 1. Instantiate the AuthorizationAppleIDProvider
        let provider = ASAuthorizationAppleIDProvider()
        // 2. Create a request with the help of provider - ASAuthorizationAppleIDRequest
        let request = provider.createRequest()
        // 3. Scope to contact information to be requested from the user during authentication.
        request.requestedScopes = [.fullName, .email]
        // 4. A controller that manages authorization requests created by a provider.
        let controller = ASAuthorizationController(authorizationRequests: [request])
        // 5. Delegate
        controller.delegate = self
        // 6. Initiate the authorization flows.
        controller.performRequests()
    }

    // MARK: - Authorization Delegate
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIdCredential as ASAuthorizationAppleIDCredential:
            if let _ = appleIdCredential.email, let _ = appleIdCredential.fullName {
                registerNewUser(credential: appleIdCredential)
            } else {
                signInExistingUser(credential: appleIdCredential)
            }
            break
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        self.sendError(error: LoginManagerError.credentialFailure)
    }
    
    func delete(completion: @escaping (Result<User, Error>)->()) {
        if let user = self.settings?.user {
            self.completion = completion
            UserManager.delete(user: user) { result in
                do {
                    self.sendSuccess(user: try result.get())
                    // 1. Instantiate the AuthorizationAppleIDProvider
                    let provider = ASAuthorizationAppleIDProvider()
                    // 2. Create a request with the help of provider - ASAuthorizationAppleIDRequest
                    let request = provider.createRequest()
                    // 3. Scope to contact information to be requested from the user during authentication.
                    request.requestedOperation = .operationLogout
                    // 4. A controller that manages authorization requests created by a provider.
                    let controller = ASAuthorizationController(authorizationRequests: [request])
                    // 5. Delegate
                    controller.delegate = self
                    // 6. Initiate the authorization flows.
                    controller.performRequests()
                } catch {
                    self.sendError(error: error)
                }
            }
        }
    }
    
    // MARK: Login com CloudKit
    
    // Método chamado quando o usuário faz login pela primeira vez cria um usuário novo no sistema
    // TODO: Se o usuário cancelar o sign in with Apple e fizer login novamente irá perder todos os dados. É importante ver se o e-mail já existe e se existir, trocar o ID do login no CloudKit
    private func registerNewUser(credential: ASAuthorizationAppleIDCredential) {
        let user = User.parse(credentials: credential)
        UserManager.modify(user: user) { result in
            do {
                self.sendSuccess(user: try result.get())
            } catch {
                UserManager.save(user: user) { result in
                    do {
                        self.sendSuccess(user: try result.get())
                    } catch {
                        self.sendError(error: LoginManagerError.loginFailure)
                    }
                }
            }
        }
    }
    
    // Método chamado quando o usuário faz login e já está autorizado, neste caso as credenciais não contém os dados necessários, por isso é necessário buscar no CloudKit
    private func signInExistingUser(credential: ASAuthorizationAppleIDCredential) {
        UserManager.fetch(userId: credential.user) { result in
            do {
                self.sendSuccess(user: try result.get())
            } catch {
                self.sendError(error: LoginManagerError.loginFailure)
            }
        }
    }
    
    
    private func sendSuccess(user: User) {
        // Garantia que a alteração de uma variábel Published será executada na thread principal
        DispatchQueue.main.async {
            self.settings?.user = user
            self.completion?(.success(user))
            self.completion = nil
        }
    }
    
    
    private func sendError(error: Error) {
        // Garantia que a alteração de uma variábel Published será executada na thread principal
        DispatchQueue.main.async {
            self.settings?.user = nil
            self.settings?.loggedIn = false
            self.completion?(.failure(error))
            self.completion = nil
        }
    }
}

