//
//  AddDetailsViewController.swift
//  VITPool
//
//  Created by ANKIT YADAV on 24/01/20.
//  Copyright © 2020 ANKIT YADAV. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class AddDetailsViewController: UIViewController {
    
    var ref:DatabaseReference?
    
    //Declaring all the textFields and Buttons
    @IBOutlet weak var nameField: Designed!
    @IBOutlet weak var regField: Designed!
    @IBOutlet weak var vitemailField: Designed!
    @IBOutlet weak var phoneField: Designed!
    @IBOutlet weak var continueBttn: UIButton!
    @IBAction func continueBttn(_ sender: Any) {
        updateData()
        self.performSegue(withIdentifier: "signedUp", sender: self)
    }
    
    func updateData() {
        self.ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        if self.nameField.text != "" && self.regField.text != ""{
            self.ref?.child("USER").child(uid).setValue(["Name" : self.nameField.text ,"Registration Number" : self.regField.text ,"VIT Email" : self.vitemailField.text, "Phone Number" : self.phoneField.text])
            loader()
        }
        else
        {
            // create the alert
            let alert = UIAlertController(title: "Invalid!r!!", message: "Please fill all the details!", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueBttn.layer.cornerRadius = 15
        //Hide Keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func loader(){
        CustomLoader.instance.gifName = "dmeo"
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
        view.frame.origin.y = 0
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

//&& self.vitemailField.text != ""&& self.phoneField.text != ""
