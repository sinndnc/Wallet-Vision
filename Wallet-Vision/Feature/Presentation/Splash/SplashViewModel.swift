//
//  SplashViewModel.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import Foundation


final class SplashViewModel : ObservableObject {
    
    @Published var isAuthenticated : Bool = false
    @Inject private var faceIDService : FaceIDServiceProtocol
    
    init() {
        faceIDService.authenticate{ result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async{
                    self.isAuthenticated.toggle()
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
}
