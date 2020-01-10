//
//  HeaderView.swift
//  QQList
//
//  Created by Adrift on 16/8/8.
//  Copyright © 2016年 adrift. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate {
    func clickHeaderView()
}

class HeaderView: UITableViewHeaderFooterView {
    
    static let ClickEvent = "HeaderView.ClickEvent"
    
    var delegate: HeaderViewDelegate?
    var groupModel: GroupModel? {
        didSet {
            button.setTitle(groupModel!.name, for: UIControl.State.normal)
            label.text = "\(groupModel!.online)/\(groupModel!.friends.count)"
        }
    }

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addSubview(button)
        addSubview(label)
        
        button.snp_makeConstraints { (make) in
            //占据整个headerView的大小
            make.edges.equalTo(0)
        }
        
        label.snp_makeConstraints { (make) in
            make.top.equalTo(snp_top)
            make.right.equalTo(snp_right).offset(-8)
            make.width.equalTo(60)
            make.height.equalTo(snp_height)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        button.imageView?.transform = groupModel!.isOpen ? CGAffineTransform(rotationAngle: CGFloat(M_PI_2)) : CGAffineTransform(rotationAngle: 0)
    }
    
    //MARK: - 内部方法
    @objc func clickEvent(sender: UIButton) {
        groupModel!.isOpen = !groupModel!.isOpen
        delegate?.clickHeaderView()
    }
    
    //MARK: - 懒加载
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "header_bg"), for: UIControl.State.normal)
        button.setBackgroundImage(UIImage(named: "header_bg_highlighted"), for: UIControl.State.highlighted)
        button.setImage(UIImage(named: "arrow"), for: UIControl.State.normal)
        //按钮是由图片跟文字组成,所以需要设置内边距
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        //内容的位置,居左
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        //设置标题内边距
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        //设置图片的位置
        button.imageView?.contentMode = UIView.ContentMode.center
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        
        //防止点击之后图片变形
        button.imageView?.clipsToBounds = false
        
        button.addTarget(self, action: #selector(clickEvent(sender:)), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        return label
    }()
}

