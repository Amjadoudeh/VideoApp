import SwiftUI

struct ContentView: View {
    @StateObject var videoManager = VideoManager()
    var colums = [GridItem(.adaptive(minimum: 250), spacing: 0)]
    var explore: Explore
    
    var body: some View {
        NavigationView {
            VStack {
                LogoControleNavView()
                Divider().background(.white.opacity(0.8))
                HStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        //MARK: Explore button
                        HStack {
                            HStack {
                                Image(systemName: "safari").font(.system(size: 20))
                                Text(explore.rawValue)
                                
                            }
                            .font(.subheadline.bold())
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 6)
                            .background(Color("AccentColor"))
                            .cornerRadius(3)
                            
                            // to be fixed
                            Divider()
                                .background(.white.opacity(0.8))
                                .frame(height: 30)
                            //MARK: Query tags
                            HStack {
                                ForEach(Query.allCases, id: \.self) {
                                    searchQuery in
                                    QueryTag(query: searchQuery, isSelected:
                                                videoManager.selectedQuery == searchQuery)
                                        .onTapGesture {
                                            videoManager.selectedQuery = searchQuery
                                        }
                                }
                            }
                            
                        }
                    }
                    .padding(.horizontal, 10)
                }
                Divider().background(.white.opacity(0.8))
                
                ScrollView {
                    if videoManager.videos.isEmpty {
                        ProgressView()
                    } else {
                        LazyVGrid(columns: colums){
                            ForEach(videoManager.videos, id: \.id) { video in
                                NavigationLink {
                                    VideoPlayerView(video: video)
                                } label: {
                                    VideoCardView(video: video)
                                        .padding(.vertical, 6)
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding(.top, 10)
            .background(.black.opacity(0.9))
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(explore: Explore.Explore)
    }
}

struct LogoControleNavView: View {
    var body: some View {
        HStack{
            HStack {
                Image("youtube")
                    .resizable()
                    .frame(width: 34, height: 30)
                
                // need to fix the Title
                Text("MYVIDEO")
                    .font(.title3.weight(.heavy))
                    .foregroundColor(.white)
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Image(systemName: "play.rectangle")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "bell")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "person.circle")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
            }
            .padding(.horizontal,4)
        }
        .padding(.horizontal, 8)
    }
}
