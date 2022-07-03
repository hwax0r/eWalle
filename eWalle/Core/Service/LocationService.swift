//
//  LocationService.swift
//  eWalle
//
//  Created by David Sergeev on 29/06/2022.
//

import Foundation

typealias LocationResult<T> = Swift.Result<T, LocationServiceError>

protocol LocationServiceProtocol {
    func getCurrentLocation(completion: @escaping (LocationResult<LocationData>) -> Void)
}

final class LocationService {
    init() {}
}

// MARK: - LocationServiceProtocol
extension LocationService: LocationServiceProtocol {
    func getCurrentLocation(completion: @escaping (LocationResult<LocationData>) -> Void) {
        completion(.failure(.serviceUnreachable))
    }
}
