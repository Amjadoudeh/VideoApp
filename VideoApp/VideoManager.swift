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
//MARK: Class for the HTTP request
class VideoManager: ObservableObject {
    @Published private(set) var videos: [Video] = []
    @Published  var selectedQuery: Query = Query.Cars {
        didSet {
            Task.init {
                await findVideos(topic: selectedQuery)
            }
        }
    }
    
    init(){
        Task.init {
            await findVideos(topic: selectedQuery)
        }
    }
    
    func findVideos(topic: Query) async {
        do {
            guard let url = URL(string: "https://api.pexels.com/videos/search?query=\(topic)&per_page=15&orientation=portrait") else { fatalError("Missing URL")}
            
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue("563492ad6f91700001000001171cc72abc8c4b37b2c09d0ebd0de313", forHTTPHeaderField: "Authorization")
            
            let (data , response) = try await URLSession.shared.data(for: urlRequest)
            
            guard ( response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data")}
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(ResponseBody.self, from: data)
            // clear it before the next response
            
            DispatchQueue.main.async {
                self.videos = []
                self.videos = decodedData.videos
            }
           
        } catch {
            print("Error fetching data from the server: \(error)")
        }
    }
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

