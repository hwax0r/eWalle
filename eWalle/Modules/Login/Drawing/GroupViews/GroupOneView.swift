//
//  GroupOneView.swift
//  eWalle
//
//  Created by David Sergeev on 25/06/2022.
//

import UIKit

final class GroupOneView: UIView {
    private let topLeftCube: CubeWithArcView
    private let topRightCube: CubeWithArcView
    private let bottomLeftCube: CubeWithArcView
    private let bottomRightCube: CubeWithArcView
    private let ellips: EllipsInRectView
    
    
    init(
        topLeftCubeColor: UIColor,
        topRightCubeColor: UIColor,
        bottomLeftCubeColor: UIColor,
        bottomRightCubeColor: UIColor,
        ellipsColor: UIColor
    ) {
        topLeftCube = .init(cubeColor: topLeftCubeColor,
                            arcCenter: .bottomRight)
        topRightCube = .init(cubeColor: topRightCubeColor,
                             arcCenter: .bottomLeft)
        bottomLeftCube = .init(cubeColor: bottomLeftCubeColor,
                               arcCenter: .topRight)
        bottomRightCube = .init(cubeColor: bottomRightCubeColor,
                                arcCenter: .topLeft)
        ellips = .init(ellipsColor: ellipsColor)
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
extension GroupOneView {
    private func configureView() {
        addSubviews([
            topLeftCube,
            topRightCube,
            bottomLeftCube,
            bottomRightCube,
            ellips,
        ])
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func calculateFrames() {
        let cubeWidth = frame.width / 2
        let cubeHeight = frame.height / 2
        
        let ellipsOriginCoefficient = 2.2556
        let ellipsSizeCoefficient = 1.8
        let ellipsWidth = frame.width / ellipsSizeCoefficient
        let ellipsHeight = frame.height / ellipsSizeCoefficient
        
        topLeftCube.frame = CGRect(x: 0,
                                   y: 0,
                                   width: cubeWidth,
                                   height: cubeHeight)
        topRightCube.frame = CGRect(x: cubeWidth,
                                    y: 0,
                                    width: cubeWidth,
                                    height: cubeHeight)
        bottomLeftCube.frame = CGRect(x: 0,
                                      y: cubeHeight,
                                      width: cubeWidth,
                                      height: cubeHeight)
        bottomRightCube.frame = CGRect(x: cubeWidth,
                                       y: cubeHeight,
                                       width: cubeWidth,
                                       height: cubeHeight)
        ellips.frame = CGRect(x: cubeWidth / ellipsOriginCoefficient,
                              y: cubeHeight / ellipsOriginCoefficient,
                              width: ellipsWidth,
                              height: ellipsHeight)
    }
}
