//
//  EllipsInRectView.swift
//  eWalle
//
//  Created by David Sergeev on 25/06/2022.
//

import UIKit

final class EllipsInRectView: UIView {
    private let ellipsColor: UIColor
    private let frontLayer = CAShapeLayer()
        
    init(ellipsColor: UIColor) {
        self.ellipsColor = ellipsColor
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
extension EllipsInRectView {
    private func configureView() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        
        frontLayer.fillColor = ellipsColor.cgColor
        layer.addSublayer(frontLayer)
    }
    
    private func drawPath() {
        let bezierPath = UIBezierPath(ovalIn: bounds)
        bezierPath.close()
        
        frontLayer.path = bezierPath.cgPath
        frontLayer.frame = bounds
    }
}
