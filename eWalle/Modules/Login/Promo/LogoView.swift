//
//  LogoView.swift
//  eWalle
//
//  Created by David Sergeev on 30/06/2022.
//

import UIKit

final class LogoView: UIView {
    private let orangeColor = UIColor(red: 1, green: 0.675, blue: 0.188, alpha: 1)
    private let darkBlueColor = UIColor(red: 0.227, green: 0.259, blue: 0.463, alpha: 1)
    
    private let ellipsView: EllipsInRectView
    private let leftEllipsHalfView: CubeWithArcView
    private let rightEllipsHalfView: CubeWithArcView
    
    init() {
        ellipsView = .init(ellipsColor: orangeColor)
        leftEllipsHalfView = .init(cubeColor: .clear,
                               arcCenter: .topRight,
                               arcContentColor: darkBlueColor)
        rightEllipsHalfView = .init(cubeColor: .clear,
                                    arcCenter: .topLeft,
                                    arcContentColor: darkBlueColor)
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        calculateFrames()
    }
}

// MARK: - Private methods
extension LogoView {
    private func configureView() {
        addSubviews([
            ellipsView,
            leftEllipsHalfView,
            rightEllipsHalfView,
        ])
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func calculateFrames() {
        let ellipsViewWidth = frame.width * 2/3
        let ellipsViewHeight = frame.height
        ellipsView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: ellipsViewWidth,
                                  height: ellipsViewHeight)
        leftEllipsHalfView.frame = CGRect(x: ellipsViewWidth / 2,
                                          y: ellipsViewHeight / 2,
                                          width: frame.width / 3,
                                          height: ellipsViewHeight / 2)
        rightEllipsHalfView.frame = CGRect(x: ellipsViewWidth,
                                           y: ellipsViewHeight / 2,
                                           width: frame.width / 3,
                                           height: ellipsViewHeight / 2)
    }
}
