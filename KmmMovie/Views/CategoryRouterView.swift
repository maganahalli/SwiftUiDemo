//
//  CategoryRouterView.swift
//  CategoryRouterView
//
//  Created by Venkatesh Maganahalli on 8/18/21.
//

import SwiftUI

struct CategoryRouterView: View {
    
    var category : String
    
    var body: some View {
        if category == "Movies" {
        SearchView(viewModel: SearchViewModel())
        }else {
            NewsContentView()
        }
    }
}

struct CategoryRouterView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRouterView(category: "Movies")
    }
}
