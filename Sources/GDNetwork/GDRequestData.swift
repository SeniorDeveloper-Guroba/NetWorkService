//
//  GDRequestData.swift
//  
//
//  Created by Senior Developer on 16.09.2022.
//
import Foundation

public protocol GDRequestData {
    
    associatedtype ReturnDecodable: Decodable
    
    var url        : URL               { get }
    var body       : Data?             { get set }
    var parameters : [String: String]? { get set }
    var header     : Header            { get }
    var httpMethod : HTTPMethod        { get }
    var returnType : ReturnType        { get }
}

public enum ReturnType {
    case json
    case data
}
