//
//  AddNewRecieverCell.swift
//  eWalle
//
//  Created by David Sergeev on 02/07/2022.
//

import UIKit

final class AddNewRecieverCell: UICollectionViewCell {
    static let identifier = "AddNewRecieverCell"
    private let addNewRecieverButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 1, green: 0.675, blue: 0.188, alpha: 1)
        button.tintColor = UIColor(red: 0.106, green: 0.114, blue: 0.157, alpha: 1)
        button.layer.cornerRadius = 52 / 2
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "plus")!, for: .normal)
        button.contentMode = .scaleAspectFit
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addNewRecieverButton.frame = CGRect(x: (frame.width - 52) / 2,
                                            y: (frame.height - 52) / 2,
                                            width: 52,
                                            height: 52)
    }
}

// MARK: - Private methods
extension AddNewRecieverCell {
    private func configureView() {
        contentView.addSubviews([
            addNewRecieverButton
        ])
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
}
