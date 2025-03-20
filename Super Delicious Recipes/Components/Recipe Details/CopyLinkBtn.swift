//
//  CopyLinkBtn.swift
//  Super Delicious Recipes
//
//  Created by development on 3/19/25.
//

import SwiftUI
import UniformTypeIdentifiers

struct CopyLinkBtn: View {
    var title: String
    var link: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            if let url = link {
                Text(title)
                    .fontWeight(.semibold)
                
                HStack(alignment: .center) {
                    Button(action: {
                        UIPasteboard.general.setValue(url, forPasteboardType: UTType.url.identifier)
                    }) {
                        Image(systemName: "document.on.document.fill")
                            .padding(10.0)
                            .foregroundColor(.white)
                            .background(.gray)
                            .cornerRadius(10)
                    }
                    
                    Text(url)
                }
            }
        }
    }
}

