//
//  Typealias.swift
//  
//
//  Created by Senior Developer on 10.09.2022.
//
import UIKit

//MARK:- RESULTS CLOSURE
public typealias ClosurePictureSession = ((PictureSessionResult) -> Void)
public typealias ClosureServerResult   = ((ServerResult) -> Void)
public typealias ClosureDecode         = ((DecodeResult) -> Void)
public typealias ClosureSession        = ((SessionResult) -> Void)
public typealias ClosureSessionData    = ((SessionDataResult) -> Void)
public typealias ClosureRequest        = ((RequestResult) -> Void)
public typealias ClosureResultFB       = ((FirebaseResult) -> Void)

//MARK: - CLOUSURES
public typealias ClosureReturn<T> = (() -> T)
public typealias Closure<T>       = ((T) -> Void)
public typealias ClosureEmpty     = (() -> Void)
public typealias ClosureTwo<T, G> = ((T, G) -> Void)
public typealias ClosureAny       = ((Any?) -> Void)

//MARK: - CUSTOM TYPE
public typealias Header     = [String: String]
public typealias HTTPMethod = String.HTTPMethod
public typealias ReturnURL  = (string: String?, URL: URL?)

//Result session
public enum SessionResult {
    case data(Data)
    case error(Error?)
}
//Result session data
public enum SessionDataResult {
    case data(Any)
    case error(Error?)
}
//Result session data
public enum RequestResult {
    case object(Any)
    case error(Error?)
}
//Firebase session data
public enum FirebaseResult {
    case object(Any)
    case error(Error?)
}
//Result Decode JSON
public enum DecodeResult {
    case json(Decodable)
    case error(Error?)
}
//Result Get Picture fot URL
public enum PictureSessionResult {
    case picture(UIImage)
    case error(Error?)
}
//Result Network Services
public enum ServerResult {
    case object(Any)
    case error(Error?)
}

