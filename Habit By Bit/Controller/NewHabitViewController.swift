//
//  NewHabitViewController.swift
//  Habit By Bit
//
//  Created by Grant Kim on 1/4/18.
//  Copyright © 2018 2.5 Yellow. All rights reserved.
//

import UIKit

class NewHabitViewController: UIViewController {
    @IBOutlet weak var habitField: UITextField!
    @IBOutlet weak var motivationField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        styleUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // collapses keyboard
        self.view.endEditing(true)
    }
    
    func styleUI() {
       
        motivationField.layer.borderWidth = 1
        habitField.layer.borderWidth = 1
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        
        // collapses view of modal view controller
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
