//
//  ServiceView.swift
//  eWalle
//
//  Created by David Sergeev on 02/07/2022.
//

import UIKit

class ServiceView: UIView, IHaveViewModel {
    typealias ViewModel = ServiceViewModel
    var viewModel: ViewModel? {
        didSet {
            guard viewModel != oldValue else {
                return
            }
            viewModelChanged()
        }
    }
    
    private let roundedView = UIView()
    private let imageView = UIImageView()
    private let serviceNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.227, green: 0.259, blue: 0.463, alpha: 1)
        guard let customFont = UIFont(name: "AvenirNext-DemiBold", size: 10) else {
            fatalError("""
                Failed to load the "AvenirNext-DemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = customFont
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension ServiceView {
    private func configureView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        roundedView.addSubview(imageView)
        roundedView.layer.cornerRadius = 12
        
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        roundedView.backgroundColor = UIColor(red: 0.945, green: 0.953, blue: 0.965, alpha: 1)
        
        self.addSubviews([
            roundedView,
            serviceNameLabel,
        ])
        translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 18),
            imageView.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 18),
            imageView.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -18),
            imageView.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: -18),
            
            roundedView.topAnchor.constraint(equalTo: self.topAnchor),
            roundedView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            roundedView.widthAnchor.constraint(equalToConstant: 60),
            roundedView.heightAnchor.constraint(equalToConstant: 60),
            roundedView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            serviceNameLabel.topAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: 6),
            serviceNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            serviceNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            serviceNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

// MARK: - IHaveViewModel
extension ServiceView {
    func viewModelChanged() {
        guard let viewModel = viewModel else { return }
        
        imageView.image = UIImage(systemName: viewModel.iconSystemName)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.13
        serviceNameLabel.attributedText = NSMutableAttributedString(
            string: viewModel.serviceName,
            attributes: [NSAttributedString.Key.kern: 0.6,
                         NSAttributedString.Key.paragraphStyle: paragraphStyle])
        serviceNameLabel.textAlignment = .center
        
        setNeedsLayout()
    }
}
