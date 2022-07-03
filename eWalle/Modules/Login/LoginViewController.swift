//
//  LoginViewController.swift
//  eWalle
//
//  Created by David Sergeev on 01/07/2022.
//

import UIKit

final class LoginViewController: UIViewController, IHaveViewModel {
    typealias ViewModel = LoginViewModel
    var viewModel: ViewModel? {
        didSet {
            guard viewModel != oldValue else {
                return
            }
            viewModelChanged()
        }
    }
    
    private let drawingView = DrawingView()
    private let dateTimeWeatherView = DateTimeWeatherView()
    private let promoView = PromoView()
    private let loginOptionsView = LoginOptionsView()
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataProvider.shared.loginViewData { [weak self] (result: Swift.Result<LoginViewModel, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.viewModel = data
            case .failure(let failure):
                print(failure)
            }
        }
        
        configureView()
        configureActions()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
}

// MARK: - Private methods
extension LoginViewController {
    private func configureView(){
        view.addSubviews([
            drawingView,
            dateTimeWeatherView,
            promoView,
            loginOptionsView,
        ])
        view.backgroundColor = .white
        
        let leadingOffset: Double = 27
        let trailingOffset: Double = 27
        NSLayoutConstraint.activate([
            drawingView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            drawingView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            drawingView.trailingAnchor.constraint(equalTo: drawingView.leadingAnchor, constant: view.frame.width * 0.33),
            drawingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            dateTimeWeatherView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            dateTimeWeatherView.leadingAnchor.constraint(equalTo: drawingView.trailingAnchor, constant: leadingOffset),
            dateTimeWeatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingOffset),
            
            promoView.topAnchor.constraint(equalTo: dateTimeWeatherView.bottomAnchor, constant: 186),
            promoView.leadingAnchor.constraint(equalTo: dateTimeWeatherView.leadingAnchor),
            promoView.trailingAnchor.constraint(equalTo: dateTimeWeatherView.trailingAnchor),
            
            loginOptionsView.topAnchor.constraint(lessThanOrEqualTo: promoView.bottomAnchor, constant: 164),
            loginOptionsView.leadingAnchor.constraint(equalTo: dateTimeWeatherView.leadingAnchor),
            loginOptionsView.trailingAnchor.constraint(equalTo: dateTimeWeatherView.trailingAnchor),
            loginOptionsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -53),
        ])
    }
    
    private func configureActions() {
        loginOptionsView.signInButtonPressed = { [weak self] in
            guard let self = self else { return }
            self.dismiss(animated: false)
        }
        
        loginOptionsView.createAccountButtonPressed = { [weak self] in
            guard let self = self else { return }
            self.dismiss(animated: true)
        }
    }
}

// MARK: - IHaveViewModel
extension LoginViewController {
    func viewModelChanged() {
        guard let viewModel = viewModel else { return }
        dateTimeWeatherView.viewModel = viewModel.dateTimeWeatherViewModel
    }
}
