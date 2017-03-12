//
//  KoalaUITableView.swift
//  somethingnew
//
//  Created by KimYong Gyun on 12/3/17.
//  Copyright © 2017 haruair. All rights reserved.
//

import UIKit

class KoalaUITableView : UITableView, UIBindable {
    var bindingCell : String?
    var bindingDataSource : String? {
        didSet {
            if let bindingDataSource = bindingDataSource {
                let cls = stringClassFromString(bindingDataSource) as! BindableTableDataSource.Type
                self.preparedDataSource = cls.init(self)
            }
        }
    }
    var binding : String? {
        didSet {
            if binding != nil {
                self.bind()
            }
        }
    }

    var preparedDataSource: UITableViewDataSource?
    var data: Any?
    var rawData: Any? {
        get { return self.data }
        set {
            self.dataSource = self.preparedDataSource
            self.data = newValue
            self.reloadData()
        }
    }

    func bind() {
        let data = Binder.instance
        data.bind(key: self.binding!, object: self)
    }
}

func stringClassFromString(_ className: String) -> AnyClass! {
    
    /// get namespace
    let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String;
    
    /// get 'anyClass' with classname and namespace
    let cls: AnyClass = NSClassFromString("\(namespace).\(className)")!;
    
    // return AnyClass!
    return cls;
}
