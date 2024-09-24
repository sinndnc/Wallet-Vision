//
//  Data+Extension.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 18.09.2024.
//

import Foundation

extension Data {
    
    func toNetwork() -> Network {
        let decoder = JSONDecoder()
        let network = try? decoder.decode(Network.self, from: self)
        print(network)
        return network ?? MainNetworks.ethereum
    }
}
