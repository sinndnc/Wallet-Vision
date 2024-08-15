//
//  DIInjectContainer.swift
//  Wallet-Vision
//
//  Created by Sinan Dinç on 15.08.2024.
//

import Foundation

class DIInjectContainer{
    
      private static var cache: [String: Any] = [:]
      private static var generators: [String: () -> Any] = [:]
    
    
    static func register<Inject>(
        type: Inject.Type,
        as serviceType: DIInjectType = .automatic,
        _ factory: @autoclosure @escaping () -> Inject
    ) {
        generators[String(describing: type.self)] = factory
        
        if serviceType == .singleton {
            cache[String(describing: type.self)] = factory()
        }
    }
    
    
    static func resolve<Inject>(
        dependencyType: DIInjectType = .automatic,
        _ type: Inject.Type
    ) -> Inject? {
        let key = String(describing: type.self)
        switch dependencyType {
        case .singleton:
            if let cachedService = cache[key] as? Inject {
                return cachedService
            } else {
                fatalError("\(String(describing: type.self)) is not registeres as singleton")
            }
        case .automatic:
            if let cachedService = cache[key] as? Inject {
                return cachedService
            }
            fallthrough
        case .newInstance:
            if let service = generators[key]?() as? Inject {
                cache[String(describing: type.self)] = service
                return service
            } else {
                return nil
            }
        }
    }
}
