//
//  CustomError.swift
//  CustomError
//
//  Created by wade on 2023/01/06.
//

import Foundation


public protocol CustomErrorType: CustomStringConvertible, LocalizedError {
    var code: Int { get }
    var error: CustomError { get }
    func error(_ additionalWording: String?) -> CustomError
}

public protocol CustomErrorEquatableType: CustomErrorType {
    
}

extension CustomErrorEquatableType {
    public static func == (lhs: Self, rhs: Int) -> Bool {
        if lhs.code == rhs { return true }
        return false
    }
    
    public static func == (lhs: Int, rhs: Self) -> Bool {
        if lhs == rhs.code { return true }
        return false
    }
    
    public static func == (lhs: Self, rhs: CustomErrorType) -> Bool {
        if lhs.code == rhs.code { return true }
        return false
    }
    
    public static func == (lhs: CustomErrorType, rhs: Self) -> Bool {
        if lhs.code == rhs.code { return true }
        return false
    }
}

struct UnknownErrorType: CustomErrorType {
    var code: Int = -1
    var error: CustomError {
        let newError = CustomError(domain: String(describing: CustomError.self), code: code, userInfo: [NSLocalizedDescriptionKey : (errorDescription ?? description)])
        return newError
    }
    
    func error(_ additionalWording: String?) -> CustomError {
        return CustomError(self, additionalDescription: additionalWording)
    }
    
    var description: String = "unknown error"
}


@objc open class CustomError: NSError {
    public enum ErrorType {
        case commonError(Error)
        case customError(CustomErrorType)
    }
    
    public var type: CustomErrorType {
        if case .customError(let error) = errorType {
            return error
        }
        
        return UnknownErrorType()
    }
    
    internal let errorType: ErrorType
    
    @objc public init(_ error: Error?, additionalDescription: String? = nil) {
        let code: Int
        var userInfo: [String: Any]?
        if let error = error as? CustomErrorType {
            code = error.code
            var desc = (error.errorDescription ?? error.description)
            if let addDesc = additionalDescription {
                desc = desc + ": \(addDesc)"
            }
            userInfo = [NSLocalizedDescriptionKey: desc]
            self.errorType = .customError(error)
        }else if let error = error {
            code = (error as NSError).code
            userInfo = (error as NSError).userInfo
            self.errorType = .commonError(error)
        }else {
            let error = UnknownErrorType()
            code = error.code
            var desc = error.description
            if let addDesc = additionalDescription {
                desc = desc + ": \(addDesc)"
            }
            userInfo = [NSLocalizedDescriptionKey: desc]
            self.errorType = .customError(error)
        }
        
//        super.init(domain: String(describing: CustomError.self), code: code, userInfo: userInfo)
        super.init(domain: String(describing: Swift.type(of: self)), code: code, userInfo: userInfo)
    }
    
    @objc public init(code: Int, userInfo dict: [String : Any]? = nil) {
        let error = UnknownErrorType()
        self.errorType = .customError(error)
        super.init(domain: String(describing: Swift.type(of: self)), code: code, userInfo: dict)
    }
    
    @objc override public init(domain: String, code: Int, userInfo dict: [String : Any]? = nil) {
        let error = UnknownErrorType()
        self.errorType = .customError(error)
        super.init(domain: domain, code: code, userInfo: dict)
    }
    
    @objc required public init?(coder: NSCoder) {
        let error = UnknownErrorType()
        self.errorType = .customError(error)
        super.init(coder: coder)
    }
    
    @objc public init() {
        let error = UnknownErrorType()
        self.errorType = .customError(error)
        super.init(domain: String(describing: Swift.type(of: self)), code: error.code, userInfo: (error.error as NSError).userInfo)
    }
}
