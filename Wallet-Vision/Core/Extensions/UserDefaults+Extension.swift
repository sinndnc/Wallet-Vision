//
//  UserDefaults+Extension.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 18.09.2024.
//

import Foundation

extension UserDefaults{
    
    
    var activeNetwork : Network {
        get{
            let data = data(forKey: Preferences.activeNetwork) ?? Data()
            let decoder = JSONDecoder()
            let network = try? decoder.decode(Network.self, from: data)
            print(network,"get")
            return network ?? MainNetworks.ethereum
        }
        set{
            let encoder = JSONEncoder()
            let network = try? encoder.encode(newValue)
            print(network,"set")
            self.set(network, forKey: Preferences.activeNetwork)
        }
    }
    
    func registerDefaultValue<T:Any>(_ value : T,key: String) {
        set(value, forKey: key)
    }
    
}
