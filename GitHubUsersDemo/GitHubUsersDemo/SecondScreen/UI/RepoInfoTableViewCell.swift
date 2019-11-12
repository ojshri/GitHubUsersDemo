//
//  RepoInfoTableViewCell.swift
//  GitHubUsersDemo1
//
//  Created by Oj Shrivastava on 11/12/19.
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//

import UIKit

class RepoInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var forksCountLabel: UILabel!
    @IBOutlet weak var starsCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
