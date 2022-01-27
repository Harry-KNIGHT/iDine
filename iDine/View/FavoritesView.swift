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
        Text("")
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
