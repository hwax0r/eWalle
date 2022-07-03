//
//  PromoView.swift
//  eWalle
//
//  Created by David Sergeev on 30/06/2022.
//

import UIKit

class PromoView: UIView {
    private let logoView = LogoView()
    private let promoTextView = PromoTextView()
    
    init() {
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Private extensions
extension PromoView {
    private func configureView() {
        addSubviews([
            logoView,
            promoTextView,
        ])
        translatesAutoresizingMaskIntoConstraints = false
        
        let logoViewHeight: Double = 40
        let logoViewWidth: Double = logoViewHeight * 1.5
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: self.topAnchor),
            logoView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            logoView.widthAnchor.constraint(equalToConstant: logoViewWidth),
            logoView.heightAnchor.constraint(equalToConstant: logoViewHeight),
            
            promoTextView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 17),
            promoTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            promoTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            promoTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
