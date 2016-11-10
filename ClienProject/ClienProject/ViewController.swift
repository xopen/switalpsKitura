//
//  ViewController.swift
//  ClienProject
//
//  Created by Jose Ignacio Diaz Ordoñez on 10/11/2016.
//  Copyright © 2016 com.swiftAlps. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        post(body: "hello");
        get(body: "hello");
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



////

func post(body: String) {
    do {
    let url:URL = URL(string: "http://jsonplaceholder.typicode.com/posts")!
    let session = URLSession.shared
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
    
    
    
    let dict = ["title": "title", "body": "body"]
//    let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
    
    
//    request.httpBody = jsonData
        
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
  
    } catch {
        print(error.localizedDescription)
        
    }

}



func get(body: String) {
    
    let url:URL = URL(string: "http://jsonplaceholder.typicode.com/posts")!
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



