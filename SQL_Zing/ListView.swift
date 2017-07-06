//
//  ListView.swift
//  SQL_Zing
//
//  Created by Ledung95d on 6/28/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ListView: UITableView,UITableViewDelegate,UITableViewDataSource {
    var delegateSelected: SelectItem!
    var items = [Label]()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        self.dataSource = self
    }
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.backgroundColor = UIColor.green
        self.delegate = self
        self.dataSource = self
    }
    //#MARK: DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = self.dequeueReusableCell(withIdentifier: "Cell")
        let currentItem = items[indexPath.row]
        cell?.textLabel?.text = currentItem.displayName
        cell?.textLabel?.textAlignment = .center
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegateSelected.selectedOrder!(id: items[indexPath.row].id)
    }
}
