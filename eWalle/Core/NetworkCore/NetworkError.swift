//
//  NetworkError.swift
//  eWalle
//
//  Created by David Sergeev on 24/06/2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case responseDecodingError
    case redirectionError
    case clientError
    case serverError
    case unexpectedResponseError
}
