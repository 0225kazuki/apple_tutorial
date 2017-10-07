//
//  Meal.swift
//  apple_tutorial
//
//  Created by 大友一樹 on 2017/10/04.
//  Copyright © 2017年 大友一樹. All rights reserved.
//

import UIKit
import os.log

class Article: NSObject {
    
    // MARK: Properties
    var title: String
    var content: String
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("articles")
    
    // MARK: Types
    struct PropertyKey {
        static let title = "title"
        static let content = "content"
    }
    
    
    //MARK: Initialization
    init?(title: String, content: String) {
        
        // The name must not be empty
        guard !title.isEmpty else {
            return nil
        }
        
        // The rating must not be empty
        guard !content.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.title = title
        self.content = content
    }
    
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(name, forKey: PropertyKey.name)
//        aCoder.encode(photo, forKey: PropertyKey.photo)
//        aCoder.encode(rating, forKey: PropertyKey.rating)
//    }
    
//    required convenience init?(coder aDecoder: NSCoder) {
//
//        // The name is required. If we cannot decode a name string, the initializer should fail.
//        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
//            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
//            return nil
//        }
//
//        // Because photo is an optional property of Meal, just use conditional cast.
//        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
//
//        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
//
//        // Must call designated initializer.
//        self.init(name: name, photo: photo, rating: rating)
//
//    }
    
}

