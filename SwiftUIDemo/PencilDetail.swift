//
//  PencilDetail.swift
//  SwiftUIDemo
//
//  Created by Marshal on 2022/1/19.
//  首页详情

import SwiftUI

struct PencilDetail: View {
    @ObservedObject var detailModel = PencilDetailModel()
    
    var symbol: String
    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            VStack(alignment: .center, spacing: 0.0) {
                HStack {
                    Image(systemName: symbol)
                        .frame(width: 30, height: 30)
                    Divider()
                    Text("Hi!")
                    Spacer()
                }
                
                VStack(alignment: .center, spacing:0.0) {
                    HStack {
                        Text("Hello, world!")
                        Spacer()
                        Text("Hello, world!")
                    }
                    Text("Hello, world!")
                }
                //id可以设置里面指定item属性，如果是个字符串可以直接\.self，表示对象本身
                //如果集合内对象里面有id唯一属性，可设置成\.id，id用来优化List的性能
                Text("通过ForEach将集合生成若干个视图")
                ForEach(detailModel.list, id: \.self) { num in
                    Text(num)
                }
            }
        })
        //设置导航
        .navigationBarTitle("PencilDetail", displayMode: .inline)
    }
}

struct PencilDetail_Previews: PreviewProvider {
    static var previews: some View {
        PencilDetail(symbol: "pencil.circle")
    }
}
