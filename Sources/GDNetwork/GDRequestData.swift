//
//  GDRequestData.swift
//  
//
//  Created by Senior Developer on 16.09.2022.
//
import Foundation

public protocol GDRequestData {
    
    associatedtype ReturnDecodable: Decodable
    
    var url        : URL { get }
    var body       : Data?  { get }
    var header     : Header { get }
    var httpMethod : String.HTTPMethod { get }
}
