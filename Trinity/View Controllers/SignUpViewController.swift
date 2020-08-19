//
//  SignUpViewController.swift
//  Trinity
//
//  Created by Isaac Sanga on 8/18/20.
//  Copyright © 2020 Isaac Zahau. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpEmailTextField: UITextField!
    
    
    @IBOutlet weak var signUpPasswordTextField: UITextField!
    
    @IBOutlet weak var signUpConfirmPasswordTextField: UITextField!
    
    @IBOutlet weak var signUpOrganizationTextField: UITextField!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var signUpErrorLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Hide the error label
        signUpErrorLable.alpha = 0
    }
    
    
    func validateFields() -> String? {
        
        // Check if there are any empty fields
        if signUpEmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            signUpPasswordTextField.text?.trimmingCharacters(in: .newlines) == "" ||
            signUpConfirmPasswordTextField.text?.trimmingCharacters(in: .newlines) == "" ||
            signUpOrganizationTextField.text?.trimmingCharacters(in: .newlines) == ""
        {
            return "Please fill in all fields"
        }
        
        // Check if password is secure
        if signUpPasswordTextField.text!.trimmingCharacters(in: .newlines) != signUpConfirmPasswordTextField.text!.trimmingCharacters(in: .newlines)
        {
            return "Passwords do not match"
        }
        
        if !isPasswordValid(signUpPasswordTextField.text!.trimmingCharacters(in: .newlines)){
            return "Password not valid"
        }
        
        return nil
    }
    
    func isPasswordValid(_ password : String) -> Bool{
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        
        return passwordTest.evaluate(with: password)
    }
    
    
    @IBAction func signUpClicked(_ sender: Any)
    {
        // Validate fields
        let error = validateFields()
        
        if error != nil
        {
            showError(error!)
        }
        else
        {
            // Create user
            Auth.auth().createUser(withEmail: signUpEmailTextField.text!.trimmingCharacters(in: .newlines), password: signUpPasswordTextField.text!.trimmingCharacters(in: .newlines)) { (result, error) in
                
                // Check for errors
                if error != nil
                {
                    self.showError("Unable to create user")
                }
                else
                {
                    
                }
            }
                   
            // Go to email confirmation screen
            
        }
        
        
    }
    
    func showError(_ message: String) {
        
        signUpErrorLable.text = message
        signUpErrorLable.alpha = 1
        
    }
    

}
