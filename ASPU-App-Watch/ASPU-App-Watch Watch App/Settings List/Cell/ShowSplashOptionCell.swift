//
//  ShowSplashOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.09.2024.
//

import SwiftUI

struct ShowSplashOptionCell: View {
    
    @State var isSplashOn = UserDefaults.standard.object(forKey: "isSplashOn") as? Bool ?? false
    
    var body: some View {
        HStack {
            Text("Заставка")
                .foregroundColor(isSplashOn ? .green : .gray)
                .fontWeight(.bold)
            Toggle("", isOn: $isSplashOn)
        }.onChange(of: isSplashOn) { oldValue, newValue in
            UserDefaults.standard.setValue(newValue, forKey: "isSplashOn")
        }
    }
}

//#Preview {
//    ShowSplashOptionCell()
//}
