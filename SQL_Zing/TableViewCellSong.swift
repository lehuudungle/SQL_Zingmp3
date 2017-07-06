//
//  TableViewCellSong.swift
//  SQL_Zing
//
//  Created by Ledung95d on 6/27/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class TableViewCellSong: TableViewCellBase {
    var btn_Play: UIButton!
    var btn_AddPlayList: UIButton!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addBtn_Play()
        addBtn_AddPlayList()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.selectionStyle = .none
    }
    func addBtn_Play(){
        cn_lblName.constant = 0
        btn_Play = UIButton()
        btn_Play.setImage(UIImage(named: "btn_play"), for: .normal)
        self.contentView.addSubview(btn_Play)
        btn_Play.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: btn_Play, attribute: .leading, relatedBy: .equal, toItem: lbl_name, attribute: .trailing, multiplier: 1.0, constant: 5)
        let cn2 = NSLayoutConstraint(item: btn_Play, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: self.contentView.center.y-15)
        let cn3 = NSLayoutConstraint(item: btn_Play, attribute: .height, relatedBy: .equal, toItem: nil, attribute:.notAnAttribute , multiplier: 1.0, constant: 30)
        let cn4 = NSLayoutConstraint(item: btn_Play, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
        NSLayoutConstraint.activate([cn1,cn2,cn3,cn4])
    }
    func addBtn_AddPlayList(){
        btn_AddPlayList = UIButton()
        btn_AddPlayList.addTarget(self, action: #selector(clickAddPlayList), for: .touchUpInside)
        btn_AddPlayList.setImage(UIImage(named: "btn_playList"), for: .normal)
        self.contentView.addSubview(btn_AddPlayList)
        btn_AddPlayList.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: btn_AddPlayList, attribute: .leading, relatedBy: .equal, toItem: btn_Play, attribute: .trailing, multiplier: 1.0, constant: 5)
        let cn2 = NSLayoutConstraint(item: btn_AddPlayList, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: self.contentView.center.y-15)
        let cn3 = NSLayoutConstraint(item: btn_AddPlayList, attribute: .height, relatedBy: .equal, toItem: nil, attribute:.notAnAttribute , multiplier: 1.0, constant: 30)
        let cn4 = NSLayoutConstraint(item: btn_AddPlayList, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
        NSLayoutConstraint.activate([cn1,cn2,cn3,cn4])

    }
    func clickAddPlayList(){
        print("Click")

    }

}
