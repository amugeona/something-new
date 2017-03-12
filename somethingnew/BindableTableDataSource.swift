//
//  BindableTableDataSource.swift
//  somethingnew
//
//  Created by KimYong Gyun on 12/3/17.
//  Copyright © 2017 haruair. All rights reserved.
//

import Foundation
import UIKit

protocol BindableTableDataSource : UITableViewDataSource {
    init(_ tableView: KoalaUITableView)
}
