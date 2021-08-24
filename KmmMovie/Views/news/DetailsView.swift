//
//  DetailsView.swift
//  DetailsView
//
//  Created by Venkatesh Maganahalli on 8/18/21.
//

import SwiftUI
import WebKit

struct DetailsView: View {
    let url : String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(url: "https://google.com")
    }
}
