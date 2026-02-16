//
//  SwipeEdgeOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.05.2025.
//

import SwiftUI

struct SwipeEdgeOptionsListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var viewModel = SwipeEdgeOptionsListViewModel()
    
    var body: some View {
        List(viewModel.edges, id: \.self) { edge in
            if viewModel.isSavedSwipeEdge(edge: edge) {
                SwipeEdgeCell(edge: edge, isSelected: viewModel.isSavedSwipeEdge(edge: edge))
            } else {
                SwipeEdgeCell(edge: edge, isSelected: viewModel.isSavedSwipeEdge(edge: edge))
                    .onTapGesture {
                        viewModel.selectSwipeEdge(edge: edge)
                        closeScreen()
                    }
              }
        }
        .navigationTitle("Края")
        .onChange(of: viewModel.isChanged) {}
    }
    
    func closeScreen() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}


#Preview {
    SwipeEdgeOptionsListView()
}
