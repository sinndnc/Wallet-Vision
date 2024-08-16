//
//  FaceIDService.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import Foundation
import LocalAuthentication

final class FaceIDService : FaceIDServiceProtocol{
    
    internal var error: NSError?
    internal var context: LAContext = LAContext()
    
    func authenticate(onCompletionHandler: @escaping (Result<Bool,Error>) -> Void)  {
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                
                if let authenticationError = authenticationError{
                    print(authenticationError)
                    onCompletionHandler(.failure(authenticationError))
                }
                
                if success {
                    print(success)
                    onCompletionHandler(.success(true))
                }
            }
        } else {
            print("no biometrics")
            onCompletionHandler(.success(false))
        }
    }
    
}
