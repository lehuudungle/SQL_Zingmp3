//
//  ViewControllerTableBase.swift
//  SQL_Zing
//
//  Created by Ledung95d on 4/18/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewControllerTableBase: ViewControllerBase {
    var myTableView: UITableView!
    var nameArtist = [String]()
    var bien: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        addTableView()
       

    }
    func getArtistWidthSongID(){
        print("so bai hat :\(items.count)")
        for song in items{
            print(song["SongName"])
            let detail = dataBase.viewDatabase("DETAILALBUM", columns: ["ARTISTS.ArtistName"], statement: "JOIN ARTISTS on DETAILALBUM.ArtistID = ARTISTS.ID where SONGID = \(song["ID"]!)")
            print("doi tuong detail: \(detail)")
            nameArtist.append(detail.first!["ArtistName"] as! String)


        }

    }

    func addTableView(){
        myTableView = UITableView()
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        myTableView.backgroundColor = UIColor.brown
        self.view.addSubview(myTableView)

        // contrains
        self.myTableView.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: myTableView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: myTableView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: myTableView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 104)
        let cn4 = NSLayoutConstraint(item: myTableView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activate([cn1,cn2,cn3,cn4])


    }
    



}
