import Foundation
import SwiftUI

//MARK: Query tags
enum Query: String, CaseIterable {
    case  Cars , Animals , People, Ocean , Food, Flamenco, Meditaion ,Study , Nature
}

//MARK: Explore button
enum Explore: String {
    case Explore
}

//MARK: ResponseBody
struct ResponseBody: Decodable {
    var page: Int
    var perPage: Int
    var totalResults: Int
    var url: String
    var videos: [Video]
    
}

struct Video: Identifiable, Decodable {
    var id: Int
    var image: String
    var duration: Int
    var user: User
    var videoFiles: [VideoFiles]
    
    struct User: Identifiable, Decodable {
        var id: Int
        var name: String
        var url: String
    }
    
    struct VideoFiles: Identifiable, Decodable {
        var id: Int
        var quality: String
        var fileType: String
        var link: String
    }
}

