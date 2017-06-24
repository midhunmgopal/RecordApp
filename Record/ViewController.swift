//
//  ViewController.swift
//  Record
//
//  Created by Ovoid on 24/06/17.
//  Copyright © 2017 myproject. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSample: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.perform(#selector(showNextScreen), with: nil, afterDelay: TimeInterval(0.5))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    @objc fileprivate func showNextScreen() {
        let loginControler = storyboard?.instantiateViewController(withIdentifier: "RLoginViewController") as! RLoginViewController
        self.navigationController?.pushViewController(loginControler, animated: true)
    }


}

