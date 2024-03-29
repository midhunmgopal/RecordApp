//
//  RImageDisplayViewController.swift
//  Record
//
//  Created by Ovoid on 24/06/17.
//  Copyright © 2017 myproject. All rights reserved.
//

import UIKit

class RImageDisplayViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var displayImage: UIImage?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = displayImage
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

    @IBAction func didTappedDismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
