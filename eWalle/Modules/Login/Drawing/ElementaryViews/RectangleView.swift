//
//  Rectangle.swift
//  eWalle
//
//  Created by David Sergeev on 27/06/2022.
//

import UIKit

final class RectangleView: UIView {
    private let rectColor: UIColor
    
    init(color: UIColor) {
        rectColor = color
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension RectangleView {
    private func configureView() {
        backgroundColor = rectColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}
