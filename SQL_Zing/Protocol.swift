//
//  Protocol.swift
//  SQL_Zing
//
//  Created by Ledung95d on 6/28/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import CoreGraphics
enum Type{
    case SONGS
    case ALBUMS
    case ARTISTS
    case PLAYLIST
    case GENRE
    case CELL
    case NONE

}
@objc protocol SelectItem{
    @objc optional func selectedOrder(id: Int)
}
