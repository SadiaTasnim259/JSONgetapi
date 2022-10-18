//
//  GetJSON.swift
//  JSONgetapi
//
//  Created by Sadia on 17/10/22.
//

import Foundation

struct ProductsList: Codable {
    var products: [Product]
    var total, skip, limit: Int
}


struct Product: Codable {
    let title: String
    let price: Int
    let stock:Int
    let brand: String
    let rating: Double
}



