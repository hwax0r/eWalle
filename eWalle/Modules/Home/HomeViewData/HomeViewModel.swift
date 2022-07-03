//
//  HomeViewModel.swift
//  eWalle
//
//  Created by David Sergeev on 03/07/2022.
//

import Foundation

struct HomeViewModel: Equatable {
    let accountOverviewModel: AccountOverviewViewModel
    let sendMoneyModel: SendMoneyViewModel
    let servicesModel: ServicesViewModel
}
