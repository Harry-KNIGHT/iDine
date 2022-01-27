//
//  FavoritesView.swift
//  iDine
//
//  Created by Elliot Knight on 27/01/2022.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        List {
            Section {
                ForEach(order.items) { item in
                    HStack {
                        Text(item.name)
                    }
                }.onDelete(perform: deletFav)
            }
        }
        .navigationTitle("Favorites")
        .toolbar {
            EditButton()
        }
    }
    func deletFav(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        FavoritesView()
                .environmentObject(Order())
        }
    }
}
