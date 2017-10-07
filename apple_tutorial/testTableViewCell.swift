//
//  MealTableViewCell.swift
//  apple_tutorial
//
//  Created by 大友一樹 on 2017/10/04.
//  Copyright © 2017年 大友一樹. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

