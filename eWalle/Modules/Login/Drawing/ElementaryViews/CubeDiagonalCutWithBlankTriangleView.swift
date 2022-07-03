//
//  CubeDiagonalCut.swift
//  eWalle
//
//  Created by David Sergeev on 24/06/2022.
//

import UIKit

final class CubeDiagonalCutWithBlankTriangleView: UIView {
    private let cubeColor: UIColor
    private let triangleVertexIn: TriangleVertexIn
    private let triangleColor: UIColor
    private let frontLayer = CAShapeLayer()
    
    enum TriangleVertexIn {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
    }
    
    init(
        cubeColor: UIColor,
        triangleColor: UIColor,
        triangleVertexIn: TriangleVertexIn
    ) {
        self.cubeColor = cubeColor
        self.triangleColor = triangleColor
        self.triangleVertexIn = triangleVertexIn
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        drawPath()
    }
}

// MARK: - Private methods
extension CubeDiagonalCutWithBlankTriangleView {
    private func configureView() {
        backgroundColor = cubeColor
        translatesAutoresizingMaskIntoConstraints = false
        
        frontLayer.fillColor = triangleColor.cgColor
        layer.addSublayer(frontLayer)
    }
    
    private func drawPath() {
        var triangleVertexPoint: CGPoint
        var diagonalLowerPoint: CGPoint
        var diagonalUpperPoint: CGPoint
        
        switch triangleVertexIn {
        case .topLeft:
            triangleVertexPoint = CGPoint(x: 0,
                                          y: 0)
            diagonalLowerPoint = CGPoint(x: 0,
                                         y: frame.height)
            diagonalUpperPoint = CGPoint(x: frame.width,
                                         y: 0)
        case .topRight:
            triangleVertexPoint = CGPoint(x: frame.width,
                                          y: 0)
            diagonalLowerPoint = CGPoint(x: frame.width,
                                         y: frame.height)
            diagonalUpperPoint = CGPoint(x: 0,
                                         y: 0)
        case .bottomLeft:
            triangleVertexPoint = CGPoint(x: 0,
                                          y: frame.height)
            diagonalLowerPoint = CGPoint(x: frame.width,
                                         y: frame.height)
            diagonalUpperPoint = CGPoint(x: 0,
                                         y: 0)
        case .bottomRight:
            triangleVertexPoint = CGPoint(x: frame.width,
                                          y: frame.height)
            diagonalLowerPoint = CGPoint(x: 0,
                                         y: frame.height)
            diagonalUpperPoint = CGPoint(x: frame.width,
                                         y: 0)
        }
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: triangleVertexPoint)
        bezierPath.addLine(to: diagonalLowerPoint)
        bezierPath.addLine(to: diagonalUpperPoint)
        bezierPath.addLine(to: triangleVertexPoint)
        bezierPath.close()
        
        frontLayer.path = bezierPath.cgPath
        
    }
}
