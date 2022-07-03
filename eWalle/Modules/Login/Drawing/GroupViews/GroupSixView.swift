//
//  GroupSixView.swift
//  eWalle
//
//  Created by David Sergeev on 28/06/2022.
//

import UIKit

final class GroupSixView: UIView {
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
        topLeftCube = .init(cubeColor: .clear,
                            arcCenter: .bottomLeft,
                            arcContentColor: topLeftCubeColor)
        topRightCube = .init(cubeColor: .clear,
                             arcCenter: .bottomRight,
                             arcContentColor: topRightCubeColor)
        bottomLeftCube = .init(cubeColor: .clear,
                               arcCenter: .topLeft,
                               arcContentColor: bottomLeftCubeColor)
        bottomRightCube = .init(cubeColor: .clear,
                                arcCenter: .topRight,
                                arcContentColor: bottomRightCubeColor)
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
extension GroupSixView {
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
        
        let ellipsSizeCoefficient = 0.6
        let ellipsFrameCorrdinateCoefficient = (1 - ellipsSizeCoefficient) / 2
        
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
        ellips.frame = CGRect(x: -frame.width * ellipsSizeCoefficient / 2,
                              y: frame.height * ellipsFrameCorrdinateCoefficient,
                              width: frame.width * ellipsSizeCoefficient,
                              height: frame.height * ellipsSizeCoefficient)
    }
}
