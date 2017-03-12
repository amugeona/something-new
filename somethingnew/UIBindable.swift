//
//  UIBindable.swift
//  somethingnew
//
//  Created by KimYong Gyun on 12/3/17.
//  Copyright © 2017 haruair. All rights reserved.
//

protocol UIBindable {
    var rawData : Any? { get set }
    var binding : String? { get set }
    func bind()
    func willBind()
    func didBind()
}

extension UIBindable {
    func bind () {
        self.willBind()
        let data = Binder.instance
        data.bind(key: self.binding!, object: self)
        self.didBind()
    }

    func willBind () {
    }
    func didBind () {
    }
}
