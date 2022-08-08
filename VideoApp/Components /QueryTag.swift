import SwiftUI

struct QueryTag: View {
    var query: String
    var isSelected: Bool
    
    var body: some View {
        
        Text(query)
            .font(.subheadline)
            .fontWeight(isSelected ? .bold : .semibold)
            .foregroundColor(isSelected ? .black : .white)
            .padding()
            .background(isSelected ? .white : .gray)
            .cornerRadius(25)
        
    }
}

struct QueryTag_Previews: PreviewProvider {
    static var previews: some View {
        QueryTag(query: "Cars", isSelected: true)
            .preferredColorScheme(.dark)
    }
}

