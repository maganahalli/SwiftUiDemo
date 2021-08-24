//
//  DataModel.swift
//  KmmMovie
//
//  Created by Venkatesh Maganahalli on 8/18/21.
//

import Foundation

struct MoviesResult: Codable {
    var results: [Movie]
    let title: String?
}


struct Movie: Codable, Hashable {
    var id: CLong
    var title: String
    var overview: String
    var poster_path: String? = nil
}


enum MovieError: Error {
    case runtimeError(String)
}
