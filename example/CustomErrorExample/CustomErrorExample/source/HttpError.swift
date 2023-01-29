//
//  HttpError.swift
//  CustomErrorExample
//
//  Created by wade on 2023/01/16.
//

import Foundation


class HttpError: CustomError {
    static func clientError(type: HttpClientErrorType) -> HttpError {
        return type.error as! HttpError
    }
    
    static func serverError(type: HttpServerErrorType) -> HttpError {
        return type.error as! HttpError
    }
}
