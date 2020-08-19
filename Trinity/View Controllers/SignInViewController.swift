//
//  SignInViewController.swift
//  Trinity
//
//  Created by Isaac Sanga on 8/18/20.
//  Copyright © 2020 Isaac Zahau. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var signInEmailTextField: UITextField!
    
    @IBOutlet weak var signInPasswordTextField: UITextField!
    
    @IBOutlet weak var signInLabel: UILabel!
    
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Hide the error label
        signInLabel.alpha = 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func signInClicked(_ sender: Any) {
    }
}
