//
//  ItemDetailView.swift
//  iDine
//
//  Created by Elliot Knight on 25/01/2022.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.headline)
            .buttonStyle(.borderedProminent)
            .shadow(color: .blue, radius: 5, x: 4, y: 4)
    }
}

extension View {
    func buttonStyling() -> some View {
        modifier(ButtonModifier())
    }
}


struct PhotoCreditModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(3)
            .font(.headline)
            .foregroundColor(.white)
            .background(.black)
            .offset(x: -5, y: -5)
    }
}

extension View {
    func photoCredit() -> some View {
        modifier(PhotoCreditModifier())
    }
}
struct ItemDetailView: View {
    @EnvironmentObject var order: Order
    @State private var NewFavoriteListItems = [String]()
    let item: MenuItem
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Image : \(item.photoCredit)")
                    .photoCredit()
            }
            Text(item.description)
            
            Button("Order this") {
                order.add(item: item)
            }
            .buttonStyling()
            Spacer()
        } .padding()
            .navigationTitle(item.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                // Struggled all the day for that, it's fixed
                // order.add(item: item)
                //                order.items.append(NewFavoriteListItems)
                //                order.items += NewFavoriteListItems
                addFavorites(at: item)
            }) {
                Image(systemName: "heart")
            }//.disabled(order.items.contains(item))
            )
    }
    //    func addFavorites(at indexSet: IndexSet) {
    //        favItems.append(item)
    //     }
    
    func addFavorites(at itemNumber: MenuItem) {
        order.add(item: itemNumber)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetailView(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
