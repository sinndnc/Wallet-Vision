//
//  NFCService.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import Foundation
import CoreNFC


final class NFCService : NSObject , NFCServiceProtocol {

    var session: NFCNDEFReaderSession?
    
    
    func beginScanning() {
        guard NFCNDEFReaderSession.readingAvailable else {
            print("NFC is not available on this device.")
            return
        }
        
        session = NFCNDEFReaderSession(delegate: self, queue: .main, invalidateAfterFirstRead: false)
        session?.alertMessage = "Hold your iPhone near the NFC tag."
        session?.begin()
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: any Error) {
        print("Session invalidated: \(error.localizedDescription)")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        for message in messages {
            for record in message.records {
                if let string = String(data: record.payload, encoding: .utf8) {
                    print("NFC Tag Content: \(string)")
                }
            }
        }
        session.invalidate()
    }
    
    func readerSessionDidBecomeActive(_ session: NFCNDEFReaderSession) {
        print(session.description)
    }
    
    
    
    
}
