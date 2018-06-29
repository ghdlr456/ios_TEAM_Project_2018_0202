//
//  fingersViewController.swift
//  UiTableViewController Test 02
//
//  Created by D7703_02 on 2018. 6. 29..
//  Copyright © 2018년 lse. All rights reserved.
//

import UIKit

class fingersViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        input.delegate = self
        input.clearButtonMode = UITextFieldViewMode.always

        // Do any additional setup after loading the view.
    }

    @IBAction func touchesBegan(_ sender: Any) {
        let number = arc4random() % 6
        print(number)
        let numberString = String(number)
        
        if input.text == numberString {
            resultLabel.text = "빙고!!!"
        } else {
            resultLabel.text = "실패!!! Try again!!! 숨겨진 숫자는 현재 \(number)"
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        input.resignFirstResponder()
        view.backgroundColor = UIColor.yellow
        return true
    }
    

}
