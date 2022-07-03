//
//  MoneyRecieverCell.swift
//  eWalle
//
//  Created by David Sergeev on 02/07/2022.
//

import UIKit

final class MoneyRecieverCell: UICollectionViewCell, IHaveViewModel {
    static let reuseIdentifier = "MoneyRecieverCell"
    
    typealias ViewModel = MoneyRecieverViewModel
    var viewModel: ViewModel? {
        didSet {
            guard viewModel != oldValue else {
                return
            }
            viewModelChanged()
        }
    }
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person.fill")
        imageView.backgroundColor = .clear
//        imageView.layer.cornerRadius = 12
//        imageView.layer.borderColor = UIColor(red: 0.227, green: 0.259, blue: 0.463, alpha: 0.2).cgColor
//        imageView.layer.borderWidth = 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(red: 0.227, green: 0.259, blue: 0.463, alpha: 1)
        guard let customFont = UIFont(name: "AvenirNext-Regular", size: 12) else {
            fatalError("""
                Failed to load the "AvenirNext-Regular" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = customFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        profileImageView.frame = CGRect(x: 20,
                                        y: 20,
                                        width: 60,
                                        height: 60)
        nameLabel.frame = CGRect(x: 20,
                                 y: 100 - 14,
                                 width: frame.width - 20 * 2,
                                 height: 14)
    }
}

// MARK: - Private methods
extension MoneyRecieverCell {
    private func configureView() {
        contentView.addSubviews([
            profileImageView,
            nameLabel,
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layer.cornerRadius = 12
        layer.cornerRadius = 12
        layer.masksToBounds = true
        contentView.backgroundColor = UIColor(red: 0.945, green: 0.953, blue: 0.965, alpha: 1)
        
    }
}

// MARK: - IHaveViewModel
extension MoneyRecieverCell {
    func viewModelChanged() {
        guard let viewModel = viewModel else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.13
        nameLabel.attributedText = NSMutableAttributedString(string: viewModel.name,
                                                         attributes: [
                                                            NSAttributedString.Key.kern: 0.72,
                                                            NSAttributedString.Key.paragraphStyle: paragraphStyle
                                                         ])
        nameLabel.textAlignment = .center
        
        setNeedsLayout()
    }
}
