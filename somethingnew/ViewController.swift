//
//  ViewController.swift
//  somethingnew
//
//  Created by KimYong Gyun on 12/3/17.
//  Copyright © 2017 haruair. All rights reserved.
//

import UIKit

class ViewController: KoalaUIViewController {
    
    dynamic var items : [String] = []
    dynamic var hello : String?
    dynamic var hello2 : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hello = "Hello world"
        self.hello2 = "E2"
        self.items = ["hello", "world"]
        self.items.append("World")
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            self.items.append("World2")
        }
    }

    @IBAction func SaveBtnTouched(_ sender: Any) {
        if let msg = self.hello, msg != "" {
            self.items.append(msg)
            self.hello = ""
        }
        if let msg = self.hello2, msg != "" {
            self.items.append(msg)
            self.hello2 = ""
        }
    }

    @IBAction func DeleteAllBtnTouched(_ sender: Any) {
        self.items.removeAll()
    }
}
