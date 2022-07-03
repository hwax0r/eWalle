//
//  ProfileView.swift
//  eWalle
//
//  Created by David Sergeev on 03/07/2022.
//

import UIKit

final class ProfileView: UIView {
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let profileNameLabel: UILabel = {
        let label = UILabel()
        label.textColor =  UIColor(red: 0.106, green: 0.114, blue: 0.157, alpha: 1)
        guard let customFont = UIFont(name: "AvenirNext-DemiBold", size: 16) else {
            fatalError("""
                Failed to load the "AvenirNext-DemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = customFont
        label.text = "Carol Black"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.482, green: 0.498, blue: 0.62, alpha: 1)
        guard let customFont = UIFont(name: "AvenirNext-Medium", size: 10) else {
            fatalError("""
                Failed to load the "AvenirNext-Medium" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = customFont
        label.text = "Seattle,Washington"
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: .bottomRight, radius: 53.5)
    }
}

// MARK: - Private methods
extension ProfileView {
    private func configureView() {
        addSubviews([
            profileImageView,
            profileNameLabel,
            locationLabel,
        ])
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            profileImageView.widthAnchor.constraint(equalToConstant: 45),
            profileImageView.heightAnchor.constraint(equalToConstant: 45),
            profileImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            
            profileNameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            profileNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            
            locationLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: profileNameLabel.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
            locationLabel.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),
        ])
    }
}
