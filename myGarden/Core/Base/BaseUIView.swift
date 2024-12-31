//
//  BaseView.swift
//  MyGarden
//
//  Created by zeze kim on 12/28/24.
//

import UIKit
import SnapKit

class BaseUIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        
    }
    
    func setConstraints() {}

}
