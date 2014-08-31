//
//  FirstViewController.swift
//  TodoList
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    // 参考
    // ttps://www.youtube.com/watch?v=war0gHL26ns
    
    // タスク一覧を表示するUITableView
    @IBOutlet var tblTasks: UITableView!
    
    // アプリ起動後に最初に呼ばれるところ（１回だけ）
    // 初期設定とかする(直接何か動作する処理はあんまり書かないと思う)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // メモリが危なくなったら呼び出される処理
    // TODO どんな処理をここに書くのかをチェック
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // 追加
    // Returning to view
    // View が表示される直前に呼ばれるメソッド
    // タブ等の切り替え等により、画面に表示されるたびに呼び出される
    override func viewWillAppear(animated: Bool){
        // tableviewのセルに格納されているデータを読み込む
        tblTasks.reloadData()
    }
    
    // UITableViewDelegate
    // UITableViewDelegateを継承した場合、実装しなければならない
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!){
        // 削除処理
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            // cellの削除
            taskMgr.tasks.removeAtIndex(indexPath.row)
            // リロード
            tblTasks.reloadData()
        }
        
    }
    
    // UITableViewDataSource
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int{
        // DataSourceの数
        return taskMgr.tasks.count;
    }
    
    // Cellの内容を定義
    // tskMgrはTaskManager.swiftに定義したメンバ変数
    // nameとdetailの構造体を持つ
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        // cellはUITableViewCellの型が入る
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "test")
        
        // textLabelはタイトルのようなもの
        cell.textLabel.text = taskMgr.tasks[indexPath.row].name
        // detailTextLabelは詳細
        cell.detailTextLabel.text = taskMgr.tasks[indexPath.row].desc
        
        // 設定したcellを返す
        return cell
    }
}

