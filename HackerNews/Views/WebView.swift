//
//  WebView.swift
//  HackerNews
//
//  Created by Mohamed Elbendary on 19/06/2026.
//

import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let safeUrl = urlString, let url = URL(string: safeUrl) else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
