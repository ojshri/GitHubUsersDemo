//
//  SecondScreenViewController.swift
//  GitHubUsersDemo1
//
//  Created by Oj Shrivastava on 11/12/19.
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//

import UIKit

let repoInfoTableViewCellID = "RepoInfoTableViewCellID"

class SecondScreenViewController: ViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userInfoLabel: UILabel!
    @IBOutlet weak var userBioLabel: UILabel!
    @IBOutlet weak var repoSearchTextField: UITextField!
    @IBOutlet weak var repoTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}


extension SecondScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = repoTableView.dequeueReusableCell(withIdentifier: repoInfoTableViewCellID) as? RepoInfoTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}
