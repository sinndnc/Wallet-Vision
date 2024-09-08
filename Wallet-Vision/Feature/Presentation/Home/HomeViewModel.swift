//
//  HomeViewModel.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import Foundation

final class HomeViewModel : ObservableObject {
    
    @Inject var nfcService : NFCServiceProtocol
    
    @Inject var faceId : FaceIDServiceProtocol 
    
    
}
