//
//  TableViewCellBase.swift
//  SQL_Zing
//
//  Created by Ledung95d on 6/27/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class TableViewCellBase: UITableViewCell {

    var img_Detail: UIImageView!
    var lbl_name: UILabel!
    var lbl_info: UILabel!
    var cn_lblName = NSLayoutConstraint()
    var cn_lblInfo = NSLayoutConstraint()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addImageDetail()
        addName()
        addInfo()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    func addImageDetail(){
        img_Detail = UIImageView()
        img_Detail.contentMode = .scaleToFill
        self.contentView.addSubview(img_Detail)
        img_Detail.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: img_Detail, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1.0, constant: 5)
        let cn2 = NSLayoutConstraint(item: img_Detail, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: img_Detail, attribute: .height, relatedBy: .equal, toItem: nil, attribute:.notAnAttribute , multiplier: 1.0, constant: 84)
        let cn4 = NSLayoutConstraint(item: img_Detail, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 84)
        NSLayoutConstraint.activate([cn1,cn2,cn3,cn4])

    }
    func addName(){
        lbl_name = UILabel()

        self.contentView.addSubview(lbl_name)
        lbl_name.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: lbl_name, attribute: .leading, relatedBy: .equal, toItem: img_Detail, attribute: .trailing, multiplier: 1.0, constant: 2)
        let cn2 = NSLayoutConstraint(item: lbl_name, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: lbl_name, attribute: .height, relatedBy: .equal, toItem: nil, attribute:.notAnAttribute , multiplier: 1.0, constant: 25)
        cn_lblName = NSLayoutConstraint(item: lbl_name, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: -80)
        NSLayoutConstraint.activate([cn1,cn2,cn_lblName,cn3])

    }
    func addInfo(){
        lbl_info = UILabel()

        self.contentView.addSubview(lbl_info)
        lbl_info.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: lbl_info, attribute: .leading, relatedBy: .equal, toItem: img_Detail, attribute: .trailing, multiplier: 1.0, constant: 2)
        let cn2 = NSLayoutConstraint(item: lbl_info, attribute: .top, relatedBy: .equal, toItem: lbl_name, attribute: .bottom, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: lbl_info, attribute: .height, relatedBy: .equal, toItem: nil, attribute:.notAnAttribute , multiplier: 1.0, constant: 25)
        cn_lblInfo = NSLayoutConstraint(item: lbl_info, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: -100)
        NSLayoutConstraint.activate([cn1,cn2,cn3,cn_lblInfo])
    }



}
