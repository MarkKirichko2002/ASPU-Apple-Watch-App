//
//  DistanceOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 13.10.2024.
//

import SwiftUI

struct DistanceOptionCell: View {
    
    var distances = [100, 200, 300, 400, 500]
    
    @State var currentDistance = UserDefaults.standard.object(forKey: "distance") as? Int ?? 300
    
    var body: some View {
        Picker("Расстояние до ближайшего здания", selection: $currentDistance) {
            ForEach(distances, id: \.self) {
                Text("\($0) метров")
            }
        }.onChange(of: currentDistance) { distance in
            UserDefaults.standard.set(distance, forKey: "distance")
        }
    }
}

#Preview {
    DistanceOptionCell()
}
