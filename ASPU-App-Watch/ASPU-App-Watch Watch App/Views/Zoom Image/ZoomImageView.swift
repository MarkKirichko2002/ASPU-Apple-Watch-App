//
//  ZoomImageView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 12.08.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ZoomImageView: View {
    
    var url: String
    @State var scale = 1.0
    @State var isZoomed = true
    
    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            if url.contains("http") {
                WebImage(url: URL(string: url))
                    .resizable()
                    .frame(width: 300, height: 300)
                    .onTapGesture(count: 2) {
                        isZoomed.toggle()
                        if isZoomed {
                            scale -= 0.5
                        } else {
                            scale += 0.5
                        }
                    }
                    .scaleEffect(scale)
            } else {
                Image(url)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .onTapGesture(count: 2) {
                        isZoomed.toggle()
                        if isZoomed {
                            scale -= 0.5
                        } else {
                            scale += 0.5
                        }
                    }
                    .scaleEffect(scale)
            }
        }
    }
}

#Preview {
    ZoomImageView(url: "")
}
