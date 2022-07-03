//
//  MenuOptionsView.swift
//  eWalle
//
//  Created by David Sergeev on 03/07/2022.
//

import UIKit

final class MenuOptionsView: UIView {
    private let options = [
        MenuOptionLabel(optionName: "Home", selected: true),
        MenuOptionLabel(optionName: "Profile", selected: false),
        MenuOptionLabel(optionName: "Accounts", selected: false),
        MenuOptionLabel(optionName: "Transactions", selected: false),
        MenuOptionLabel(optionName: "Stats", selected: false),
        MenuOptionLabel(optionName: "Settings", selected: false),
        MenuOptionLabel(optionName: "Help", selected: false),
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
extension MenuOptionsView {
    private func configureView() {
        addSubviews(options)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        
        
        NSLayoutConstraint.activate([
            options[0].topAnchor.constraint(equalTo: self.topAnchor),
            options[0].leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            options[1].topAnchor.constraint(equalTo: options[0].bottomAnchor, constant: 20),
            options[1].leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            options[2].topAnchor.constraint(equalTo: options[1].bottomAnchor, constant: 20),
            options[2].leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            options[3].topAnchor.constraint(equalTo: options[2].bottomAnchor, constant: 20),
            options[3].leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            options[4].topAnchor.constraint(equalTo: options[3].bottomAnchor, constant: 20),
            options[4].leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            options[5].topAnchor.constraint(equalTo: options[4].bottomAnchor, constant: 20),
            options[5].leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            options[6].topAnchor.constraint(equalTo: options[5].bottomAnchor, constant: 20),
            options[6].leadingAnchor.constraint(equalTo: self.leadingAnchor),
            options[6].bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
