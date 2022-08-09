import SwiftUI

struct VideoCardView: View {
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading) {
                //MARK: Video image
                AsyncImage(url: URL(string: "")) { image in
                    image.resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 250)
                        .cornerRadius(5)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.3))
                        .frame(maxWidth: .infinity)
                        .frame(height: 250)
                        .cornerRadius(5)
                }
                
                //MARK: Video info
                VStack() {
                    HStack(alignment: .center,spacing: 5) {
                        Image(systemName: "person")
                            .font(.system(size: 35))
                        Spacer()
                        VStack(alignment: .leading, spacing: 5) {
                            Text("By AMJAD")
                            
                            Text("30 sec")
                        }
                        Spacer()
                        Spacer()
                    }
                }
                .padding()
            }
            Image(systemName: "play")
                .foregroundColor(.white)
                .font(.title)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(30)
        }
    }
}

struct VideoCardView_Previews: PreviewProvider {
    static var previews: some View {
        VideoCardView()
    }
}
