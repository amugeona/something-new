//
//  KoalaUIViewController.swift
//  somethingnew
//
//  Created by KimYong Gyun on 12/3/17.
//  Copyright © 2017 haruair. All rights reserved.
//

import UIKit

class KoalaUIViewController : UIViewController {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.bind()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.bind()
    }

    deinit {
        self.unbind()
    }
    
    func bind() {
        Binder.bindController(self)
    }
    
    func unbind() {
        Binder.unbindController(self)
    }
}
