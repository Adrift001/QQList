//
//  ListViewController.swift
//  QQList
//
//  Created by Adrift on 16/8/8.
//  Copyright © 2016年 adrift. All rights reserved.
//

import UIKit


class ListViewController: UITableViewController {

    let cellIdentifier = "cellIdentifier"
    let cellHeaderIdentifier = "cellHeaderIdentifier"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "好友列表"
        tableView.tableFooterView = UIView()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    //MARK: -UITableViewDataSource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataArr.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let groupModel = dataArr[section]
        return groupModel.isOpen ? groupModel.friends!.count : 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)
        }
        
        //分割线顶格
        cell?.separatorInset = UIEdgeInsetsZero
        cell?.layoutMargins = UIEdgeInsetsZero
        cell?.preservesSuperviewLayoutMargins = false
        
        let groupModel = dataArr[indexPath.section]
        let friendModel = groupModel.friends![indexPath.row]
        cell?.imageView?.image = UIImage(named: friendModel.icon!)
        cell?.textLabel?.text = friendModel.name!
        cell?.detailTextLabel?.text = friendModel.intro!
        return cell!
    }
    //MARK: - UITableViewDelegate

    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var header = tableView.dequeueReusableHeaderFooterViewWithIdentifier(cellHeaderIdentifier) as? HeaderView
        if header == nil {
            header = HeaderView()
        }
        header?.delegate = self
        header?.groupModel = dataArr[section]
        return header
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let vc = ViewController()
        vc.title = dataArr[indexPath.section].friends![indexPath.row].name
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - 懒加载
    //数据源
    private lazy var dataArr: Array<GroupModel> = {
        let path = NSBundle.mainBundle().pathForResource("friends", ofType: "plist")
        let dictArr: NSArray = NSArray(contentsOfFile: path!)!
        var arr = Array<GroupModel>()
        for dict in dictArr {
            let groupModel = GroupModel(dict: dict as! Dictionary<String, AnyObject>)
            arr.append(groupModel)
        }
        return arr
    }()
}

extension ListViewController: HeaderViewDelegate {
    func clickHeaderView() {
        tableView.reloadData()
    }
}
