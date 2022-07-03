//
//  IHaveViewModel.swift
//  eWalle
//
//  Created by David Sergeev on 30/06/2022.
//

import Foundation

protocol IHaveViewModel: AnyObject {
    associatedtype ViewModel
    
    var viewModel: ViewModel? { get set }
    
    func viewModelChanged()
}
