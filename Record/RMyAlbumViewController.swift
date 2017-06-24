//
//  RMyAlbumViewController.swift
//  Record
//
//  Created by Ovoid on 24/06/17.
//  Copyright © 2017 myproject. All rights reserved.
//

import UIKit
import Photos


class RMyAlbumViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //fileprivate var arrayPhotos: [PHAsset] = []
    
    fileprivate var assestsFetchResults:PHFetchResult<PHAsset>!
    fileprivate var imageManager: PHCachingImageManager = PHCachingImageManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: false)
        let options = PHFetchOptions()
        options.sortDescriptors = [sortDescriptor]
        
        assestsFetchResults = PHAsset.fetchAssets(with: .image, options: options)
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

}

//imageViewCell

extension RMyAlbumViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if assestsFetchResults.count > 10 {
            return 10
        }
        else if assestsFetchResults.count > 0 && assestsFetchResults.count < 10 {
            return assestsFetchResults.count
        }
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageViewCell", for: indexPath)
        
        let imageview: UIImageView? = cell.viewWithTag(100) as? UIImageView
        let asset: PHAsset = assestsFetchResults[indexPath.row]
        imageManager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options: nil) { (image, info) in
            DispatchQueue.main.async {
                imageview?.image = image
            }
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let asset: PHAsset = assestsFetchResults[indexPath.row]
        imageManager.requestImage(for: asset, targetSize: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-55), contentMode: .aspectFit, options: nil) { (image, info) in
            
            let displayController = self.storyboard?.instantiateViewController(withIdentifier: "RImageDisplayViewController") as! RImageDisplayViewController
            displayController.modalPresentationStyle = .overCurrentContext
            displayController.modalTransitionStyle = .crossDissolve
            displayController.displayImage = image
            
            self.present(displayController, animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
    }
    
    
}
