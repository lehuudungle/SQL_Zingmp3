//
//  DataBase.swift
//  SQL_Zing
//
//  Created by Ledung95d on 4/16/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import FMDB
class DataBase{
    
    var databasePath = NSString()
     init(){
        getPath()
        if (createDatabase() == true){
            insertNewValueToTables()
        }
        viewDatabase("SONGS", columns: ["*"], statement: "")


    }
    func insertNewValueToTables(){
        insertDatabase("ALBUMS", dict: ["Price":"200.000","AlbumName":"Anh Bỏ Thuốc Em Sẽ Yêu","ReleaseDate":"11/1/2015","UrlImg":"Anh Bỏ Thuốc Em Sẽ Yêu - Lyna Thùy Linh.jpg"])

        insertDatabase("SONGS", dict: ["SongName":"Anh Bỏ Thuốc Em Sẽ Yêu","UrlImg":"Anh Bỏ Thuốc Em Sẽ Yêu - Lyna Thùy Linh.jpg"])
        insertDatabase("ALBUMS", dict: ["Price":"400.000","AlbumName":"Bí mật bị thời gian vùi lấp","ReleaseDate":"6/09/2016","UrlImg":"Bí Mật Bị Thời Gian Vùi Lấp.jpg"])
        insertDatabase("ALBUMS", dict: ["Price":"700.000","AlbumName":"Đếm Ngày Xa em","ReleaseDate":"31/09/2017","UrlImg":"Đếm Ngày Xa Em - Lou Hoàng,OnlyC.jpg"])
        insertDatabase("ALBUMS", dict: ["Price":"123.000","AlbumName":"Yêu Một Người Không Sai","ReleaseDate":"31/09/2017","UrlImg":"Yêu Một Người Không Sai.jpg"])

        // artists

        insertDatabase("ARTISTS", dict: ["ArtistName":"Chí Thiện","Born":"19/5/1986","UrlImg":"Tình Yêu Nhạt Màu (Bí Mật Bị Thời Gian Vùi Lấp OST).jpg"])
        insertDatabase("ARTISTS", dict: ["ArtistName":"Hari Won","Born":"20/11/1983","UrlImg":"Anh Cứ Đi Đi.jpg"])
        insertDatabase("ARTISTS", dict: ["ArtistName":"Lyna Thuy LInh","Born":"19/1/1990","UrlImg":"LYNA THÙY LINH.jpg"])
        insertDatabase("ARTISTS", dict: ["ArtistName":"Mai Fin","Born":"19/1/1990","UrlImg":"LOUHOANG.jpg"])
        insertDatabase("ARTISTS", dict: ["ArtistName":"Lou Hoang","Born":"19/1/1990","UrlImg":"LOUHOANG.jpg"])

        // genres
        insertDatabase("GENRES", dict: ["GenreName":"NhacTre"])
        insertDatabase("GENRES", dict: ["GenreName":"Trữ Tình"])

        // PlayList
        insertDatabase("PLAYLIST", dict: ["PlayListName":"Nhac Nghe Lúc Buồn"])
        insertDatabase("PLAYLIST", dict: ["PlayListName":"Nhac Thất Tình"])

        // Song
        insertDatabase("SONGS", dict: ["SongName":"Anh Bỏ Thuốc Em Sẽ Yêu","UrlImg":"Anh Bỏ Thuốc Em Sẽ Yêu - Lyna Thùy Linh.jpg"])
        insertDatabase("SONGS", dict: ["SongName":"Gái Nhà Lành","UrlImg":"Gái Nhà Lành.jpg"])
        insertDatabase("SONGS", dict: ["SongName":"Anh cứ đi đi","UrlImg":"Anh Cứ Đi Đi - Hari Won.jpg"])
        insertDatabase("SONGS", dict: ["SongName":"Điệp khúc mùa xuân-Sơn Ngọc Minh","UrlImg":"Gái Nhà Lành.jpg"])
        insertDatabase("SONGS", dict: ["SongName":"Gái Nhà Lành","UrlImg":"Điệp Khúc Mùa Xuân.jpg"])
        insertDatabase("SONGS", dict: ["SongName":"Chỉ mong trái tim người","UrlImg":"Chỉ Mong Trái Tim Người.jpg"])

        // detailPlayList

        insertDatabase("SONGS", dict: ["SongID":"1"])
        insertDatabase("SONGS", dict: ["SongID":"1"])
        insertDatabase("SONGS", dict: ["SongID":"1"])
        insertDatabase("SONGS", dict: ["SongID":"1"])
        insertDatabase("SONGS", dict: ["SongID":"1"])
        insertDatabase("SONGS", dict: ["SongID":"2"])
        insertDatabase("SONGS", dict: ["SongID":"1"])

        // detailAlumbs
        insertDatabase("DETAILALBUM", dict: ["AlbumID":"1","GenreID":"1","ArtistID":"4","SongID":"1"])




    }
    func getPath(){
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = NSString(string: dirPaths[0])
        databasePath = docsDir.appendingPathComponent("musics.db") as NSString
        print("url : \(databasePath)")

    }
    func createDatabase() -> Bool
    {
        let filemgr = FileManager.default

        if !filemgr.fileExists(atPath: databasePath as String) {

            let contactDB = FMDatabase(path: databasePath as String)

            if contactDB == nil {
                print("Error: \(contactDB?.lastErrorMessage())")
            }

            if (contactDB?.open())! {
                let sql_Create_SONGS = "create table if not exists SONGS (ID integer primary key autoincrement, SongName text, UrlImg text)"

                let sql_Create_DetailPlayList = "create table if not exists DetailPlayList (SongID integer, PlayListID integer, foreign key (SongID) references SONGS(ID), foreign key (PlayListID) references PLAYLIST(ID), primary key (SongID, PlayListID))"

                let sql_Create_PlayList = "create table if not exists PLAYLIST (ID integer primary key autoincrement, PlaylistName text)"

                let sql_Create_ALBUMS = "create table if not exists ALBUMS (ID integer primary key autoincrement, Price text, AlbumName text, ReleaseDate text, UrlImg text)"

                let sql_Create_DetailAlbum = "create table if not exists DETAILALBUM (AlbumID integer, GenreID integer, ArtistID integer, SongID integer, foreign key (AlbumID) references ALBUMS(ID), foreign key (GenreID) references GENRES(ID), foreign key (ArtistID) references ARTISTS(ID), foreign key (SongID) references SONGS(ID), primary key (AlbumID, GenreID, ArtistID, SongID))"

                let sql_Create_ARTISTS = "create table if not exists ARTISTS (ID integer primary key autoincrement, ArtistName text, UrlImg text, Born text not null)"

                let sql_Create_GENRES = "create table if not exists GENRES (ID integer primary key autoincrement, GenreName text)"


                if !(contactDB?.executeStatements(sql_Create_SONGS))! {
                    print("Error: \(contactDB?.lastErrorMessage())")
                }
                if !(contactDB?.executeStatements(sql_Create_DetailPlayList))! {
                    print("Error: \(contactDB?.lastErrorMessage())")
                }
                if !(contactDB?.executeStatements(sql_Create_PlayList))! {
                    print("Error: \(contactDB?.lastErrorMessage())")
                }
                if !(contactDB?.executeStatements(sql_Create_ALBUMS))! {
                    print("Error: \(contactDB?.lastErrorMessage())")
                }
                if !(contactDB?.executeStatements(sql_Create_DetailAlbum))! {
                    print("Error: \(contactDB?.lastErrorMessage())")
                }
                if !(contactDB?.executeStatements(sql_Create_ARTISTS))! {
                    print("Error: \(contactDB?.lastErrorMessage())")
                }
                if !(contactDB?.executeStatements(sql_Create_GENRES))! {
                    print("Error: \(contactDB?.lastErrorMessage())")
                }
                //                let sql_stmt2 = "create table if not exists track (trackid integer primary key autoincrement, trackname text, artistid integer, foreign key (artistid) references artist(artistid))"

                if !(contactDB?.executeStatements("PRAGMA foreign_keys = ON"))!
                {
                    print("Error: \(contactDB?.lastErrorMessage())")
                }
            } else {
                print("Error: \(contactDB?.lastErrorMessage())")
            }
            contactDB?.close()
            return true
        }
        return false
    }
    func insertDatabase(_ nameTable: String, dict: NSDictionary)
    {
        //Insert
        var keys = String();
        var values = String();
        var first = true
        for key in dict.allKeys
        {
            if (first == true)
            {
                keys = "'" + (key as! String) + "'"
                values = "'" + (dict.object(forKey: key) as! String) + "'"
                first = false
                continue
            }
            keys = keys + "," + "'" + (key as! String) + "'"
            values = values + "," + "'" + (dict.object(forKey: key) as! String) + "'"
            print("key\(keys)")
            print("\(values)")
        }
        let contactDB = FMDatabase(path: databasePath as String)
        if (contactDB?.open())! {
            if !(contactDB?.executeStatements("PRAGMA foreign_keys = ON"))!
            {
                print("Error: \(contactDB?.lastErrorMessage())")
            }
            let insertSQL = "INSERT INTO \(nameTable) (\(keys)) VALUES (\(values))"
            print("insert: \(insertSQL)")
            let result = contactDB?.executeUpdate(insertSQL,
                                                  withArgumentsIn: nil)
            if !result! {
                print("Error: \(contactDB?.lastErrorMessage())")
            }
        }
        contactDB?.close()
    }
    func viewDatabase(_ table: String, columns: [String], statement: String) -> [NSDictionary]
    {

        var allColumns = ""
        var items = [NSDictionary]()
        for column in columns
        {
            if (allColumns == "")
            {
                allColumns = column
            }
            else
            {
                allColumns = allColumns + "," + column
            }
        }
        let querySQL = "Select DISTINCT \(allColumns) From \(table) \(statement)"
        
        let contactDB = FMDatabase(path: databasePath as String)
        if (contactDB?.open())! {
            let results:FMResultSet? = contactDB?.executeQuery(querySQL,
                                                               withArgumentsIn: nil)
            while ((results?.next()) == true)
            {   
                items.append(results!.resultDictionary() as NSDictionary)
            }
        }
        contactDB?.close()
        return items
    }

}
