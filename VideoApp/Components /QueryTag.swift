import SwiftUI

struct QueryTag: View {
    var query: Query
    var isSelected: Bool
    
    var body: some View {
        
        Text(query.rawValue)
            .font(.subheadline)
            .fontWeight(isSelected ? .bold : .semibold)
            .foregroundColor(isSelected ? .black : .white)
            .padding(.horizontal, 6)
            .padding(.vertical, 8)
            .background(isSelected ? .white : Color("AccentColor"))
            .cornerRadius(25)
    }
}

struct QueryTag_Previews: PreviewProvider {
    static var previews: some View {
        QueryTag(query: Query.cars, isSelected: true)
            .preferredColorScheme(.dark)
    }
}

