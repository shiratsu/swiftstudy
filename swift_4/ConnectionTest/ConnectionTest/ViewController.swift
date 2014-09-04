//
//  ViewController.swift
//  ConnectionTest
//
//  Created by 佐々木 健 on 2014/09/04.
//  Copyright (c) 2014年 佐々木 健. All rights reserved.
//

import UIKit


class ViewController: UIViewController, ConnectionResult {
    // プロトコルを継承する
    
    // !マークは値が必ず入っていることが保証されるOptional型
    // 値が入っていないとエラーになる
    // この場合はStroyboardからひもづけているので必ずついていなければならない
    // reference outlet@storyboard
    @IBOutlet var label: UILabel!
    var connection : Connection!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // touch up inside@storyboard
    @IBAction func btnClick(sender: AnyObject) {
        // インスタンス化とデリゲートのセット
        connection = Connection(urlStr: "http://yahoo.co.jp")
        connection.delegate = self
        connection.doConnect()
    }
    
    // delegate
    // 実際に処理を行う
    func showResult(resultMessage: String?) -> Void {
        label.text = resultMessage
    }

}

