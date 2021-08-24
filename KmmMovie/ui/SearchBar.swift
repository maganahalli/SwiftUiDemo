//
//  SearchBar.swift
//  SearchBar
//
//  Created by Venkatesh Maganahalli on 8/18/21.
//


import SwiftUI

struct SearchBar : View {
    
    @Binding var searchText: String
    @Binding var searching: Bool
    var viewModel : SearchViewModel
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("LightGray"))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search ..", text: $searchText) { startedEditing in
                    if startedEditing {
                        withAnimation {
                            searching = true
                        }
                    }
                } onCommit: {
                    self.viewModel.loadMovies(query: self.searchText)
                    withAnimation {
                        searching = false
                    }
                }
            }
            .foregroundColor(.gray)
            .padding(.leading, 13)
        }
            .frame(height: 40)
            .cornerRadius(13)
            .padding()
    }
}
