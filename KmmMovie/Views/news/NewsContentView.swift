//
//  NewsContentView.swift
//  NewsContentView
//
//  Created by Venkatesh Maganahalli on 8/18/21.
//

import SwiftUI

struct NewsContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List (networkManager.posts){ post in
                
                NavigationLink.init(
                    destination: DetailsView(url: post.url),
                    label: {
                        HStack {
                            Text(String(post.points))
                        Text(post.title)
                        }
                    })
                
            .padding(.horizontal)
        }
        .navigationBarTitle("Trending NEWS !!!!")
        }
        
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
        
    }
}

struct NewsContentViewPreviews: PreviewProvider {
    static var previews: some View {
        NewsContentView()
    }
}
