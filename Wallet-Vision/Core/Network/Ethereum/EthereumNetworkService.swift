//
//  NetworkService.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 23.08.2024.
//

import SwiftUI

protocol NetworkServiceProtocol {
    
    func connectToNetwork()
    
}

struct NetworkService : NetworkServiceProtocol {
    
    public var RPCURl : String
    
    
    init(RPCURl: String) {
        self.RPCURl = RPCURl
    }
    
    
    func connectToNetwork() {
        guard let clienturl = URL(string: RPCURl) else { return }
        
        //let web3 = try! Web3(rpcURL: clienturl.absoluteString)

    }
    
    
    
    
    
}
