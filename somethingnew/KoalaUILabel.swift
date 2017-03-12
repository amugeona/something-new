//
//  KoalaUILabel.swift
//  somethingnew
//
//  Created by KimYong Gyun on 12/3/17.
//  Copyright © 2017 haruair. All rights reserved.
//

import UIKit

class KoalaUILabel : UILabel, UIBindable {
    override var text : String? {
        get {
            return super.text
        }
        set {
            let data = Binder.instance
            data.update(key: self.binding!, newValue: newValue)
            super.text = newValue
        }
    }
    
    var rawData : Any? {
        get {
            return self.text
        }
        set {
            super.text = newValue as! String?
        }
    }

    var binding : String? {
        didSet {
            if binding != nil {
                self.bind()
            }
        }
    }
}
