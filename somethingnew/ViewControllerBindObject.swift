//
//  ViewControllerBindObject.swift
//  somethingnew
//
//  Created by KimYong Gyun on 12/3/17.
//  Copyright © 2017 haruair. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerBindObject : NSObject {
    var ctrl : UIViewController
    var props : [String]
    init(_ bindCtrl : UIViewController) {
        ctrl = bindCtrl
        
        let mirror = Mirror(reflecting: ctrl)
        
        self.props = mirror.children.flatMap {
            return $0.label!
        }
        
        super.init()
        
        for prop in self.props {
            ctrl.addObserver(self, forKeyPath: prop, options: [.initial, .new, .old], context: nil)
        }
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let bind = Binder.instance
        if let keyPath = keyPath, let change = change, let newValue = change[NSKeyValueChangeKey.newKey] as Any? {
            bind.update(key: keyPath, newValue: newValue, currentCtrl: self.ctrl)
        }
    }
    deinit {
        for prop in self.props {
            ctrl.removeObserver(self, forKeyPath: prop)
        }
    }
}
