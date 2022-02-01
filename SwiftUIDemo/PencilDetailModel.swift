//
//  ListModel.swift
//  SwiftUIDemo
//
//  Created by 李帅 on 2022/2/1.
//

import UIKit

class PencilDetailModel: ObservableObject {
    @Published var list: [String] = []
    
    init() {
        //直接在这里获取网络数据即可，这里是模拟网络异步请求
        DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async {
                self.list = ["哈哈",
                        "我是网络请求数据",
                        "我是模拟的网络请求数据",
                        "我的参数使用@Published修饰,遵循ObservableObject协议",
                        "一旦发生改变则会更新使用该参数的UI",
                        "UI监听该对象时需要使用@ObservedObject来修饰"]
            }
        }
    }
}
