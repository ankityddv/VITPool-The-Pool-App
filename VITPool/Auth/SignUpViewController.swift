//
//  SignUpViewController.swift
//  VITPool
//
//  Created by ANKIT YADAV on 24/01/20.
//  Copyright © 2020 ANKIT YADAV. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    //Declaring all the textFields and Buttons
    @IBOutlet weak var emailField: Designed!
    @IBOutlet weak var passwordField: Designed!
    @IBOutlet weak var signUpBttn: UIButton!
    
    @IBAction func signUpBttn(_ sender: Any) {
        createUser()
    }
    
    func createUser(){
        let email = emailField.text!
        let password = passwordField.text!
        if password.count < 6 && password.count >= 1 {
            // create the alert
            let alert = UIAlertController(title: "Invalid!!!", message: "Password must be greater than 6 characters!", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        else if email.count == 0 && password.count == 0 {
            // create the alert
            let alert = UIAlertController(title: "Invalid!!!", message: "Please enter the email and password!", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        else{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                self.performSegue(withIdentifier: "user_created", sender: self)
            }
            loader()
            //CustomLoader.instance.showLoaderView()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpBttn.layer.cornerRadius = 15
        //Hide Keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func loader(){
        CustomLoader.instance.gifName = "demo"
        CustomLoader.instance.showLoaderView()
    }
    // MARK: - Code below this is for hiding keyboard

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func hideKeyboard(){
        view.resignFirstResponder()
    }
    
    @objc func keyboardwilchange(notification: Notification){
        view.frame.origin.y = -270

    }
    
    //UITextFieldDeligate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    //Hide when touch outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        view.frame.origin.y = 0
    }

}
