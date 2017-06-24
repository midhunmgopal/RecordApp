//
//  RSignupViewController.swift
//  Record
//
//  Created by Ovoid on 24/06/17.
//  Copyright © 2017 myproject. All rights reserved.
//

import UIKit
import Alamofire


class RSignupViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textFieldName: UITextField?
    @IBOutlet weak var textFieldUsername: UITextField?
    @IBOutlet weak var textFieldPassword: UITextField?
    @IBOutlet weak var textFieldEmail: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldName?.delegate = self
        textFieldUsername?.delegate = self
        textFieldPassword?.delegate = self
        textFieldEmail?.delegate = self
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
    
    @IBAction func didTappedSignupButton(_ sender: Any) {
        registerUser()
    }
    
    
    // MARK:- TEXTFIELD DELEGATE
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}


//MARK:- URL SERVICE CALL
extension RSignupViewController {
    
    /**
     Register the user.
     */
    fileprivate func registerUser() {
        
        guard
            let name = textFieldName?.text,
            let username = textFieldUsername?.text,
            let email = textFieldEmail?.text,
            let password = textFieldPassword?.text
        else {
            return
        }
        
        let urlPath = "?token=ABCD&name=\(name)&username=\(username)&email=\(email)&password=\(password)"
        let urlString = getComplete(url: kRegisterUrl, path: urlPath)
        //print("URL:", urlString)
        
        
        Alamofire.request(urlString).responseJSON { (response) in
            
            // print("response: ", response.result.value ?? "no default")
            
            switch response.result {
            case .success:
                self.navigationController?.popViewController(animated: true)
                break
            case .failure(let error):
                self.textFieldName?.text = ""
                self.textFieldUsername?.text = ""
                self.textFieldPassword?.text = ""
                self.textFieldEmail?.text = ""
                print(error)
            }
        }
    }
}
