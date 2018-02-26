//
//  HomeViewController.swift
//  parseChat
//
//  Created by Jesus perez on 2/25/18.
//  Copyright © 2018 Jesus perez. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
            // PFUser.current() will now be nil
            print("User was successfully logged out")
            print(error?.localizedDescription as Any)
            self.performSegue(withIdentifier: "logoutSegue", sender: nil)
        }
    }
    @IBOutlet weak var onLogout: UIButton!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
