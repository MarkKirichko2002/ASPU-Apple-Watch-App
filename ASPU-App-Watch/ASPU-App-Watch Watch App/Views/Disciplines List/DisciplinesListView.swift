//
//  DisciplinesListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 28.10.2024.
//

import SwiftUI

struct DisciplinesListView: View {
    
    @Binding var currentPair: Discipline
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var pairs: [Discipline]
    
    var body: some View {
        List(pairs, id: \.self) { pair in
            if pair == currentPair {
                HStack {
                    if pair.subgroup == 0 {
                        Text("\(pair.name)")
                    } else {
                        Text("\(pair.name) (подгруппа: \(pair.subgroup))")
                    }
                    Spacer()
                    Image("check")
                        .resizable()
                        .frame(width: 20, height: 20)
                }.contentShape(Rectangle())
            } else {
                HStack {
                    if pair.subgroup == 0 {
                        Text("\(pair.name)")
                    } else {
                        Text("\(pair.name) (подгруппа: \(pair.subgroup))")
                    }
                }.contentShape(Rectangle())
                .onTapGesture {
                    currentPair = pair
                    closeScreen()
                }
            }
        }.navigationTitle("Дисциплины")
            .fontWeight(.bold)
            .onChange(of: currentPair) {}
    }
    
    func closeScreen() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

//#Preview {
//    DisciplinesListView()
//}
