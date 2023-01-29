//
//  SampleType.swift
//  CustomErrorObjectiveCExample
//
//  Created by wade on 2023/01/16.
//

import Foundation


class SampleError: CustomError {
    init(type: SampleErrorType) {
        super.init(type.error)
    }
    
    @objc required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc enum SampleErrorType: Int {
    case sample1             = 10000
    case sample2
}

extension SampleErrorType: CustomErrorType {
    public var code: Int {
        self.rawValue
    }
    
    public var error: CustomError {
        return CustomError(self)
    }
    
    public func error(_ additionalWording: String? = nil) -> CustomError {
        return CustomError(self, additionalDescription: additionalWording)
    }
    
    public var description: String {
        switch self {
        case .sample1: return "sample error 1"
        case .sample2: return "sample error 2"
        default:
            return "sample error"
        }
    }
}


@objc enum SampleEquatableErrorType: Int {
    case sampleEquatable1           = 20000
    case sampleEquatable2
}

extension SampleEquatableErrorType: CustomErrorEquatableType {
    public var code: Int {
        self.rawValue
    }
    
    public var error: CustomError {
        return CustomError(self)
    }
    
    public func error(_ additionalWording: String? = nil) -> CustomError {
        return CustomError(self, additionalDescription: additionalWording)
    }
    
    public var description: String {
        switch self {
        case .sampleEquatable1: return "sample equatable error 1"
        case .sampleEquatable2: return "sample equatable error 2"
        default:
            return "sample error"
        }
    }
}
