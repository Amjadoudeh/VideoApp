import SwiftUI

struct ContentView: View {
    var explore: Explore
    var body: some View {
        VStack {
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
                    
                    ForEach(Query.allCases, id: \.self) {
                        searchQuery in
                        QueryTag(query: searchQuery, isSelected: false)
                    }
                    
                }
                .padding(.horizontal, 10)
            }
        }
        .background(.black.opacity(0.8))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(explore: Explore.explore)
    }
}
