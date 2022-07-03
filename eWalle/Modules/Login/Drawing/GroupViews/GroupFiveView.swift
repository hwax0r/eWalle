//
//  GroupFiveView.swift
//  eWalle
//
//  Created by David Sergeev on 28/06/2022.
//

import UIKit

final class GroupFiveView: UIView {
    private let bigCube: CubeDiagonalCutWithBlankTriangleView
    private let topLeftCube: CubeDiagonalCutWithBlankTriangleView
    private let topRightCube: RectangleView
    private let bottomLeftCube: CubeDiagonalCutWithBlankTriangleView
    private let bottomRightCube: CubeWithArcView
    
    init(
        bigCubeColor: UIColor,
        circleHalfColor: UIColor,
        topLeftCubeColor: UIColor,
        topRightCubeColor: UIColor,
        bottomLeftCubeColor: UIColor,
        bottomRightCubeColor: UIColor
    ) {
        bigCube = .init(cubeColor: bigCubeColor,
                        triangleColor: .white,
                        triangleVertexIn: .bottomRight)
        topLeftCube = .init(cubeColor: .clear,
                            triangleColor: topLeftCubeColor,
                            triangleVertexIn: .topRight)
        topRightCube = .init(color: topRightCubeColor)
        bottomLeftCube = .init(cubeColor: .clear,
                               triangleColor: bottomLeftCubeColor,
                               triangleVertexIn: .topRight)
        bottomRightCube = .init(cubeColor: .white,
                                arcCenter: .topRight,
                                arcContentColor: bottomRightCubeColor)
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
extension GroupFiveView {
    private func configureView() {
        addSubviews([
            bigCube,
            topLeftCube,
            topRightCube,
            bottomLeftCube,
            bottomRightCube,
        ])
    }
    
    private func calculateFrames() {
        bigCube.frame = CGRect(x: 0,
                               y: 0,
                               width: frame.width,
                               height: frame.height)
        topLeftCube.frame = CGRect(x: 0,
                                   y: 0,
                                   width: frame.width / 2,
                                   height: frame.height / 2)
        topRightCube.frame = CGRect(x: frame.width / 2,
                                    y: 0,
                                    width: frame.width / 2,
                                    height: frame.height / 2)
        bottomLeftCube.frame = CGRect(x: 0,
                                      y: frame.height / 2,
                                      width: frame.width / 2,
                                      height: frame.height / 2)
        bottomRightCube.frame = CGRect(x: frame.width / 2,
                                       y: frame.height / 2,
                                       width: frame.width / 2,
                                       height: frame.height / 2)
    }
}
