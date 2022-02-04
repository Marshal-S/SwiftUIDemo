//
//  ListRow.swift
//  SwiftUIDemo
//
//  Created by Marshal on 2022/1/19.
//

import SwiftUI

struct ListRow: View {
    var symbol: String
    var body: some View {
        NavigationLink(destination: PencilDetail(symbol: symbol)) {
            HStack {
                Image(systemName: symbol)
                    .frame(width: 40, height: 40)
                Divider()
                Spacer()
                Text(symbol)
                    .foregroundColor(.red)
                    .opacity(0.8)
                Spacer()
            }
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(symbol: "pencil.circle")
    }
}
