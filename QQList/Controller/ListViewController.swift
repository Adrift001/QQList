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
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    //MARK: -UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataArr.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let groupModel = dataArr[section]
        return groupModel.isOpen ? groupModel.friends.count : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellIdentifier)
        }
        
        //分割线顶格
        cell?.separatorInset = UIEdgeInsets.zero
        cell?.layoutMargins = UIEdgeInsets.zero
        cell?.preservesSuperviewLayoutMargins = false
        
        let groupModel = dataArr[indexPath.section]
        let friendModel = groupModel.friends[indexPath.row]
        cell?.imageView?.image = UIImage(named: friendModel.icon)
        cell?.textLabel?.text = friendModel.name
        cell?.detailTextLabel?.text = friendModel.intro
        return cell!
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var header = tableView.dequeueReusableHeaderFooterView(withIdentifier: cellHeaderIdentifier) as? HeaderView
        if header == nil {
            header = HeaderView()
        }
        header?.delegate = self
        header?.groupModel = dataArr[section]
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = ViewController()
        vc.title = dataArr[indexPath.section].friends[indexPath.row].name
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - 懒加载
    //数据源
    private lazy var dataArr: Array<GroupModel> = {
        let path = Bundle.main.path(forResource: "friends", ofType: "plist")
        let dictArr: NSArray = NSArray(contentsOfFile: path!)!
        return [GroupModel].deserialize(from: dictArr)! as! [GroupModel]
    }()
}

extension ListViewController: HeaderViewDelegate {
    func clickHeaderView() {
        tableView.reloadData()
    }
}
