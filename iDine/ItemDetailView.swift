//
//  ItemDetailView.swift
//  iDine
//
//  Created by Elliot Knight on 25/01/2022.
//

import SwiftUI

struct ItemDetailView: View {
    @EnvironmentObject var order: Order
    let item: MenuItem
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Image : \(item.photoCredit)")
                    .padding(3)
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(.black)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
            
            Button("Order this") {
                order.add(item: item)
            }
            .font(.headline)
            Spacer()
        } .padding()
            .navigationTitle(item.name)
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        /* shows title in Canva */
        NavigationView {
            ItemDetailView(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
