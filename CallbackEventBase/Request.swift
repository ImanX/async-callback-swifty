//
//  Request.swift
//  CallbackEventBase
//
//  Created by ImanX on 8/16/17.
//  Copyright © 2017 ImanX. All rights reserved.
//

import Foundation
import Alamofire

class Request {
    private var _url:String!;
    private var _callback:AsyncCallback!;
    private var _parameters:[String:String]?;
    private var _header:[String:String]?;
    private var _method:HTTPMethod?
    
    init(URL:String , callback:AsyncCallback) {
        self._url = URL;
        self._callback = callback;
    }
    
    public var url:String{
        get{return _url}
    }
    
    public var callback:AsyncCallback{
        get{return self._callback!}
    }
    
    public var parameters:[String:String]{
        set{_parameters = newValue}
        get{return _parameters!}
    }
    
    public var header:[String :String]{
        set{_header = newValue}
        get {return _header!}
    }
    
    public var method:HTTPMethod{
        set{_method = newValue}
        get{return _method!}
    }
    
    
    
    public func get()->Void{
        
              Alamofire.request(_url,
                          method: _method!,
                          parameters: _parameters,
                          encoding: JSONEncoding.default,
                          headers: _header)
            .responseJSON { (responser) in
                
                let statusCode  = responser.response?.statusCode;
                let data = responser.result.value as! NSDictionary;
                if statusCode == 200 {
                    self._callback.didSuccessRequest!(data.description);
                }else {
                    self._callback.didFailureResquest!(statusCode!,data.description);
                }
        }
        
    }
    
}
