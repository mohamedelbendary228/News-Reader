//
//  DetailsView.swift
//  HackerNews
//
//  Created by Mohamed Elbendary on 19/06/2026.
//

import SwiftUI
import WebKit

struct DetailsView: View {
    var url: String?
    var body: some View {
        WebView(urlString: url)
    }
}


