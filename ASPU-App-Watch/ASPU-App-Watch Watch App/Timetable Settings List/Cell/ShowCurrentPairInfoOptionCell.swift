//
//  ShowCurrentPairInfoOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 15.06.2025.
//

import SwiftUI

struct ShowCurrentPairInfoOptionCell: View {
    
    @State var isShowCurrentPairInfoOn = UserDefaults.standard.object(forKey: "isShowCurrentPairInfoOn") as? Bool ?? false
    
    var body: some View {
        HStack {
            Text("Инфа о текущей паре")
                .foregroundColor(isShowCurrentPairInfoOn ? .green : .gray)
                .fontWeight(.bold)
            Toggle("", isOn: $isShowCurrentPairInfoOn)
        }.onChange(of: isShowCurrentPairInfoOn) { oldValue, newValue in
            UserDefaults.standard.setValue(newValue, forKey: "isShowCurrentPairInfoOn")
        }
    }
}

#Preview {
    ShowCurrentPairInfoOptionCell()
}
