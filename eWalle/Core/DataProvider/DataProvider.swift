//
//  DataProvider.swift
//  eWalle
//
//  Created by David Sergeev on 24/06/2022.
//

import Foundation

final class DataProvider {
    static let shared = DataProvider()
    private let networkCore = NetworkCore.shared
    private let concurrentUtilityQueue = DispatchQueue(label: "DataProviderQueue",
                                                qos: .utility,
                                                attributes: .concurrent)
    
    private init() {}
}

// MARK: - WeatherServiceProtocol
extension DataProvider: WeatherServiceProtocol {
    func getCurrentWeatherAtLocation(completion: @escaping (WeatherResult<WeatherData>) -> Void) {
        let weatherService = WeatherService()
        var weatherData: WeatherData?
        
        concurrentUtilityQueue.async {
            weatherService.getCurrentWeatherAtLocation() { (result: WeatherResult<WeatherData>) in
                switch result {
                case .success(let data):
                    weatherData = data
                case .failure(let error):
                    print("Remote WeatherService error: \(error)")
                }
            }
            
            DispatchQueue.main.async {
                if let weatherData = weatherData {
                    completion(.success(weatherData))
                } else {
                    let weatherServiceDataForPreview = WeatherData(tempreture: 34,
                                                                   measurementSystem: .celsius,
                                                                   weatherType: .cloudy)
                    completion(.success(weatherServiceDataForPreview))
                }
            }
        }
    }
}

// MARK: - LocationServiceProtocol
extension DataProvider: LocationServiceProtocol {
    func getCurrentLocation(completion: @escaping (LocationResult<LocationData>) -> Void) {
        let locationService = LocationService()
        var locationData: LocationData?
        
        concurrentUtilityQueue.async {
            locationService.getCurrentLocation() { (result: LocationResult<LocationData>) in
                switch result {
                case .success(let data):
                    locationData = data
                case .failure(let error):
                    print("Remote LocationService error: \(error)")
                }
            }
            
            DispatchQueue.main.async {
                if let locationData = locationData {
                    completion(.success(locationData))
                } else {
                    let locationDataForPreview = LocationData(latitude: 48.708050,
                                                              longitude: 44.513302)
                    completion(.success(locationDataForPreview))
                }
            }
        }
    }
}

// MARK: - LoginViewDataProtocol
extension DataProvider: LoginViewDataProtocol {
    func loginViewData(completion: @escaping (Result<LoginViewModel, Error>) -> Void) {
        concurrentUtilityQueue.async {
            let loginViewModel = LoginViewModel(
                dateTimeWeatherViewModel: DateTimeWeatherViewModel(time: "06:20 PM",
                                                                   temperature: "34° C",
                                                                   date: "Nov.10.2020 | Wednesday"))
            DispatchQueue.main.async {
                completion(.success(loginViewModel))
            }
        }
    }
}

// MARK: - HomeViewDataProtocol
extension DataProvider: HomeViewDataProtocol {
    func homeViewData(completion: @escaping (Result<HomeViewModel, Error>) -> Void) {
        concurrentUtilityQueue.async {
            let homeViewData = HomeViewModel(
                accountOverviewModel: AccountOverviewViewModel(
                    accountCardViewModel: AccountCardViewModel(
                        balanceModel: BalanceViewModel(balance: "20,600"))),
                sendMoneyModel: SendMoneyViewModel(
                    moneyRecieversModel: MoneyRecieversViewModel(
                        moneyRecievers: [
                            MoneyRecieverViewModel(name: "Mike"),
                            MoneyRecieverViewModel(name: "Joseph"),
                            MoneyRecieverViewModel(name: "Ashley"),
                        ])),
                servicesModel: ServicesViewModel(
                    services: [
                        ServiceViewModel(serviceName: "Send\nMoney", iconSystemName: "paperplane"),
                        ServiceViewModel(serviceName: "Receive\nMoney", iconSystemName: "chevron.down.square"),
                        ServiceViewModel(serviceName: "Mobile\nPrepaid", iconSystemName: "iphone"),
                        ServiceViewModel(serviceName: "Electricity\nBill", iconSystemName: "bolt.fill"),
                        ServiceViewModel(serviceName: "Cashback\nOffer", iconSystemName: "tag"),
                        ServiceViewModel(serviceName: "Movie\nTickets", iconSystemName: "camera.aperture"),
                        ServiceViewModel(serviceName: "Flight\nTickets", iconSystemName: "airplane.departure"),
                        ServiceViewModel(serviceName: "More\nOptions", iconSystemName: "folder.badge.gearshape"),
                    ]))
            DispatchQueue.main.async {
                completion(.success(homeViewData))
            }
        }
    }
}
