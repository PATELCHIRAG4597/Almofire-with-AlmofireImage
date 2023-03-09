//
//  MYTableViewCell.swift
//  Almofire with AlmofireImage
//
//  Created by CodeInfoWay CodeInfoWay on 3/9/23.
//

import UIKit

class MYTableViewCell: UITableViewCell {
    @IBOutlet weak var MyImage: UIImageView!
    
    @IBOutlet weak var MyLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
