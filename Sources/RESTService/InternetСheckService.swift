//
//  InternetСheckService.swift
//  
//
//  Created by Senior Developer on 10.09.2022.
//
import Foundation
import AlertService
import Reachability

final public class InternetСheckService {
    
    private let alertService = AlertService()
    
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
                alertService.default(title: "Ошибка", message: "Нет интернета")
                return false
            default:
                alertService.default(title: "Ошибка", message: "Нет интернета")
                return false
        }
    }
    static func check() -> Bool {
        let reachability = try? Reachability()
        let alertService = AlertService()
        switch reachability?.connection {
            case .cellular:
                print("cellular")
                return true
            case .wifi:
                print("wifi")
                return true
            case .unavailable:
                alertService.default(title: "Ошибка", message: "Нет интернета")
                return false
            default:
                alertService.default(title: "Ошибка", message: "Нет интернета")
                return false
        }
    }
}
