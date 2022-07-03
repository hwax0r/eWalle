//
//  PromoTextView.swift
//  eWalle
//
//  Created by David Sergeev on 30/06/2022.
//

import UIKit

final class PromoTextView: UIView {
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        
        guard let customFont = UIFont(name: "Ubuntu-Medium", size: 28) else {
            fatalError("""
                Failed to load the "Ubuntu-Medium" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = customFont
        label.textColor = UIColor(red: 0.106, green: 0.114, blue: 0.157, alpha: 1)
        label.text = "eWalle"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var promoTextLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont(name: "AvenirNext-Medium", size: 14)
        label.textColor =  UIColor(red: 0.481, green: 0.5, blue: 0.621, alpha: 1)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.13
        label.attributedText = NSMutableAttributedString(
            string: "Open An Account For Digital E-Wallet Solutions.Instant Payouts. \n\nJoin For Free.",
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
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
extension PromoTextView {
    private func configureView() {
        addSubviews([
            productNameLabel,
            promoTextLabel,
        ])
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            productNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            productNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productNameLabel.bottomAnchor.constraint(equalTo: promoTextLabel.topAnchor, constant: -16),
            
            promoTextLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 16),
            promoTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            promoTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            promoTextLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
