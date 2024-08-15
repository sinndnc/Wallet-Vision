//
//  DIPropertyWrapper.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import Foundation




@propertyWrapper
struct Inject<Inject> {
    
    var inject: Inject
    
    init(_ dependencyType: DIInjectType = .newInstance) {
        guard let inject = DIInjectContainer.resolve(dependencyType: dependencyType, Inject.self) else {
            fatalError("No dependency of type \(String(describing: Inject.self)) registered!")
        }
        self.inject = inject
    }
    
    var wrappedValue: Inject {
        get { self.inject }
        mutating set { inject = newValue }
    }
}
