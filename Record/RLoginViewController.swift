//
//  RLoginViewController.swift
//  Record
//
//  Created by Ovoid on 24/06/17.
//  Copyright © 2017 myproject. All rights reserved.
//

import UIKit
import Alamofire


class RLoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textfieldUsername: UITextField!
    @IBOutlet weak var textfieldPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        textfieldUsername.delegate = self
        textfieldPassword.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK:- ACTIONS
    
    @IBAction func didTappedSignupButton(_ sender: Any) {
        self.performSegue(withIdentifier: "SegueLoginToSignup", sender: nil)
    }
    
    @IBAction func didTappedLoginButton(_ sender: Any) {
        loginUser()
    }
    
    
    //MARK:- TEXT FIELD
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


//MARK:- URL SERVICE CALL
extension RLoginViewController {
    
    /**
     Login the user.
     */
    fileprivate func loginUser() {
        
        guard
            let email = textfieldUsername?.text,
            let password = textfieldPassword?.text
            else {
                return
        }
        
        let urlPath = "?token=ABCD&email=\(email)&password=\(password)"
        let urlString = getComplete(url: kLoginUser, path: urlPath)
        
        
        self.performSegue(withIdentifier: "SegueLoginToHome", sender: nil)
        
        /*
         Error received on service call.
         responseSerializationFailed(Alamofire.AFError.ResponseSerializationFailureReason.jsonSerializationFailed(Error Domain=NSCocoaErrorDomain Code=3840 "Invalid value around character 0." UserInfo={NSDebugDescription=Invalid value around character 0.}))
         */
        
        
        Alamofire.request(urlString)
            .validate(contentType: ["application/json", "text/html"])
            .responseJSON { (response) in
            
            switch response.result {
            case .success:
                self.performSegue(withIdentifier: "SegueLoginToHome", sender: nil)
                break
            case .failure(let error):
                print(error)
            }
        }
        
    }
}

