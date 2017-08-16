//
//  AsyncCallback.swift
//  CallbackEventBase
//
//  Created by ImanX on 8/16/17.
//  Copyright © 2017 ImanX. All rights reserved.
//

import Foundation
class AsyncCallback {
    public var didSuccessRequest:((_ data:String)->Void)!;
    public var didFailureResquest:((_ code:Int,_ data:String)->Void)!;
    public var didFailureConnection:(()->Void)?;
}
