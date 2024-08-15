//
//  NFCServiceProtocol.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import Foundation
import CoreNFC

protocol NFCServiceProtocol : NFCNDEFReaderSessionDelegate {
    
    func beginScanning()
    
    
}
