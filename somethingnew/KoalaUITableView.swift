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
                let cls = bindingDataSource.ToAnyClass() as! BindableTableDataSource.Type
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
}
