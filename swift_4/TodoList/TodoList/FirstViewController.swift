//
//  FirstViewController.swift
//  TodoList
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    // ttps://www.youtube.com/watch?v=war0gHL26ns
    
    // 追加
    @IBOutlet var tblTasks: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // 追加
    // Returning to view
    override func viewWillAppear(animated: Bool){
        tblTasks.reloadData()
    }
    
    // UITableViewDelegate
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!){
        
        if(editingStyle == UITableViewCellEditingStyle.Delete){
//            println("Delete this Now")
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
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        // DataSourceの内容
        
        // cellはUITableViewCellの型が入る
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "test")
        
        cell.textLabel.text = taskMgr.tasks[indexPath.row].name
        cell.detailTextLabel.text = taskMgr.tasks[indexPath.row].desc
        return cell
        
        
        
    }
    


}

