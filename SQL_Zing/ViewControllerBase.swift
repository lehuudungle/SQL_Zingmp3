//
//  ViewControllerBase.swift
//  SQL_Zing
//
//  Created by Ledung95d on 4/18/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewControllerBase: UIViewController {

    var listView = ListView(frame: CGRect(x: 0, y: 0, width: 200, height: 100), style: .plain)
    var itemsOfListView:[Label]!
    var btn_Title:UIButton!
    var txt_Search: UITextField!
    var items = [NSDictionary]()
    var dataBase = DataBase()

    override func viewDidLoad() {
        super.viewDidLoad()
        addBtn_Title()
        addTxt_Search()
//        addListViewOrder()
        
    }

    func addListViewOrder(){
        listView.items = itemsOfListView

        self.view.addSubview(listView)
        listView.translatesAutoresizingMaskIntoConstraints = false
        // contrains
        let cn1 = NSLayoutConstraint(item: listView, attribute: .centerX, relatedBy: .equal, toItem: btn_Title, attribute: .centerX, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: listView, attribute: .top, relatedBy: .equal, toItem: btn_Title, attribute: .bottom, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: listView, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(itemsOfListView.count)*50)

        let cn4 = NSLayoutConstraint(item: listView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200)
        NSLayoutConstraint.activate([cn1,cn2,cn3,cn4])

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setActionForRightBarButton()
        addListViewOrder()

    }
    func setActionForRightBarButton(){

        self.tabBarController?.navigationItem.rightBarButtonItem?.target = self
        self.tabBarController?.navigationItem.rightBarButtonItem?.action = #selector(checkHiddenSearch)
    }
    func checkHiddenSearch(){

        if txt_Search.isHidden == true{
            UIView.transition(with: self.txt_Search, duration: 0.5, options: .transitionCurlDown, animations: nil, completion: nil)

        }else{
            UIView.transition(with: self.txt_Search, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)

        }
        txt_Search.isHidden = !txt_Search.isHidden
        self.txt_Search.resignFirstResponder()

    }
    func addTxt_Search(){
        txt_Search = UITextField()
        txt_Search.isHidden = true
        txt_Search.borderStyle = .roundedRect
        txt_Search.placeholder = "Enter name here"
        txt_Search.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(txt_Search)

        // contrains
        let cn1 = NSLayoutConstraint(item: txt_Search, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: txt_Search, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: txt_Search, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)

        let cn4 = NSLayoutConstraint(item: txt_Search, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 64)
        NSLayoutConstraint.activate([cn1,cn2,cn3,cn4])

    }


    func addBtn_Title(){
        btn_Title = UIButton()
        btn_Title.setTitle("Name", for: .normal)
        btn_Title.setTitleColor(UIColor.gray, for: .highlighted)
        btn_Title.addTarget(self, action: #selector(chooseOrder), for: .touchUpInside)
        btn_Title.backgroundColor = UIColor.black
        self.view.addSubview(btn_Title)
        // contraints

        btn_Title.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: btn_Title, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: btn_Title, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: btn_Title, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)

        let cn4 = NSLayoutConstraint(item: btn_Title, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 64)
        NSLayoutConstraint.activate([cn1,cn2,cn3,cn4])
        
    }
    func chooseOrder(){
        print("Click")

    }

}
