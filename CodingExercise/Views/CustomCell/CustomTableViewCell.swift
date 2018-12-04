//
//  CustomTableViewCell.swift
//  CodingExercise
//
//  Created by Arun Thakkar on 12/3/18.
//  Copyright © 2018 Arun Thakkar. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class SubtitleTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        self.imageView?.layer.masksToBounds = true
        self.imageView?.layer.borderWidth = 0.5
        self.imageView?.layer.borderColor = UIColor.lightGray.cgColor
        self.imageView?.layer.cornerRadius = 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setData(album:Album){
        self.textLabel?.text = album.albumName
        self.imageView?.downloadImageFrom(link: album.artWorkUrl)
        self.detailTextLabel?.text = album.artistName
        
    }
}

