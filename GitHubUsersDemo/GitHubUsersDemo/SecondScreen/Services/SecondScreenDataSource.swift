//
//  SecondScreenDataSource.swift
//  GitHubUsersDemo
//
//  Created by Oj Shrivastava on 11/12/19.
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//

//let largeAvatarUrlKey = ""
//let userNamekey = ""
//let repoCountKey = ""

struct UserDetail {
    
    var iconUrl: String
    var userName: String
    var repoCount: String
    
    init() {
        iconUrl = ""
        userName = ""
        repoCount = ""
    }
    
    init?(_ dictionary: [String: Any]) {
        self.iconUrl = dictionary[iconUrlKey] as? String  ?? ""
        self.userName = dictionary[userNamekey] as? String ?? ""
        self.repoCount = dictionary[repoCountKey] as? String ?? ""
    }
}
