//
//  FirstScreenServiceManager.swift
//  GitHubUsersDemo
//
//  Created by Oj Shrivastava on 11/7/19.
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//

import UIKit

typealias AuthenticationCallBack = (Bool, Error?) -> Void

let userSearchBaseAPI  = "https://api.github.com/search/users?q=oj"
let repoAPI = "https://api.github.com/users/oj/repos"

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
    
    // API call for List Users
    func listUsers() {
        
        var request = URLRequest(url: URL(string: userSearchBaseAPI)!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let usersListTask = session?.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error)
                
            } else {
                if let httpURLResponse = response as? HTTPURLResponse {
                    print("status code \(httpURLResponse.statusCode)")
                    if let data = data,
                        httpURLResponse.statusCode == 200 {
                        
                        _  = self.retriveJsonFromData(data: data)
                        print("possibly success")
                    }
                }
            }
        }
        usersListTask?.resume()
    }
    
    func retriveJsonFromData(data: Data) -> [String] {
        do {
            guard let content = try JSONSerialization.jsonObject(with: data,
                                                                 options: []) as? String else {
                                                                    return []
            }
            print(content)
        }
        catch {
            print(error)
        }
        return []
    }
}


