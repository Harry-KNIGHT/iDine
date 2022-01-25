//
//  ItemRowView.swift
//  iDine
//
//  Created by Elliot Knight on 25/01/2022.
//

import SwiftUI

struct ItemRowView: View {
    static let colors: [String: Color] = ["D": .purple, "N": .green, "G": .black, "S": .blue]
    
    let item: MenuItem
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(lineWidth: 1.5))
            VStack(alignment: .leading) {
            Text(item.name)
                    .font(.headline)
            Text("$\(item.price)")
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(ItemRowView.colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(item: .example)
    }
}
