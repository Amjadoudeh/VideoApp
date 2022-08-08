import SwiftUI

struct ContentView: View {
    var explore: Explore
    var body: some View {
        VStack {
            LogoControleView()
            Divider().background(.white.opacity(0.8))
            QueryTagNav(explore: Explore.explore)
            Divider().background(.white.opacity(0.8))
            Spacer()
        }
        .padding(.top, 10)
        .background(.black.opacity(0.9))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(explore: Explore.explore)
    }
}

struct QueryTagNav: View {
    var explore: Explore
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                HStack {
                    Image(systemName: "safari").font(.system(size: 20))
                    
                    Text(explore.rawValue)
                    
                }
                .font(.subheadline.bold())
                .foregroundColor(.white)
                .padding(.horizontal, 6)
                .padding(.vertical, 6)
                .background(Color("AccentColor"))
                .cornerRadius(5)
                
                // to be fixed
                Divider().background(.white.opacity(0.8))
                    .frame(height: 30)
                
                HStack {
                    ForEach(Query.allCases, id: \.self) {
                        searchQuery in
                        QueryTag(query: searchQuery, isSelected: false)
                    }
                }
                
            }
        }
        .padding(.horizontal, 8)
    }
}

struct LogoControleView: View {
    var body: some View {
        HStack{
            HStack {
                Image(systemName: "play.rectangle")
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                    .background(.red)
                // need to fix the background
                
                
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

struct ExtractedView: View {
    var body: some View {
        ExtractedView()
    }
}
