//
//  Extension.swift
//  X&0
//
//  Created by Ionut Marinica on 06/04/2019.
//  Copyright © 2019 Ionut Marinica. All rights reserved.
//

import UIKit

extension UILabel {
    
    func myText(text: String?, textColor: UIColor?, backgroundColor: UIColor?, font: UIFont?, textAlignment: NSTextAlignment?) {
        self.text = text
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.font = font
        self.textAlignment = textAlignment ?? .center
        
    }
}

extension UILabel {
    
    func myLayer(){
        layer.cornerRadius = 20
        layer.backgroundColor = #colorLiteral(red: 1, green: 0.3019607843, blue: 0.3019607843, alpha: 1)
    }
}

extension UIView {
    
    func myLayer( borderWidth: CGFloat, borderColor: UIColor?, cornerRadius: CGFloat, layerBackgroundColor: UIColor?) {
        
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor
        self.layer.cornerRadius = cornerRadius
        self.layer.backgroundColor = layerBackgroundColor?.cgColor
    }
}
