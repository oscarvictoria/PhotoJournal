//
//  ImageObject.swift
//  PhotoJournal
//
//  Created by Oscar Victoria Gonzalez  on 1/27/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

struct ImageObject: Codable {
//  let imageText: String
  let imageData: Data
  let date: Date
  let identifier = UUID().uuidString
}
