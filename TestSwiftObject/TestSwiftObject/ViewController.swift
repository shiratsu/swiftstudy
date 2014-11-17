//
//  ViewController.swift
//  TestSwiftObject
//
//  Created by 佐々木 健 on 2014/11/16.
//  Copyright (c) 2014年 ssk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count: NumCount!
    let prefText: String = "count:"
    @IBOutlet var dispCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // インスタンス化
        count = NumCount()
        
        // ラベルに表示
        dispCountLabel(count.getCount())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ボタンを押されたときのアクション
    @IBAction func tapBtn(sender: AnyObject) {
        // UIAlertControllerを作成
        var ac = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
        
        // キャンセルボタンを押したときの処理
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
            println("Cancel button tapped.")
        }
        
        // OKボタンを押したときの処理
        let okAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
            println("OK button tapped.")
        }
        
        // UIAlertViewにアクションを追加
        ac.addAction(cancelAction)
        ac.addAction(okAction)
        
        // Viewで表示
        presentViewController(ac, animated: true, completion: nil)
    }

    // カウントアップ
    @IBAction func CountUp(sender: AnyObject) {
        // .(ドット)を使ってメソッドを呼び出す
        self.count.addCount()
        
        // カウントラベルの表示
        dispCountLabel(self.count.getCount())
    }
    
    func dispCountLabel(countNum : Int) -> Void {
        // 表示
        dispCount.text = prefText + String(countNum)
    }
}

