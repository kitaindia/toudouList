//
//  AddTodoViewController.swift
//  toudouList
//
//  Created by 竹原正起 on 2018/06/25.
//  Copyright © 2018年 竹原正起. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var toudouList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let stringList = UserDefaults.standard.object(forKey: "toudouList") as? [String] {
            toudouList = stringList
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func add(_ sender: Any) {
        if let text = textField.text {
            // TODO: 藤堂かどうかのバリデーションを入れる
            toudouList.append(text)
            UserDefaults.standard.set(toudouList, forKey: "toudouList")
            textField.text = nil
        }
    }
}
