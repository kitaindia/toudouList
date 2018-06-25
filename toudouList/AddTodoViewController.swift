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
    @IBOutlet weak var errorText: UILabel!
    
    var toudouList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let stringList = UserDefaults.standard.object(forKey: "toudouList") as? [String] {
            toudouList = stringList
        }
        
        errorText.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func add(_ sender: Any) {
        
        if let text = textField.text {
            
            if validate(text: text) {
                toudouList.append(text)
                UserDefaults.standard.set(toudouList, forKey: "toudouList")
                textField.text = nil
                errorText.isHidden = true
            } else {
                errorText.isHidden = false
            }
        }

        

     }
    
    func validate(text: String) -> (Bool) {
        guard let regex = try? NSRegularExpression(pattern: "^藤堂") else { return false }
            
        return (regex.firstMatch(in: text, options: NSRegularExpression.MatchingOptions(), range: NSRange(location: 0, length: text.count)) != nil)
    }
}
