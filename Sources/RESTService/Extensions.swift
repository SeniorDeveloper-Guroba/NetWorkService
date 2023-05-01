//
//  Extensions.swift
//  
//
//  Created by Senior Developer on 15.09.2022.
//

import Foundation

//MARK: - Others
extension String {
    
    public enum HTTPMethods : String {
        case post  = "POST"
        case get   = "GET"
        case patch = "PATCH"
        case put   = "PUT"
    }
}

extension Dictionary where Iterator.Element == (key: String, value: String) {
    
    func createQueryItems() -> [URLQueryItem] {
        let result = self.map { URLQueryItem(name: $0, value: $1) }
        return result
    }
}

extension URL {
    
    public func create(dictionary: [String: String]?) -> URL? {
        var components = URLComponents()
        components.scheme     = self.scheme
        components.host       = self.host
        components.path       = self.path
        components.queryItems = dictionary?.createQueryItems()
        guard let url = components.url else {
            fatalError("Error URL no url")
        }
        return url
    }

}
