import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var video: Video
    @State private var player = AVPlayer()
    
    var body: some View {
        //MARK: VideoPlayer from AVkit
        VideoPlayer(player: player)
            .ignoresSafeArea()
            .onAppear {
                if let link = video.videoFiles.first?.link {
                    player = AVPlayer(url: URL(string: link)!)
                    player.play()
                }
            }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(video: previewVideo)
    }
}
