//
//  HomeViewController.swift
//  eWalle
//
//  Created by David Sergeev on 03/07/2022.
//

import UIKit

final class HomeViewController: UIViewController, IHaveViewModel {
    typealias ViewModel = HomeViewModel
    var viewModel: ViewModel? {
        didSet {
            guard viewModel != oldValue else {
                return
            }
            viewModelChanged()
        }
    }
    
    private let headerView = HeaderView()
    private let accountOverviewView = AccountOverviewView()
    private let sendMoneyView = SendMoneyView()
    private let servicesView = ServicesView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        DataProvider.shared.homeViewData { [weak self] (result: Swift.Result<HomeViewModel, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.viewModel = data
            case .failure(let error):
                print(error)
            }
        }
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureView()
        configureActions()
    }
}

// MARK: - Private methods
extension HomeViewController {
    private func configureView(){
        view.addSubviews([
            headerView,
            accountOverviewView,
            sendMoneyView,
            servicesView,
        ])
        
        let leadingOffset: Double = 25
        let trailingOffset: Double = 25
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingOffset),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailingOffset),
            
            accountOverviewView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 50),
            accountOverviewView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            accountOverviewView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            
            sendMoneyView.topAnchor.constraint(equalTo: accountOverviewView.bottomAnchor, constant: 20),
            sendMoneyView.leadingAnchor.constraint(equalTo: accountOverviewView.leadingAnchor),
            sendMoneyView.trailingAnchor.constraint(equalTo: accountOverviewView.trailingAnchor),
            sendMoneyView.bottomAnchor.constraint(equalTo: sendMoneyView.topAnchor, constant: 200),
            
            servicesView.topAnchor.constraint(equalTo: sendMoneyView.bottomAnchor, constant: 40),
            servicesView.leadingAnchor.constraint(equalTo: sendMoneyView.leadingAnchor),
            servicesView.trailingAnchor.constraint(equalTo: sendMoneyView.trailingAnchor),
            servicesView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
        ])
    }
    
    private func configureActions() {
        headerView.menuButtonPressed = { [weak self] in
            guard let self = self else { return }
            let vc = MenuViewController(homeView: self.view)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
        }
    }
}

// MARK: - IHaveViewModel
extension HomeViewController {
    func viewModelChanged() {
        guard let viewModel = viewModel else { return }
        accountOverviewView.viewModel = viewModel.accountOverviewModel
        sendMoneyView.viewModel = viewModel.sendMoneyModel
        servicesView.viewModel = viewModel.servicesModel
    }
}
