//
//  FirstScreenServiceManager.swift
//  GitHubUsersDemo
//
//  Created by Oj Shrivastava on 11/7/19.
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//

import UIKit

typealias AuthenticationCallBack = (Bool, Error?) -> Void

let api_Domain  = "https://api.github.com"

let username = "oj.shrivastava@gmail.com"
let password = "oj65@rgtu#"

class FirstScreenServiceManager: NSObject, URLSessionDelegate {
    
    fileprivate static var queue: OperationQueue = OperationQueue.init()
    fileprivate var session: URLSession?
    
    @objc static func initializeIconDownload() {
        queue.maxConcurrentOperationCount = 1
        queue.name = "com.shrivastava.oj.githubDemoUserList"
    }
    
    override init() {
        super.init()
        session = URLSession(configuration: .default,
                             delegate: self,
                             delegateQueue: FirstScreenServiceManager.queue)
    }
    
    func authenticationRequest() {
        
        var request = URLRequest(url: URL(string: api_Domain)!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
    }
}
