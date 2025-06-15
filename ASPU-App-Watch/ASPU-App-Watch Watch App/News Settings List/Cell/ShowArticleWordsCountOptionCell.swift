//
//  ShowArticleWordsCountOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 21.04.2025.
//

import SwiftUI

struct ShowArticleWordsCountOptionCell: View {
    
    @State var isShowArticleWordsCountOn = UserDefaults.standard.object(forKey: "isShowArticleWordsCountOn") as? Bool ?? false
    
    var body: some View {
        HStack {
            Text("Кол-во слов")
                .foregroundColor(isShowArticleWordsCountOn ? .green : .gray)
                .fontWeight(.bold)
            Toggle("", isOn: $isShowArticleWordsCountOn)
        }.onChange(of: isShowArticleWordsCountOn) { oldValue, newValue in
            UserDefaults.standard.setValue(newValue, forKey: "isShowArticleWordsCountOn")
        }
    }
}

//#Preview {
//    ShowArticleWordsCountOptionCell()
//}
