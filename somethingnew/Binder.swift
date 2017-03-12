//
//  Binder.swift
//  somethingnew
//
//  Created by KimYong Gyun on 12/3/17.
//  Copyright © 2017 haruair. All rights reserved.
//

import UIKit

class Binder {
    static let instance = Binder()

    var data : Dictionary<String, Array<UIBindable>>
    var ctrlData : [ViewControllerBindObject]

    init() {
        data = [:]
        ctrlData = []
    }

    func bind (key: String, object: UIBindable) {
        if data[key] == nil {
            data[key] = []
        }
        data[key]?.append(object)
    }

    func update (key: String, newValue: Any?, currentCtrl: UIViewController? = nil) {
        if let fields = data[key] {
            for field in fields {
                var f = field
                f.rawData = newValue
            }
        }
        for bindObj in ctrlData {
            if currentCtrl != bindObj.ctrl {
                bindObj.ctrl.setValue(newValue, forKey: key)
            }
        }
    }
    
    static func bindController(_ ctrl: UIViewController) {
        let bind = Binder.instance
        bind.ctrlData.append(ViewControllerBindObject(ctrl))
    }

    static func unbindController(_ ctrl: UIViewController) {
        let bind = Binder.instance
        let index = bind.ctrlData.index { (bindObject) -> Bool in
            return bindObject.ctrl == ctrl
        }
        if let index = index {
            bind.ctrlData.remove(at: index)
        }
    }
}
