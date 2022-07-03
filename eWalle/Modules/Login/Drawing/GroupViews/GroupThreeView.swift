//
//  GroupThreeView.swift
//  eWalle
//
//  Created by David Sergeev on 26/06/2022.
//

import UIKit

final class GroupThreeView: UIView {
    private let topLeftCube: CubeWithArcView
    private let topRightCube: RectangleView
    private let bottomLeftCube: CubeWithArcView
    private let bottomRightCube: RectangleView
    private let centerTopLeftCube: CubeWithArcView
    private let centerBottomLeftCube: CubeWithArcView
    private let centerBottomRightCube: CubeWithArcView
    
    init(
        topLeftCubeColor: UIColor,
        topRightCubeColor: UIColor,
        bottomLeftCubeColor: UIColor,
        bottomRightCubeColor: UIColor,
        centerTopLeftCubeArcContentColor: UIColor,
        centerBottomLeftCubeArcContentColor: UIColor,
        centerBottomRightCubeArcContentColor: UIColor
    ) {
        topLeftCube = .init(cubeColor: topLeftCubeColor,
                            arcCenter: .bottomRight)
        topRightCube = .init(color: topRightCubeColor)
        bottomLeftCube = .init(cubeColor: bottomLeftCubeColor,
                               arcCenter: .topRight)
        bottomRightCube = .init(color: bottomRightCubeColor)
        centerTopLeftCube = .init(cubeColor: .clear,
                                  arcCenter: .bottomRight,
                                  arcContentColor: centerTopLeftCubeArcContentColor)
        centerBottomLeftCube = .init(cubeColor: .clear,
                                     arcCenter: .topRight,
                                     arcContentColor: centerBottomLeftCubeArcContentColor)
        centerBottomRightCube = .init(cubeColor: .clear,
                                      arcCenter: .topLeft,
                                      arcContentColor: centerBottomRightCubeArcContentColor)
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
extension GroupThreeView {
    private func configureView() {
        addSubviews([
            topLeftCube,
            topRightCube,
            bottomLeftCube,
            bottomRightCube,
            centerTopLeftCube,
            centerBottomLeftCube,
            centerBottomRightCube,
        ])
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func calculateFrames() {
        let cubeWidth = frame.width / 2
        let cubeHeight = frame.height / 2
        
        topLeftCube.frame = CGRect(x: 0,
                                   y: 0,
                                   width: cubeWidth,
                                   height: cubeHeight)
        topRightCube.frame = CGRect(x: cubeWidth,
                                   y: 0,
                                   width: cubeWidth,
                                   height: cubeHeight * 2)
        bottomLeftCube.frame = CGRect(x: 0,
                                   y: cubeHeight,
                                   width: cubeWidth,
                                   height: cubeHeight)
        bottomRightCube.frame = CGRect(x: cubeWidth,
                                   y: cubeHeight,
                                   width: cubeWidth,
                                   height: cubeHeight)
        centerTopLeftCube.frame = CGRect(x: cubeWidth / 2,
                                         y: cubeHeight / 2,
                                         width: cubeWidth / 2,
                                         height: cubeHeight / 2)
        centerBottomLeftCube.frame = CGRect(x: cubeWidth / 2,
                                            y: cubeHeight,
                                            width: cubeWidth / 2,
                                            height: cubeHeight / 2)
        centerBottomRightCube.frame = CGRect(x: cubeWidth,
                                             y: cubeHeight,
                                             width: cubeWidth / 2,
                                             height: cubeHeight / 2)
    }
}
