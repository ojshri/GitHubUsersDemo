//
//  FirstScreenViewController.swift
//  GitHubUsersDemo
//
//  Created by Oj Shrivastava on 11/6/19.
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//

import UIKit

let userInfoTableViewCellID = "UserInfoTableViewCellID"

class FirstScreenViewController: UIViewController {
    
    @IBOutlet weak var userInfoTableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

extension FirstScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = userInfoTableView.dequeueReusableCell(withIdentifier: userInfoTableViewCellID) as? UserInfoTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}

