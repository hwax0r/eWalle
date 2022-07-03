//
//  GroupTwoView.swift
//  eWalle
//
//  Created by David Sergeev on 26/06/2022.
//

import UIKit

final class GroupTwoView: UIView {
    private let topLeftCube: CubeDiagonalCutWithBlankTriangleView
    private let topRightCube: CubeDiagonalCutWithBlankTriangleView
    private let bottomLeftCube: CubeDiagonalCutWithBlankTriangleView
    private let bottomRightCube: CubeDiagonalCutWithBlankTriangleView
    
    init(
        topLeftCubeColor: UIColor,
        topRightCubeColor: UIColor,
        bottomLeftCubeColor: UIColor,
        bottomRightCubeColor: UIColor
    ) {
        topLeftCube = .init(cubeColor: topLeftCubeColor,
                            triangleColor: .white,
                            triangleVertexIn: .bottomLeft)
        topRightCube = .init(cubeColor: topRightCubeColor,
                             triangleColor: .white,
                             triangleVertexIn: .topLeft)
        bottomLeftCube = .init(cubeColor: bottomLeftCubeColor,
                               triangleColor: .white,
                               triangleVertexIn: .bottomRight)
        bottomRightCube = .init(cubeColor: bottomRightCubeColor,
                                triangleColor: .white,
                                triangleVertexIn: .topRight)
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
extension GroupTwoView {
    private func configureView() {
        addSubviews([
            topLeftCube,
            topRightCube,
            bottomLeftCube,
            bottomRightCube,
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
                                   height: cubeHeight)
        bottomLeftCube.frame = CGRect(x: 0,
                                   y: cubeHeight,
                                   width: cubeWidth,
                                   height: cubeHeight)
        bottomRightCube.frame = CGRect(x: cubeWidth,
                                   y: cubeHeight,
                                   width: cubeWidth,
                                   height: cubeHeight)
    }
}
