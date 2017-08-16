//
//  ViewController.swift
//  CallbackEventBase
//
//  Created by ImanX on 8/16/17.
//  Copyright © 2017 ImanX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://api.zarinpal.com/rest/v3/app/basicInfo.json";
        let request = Request(URL: url, callback: AsyncCallback());
        request.method = .get;
        // request.parameters = ["name" :"Alireza"];
        request.header = ["Authorization" :"05626d79e6918f09695323f0271765828ffbaf7c2a3f9f5670c6b7b2b18a4c87ffb4bfb6de793e46"];
        request.get();
        
        
        request.callback.didSuccessRequest = {(response) in
            print(response);
        }
        
        
        request.callback.didFailureResquest = {(code , response) in
            print(response);
        }
        
        request.callback.didFailureConnection = {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

