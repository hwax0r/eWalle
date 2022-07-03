//
//  LoginViewDataProtocol.swift
//  eWalle
//
//  Created by David Sergeev on 03/07/2022.
//

import Foundation

protocol LoginViewDataProtocol {
    func loginViewData(completion: @escaping (Swift.Result<LoginViewModel, Error>) -> Void)
}
