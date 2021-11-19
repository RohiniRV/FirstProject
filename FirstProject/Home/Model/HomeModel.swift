//
//  HomeModel.swift
//  FirstProject
//
//  Created by rvaidya on 16/11/21.
//

import Foundation

struct RedundantModel: Decodable {
    var page: Int
    var per_page: Int
    var total: Int
    var total_pages: Int
    var data: [HomeModel]
}

struct HomeModel: Decodable {
    var id: Int
    var email: String
    var first_name: String
    var last_name: String
    var avatar: String
}
