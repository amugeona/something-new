//
//  BindController.swift
//  somethingnew
//
//  Created by KimYong Gyun on 12/3/17.
//  Copyright © 2017 haruair. All rights reserved.
//

import UIKit

class BindController {
    init(_ ctrl: UIViewController) {
        let bind = BindData.instance
        bind.bindController(ctrl)
    }
}
