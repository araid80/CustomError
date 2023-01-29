//
//  HttpError.swift
//  CustomErrorExample
//
//  Created by wade on 2023/01/16.
//

import Foundation


@objc class HttpError: CustomError {
    @objc static func clientError(type: HttpClientErrorType) -> HttpError {
        return type.error as! HttpError
    }
    
    @objc static func serverError(type: HttpServerErrorType) -> HttpError {
        return type.error as! HttpError
    }
}
