//
//  RHomeViewController.swift
//  Record
//
//  Created by Ovoid on 24/06/17.
//  Copyright © 2017 myproject. All rights reserved.
//

import UIKit

enum MenuItem : Int {
    case MyApp = 0
    case MyAlbum
    case MyInfo
}

class RHomeViewController: UIViewController {

    @IBOutlet weak var tableviewHome: UITableView!
    @IBOutlet weak var heightConstraintTableViewHome: NSLayoutConstraint!
    
    fileprivate var arrayMenus: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arrayMenus = ["My App", "My Album", "My info"]
        tableviewHome.delegate = self
        tableviewHome.dataSource = self
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        heightConstraintTableViewHome.constant = tableviewHome.contentSize.height
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuTableViewCell", for: indexPath) as? RHomeTableViewCell
        cell?.labelMenuName?.text = arrayMenus[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case MenuItem.MyApp.rawValue:
            let cameraController = RMyAppViewController()
            self.navigationController?.pushViewController(cameraController, animated: true)
            
            
            break
            
        case MenuItem.MyAlbum.rawValue:
            self.performSegue(withIdentifier: "SegueHomeToMyAlbum", sender: nil)
            break
        case MenuItem.MyInfo.rawValue:
            self.performSegue(withIdentifier: "SegueHomeToMyInfo", sender: nil)
            break
            
        default:
            break
        }
    }
}
