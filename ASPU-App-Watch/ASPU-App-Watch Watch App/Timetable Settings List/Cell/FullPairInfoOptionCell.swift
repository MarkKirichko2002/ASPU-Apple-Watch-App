//
//  FullPairInfoOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 07.10.2024.
//

import SwiftUI

struct FullPairInfoOptionCell: View {
    
    @State var isFullPairInfoOn = UserDefaults.standard.object(forKey: "isFullPairInfoOn") as? Bool ?? false
    
    var body: some View {
        HStack {
            Text("Полная инфа о паре")
                .foregroundColor(isFullPairInfoOn ? .green : .gray)
                .fontWeight(.bold)
            Toggle("", isOn: $isFullPairInfoOn)
        }.onChange(of: isFullPairInfoOn) { oldValue, newValue in
            UserDefaults.standard.setValue(newValue, forKey: "isFullPairInfoOn")
        }
    }
}

#Preview {
    FullPairInfoOptionCell()
}
