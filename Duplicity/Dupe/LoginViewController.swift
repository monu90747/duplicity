//
//  LoginViewController.swift
//  Duplicity
//
//  Created by Kaitlyn on 3/13/15.
//  Copyright (c) 2015 K8La. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, FBLoginViewDelegate {
  
    
/////////////////////////////// FACEBOOK LOGIN ////////////////////
    var fbl: FBLoginView = FBLoginView()
    
    
    func loginViewShowingLoggedInUser(loginView: FBLoginView) {
        logStatusTxt.text = "You are logged in!"
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView?, user: FBGraphUser) {
//        profilePictureView.profileID = user.objectID
        userNameTxt.text = user.first_name + " " + user.last_name
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView?) {
//        profilePictureView.profileID = nil
        userNameTxt.text = ""
        logStatusTxt.text = "You are logged out!"
    }
   
    @IBAction func submit(sender: UIButton) {
        
        
    }
//////////////////////////////////////////////////////////////////
    
  

    @IBOutlet var loginView : FBLoginView!
    
    @IBOutlet weak var userNameTxt: UILabel!
    
    @IBOutlet weak var logStatusTxt: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var logo: UILabel!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var submitLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var loginLabel: UILabel!
    
    
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var signupLabel: UILabel!
    

    
    func activeLogin () {
        
        logo.hidden = true
        email.hidden =  false
        password.hidden = false
        submitButton.hidden = false
        submitLabel.hidden = false
        loginButton.hidden = true
        loginLabel.hidden = true
        signupButton.hidden = true
        signupLabel.hidden = true
    }
    
    
    
    
    
    @IBAction func signup(sender: AnyObject) {
        
        activeLogin()
        
        
    }


    @IBAction func login(sender: AnyObject) {
        
        activeLogin()

    }


    func didTapView(){
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        fbl.delegate = self
        loginView.readPermissions = ["public_profile", "email", "user_friends"]
        
        /////////////////// Dismiss Keyboard /////////////////////////////////
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: "didTapView")
        self.view.addGestureRecognizer(tapRecognizer)
        
        //////////////////////////////////////////////////////////////////////
        
        email.hidden = true
        password.hidden = true
        submitButton.hidden = true
        submitLabel.hidden = true


        
        var user = PFUser()
        user.username = "myUsername"
        user.password = "myPassword"
        user.email = "email@example.com"
        // other fields can be set just like with PFObject

        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if error == nil {
                // Hooray! Let them use the app now.
            } else {
//                let errorString = error.userInfo["error"] as NSString
                // Show the errorString somewhere and let the user try again.
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
