//
//  Requestmanager.swift
//  ClienProject
//
//  Created by Jose Ignacio Diaz Ordoñez on 10/11/2016.
//  Copyright © 2016 com.swiftAlps. All rights reserved.
//

import UIKit
import Foundation
class Requestmanager: NSObject {

    
    /// Performs a post request to our amazing backend for our beautiful and amazing Project Manager 😘 
    /// - parameter title: Title of the blog
    /// - parameter body: Body of the blog

    public func post(title: String, body: String) {
    
            let url:URL = URL(string: "https://swift-alps-blog.herokuapp.com/create")!
            let session = URLSession.shared
            
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
            
            
            
            let dict = ["title": title, "body": body]
            
            
            request.httpBody = try! JSONSerialization.data(withJSONObject: dict)
            
            let task = session.dataTask(with: request as URLRequest) {
                (
                data, response, error) in
                
                guard let data = data, let _:URLResponse = response, error == nil else {
                    print("error")
                    return
                }
                
                let dataString =  String(data: data, encoding: String.Encoding.utf8)
                print(dataString!)
                
            }
            
            task.resume()
            
    
        
    }
    
    /// Performs a get request to our beautiful and amazing imaginary backend
    
   public func get(body: String) {
        
        let url:URL = URL(string: "https://swift-alps-blog.herokuapp.com/")!
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        let paramString = "data=body"
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest) {
            (
            data, response, error) in
            
            guard let data = data, let _:URLResponse = response, error == nil else {
                print("error")
                return
            }
            
            let dataString =  String(data: data, encoding: String.Encoding.utf8)
            print(dataString!)
            
        }
        
        task.resume()
        
    }
    

    
}
