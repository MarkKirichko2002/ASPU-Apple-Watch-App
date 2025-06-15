//
//  NewsInfoView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 03.11.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsInfoView: View {
    
    @ObservedObject var viewModel = NewsInfoViewModel()
    var abbreviation: String
    var id: Int
    var option: NewsInfoOptions
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                Text("Загрузка...")
                    .fontWeight(.bold)
            } else {
                switch option {
                case .description:
                    if !viewModel.info.description.isEmpty {
                        ScrollView {
                            VStack {
                                Text(viewModel.info.description)
                                    .fontWeight(.bold)
                            }.padding(10)
                        }
                    } else {
                        Text("Нет описания")
                            .fontWeight(.bold)
                    }
                case .image:
                    if !viewModel.info.images.isEmpty {
                        ScrollView(.horizontal, showsIndicators: true) {
                            LazyHStack {
                                ForEach(viewModel.info.images, id: \.self) { image in
                                    WebImage(url: URL(string: image))
                                        .resizable()
                                        .frame(width: 160, height: 160)
                                        .aspectRatio(contentMode: .fill)
                                        .cornerRadius(10)
                                        .onTapGesture {
                                            viewModel.currentImage = image
                                            viewModel.isImageSelected.toggle()
                                     }
                                }
                            }
                            .padding()
                        }
                    } else {
                        Text("Нет изображений")
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .navigationTitle(option.rawValue)
        .onChange(of: viewModel.isImageSelected) {
            self.viewModel.isImagePresented.toggle()
        }
        .onAppear {
            viewModel.getArticleInfo(abbreviation: abbreviation, id: id)
        }
        .sheet(isPresented: $viewModel.isImagePresented, content: {
            ZoomImageView(url: viewModel.currentImage)
        })
    }
}

//#Preview {
//    NewsInfoView()
//}
