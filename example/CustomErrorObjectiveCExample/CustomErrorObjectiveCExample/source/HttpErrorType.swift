//
//  HttpErrorType.swift
//  CustomErrorExample
//
//  Created by wade on 2023/01/16.
//

import Foundation


@objc enum HttpClientErrorType: Int {
    case badRequest                 = 400
    case unauthorized
    case paymentRequired
    case forbidden
    case notFound
    // ...
}

extension HttpClientErrorType: CustomErrorType {
    public var code: Int {
        self.rawValue
    }
    
    public var error: CustomError {
        return HttpError(self)
    }
    
    public func error(_ additionalWording: String? = nil) -> CustomError {
        return HttpError(self, additionalDescription: additionalWording)
    }
    
    public var description: String {
        switch self {
        case .badRequest: return "bad request"
        case .unauthorized: return "unauthorized"
        case .paymentRequired: return "payment required"
        case .forbidden: return "forbidden"
        case .notFound: return "not found"
        default:
            return "http client error"
        }
    }
}

@objc enum HttpServerErrorType: Int {
    case internalServerError            = 500
    case notImplemented
    case badGateway
    case serviceUnavailable
    // ...
}

extension HttpServerErrorType: CustomErrorType {
    public var code: Int {
        self.rawValue
    }
    
    public var error: CustomError {
        return HttpError(self)
    }
    
    public func error(_ additionalWording: String? = nil) -> CustomError {
        return HttpError(self, additionalDescription: additionalWording)
    }
    
    public var description: String {
        switch self {
        case .internalServerError: return "internal server error"
        case .notImplemented: return "not implemented"
        case .badGateway: return "bad gateway"
        case .serviceUnavailable: return "service unavailable"
        default:
            return "http server error"
        }
    }
}
