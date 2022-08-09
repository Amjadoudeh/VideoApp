import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var video: Video
    @State private var player = AVPlayer()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(video: previewVideo)
    }
}
