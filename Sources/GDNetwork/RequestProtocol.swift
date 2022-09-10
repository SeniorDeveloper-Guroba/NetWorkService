//
//  RequestProtocol.swift
//  
//
//  Created by Senior Developer on 10.09.2022.
//
import Foundation

public protocol RequestProtocol {
    
    func request(data: Any?, completion: @escaping ClosureRequest)
}

