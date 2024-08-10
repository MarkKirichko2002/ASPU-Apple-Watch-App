//
//  ArticleDetailView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 05.07.2024.
//

import SwiftUI
import SDWebImageSwiftUI
import SwiftData

struct ArticleDetailView: View {
    
    var article: Article
    var abbreviation: String
    
    @Query var articles: [ArticleModel]
    @ObservedObject var viewModel = ArticleDetailViewModel()
    @State var alert = false
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        Form() {
            Section("Изображения") {
                ScrollView(.horizontal, showsIndicators: true) {
                    LazyHStack {
                        if viewModel.isLoading {
                            Text("Загрузка...")
                                .fontWeight(.bold)
                        } else if !viewModel.articleInfo.images.isEmpty {
                            ForEach(viewModel.articleInfo.images, id: \.self) { image in
                                WebImage(url: URL(string: image))
                                    .resizable()
                                    .frame(width: 160, height: 160)
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(10)
                            }.listStyle(.carousel)
                        } else {
                            Text("Нет изображений")
                                .fontWeight(.bold)
                        }
                    }
                    .padding()
                }
            }
            
            Section("Название") {
                Text(viewModel.articleInfo.title)
                    .fontWeight(.bold)
            }
            
            Section("Дата") {
                Text(viewModel.articleInfo.date)
                    .fontWeight(.bold)
            }
            
            Section("Описание") {
                if !viewModel.articleInfo.description.isEmpty {
                    Text(viewModel.articleInfo.description)
                        .fontWeight(.bold)
                } else {
                    Text("Нет описания")
                        .fontWeight(.bold)
                }
            }
            Section() {
                Button {
                    let model = ArticleModel(id: viewModel.articleInfo.id ?? 0, title: viewModel.articleInfo.title, desc: viewModel.articleInfo.description, date: viewModel.articleInfo.date, images: viewModel.articleInfo.images)
                    if !articles.contains(where: { $0.id == model.id }) {
                        modelContext.insert(model)
                    } else {
                        alert.toggle()
                    }
                } label: {
                    Text("Сохранить")
                        .fontWeight(.bold)
                }
            }
        }.navigationTitle("Подробнее")
            .alert(isPresented: $alert) {
                Alert(title: Text("Новость уже сохранена"))
            }
        .onAppear {
            viewModel.getArticleInfo(abbreviation: abbreviation, id: article.id)
        }
    }
}

#Preview {
    ArticleDetailView(article: Article(id: 1, title: "НАРЯДУ С ДИПЛОМОМ О ВЫСШЕМ ОБРАЗОВАНИИ ВЫПУСКНИКИ АГПУ ПОЛУЧАЮТ ЭЛЕКТРОННЫЙ ПОРТФЕЛЬ", description: "В день вручения дипломов о высшем образовании, 8 июля, выпускники АГПУ получат поздравительную открытку-вкладыш. В ней размещено поздравление Министра просвещения Российской Федерации Сергея Кравцова для выпускников педагогических университетов. Открытка-вкладыш содержит QR-код электронного портфеля, который откроет доступ выпускнику, молодому специалисту и педагогическому работнику со стажем работы актуальную и полезную информацию, станет надежным помощником в профессиональном становлении, навигатором в огромном информационном пространстве. Электронный портфель – это удобный поисково-информационный ресурс, объединяющий несколько рубрик. На страницах электронного портфеля раскрываются секреты воспитания, сервис рассказывает о важных событиях, памятных датах, дает рекомендации по разработке и управлению проектами в сфере образования. Кроме того, также представлены нормативные документы, ссылки на полезные медиаресурсы, советы по ведению школьной документации, подготовке к занятиям и многое другое. Ресурс будет постоянно обновляться, что позволит педагогу, студенту всегда быть в курсе всех изменений в системе образования!", date: "04.07.2024", previewImage: "http://www.agpu.net/upload/iblock/56e/7j5xwcjoniy9gr8k2q918ldchx7808h5.png"), abbreviation: "")
}
