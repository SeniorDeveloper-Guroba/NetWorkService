//
//  SessionProtocol.swift
//  
//
//  Created by Senior Developer on 15.09.2022.
//
import Combine
import Foundation

public protocol GDSessionProtocol {
    
    func session(url: URL?, body: Data?, httpMethod: HTTPMethod, header: Header?, completion: @escaping ClosureSession)
}

public extension GDSessionProtocol {
    
    func session(url: URL?, body: Data? = nil, httpMethod: HTTPMethod, header: Header? = nil, completion: @escaping ClosureSession){
        guard let url = url else {
            fatalError("Error URL \(url?.absoluteString ?? "no url")")
        }
        var request   = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = header
        request.httpBody = body
        //Request responce
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            //error return response
            if let error = error {
                completion(.error(error))
                //data return response
            } else {
                guard let data = data else { return }
                print(response?.url?.absoluteString as Any, "Sessionoble response URL absoluteString")
                completion(.data(data))
            }
        }.resume()
    }
    
    func session(url: URL?, body: Data? = nil, httpMethod: HTTPMethod, header: Header? = nil) throws -> AnyPublisher<Data, Error> {
        guard let url = url else {
            throw RequestError.responseInvalid
        }
        var request                 = URLRequest(url: url)
        request.httpMethod          = httpMethod.rawValue
        request.allHTTPHeaderFields = header
        request.httpBody            = body
        
        return URLSession.shared.dataTaskPublisher(for: request)
        
            .tryMap { data, response -> (Data, HTTPURLResponse) in
                if let httpResponse = response as? HTTPURLResponse {
                    return (data, httpResponse)
                } else {
                    throw RequestError.responseInvalid
                }
            }
            .tryMap { data, response -> Data in
                if (200..<300).contains(response.statusCode) {
                    return data
                } else {
                    throw RequestError.responseInvalid
                }
            }.eraseToAnyPublisher()
    }
    
    @available(iOS 15.0, *)
    func session(url: URL?, body: Data? = nil, httpMethod: HTTPMethod, header: Header? = nil) async throws -> Data {
        
        guard let url = url else {
            throw RequestError.responseInvalid
        }
        var request                 = URLRequest(url: url)
        request.httpMethod          = httpMethod.rawValue
        request.allHTTPHeaderFields = header
        request.httpBody            = body
        do {
            let (data, httpResponse) = try await URLSession.shared.data(for: request)
            
            if let response = httpResponse as? HTTPURLResponse, (200..<300).contains(response.statusCode) {
                return data
            } else {
                throw RequestError.responseInvalid
            }
            
        } catch let error {
            throw error
        }
    }
    
    
}

enum RequestError: LocalizedError {
    case urlInvalid
    case requestInvalid
    case responseInvalid
    case internetUnavailable
}
