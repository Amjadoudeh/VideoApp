//
//  TabView.swift
//  VideoApp
//
//  Created by Amjad Oudeh on 09.08.22.
//

import SwiftUI

struct TabView: View {
    var body: some View {
        HStack(alignment: .center) {
            NavigationLink {
                
            } label: {
                VStack {
                    Image("home-icon")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 25, height: 25)
                    
                    
                    Spacer()
                    Text("Home")
                        .font(.caption2)
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
            
            NavigationLink {
                
            } label: {
                VStack {
                    Image(systemName: "house.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                    
                    Spacer()
                    Text("Home")
                        .font(.caption2)
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
            
            NavigationLink {
                
            } label: {
                VStack {
                    Image(systemName: "plus.circle")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                    
                }
            }
            
            Spacer()
            
            NavigationLink {
                
            } label: {
                VStack {
                    Image(systemName: "house.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                    
                    
                    Text("Home")
                        .font(.caption2)
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
            
            NavigationLink {
                
            } label: {
                VStack {
                    Image(systemName: "house.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                    
                    Spacer()
                    Text("Home")
                        .font(.caption2)
                        .foregroundColor(.white)
                }
            }
        }
        .frame(height: 30)
        .padding()
        .background(.red)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
            .preferredColorScheme(.dark)
    }
}
