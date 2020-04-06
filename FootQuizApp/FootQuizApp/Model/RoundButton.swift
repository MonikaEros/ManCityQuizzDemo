//
//  RoundButton.swift
//  FootQuizApp
//
//  Created by Yuriy Oksamytny on 06/04/2020.
//  Copyright © 2020 Yuriy Oksamytny. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class RoundButton: UIButton {
    
    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = 15
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = 15
        }
    }
}
