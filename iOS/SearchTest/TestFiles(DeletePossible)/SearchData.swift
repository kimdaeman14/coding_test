//
//  SearchData.swift
//  SearchTest
//
//  Created by kimdaeman14 on 2018. 9. 12..
//  Copyright © 2018년 A3LCamel. All rights reserved.
//

import Foundation


//struct SearchData: Decodable {
//    var first:String?
//    var second:[Bet]?
//}
//
//
//struct Bet: Codable {
//    let price: String
//    let sale: String
//}



struct Search: Decodable {
    var word: String?
    var relatedQuery: [String]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let result = try? container.decode(String.self) {
            self.word = result
        }
        if let retult = try? container.decode([String].self) {
            self.relatedQuery = retult
        }
    }
}
