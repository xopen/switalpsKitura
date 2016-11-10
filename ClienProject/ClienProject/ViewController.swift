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
        
        let request = Requestmanager()
        
        
        request.post(title: "hello Title",body:"hello Body`")
        request.get(body: "hello");
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}






