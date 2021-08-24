//
//  SearchView.swift
//  KmmMovie
//
//  Created by Venkatesh Maganahalli on 8/18/21.
//

import SwiftUI


struct SearchView : View {
    
    @State var searchText = ""
    @State var searching = false
    let myMoviewTitles = [" "]
    
    @ObservedObject var viewModel: SearchViewModel 
    
    @State private var query: String = ""
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
         
            ScrollView{
         
                        VStack(alignment: .leading) {
                            SearchBar(searchText: $searchText, searching: $searching,viewModel: viewModel)

            Group { () -> AnyView in
                
                switch viewModel.viewState {
                
                case .Init:
                    return AnyView(Text("Please type Movie Title").bold().padding())
                
                case .Loading(let message):
                    return AnyView(Text(verbatim: message).bold().padding())
                
                case .Fetched(let moviesResult):
                    return AnyView(SearchedView(movieResult: moviesResult))
                    
                case .NoResultsFound:
                    return AnyView(Text("No matching movies found").bold().padding())
                    
                case .ApiError(let errorMessage):
                    return AnyView(Text(verbatim: errorMessage).bold().padding())
                }
            }
        }  // end scroll view
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}


}


