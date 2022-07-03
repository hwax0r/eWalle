//
//  DateTimeWeatherView.swift
//  eWalle
//
//  Created by David Sergeev on 30/06/2022.
//

import UIKit

final class DateTimeWeatherView: UIView, IHaveViewModel {
    typealias ViewModel = DateTimeWeatherViewModel
    var viewModel: ViewModel? {
        didSet {
            guard viewModel != oldValue else {
                return
            }
            viewModelChanged()
        }
    }
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        guard let customFont = UIFont(name: "AvenirNext-Medium", size: 24) else {
            fatalError("""
                Failed to load the "AvenirNext-Medium" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = customFont
        label.textColor = UIColor(red: 0.106, green: 0.114, blue: 0.157, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        guard let customFont = UIFont(name: "AvenirNext-DemiBold", size: 13) else {
            fatalError("""
                Failed to load the "AvenirNext-DemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = customFont
        label.textColor = UIColor(red: 0.106, green: 0.114, blue: 0.157, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        guard let customFont = UIFont(name: "AvenirNext-Medium", size: 13) else {
            fatalError("""
                Failed to load the "AvenirNext-Medium" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = customFont
        label.textColor = UIColor(red: 0.481, green: 0.5, blue: 0.621, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let weatherIcon: UIImageView = {
        let image = UIImage(systemName: "cloud.fill")!
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor(red: 1, green: 0.675, blue: 0.188, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(){
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension DateTimeWeatherView {
    private func configureView() {
        addSubviews([
            timeLabel,
            weatherIcon,
            weatherLabel,
            dateLabel,
        ])
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([            
            timeLabel.topAnchor.constraint(equalTo: self.topAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            timeLabel.widthAnchor.constraint(equalToConstant: 107),
            timeLabel.heightAnchor.constraint(equalToConstant: 33),
            
            weatherIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            weatherIcon.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 20),
            weatherIcon.widthAnchor.constraint(equalToConstant: 18),
            weatherIcon.heightAnchor.constraint(equalToConstant: 18),
            
            weatherLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            weatherLabel.leadingAnchor.constraint(equalTo: weatherIcon.trailingAnchor, constant: 8),
            weatherLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 7),
            dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

// MARK: - IHaveViewModel
extension DateTimeWeatherView {
    func viewModelChanged() {
        guard let viewModel = viewModel else { return }
        timeLabel.text = viewModel.time
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.13
        weatherLabel.attributedText = NSMutableAttributedString(
            string: viewModel.temperature,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        )

        dateLabel.attributedText = NSMutableAttributedString(
            string: viewModel.date,
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        )
        
        setNeedsLayout()
    }
}
