//
//  ImageCell.swift
//  PhotoJournal
//
//  Created by Oscar Victoria Gonzalez  on 1/27/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imagePicture: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    
    func configured(for image: ImageObject) {
        imagePicture.image = UIImage(systemName: "circle")
        textView.text = "Hello"
      }
    
    
}
