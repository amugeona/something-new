//
//  MyTableViewDataSource.swift
//  somethingnew
//
//  Created by KimYong Gyun on 12/3/17.
//  Copyright © 2017 haruair. All rights reserved.
//

import Foundation
import UIKit

class MyTableViewDataSource : NSObject, BindableTableDataSource {
    var tableView : KoalaUITableView?
    required init(_ tableView: KoalaUITableView) {
        self.tableView = tableView
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = self.tableView?.data as! [String]
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: (self.tableView?.bindingCell!)!)
        let data = self.tableView?.data as! [String]
        cell?.textLabel?.text = data[indexPath.row]
        return cell!
    }
}
