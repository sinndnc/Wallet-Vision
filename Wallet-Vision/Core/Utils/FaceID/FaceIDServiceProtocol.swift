//
//  FaceIDServiceProtocol.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import Foundation
import LocalAuthentication

protocol FaceIDServiceProtocol {
    
    var context : LAContext { get set }
    var error : NSError? { get set }
    
    func authenticate(onCompletionHandler: @escaping (Result<Bool,Error>) -> Void) 
}
