//
//  NumCount.swift
//  TestSwiftObject
//
//  Created by 佐々木 健 on 2014/11/16.
//  Copyright (c) 2014年 ssk. All rights reserved.
//

import Foundation

class NumCount {
    var count: Int
    
    init(){
        self.count = 0
    }
    
    func addCount() -> Void {
        count++
    }
    
    func getCount() -> Int {
        return self.count
    }
}

