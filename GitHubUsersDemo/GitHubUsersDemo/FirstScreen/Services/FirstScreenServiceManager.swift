//
//  FirstScreenServiceManager.swift
//  GitHubUsersDemo
//
//  Created by Oj Shrivastava on 11/12/19.
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//

import Foundation

let userSearchBaseAPI  = "https://api.github.com/search/users?q=oj"

class FirstScreenServiceManager: NSObject, URLSessionDelegate {
    
    private static var queue: OperationQueue = OperationQueue.init()
    private var session: URLSession?
    
    override init() {
        
        FirstScreenServiceManager.queue.maxConcurrentOperationCount = 1
        FirstScreenServiceManager.queue.name = "com.shrivastava.oj.githubDemoUserList"
        super.init()
        
        session = URLSession(configuration: .default,
                             delegate: self,
                             delegateQueue: FirstScreenServiceManager.queue)
        
    }
    
    // API call for List Users
    func listUsers(with name:String) {
        
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
    
    private func retriveJsonFromData(data: Data) -> [String] {
        do {
            guard let content = try JSONSerialization.jsonObject(with: data,
                                                                 options: .allowFragments) as? [String : Any] else {
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



