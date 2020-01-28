//
//  ViewController.swift
//  PhotoJournal
//
//  Created by Oscar Victoria Gonzalez  on 1/27/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let dataPersistance = PersistenceHelper(filename: "images.plist")
    
    var imageObjects = [ImageObject]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var selectedImage: UIImage?
    
    
    private func loadImageObjects() {
         do {
             imageObjects = try dataPersistance.loadEvents()
         } catch {
             print("error, could not load images")
         }
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        loadImageObjects()
    }
    
  
    @IBAction func settings(_ sender: UIButton) {
        let alertAction = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let deleteAction = UIAlertAction(title: "Delete", style: .default, handler: nil)
            let editAction = UIAlertAction(title: "Edit", style: .default)
            let shareAction = UIAlertAction(title: "Share", style: .default)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alertAction.addAction(deleteAction)
            alertAction.addAction(editAction)
            alertAction.addAction(shareAction)
            alertAction.addAction(cancelAction)
            present(alertAction, animated: true)
    }
    
    @IBAction func newEvent(segue: UIStoryboardSegue) {
         guard let photo = segue.source as? PhotoViewController else {
             fatalError("failed to access CreateEventController")
         }
         selectedImage = photo.photoLibraryImage.image
     }
    
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageObjects.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "journalCell", for: indexPath) as? ImageCell else {
            fatalError("error")
        }
        let object = imageObjects[indexPath.row]
  
        cell.configured(for: object)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let maxWidth: CGFloat = UIScreen.main.bounds.size.width
           let itemWidth: CGFloat = maxWidth * 0.80
           return CGSize(width: itemWidth, height: itemWidth)  }
}
