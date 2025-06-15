//
//  SplashScreenOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.09.2024.
//

import SwiftUI

struct SplashScreenOptionCell: View {
    
    var body: some View {
        NavigationLink {
            SplashScreenOptionsListView()
        } label: {
            Text("Заставки")
                .fontWeight(.bold)
        }
    }
}

//#Preview {
//    ShowSplashOptionCell()
//}
