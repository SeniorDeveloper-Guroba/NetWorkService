//
//  GDRequestProtocol.swift
//  
//
//  Created by Senior Developer on 15.09.2022.
//
import Foundation

public protocol GDRequestProtocol: AnyObject, GDSessionProtocol {
    
   
}

public extension GDRequestProtocol {
    
    func request<T:GDRequestData>(requestData: T, completionRequest: @escaping Closure<RequestResult>) {
        let internetСheck  = InternetСheckService()
        let decoderService = JSONDecoderService()
        let groupSession   = DispatchGroup()
        var sessionData    : Data?
        //1 - Testing internet
        guard internetСheck.check() else { return }
        //2 - Creating URL, Header, Body, Parameters
        let body       = requestData.body
        let url        = requestData.url
        let header     = requestData.header
        let httpMethod = requestData.httpMethod
        //3 - Geting data
        groupSession.enter()
        session(url: url, body: body, httpMethod: httpMethod, header: header) { sessionResult in
            switch sessionResult {
                // Error
                case .error(let error):
                    print(error!.localizedDescription, "Error JSONDecode get from Server \(String(describing: Self.self))")
                    print(#function, #line, #file)
                    completionRequest(.error(error))
                // Success
                case .data(let data):
                    print(String(data: data, encoding: .utf8)!)
                    print(#function, #line, #file)
                    sessionData = data
                    groupSession.leave()
            }
        }
        //4 - Decoding
        groupSession.notify(queue: .main) {
            decoderService.decode(jsonType: T.ReturnDecodable.self, data: sessionData) { (decodeResult) in
                switch decodeResult {
                        // Error
                    case .error(let error):
                        completionRequest(.error(error))
                        // Success
                    case .json(let object):
                        if let object = object as? T.ReturnDecodable {
                            completionRequest(.object(object))
                        }
                }
            }
        }
    }
}

