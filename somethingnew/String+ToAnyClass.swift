//
//  String+ToAnyClass.swift
//  somethingnew
//
//  Created by KimYong Gyun on 12/3/17.
//  Copyright © 2017 haruair. All rights reserved.
//

import Foundation

extension String {
    func ToAnyClass() -> AnyClass! {
        /// get namespace
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        /// get 'anyClass' with classname and namespace
        let cls: AnyClass = NSClassFromString("\(namespace).\(self)")!
        // return AnyClass!
        return cls
    }
}
