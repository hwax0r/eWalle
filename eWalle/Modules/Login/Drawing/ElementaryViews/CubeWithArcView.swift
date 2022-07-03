//
//  CubeWithArcView.swift
//  eWalle
//
//  Created by David Sergeev on 24/06/2022.
//

import UIKit

final class CubeWithArcView: UIView {
    private let cubeColor: UIColor
    private let arcCenter: ArcCenter
    private var arcContentColor: UIColor = UIColor.white
    private let frontLayer = CAShapeLayer()

    enum ArcCenter {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
    }
    
    init(cubeColor: UIColor, arcCenter: ArcCenter) {
        self.cubeColor = cubeColor
        self.arcCenter = arcCenter
        super.init(frame: .zero)
        
        configureView()
    }
    
    convenience init(cubeColor: UIColor, arcCenter: ArcCenter, arcContentColor: UIColor) {
        self.init(cubeColor: cubeColor, arcCenter: arcCenter)
        self.arcContentColor = arcContentColor
        
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
extension CubeWithArcView {
    private func configureView() {
        backgroundColor = cubeColor
        translatesAutoresizingMaskIntoConstraints = false
        
        frontLayer.mask = CAShapeLayer()
        frontLayer.backgroundColor = arcContentColor.cgColor
        layer.addSublayer(frontLayer)
    }
    
    private func drawPath() {
        let arcRadius = frame.width
        var arcCenterPoint: CGPoint
        var startAngle: CGFloat
        var endAngle: CGFloat
        var clockwise = false
        frontLayer.frame = bounds
        
        
        switch arcCenter {
        case .topLeft :
            startAngle = 0
            endAngle = -1 * CGFloat.pi / 2
            arcCenterPoint = CGPoint(x: 0,
                                     y: 0)
            clockwise = true
        case .topRight:
            startAngle = CGFloat.pi
            endAngle = 3/2 * CGFloat.pi
            arcCenterPoint = CGPoint(x: self.frame.width,
                                     y: 0)
        case .bottomLeft:
            startAngle = 0
            endAngle = CGFloat.pi / 2
            arcCenterPoint = CGPoint(x: 0,
                                     y: self.frame.height)
        case .bottomRight:
            startAngle = CGFloat.pi / 2
            endAngle =  CGFloat.pi
            arcCenterPoint = CGPoint(x: self.frame.width,
                                     y: self.frame.height)
        }

        let bezierPath = UIBezierPath()
        bezierPath.addArc(withCenter: arcCenterPoint,
                          radius: arcRadius,
                          startAngle: startAngle,
                          endAngle: endAngle,
                          clockwise: clockwise)
        bezierPath.close()
        
        (frontLayer.mask as? CAShapeLayer)?.frame = bounds
        (frontLayer.mask as? CAShapeLayer)?.path = bezierPath.cgPath
    }
}
