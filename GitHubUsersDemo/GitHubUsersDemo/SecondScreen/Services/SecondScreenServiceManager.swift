//
//  SecondScreenServiceManager.swift
//  GitHubUsersDemo
//
//  Created by Oj Shrivastava on 11/12/19.
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//

import Foundation

class SecondScreenServiceManager: NSObject, URLSessionDelegate {
    
    let repoAPI = "https://api.github.com/users/oj/repos"
    
    private var requestQueue: OperationQueue!
    private var session: URLSession?
    
    override init() {
        requestQueue.maxConcurrentOperationCount = 1
        requestQueue.name = "com.shrivastava.oj.listOfRepos"
        
        super.init()
        session = URLSession(configuration: .default,
                             delegate: self,
                             delegateQueue: requestQueue)
    }
    
    // API Call for Individual Screen
    func listRepos(for userName: String) {
        
        var repoRequest = URLRequest(url: URL(string: repoAPI)!)
        repoRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        repoRequest.httpMethod = "GET"
        
        let repoTask = session?.dataTask(with: repoRequest) { data, response, error in
            
            if let error = error {
                print(error)
            }
            else {
                
            }
        }
        repoTask?.resume()
    }
    
    private func getUserDetails(from data: Data) -> [String] {
        
        do {
            let content = try JSONSerialization.jsonObject(with: data, options: [])
        }
        catch {
            print("Something went wrong")
        }
        
        return []
    }
}
