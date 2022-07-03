//
//  NetworkCore.swift
//  eWalle
//
//  Created by David Sergeev on 24/06/2022.
//

import Foundation

typealias CoreResult<T: Responsable> = Swift.Result<T, NetworkError>

protocol NetworkCoreProtocol {
    func request<Res: Responsable>(url: String,
                                   completion: @escaping (CoreResult<Res>) -> Void)
}

final class NetworkCore {
    static let shared = NetworkCore()
    private let jsonDecoder = JSONDecoder()
    
    private init() { }
}

// MARK: - NetworkCoreProtocol
extension NetworkCore: NetworkCoreProtocol {
    func request<Res>(url: String,
                      completion: @escaping (CoreResult<Res>) -> Void) where Res : Responsable {
        guard let urlRequest = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = TimeInterval(10)
        sessionConfiguration.timeoutIntervalForResource = TimeInterval(10)
        let dataTask = URLSession
            .shared
            .dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {
                    if let data = data,
                       (response as? HTTPURLResponse)?.statusCode == 200,
                       error == nil {
                        self.handleSuccessDataResponse(data, completion: completion)
                    } else {
                        guard let responseCode = (response as? HTTPURLResponse)?.statusCode else {
                            completion(.failure(.unexpectedResponseError))
                            return
                        }
                        
                        switch responseCode {
                        case 300..<400:
                            completion(.failure(.redirectionError))
                        case 400..<500:
                            completion(.failure(.clientError))
                        case 500..<600:
                            completion(.failure(.serverError))
                        default:
                            completion(.failure(.unexpectedResponseError))
                        }
                    }
                }
            })
        dataTask.resume()
    }
}

// MARK: - Data decoding
extension NetworkCore {
    private func handleSuccessDataResponse<Res: Responsable>(_ data: Data,
                                                        completion: (CoreResult<Res>) -> Void) {
        do {
            completion(.success(try decodeData(data: data)))
        } catch {
            completion(.failure(.responseDecodingError))
        }
    }
    
    private func decodeData<Res: Responsable>(data: Data) throws -> Res {
        let response = try jsonDecoder.decode(Res.self, from: data)
        return response
    }
}
