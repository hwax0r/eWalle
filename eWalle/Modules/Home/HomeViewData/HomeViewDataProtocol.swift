//
//  HomeViewDataProtocol.swift
//  eWalle
//
//  Created by David Sergeev on 03/07/2022.
//

import Foundation

protocol HomeViewDataProtocol {
    func homeViewData(completion: @escaping (Swift.Result<HomeViewModel, Error>) -> Void)
}
