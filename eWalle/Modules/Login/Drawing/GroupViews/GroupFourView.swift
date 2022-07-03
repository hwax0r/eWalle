//
//  GroupFourView.swift
//  eWalle
//
//  Created by David Sergeev on 27/06/2022.
//

import UIKit

final class GroupFourView: UIView {
    private let bigCube: CubeDiagonalCutWithBlankTriangleView
    private let littleCube: CubeDiagonalCutWithBlankTriangleView
    
    init(
        bigCubeColor: UIColor,
        littleCubeColor: UIColor
    ) {
        bigCube = .init(cubeColor: bigCubeColor,
                        triangleColor: .white,
                        triangleVertexIn: .bottomRight)
        littleCube = .init(cubeColor: littleCubeColor,
                           triangleColor: .white,
                           triangleVertexIn: .topLeft)
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
extension GroupFourView {
    private func configureView() {
        addSubviews([
            bigCube,
            littleCube,
        ])
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func calculateFrames() {
        bigCube.frame = CGRect(x: 0,
                               y: 0,
                               width: frame.width,
                               height: frame.height)
        littleCube.frame = CGRect(x: frame.width / 2,
                                  y: frame.height / 2,
                                  width: frame.width / 2,
                                  height: frame.height / 2)
    }
}
