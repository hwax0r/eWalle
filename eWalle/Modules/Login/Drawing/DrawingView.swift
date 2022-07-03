//
//  DrawingView.swift
//  eWalle
//
//  Created by David Sergeev on 29/06/2022.
//

import UIKit

final class DrawingView: UIView {
    private let orangeColor = UIColor(red: 1, green: 0.675, blue: 0.188, alpha: 1)
    private let lightBlueColor = UIColor(red: 0.343, green: 0.848, blue: 0.958, alpha: 1)
    private let darkBlueColor = UIColor(red: 0.227, green: 0.259, blue: 0.463, alpha: 1)
    private let coralColor = UIColor(red: 1, green: 0.208, blue: 0.421, alpha: 1)
    private let whiteColor = UIColor.white
    
    private let groupOneView: GroupOneView
    private let groupTwoView: GroupTwoView
    private let groupThreeView: GroupThreeView
    private let groupFourView: GroupFourView
    private let groupFiveView: GroupFiveView
    private let groupSixView: GroupSixView
        
    init() {
        groupOneView = .init(topLeftCubeColor: orangeColor,
                             topRightCubeColor: coralColor,
                             bottomLeftCubeColor: orangeColor,
                             bottomRightCubeColor: darkBlueColor,
                             ellipsColor: lightBlueColor)
        groupTwoView = .init(topLeftCubeColor: orangeColor,
                             topRightCubeColor: lightBlueColor,
                             bottomLeftCubeColor: coralColor,
                             bottomRightCubeColor: darkBlueColor)
        groupThreeView = .init(topLeftCubeColor: coralColor,
                               topRightCubeColor: darkBlueColor,
                               bottomLeftCubeColor: orangeColor,
                               bottomRightCubeColor: darkBlueColor,
                               centerTopLeftCubeArcContentColor: lightBlueColor,
                               centerBottomLeftCubeArcContentColor: coralColor,
                               centerBottomRightCubeArcContentColor: coralColor)
        groupFourView = .init(bigCubeColor: orangeColor,
                              littleCubeColor: coralColor)
        groupFiveView = .init(bigCubeColor: lightBlueColor,
                              circleHalfColor: lightBlueColor,
                              topLeftCubeColor: darkBlueColor,
                              topRightCubeColor: lightBlueColor,
                              bottomLeftCubeColor: darkBlueColor,
                              bottomRightCubeColor: lightBlueColor)
        groupSixView = .init(topLeftCubeColor: lightBlueColor,
                             topRightCubeColor: coralColor,
                             bottomLeftCubeColor: lightBlueColor,
                             bottomRightCubeColor: coralColor,
                             ellipsColor: whiteColor)
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
extension DrawingView {
    private func configureView() {
        addSubviews([
            groupOneView,
            groupTwoView,
            groupThreeView,
            groupFourView,
            groupFiveView,
            groupSixView,
        ])
        backgroundColor = whiteColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func calculateFrames() {
        let cubeAmount: CGFloat = 6
        let cubeWidth = frame.width
        let cubeHeight = frame.height / cubeAmount
        
        groupOneView.frame = CGRect(x: 0,
                                    y: 0,
                                    width: cubeWidth,
                                    height: cubeHeight)
        groupTwoView.frame = CGRect(x: 0,
                                    y: groupOneView.frame.maxY,
                                    width: cubeWidth,
                                    height: cubeHeight)
        groupThreeView.frame = CGRect(x: 0,
                                      y: groupTwoView.frame.maxY,
                                      width: cubeWidth,
                                      height: cubeHeight)
        groupFourView.frame = CGRect(x: 0,
                                     y: groupThreeView.frame.maxY,
                                     width: cubeWidth,
                                     height: cubeHeight)
        groupFiveView.frame = CGRect(x: 0,
                                     y: groupFourView.frame.maxY,
                                     width: cubeWidth,
                                     height: cubeHeight)
        groupSixView.frame = CGRect(x: 0,
                                    y: groupFiveView.frame.maxY,
                                    width: cubeWidth,
                                    height: cubeHeight)
    }
}
