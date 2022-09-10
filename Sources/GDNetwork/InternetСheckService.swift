//
//  InternetСheckService.swift
//  
//
//  Created by Senior Developer on 10.09.2022.
//
import Foundation
import Reachability

final public class InternetСheckService {
    
    public func check() -> Bool {
        let reachability = try? Reachability()
        switch reachability?.connection {
            case .cellular:
                print("cellular")
                return true
            case .wifi:
                print("wifi")
                return true
            case .unavailable:
                AlertService.shared.default(title: .error, message: .noNetwork)
                return false
            default:
                AlertService.shared.default(title: .error, message: .noNetwork)
                return false
        }
    }
    static func check() -> Bool {
        let reachability = try? Reachability()
        switch reachability?.connection {
            case .cellular:
                print("cellular")
                return true
            case .wifi:
                print("wifi")
                return true
            case .unavailable:
                AlertService.shared.default(title: .error, message: .noNetwork)
                return false
            default:
                AlertService.shared.default(title: .error, message: .noNetwork)
                return false
        }
    }
}
