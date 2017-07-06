//
//  ViewSongs.swift
//  SQL_Zing
//
//  Created by Ledung95d on 4/18/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewSongs: ViewControllerTableBase,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,SelectItem {

    override func viewDidLoad() {
        super.viewDidLoad()
        txt_Search.delegate = self
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.listView.delegateSelected = self
         myTableView.register(TableViewCellSong.self, forCellReuseIdentifier: "Cell")
        getDataSong(statement: "")
        getArtistWidthSongID()
        loadItemsForListView()


    }
    func loadItemsForListView(){

        itemsOfListView = [Label(displayName: "Name", id: 1, column: "SongName"),Label(displayName: "ID", id: 2, column: "ID")]
    }
    override func chooseOrder(){
//        getDataSong(statement: "Order by SongName ASC")
    }
    func getDataSong(statement: String){
        items = self.dataBase.viewDatabase("SONGS", columns: ["*"], statement: statement)
        self.myTableView.reloadData()
    }
//#MARK: TextField delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var statement = ""

        print(textField.text)
        // truong hop dang xoa
        if(string == ""){
            if((textField.text?.characters.count)!>0){
                statement = (textField.text! as NSString).substring(to: (textField.text?.characters.count)! - 1)
            }else{
                statement = ""
            }
        }else{
            statement = "\(textField.text!)\(string)"
        }
        print("cau lenh : \(statement)")
        self.getDataSong(statement: "Where SongName Like '\(statement)%'")
        return true
    }
//#MARK: TableView DataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.myTableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCellBase
        let currentItem = items[indexPath.row]
        print("ten anh: \(currentItem["UrlImg"] as! String)")
        cell.img_Detail.image = UIImage(named: currentItem["UrlImg"] as! String)
        cell.lbl_name.text = currentItem.object(forKey: "SongName") as! String
        cell.lbl_info.text = nameArtist[indexPath.row]

        
        return cell
    }
    //#MARK: Protocol Selected
    func selectedOrder(id: Int){
        
        getDataSong(statement: "Order by \(self.itemsOfListView[id-1].column!) ASC")
    }

}
