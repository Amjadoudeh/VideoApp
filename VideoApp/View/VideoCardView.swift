import SwiftUI

struct VideoCardView: View {
    var video: Video
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading) {
                //MARK: Video image
                AsyncImage(url: URL(string: video.image)) { image in
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
                            Text("By: \(video.user.name)")
                                .foregroundColor(.white)
                            
                            Text("\(video.duration) sec")
                                .foregroundColor(.red)
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
        VideoCardView(video: previewVideo)
    }
}
