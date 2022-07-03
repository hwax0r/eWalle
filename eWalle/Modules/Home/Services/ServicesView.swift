//
//  ServicesView.swift
//  eWalle
//
//  Created by David Sergeev on 02/07/2022.
//

import UIKit

final class ServicesView: UIView, IHaveViewModel {
    typealias ViewModel = ServicesViewModel
    var viewModel: ViewModel? {
        didSet {
            guard viewModel != oldValue else {
                return
            }
            viewModelChanged()
        }
    }
    
    private let sectionNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.227, green: 0.259, blue: 0.463, alpha: 1)
        guard let customFont = UIFont(name: "AvenirNext-DemiBold", size: 16) else {
            fatalError("""
                Failed to load the "AvenirNext-DemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = customFont
        label.text = "Services"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let optionsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.tintColor = UIColor(red: 0.227, green: 0.259, blue: 0.463, alpha: 1)
        button.layer.cornerRadius = 52 / 2
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "slider.horizontal.3")!, for: .normal)
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let services = [
        ServiceView(),
        ServiceView(),
        ServiceView(),
        ServiceView(),
        ServiceView(),
        ServiceView(),
        ServiceView(),
        ServiceView(),
    ]
    
    init() {
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension ServicesView {
    private func configureView() {
        addSubviews([
            sectionNameLabel,
            optionsButton,
        ])
        addSubviews(services)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sectionNameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            sectionNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            optionsButton.topAnchor.constraint(equalTo: self.topAnchor),
            optionsButton.widthAnchor.constraint(equalToConstant: 60),
            optionsButton.widthAnchor.constraint(equalToConstant: 60),
            optionsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            optionsButton.bottomAnchor.constraint(equalTo: sectionNameLabel.bottomAnchor),
            
            services[0].topAnchor.constraint(equalTo: sectionNameLabel.bottomAnchor, constant: 20),
            services[0].leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            services[1].topAnchor.constraint(equalTo: sectionNameLabel.bottomAnchor, constant: 20),
            services[1].leadingAnchor.constraint(equalTo: services[0].trailingAnchor, constant: 28),
            
            services[2].topAnchor.constraint(equalTo: sectionNameLabel.bottomAnchor, constant: 20),
            services[2].leadingAnchor.constraint(equalTo: services[1].trailingAnchor, constant: 28),
            
            services[3].topAnchor.constraint(equalTo: sectionNameLabel.bottomAnchor, constant: 20),
            services[3].leadingAnchor.constraint(equalTo: services[2].trailingAnchor, constant: 28),
            
            services[4].topAnchor.constraint(equalTo: services[0].bottomAnchor, constant: 20),
            services[4].leadingAnchor.constraint(equalTo: self.leadingAnchor),
            services[4].bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            services[5].topAnchor.constraint(equalTo: services[0].bottomAnchor, constant: 20),
            services[5].leadingAnchor.constraint(equalTo: services[4].trailingAnchor, constant: 28),
            services[5].bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            services[6].topAnchor.constraint(equalTo: services[0].bottomAnchor, constant: 20),
            services[6].leadingAnchor.constraint(equalTo: services[5].trailingAnchor, constant: 28),
            services[6].bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            services[7].topAnchor.constraint(equalTo: services[0].bottomAnchor, constant: 20),
            services[7].leadingAnchor.constraint(equalTo: services[6].trailingAnchor, constant: 28),
            services[7].bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

// MARK: - IHaveViewModel
extension ServicesView {
    func viewModelChanged() {
        guard let viewModel = viewModel else { return }
        
        for index in 0..<services.count {
            services[index].viewModel = viewModel.services[index]
        }
        
        setNeedsLayout()
    }
}
