//
//  AuthenticationService.swift
//  eWalle
//
//  Created by David Sergeev on 03/07/2022.
//

import Foundation

typealias AuthenticationResult<T> = Swift.Result<T, AuthenticationServiceError>
//WeatherResult<T> = Swift.Result<T, WeatherServiceError>

protocol AuthenticationServiceProtocol {
    func authenticate(login: String, password: String, completion: @escaping (AuthenticationResult<Bool>) -> Void)
}

final class AuthenticationService {
    init() {}
}
