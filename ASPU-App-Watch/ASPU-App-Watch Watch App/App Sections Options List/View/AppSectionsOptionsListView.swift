//
//  AppSectionsOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 11.11.2024.
//

import SwiftUI

struct AppSectionsOptionsListView: View {
    var body: some View {
        List(AppSectionsOptions.allCases, id: \.rawValue) { option in
            NavigationLink {
                switch option {
                case .position:
                    AppSectionsListPositionOptionView()
                case .display:
                    AppSectionsDisplayOptionsListView()
                }
            } label: {
                Text(option.rawValue)
                    .fontWeight(.bold)
            }
        }.navigationTitle("Разделы")
    }
}

#Preview {
    AppSectionsOptionsListView()
}
