//
//  WeatherService.swift
//  eWalle
//
//  Created by David Sergeev on 24/06/2022.
//

import Foundation

typealias WeatherResult<T> = Swift.Result<T, WeatherServiceError>

protocol WeatherServiceProtocol {
    func getCurrentWeatherAtLocation(completion: @escaping (WeatherResult<WeatherData>) -> Void)
}

final class WeatherService {
    private let network = NetworkCore.shared
    
    init() {}
}

// MARK: - WeatherServiceProtocol
extension WeatherService: WeatherServiceProtocol {
    func getCurrentWeatherAtLocation(completion: @escaping (WeatherResult<WeatherData>) -> Void) {
        completion(.failure(.serviceUnreachable))
    }
}
