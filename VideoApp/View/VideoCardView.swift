import SwiftUI

struct VideoCardView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: ""))
        }
    }
}

struct VideoCardView_Previews: PreviewProvider {
    static var previews: some View {
        VideoCardView()
    }
}
