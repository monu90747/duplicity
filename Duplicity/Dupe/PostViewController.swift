//
//  PostViewController.swift
//  Duplicity
//
//  Created by Kaitlyn on 3/18/15.
//  Copyright (c) 2015 K8La. All rights reserved.
//

import UIKit
import Foundation

class PostViewController: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    var currentPickerTarget: UIImageView!
    var photoSelected:Bool = false
    
    var active:Bool = false
    
    
    @IBOutlet weak var firstImage: UIImageView!

    @IBOutlet weak var firstType: UITextField!
    
    @IBOutlet weak var firstBrand: UITextField!
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var firstPrice: UITextField!
    
    
    @IBOutlet weak var secondImage: UIImageView!
    
    @IBOutlet weak var secondType: UITextField!
    
    @IBOutlet weak var secondBrand: UITextField!
    
    @IBOutlet weak var secondName: UITextField!
    
    @IBOutlet weak var secondPrice: UITextField!
    
    
    @IBAction func submit(sender: AnyObject) {
        
        var post = PFObject(className: "Post")
        
        
//        post["firstType"] = firstType.text
//        post["firstBrand"] = firstBrand.text
//        post["firstName"] = firstName.text
//        post["firstPrice"] = firstPrice.text
//        
//        post["secondType"] = secondType.text
//        post["secondBrand"] = secondBrand.text
//        post["secondName"] = secondName.text
//        post["secondPrice"] = secondPrice.text
        
        post["firstType"] = "chachacha"
        post["firstBrand"] = "chachacha"
        post["firstName"] = "chachacha"
        post["firstPrice"] = "chachacha"
        
        post["secondType"] = "chachacha"
        post["secondBrand"] = "chachacha"
        post["secondName"] = "chachacha"
        post["secondPrice"] = "chachacha"

        
        let firstImageData = UIImagePNGRepresentation(self.firstImage.image)
        let secondImageData = UIImagePNGRepresentation(self.secondImage.image)
        
        let firstImageFile = PFFile(name: "image.png", data: firstImageData)
        let secondImageFile = PFFile(name: "image2.png", data: secondImageData)
        
        post["firstImageFile"] = firstImageFile
        post["secondImageFile"] = secondImageFile
        
        post.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if success == true {
                // The object has been saved.
                println("successfully saved")
            } else {
                // There was a problem, check error.description
                println("fuxored")
            }
        }
        
    }
    
    @IBAction func selectFirstImage(sender: AnyObject) {
        
        currentPickerTarget = firstImage
        
        photoSelected = true
        
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .ActionSheet)
        
        let selectPhotoAction = UIAlertAction(title: "Select Photo", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            var image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            image.allowsEditing = true
            
            self.presentViewController(image, animated: true, completion: nil)
            
           
        })
        let takePhotoAction = UIAlertAction(title: "Take Photo", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            var image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerControllerSourceType.Camera
            image.allowsEditing = true
            
            self.presentViewController(image, animated: true, completion: nil)

        })
        

        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            println("Cancelled")
        })
        
        

        optionMenu.addAction(selectPhotoAction)
        optionMenu.addAction(takePhotoAction)
        optionMenu.addAction(cancelAction)
        

        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    
    @IBAction func selectSecondImage(sender: AnyObject) {
        currentPickerTarget = secondImage
        
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .ActionSheet)
        
        let deleteAction = UIAlertAction(title: "Photo Library", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            
            
            var image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            image.allowsEditing = true
            
            self.presentViewController(image, animated: true, completion: nil)
            
            
        })
        let saveAction = UIAlertAction(title: "Take Photo", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            
            var image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerControllerSourceType.Camera
            image.allowsEditing = true
            
            self.presentViewController(image, animated: true, completion: nil)
            

            
        })
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            println("Cancelled")
        })
        
        
        
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(saveAction)
        optionMenu.addAction(cancelAction)
        
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
        
                photoSelected = true
        
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        println("Image selected")
        self.dismissViewControllerAnimated(true, completion: nil)
        
        currentPickerTarget.image = image

        
    }
    
    
    //import UIKit
    //
    //class PostViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    //
    //    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    //
    //
    //    func displayAlert(title:String, error:String) {
    //
    //        var alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
    //        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
    //
    //            self.dismissViewControllerAnimated(true, completion: nil)
    //
    //        }))
    //
    //        self.presentViewController(alert, animated: true, completion: nil)
    //
    //    }
    //
    //
    //    var photoSelected:Bool = false
    //
    //
    //
    //
    //
    //
    //    @IBOutlet weak var firstImage: UIImageView!
    //
    //    @IBOutlet weak var secondImage: UIImageView!
    //
    //
    //
    //    @IBOutlet weak var firstType: UITextField!
    //
    //    @IBOutlet weak var firstBrand: UITextField!
    //
    //    @IBOutlet weak var firstName: UITextField!
    //
    //    @IBOutlet weak var firstPrice: UITextField!
    //
    //
    //    @IBOutlet weak var secondType: UITextField!
    //
    //    @IBOutlet weak var secondBrand: UITextField!
    //
    //    @IBOutlet weak var secondName: UITextField!
    //
    //    @IBOutlet weak var secondPrice: UITextField!
    //
    //
    //
    //    //    @IBOutlet var imageToPost: UIImageView!
    //
    //    @IBAction func logout(sender: AnyObject) {
    //
    //        PFUser.logOut()
    //
    //        self.performSegueWithIdentifier("logout", sender: self)
    //
    //    }
    //
    //    @IBAction func chooseImage(sender: AnyObject) {
    //
    //        var image = UIImagePickerController()
    //        image.delegate = self
    //        image.sourceType = UIImagePickerControllerSourceType.Camera
    //        image.allowsEditing = false
    //
    //        self.presentViewController(image, animated: true, completion: nil)
    //
    //
    //    }
    //
    //
    //    @IBOutlet var shareText: UITextField!
    //
    //
    //
    //    @IBAction func submit(sender: AnyObject) {
    //
    //
    //        var error = ""
    //
    //        if (photoSelected == false) {
    //
    //            error = "Please select an image to post"
    //
    //        } else if (shareText.text == "") {
    //
    //            error = "Please enter a message"
    //
    //        }
    //
    //        if (error != "") {
    //
    //            displayAlert("Cannot Post Image", error: error)
    //
    //        } else {
    //
    //            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
    //            activityIndicator.center = self.view.center
    //            activityIndicator.hidesWhenStopped = true
    //            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
    //            view.addSubview(activityIndicator)
    //            activityIndicator.startAnimating()
    //            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    //
    //

    //
    //
    //            //            post["Title"] = shareText.text
    //            //            post["username"] = PFUser.currentUser().username
    //
    //
    //
    //            //            post.saveInBackgroundWithBlock{(success: Bool?, error: NSError?) -> Void in
    //            //
    //            //
    //            //                if success == false {
    //            //
    //            //                    self.activityIndicator.stopAnimating()
    //            //                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
    //            //
    //            //                    self.displayAlert("Could Not Post Image", error: "Please try again later")
    //            //
    //            //                } else {
    //            //
    //            //                    let firstImageData = UIImagePNGRepresentation(self.firstImage.image)
    //            //                    let secondImageData = UIImagePNGRepresentation(self.secondImage.image)
    //            //
    //            //                    let firstImageFile = PFFile(name: "image.png", data: firstImageData)
    //            //                    let secondImageFile = PFFile(name: "image.png", data: secondImageData)
    //            //
    //            //                    post["firstImageFile"] = firstImageFile
    //            //                    post["secondImageFile"] = secondImageFile
    //            //
    //            //                    post.saveInBackgroundWithBlock{(success: Bool!, error: NSError!) -> Void in
    //            //
    //            //                        self.activityIndicator.stopAnimating()
    //            //                        UIApplication.sharedApplication().endIgnoringInteractionEvents()
    //            //
    //            //                        if success == false {
    //            //
    //            //                            self.displayAlert("Could Not Post Image", error: "Please try again later")
    //            //
    //            //                        } else {
    //            //
    //            //                            self.displayAlert("Image Posted!", error: "Your image has been posted successfully")
    //            //
    //            //                            self.photoSelected = false
    //            //
    //            //                            self.firstImage.image = UIImage(named: "placeholder.png")
    //            //                            self.secondImage.image = UIImage(named: "placeholder.png")
    //            //
    //            //                            self.shareText.text = ""
    //            //
    //            //                            println("posted successfully")
    //            //
    //            //                        }
    //            //
    //            //                    }
    //            //
    //            //                }
    //            //
    //            //
    //            //            }
    //
    //
    //
    //        }
    //
    //
    //    }
    //

    //    
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        // Do any additional setup after loading the view, typically from a nib.
    //        
    //        photoSelected = false
    //        
    //        firstImage.image = UIImage(named: "placeholder.png")
    //        secondImage.image = UIImage(named: "placeholder.png")
    //        
    //        shareText.text = ""
    //        
    //        
    //    }
    //    
    //    
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
    //    
    //    
    //    
    //}
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true;

        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: "didTapView")
        self.view.addGestureRecognizer(tapRecognizer)
        // Do any additional setup after loading the view, typically from a nib.
//        
//        photoSelected = false
//        
//        imageToPost.image = UIImage(named: "315px-Blank_woman_placeholder.svg")
//        
//        shareText.text = ""
       
//        super.touchesBegan(touches, withEvent: event)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

    func didTapView(){
        self.view.endEditing(true)
    }
    @IBAction func goBack(sender: AnyObject) {

        self.navigationController?.popViewControllerAnimated(true);
        
    }

}
