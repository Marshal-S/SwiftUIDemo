//
//  FoldDetail.swift
//  SwiftUIDemo
//
//  Created by Marshal on 2022/1/21.
//

import SwiftUI

struct FoldDetail: View {
    var type: Int
    var body: some View {
        ScrollView {
            Text("Hello, FoldDetail!")
            Text("Just do it!")
            if (type == 5) {
                Text("退个屁的或，本店概不退货🤣")
            }
        }
        .navigationBarTitle(
            type == 0 ? "全部订单" :
            type == 1 ? "待付款" :
            type == 2 ? "待发货" :
            type == 3 ? "待收货" :
            type == 4 ? "待评价" :
            type == 5 ? "退款/售后" :
            ""
        )
    }
}

struct FoldDetail_Previews: PreviewProvider {
    static var previews: some View {
        FoldDetail(type: 0)
    }
}
