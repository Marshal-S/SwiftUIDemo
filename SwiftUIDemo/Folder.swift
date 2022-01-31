//
//  FloderDetail.swift
//  SwiftUIDemo
//
//  Created by Marshal on 2022/1/19.
//  Filder页面

import SwiftUI

struct Folder: View {
    @State var isEnterAnimation = false
    
    init() {
        print("Folder初始化了！")
    }
    
    var body: some View {
        //id可以设置里面指定item属性，如果是个字符串可以直接\.self
        //如果集合内对象里面有id属性，可设置成\.id，id用来优化List的性能
        ScrollView {
            //个人信息
            HStack(alignment: .top, spacing: nil, content: {
                Image(systemName: "video")
                    .resizable() //能让图片填充满，contentModel木了
                    .frame(width: 60, height: 60, alignment: .center)
                    .cornerRadius(4)
                    .padding(.leading, 10)
                //默认居中，所以要设置
                VStack(alignment: .leading, spacing: nil, content: {
                    Spacer()
                    Text("昵称：干饭人开动了！")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("账号：111111")
                        .font(.system(size: 12)) //也可以通过这种方式设置字体，一般这么设置
                    Spacer()
                })
                Spacer()
                HStack(alignment: .top, spacing: nil, content: {
                    Button(action: {
                        print("可以准备跳转设置界面")
                    }, label: {
                        Image(systemName: "sunset")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                    })
                })
            })
            
            VStack {
                HStack {
                    Text("全部订单")
                        .font(.headline)
                    Spacer()
                    NavigationLink(destination: FoldDetail(type: 0), label: {
                        Text("全部")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    })
                }.padding([.leading, .trailing], 10)
                
                HStack {
                    NavigationLink(destination: FoldDetail(type: 1), label: {
                        VStack {
                            Image(systemName: "cloud.sun")
                            Text("待付款")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.top, 1)
                        }
                    })
                    Spacer()
                    NavigationLink(destination: FoldDetail(type: 2), label: {
                        VStack {
                            Image(systemName: "cloud.sun")
                            Text("待发货")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.top, 1)
                        }
                    })
                    Spacer()
                    
                    NavigationLink(destination: FoldDetail(type: 3), label: {
                        VStack {
                            Image(systemName: "cloud.sun")
                            Text("待收货")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.top, 1)
                                
                        }
                    })
                    Spacer()
                    
                    NavigationLink(destination: FoldDetail(type: 4), label: {
                        VStack {
                            Image(systemName: "cloud.sun")
                            Text("待评价")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.top, 1)
                        }
                    })
                    Spacer()
                    
                    NavigationLink(destination: FoldDetail(type: 5), label: {
                        VStack {
                            Image(systemName: "cloud.sun")
                            Text("退款/售后")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.top, 1)
                        }
                    })
                }.padding([.leading, .trailing], 10)

                .padding(.top, 1)
                
                
                
            }.padding(.top, 20)
            
            
            
        }
        .navigationBarTitle("pencil") //默认是国外的样式
        .navigationBarItems(leading: leftBarItem, trailing: rightBarItem)
    }
    
    var leftBarItem: some View {
        //直接进入
        NavigationLink(destination: DrawPathDetail()) {
            Text("绘制路径")
        }
    }
    
    var rightBarItem: some View {
        //这里演示一下怎么动态控制进入下一页，通过按钮控制状态进入
        NavigationLink(destination: AnimationDetail(), isActive: $isEnterAnimation){
            Button {
                self.isEnterAnimation = true
            } label: {
                Text("绘制转场")
            }
        }
    }
}

struct FloderDetail_Previews: PreviewProvider {
    static var previews: some View {
        Folder()
    }
}
