//
//  TextFiledPadding.swift
//  Lingvist
//
//  Created by Xiaowen WANG on 2018/1/16.
//  Copyright © 2018年 Xiaowen WANG. All rights reserved.
//

import Foundation

import UIKit

class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return self.newBounds(bounds: bounds)
    }
    
    override func placeholderRect(forBounds bounds: CGRect)  -> CGRect {
        return self.newBounds(bounds: bounds)
    }
    
    override func editingRect(forBounds bounds: CGRect)  -> CGRect {
        return self.newBounds(bounds: bounds)
    }
    
    private func newBounds(bounds: CGRect)  -> CGRect {
    var newBounds = bounds
    newBounds.origin.x += padding.left
    newBounds.origin.y += padding.top
    newBounds.size.height -= padding.top + padding.bottom
    newBounds.size.width -= padding.left + padding.right
    return newBounds
    }
}
