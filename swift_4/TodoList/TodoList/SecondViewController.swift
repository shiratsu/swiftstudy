//
//  SecondViewController.swift
//  TodoList
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{
    
    // TaskとDescriptionを登録するTextFieldをひもづける
    @IBOutlet var txtTask: UITextField!
    @IBOutlet var txtDesc: UITextField!
    
    // アプリ起動後に最初に呼ばれるところ（１回だけ）
    // 初期設定とかする(直接何か動作する処理はあんまり書かないと思う)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // メモリが危なくなったら呼び出される処理
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Events
    // ボタンのクリックイベント
    // ボタンがクリックされたときに実行されるメソッド
    // senderは設定したUIButton
    @IBAction func btnAddTask_Click(sender: UIButton){
        // ここはTaskManagerのaddTask
        taskMgr.addTask(txtTask.text, desc: txtDesc.text);
        self.view.endEditing(true)
        txtTask.text = ""
        txtDesc.text = ""
        self.tabBarController.selectedIndex = 0;
    }
    
    // IOS Touch Functions
    // タッチしたときに呼ばれるイベント
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!){
        self.view.endEditing(true)
    }
    
    // UITextField Delegate
    // リターンキーを押したときの挙動
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        // ほかの場所をタッチしたときにキーボードを隠す処理
        textField.resignFirstResponder()
        return true
    }

}