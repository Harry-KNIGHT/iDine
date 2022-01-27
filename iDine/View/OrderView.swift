//
//  OrderView.swift
//  iDine
//
//  Created by Elliot Knight on 25/01/2022.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deletItems)
                }
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place order")
                    }.disabled(order.items.isEmpty)
                }
            }
            .navigationTitle("Order")
            .listStyle(InsetGroupedListStyle())
            .toolbar { EditButton() }
        }
    }
    
    func deletItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
