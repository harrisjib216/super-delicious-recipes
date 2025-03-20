//
//  WebsiteLoader.swift
//  Super Delicious Recipes
//
//  Created by development on 3/18/25.
//

import SwiftUI
import WebKit

// component to load a website from a url
struct WebsiteLoader: UIViewRepresentable {
    let link: String
    @Binding var isLoading: Bool
    @Binding var error: Error?
    
    func makeUIView(context: Context) -> WKWebView  {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.scrollView.showsVerticalScrollIndicator = false

        let request = URLRequest(url: URL(string: link)!, cachePolicy: .returnCacheDataElseLoad)
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // pass
    }
    
    /// MARK: This coordinator handles page events to toggle the loading indicator
    func makeCoordinator() -> WebsiteLoader.Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebsiteLoader
        
        init(_ parent: WebsiteLoader) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            // pass
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
        }
        
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            parent.isLoading = false
            parent.error = error
        }
    }
}
