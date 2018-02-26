//
//  LoginViewController.swift
//  parseChat
//
//  Created by Jesus perez on 2/25/18.
//  Copyright © 2018 Jesus perez. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    let alertController = UIAlertController(title: "Alert", message: "Missing Password and/or Username", preferredStyle: .alert)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alertController
        alertController.addAction(cancelAction)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        // Do any additional setup after loading the view.

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onSignIn(_ sender: Any) {
        if((username.text?.isEmpty)! || (password.text?.isEmpty)!){
            alertController.title = "Alert"
            alertController.message = "Username and/or password missing"
            
            present(alertController, animated: true) {
            }
        }else{
            PFUser.logInWithUsername(inBackground: username.text!, password: password.text!) { (user: PFUser?, error: Error?) -> Void in
                if user != nil{
                    print("you're logged in")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }else{
                    self.alertController.message = "Username or password combination not found."
                    self.present(self.alertController, animated: true){}
                }
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        if((username.text?.isEmpty)! || (password.text?.isEmpty)!){
            alertController.title = "Alert"
            alertController.message = "Username and/or password missing"
            
            present(alertController, animated: true) {
            }
        }else{
            let newUser = PFUser()
            newUser.username = username.text
            newUser.password = password .text
            newUser.signUpInBackground { (success: Bool,error: Error? ) -> Void in
                if success{
                    print("Yaya, user created")
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    
                }else{
                    if error?._code == 202{
                        self.alertController.message = "Username taken"
                        self.present(self.alertController, animated: true){}
                    }else{
                        self.alertController.message = "Try Again. Unknown error"
                        self.present(self.alertController, animated: true){}
                    }
                }
            }
        }
       
    }
}
