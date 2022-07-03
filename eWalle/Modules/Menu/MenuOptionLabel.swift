//
//  MenuOptionLabel.swift
//  eWalle
//
//  Created by David Sergeev on 03/07/2022.
//

import UIKit

final class MenuOptionLabel: UILabel {
    private let optionName: String
    private let selected: Bool
    
    init(optionName: String, selected: Bool) {
        self.optionName = optionName
        self.selected = selected
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension MenuOptionLabel {
    private func configureView() {
        textColor = UIColor(red: 0.106, green: 0.114, blue: 0.157, alpha: 1)
        if selected {
            guard let customFont = UIFont(name: "AvenirNext-DemiBold", size: 18) else {
                        fatalError("""
                            Failed to load the "AvenirNext-DemiBold" font.
                            Make sure the font file is included in the project and the font name is spelled correctly.
                            """
                        )
                    }
            font = customFont
        } else {
            guard let customFont = UIFont(name: "AvenirNext-Medium", size: 16) else {
                        fatalError("""
                            Failed to load the "AvenirNext-Medium" font.
                            Make sure the font file is included in the project and the font name is spelled correctly.
                            """
                        )
                    }
            font = customFont
        }
        text = optionName
        textAlignment = .left
        translatesAutoresizingMaskIntoConstraints = false
    }
}
