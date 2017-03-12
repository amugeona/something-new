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
}
