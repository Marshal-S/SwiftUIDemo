//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Marshal on 2021/12/24.
//  TabBar类型的首页

import SwiftUI

struct ContentView: View {
    //@State为状态机，当页面状态需要更新时，可以通过此属性设置的参数来更新View状态
    //注意：不设置@State，刚加载View时也能显示内容，之后，却无法监听参数变更以更新UI
    @State var isActiveLeft = false
    @State var isActiveRight = false
    
    var body: some View {
        TabView {
            NavigationView {
                //id可以设置里面指定item属性，如果是个字符串可以直接\.self，表示对象本身
                //如果集合内对象里面有id属性，可设置成\.id，id用来优化List的性能
                List(Symbols, id:\.self ) {
                    ListRow(symbol: $0)
                }
                .navigationBarTitle("pencil") //默认是国外的样式
                .navigationBarItems(leading: leftBarItem, trailing: rightBarItem)
                //.navigationBarHidden(true)
                //.navigationBarTitle("pencil", displayMode: .inline) //这就是国内默认使用样式了
            }.tabItem {
                Image(systemName: "pencil.circle")
                Text("pencil")
            }
            
            NavigationView {
                Folder()
            }.tabItem {
                Image(systemName: "folder.circle")
                Text("folder")
            }
        }
    }
    
    var leftBarItem: some View {
        //toggle为Bool的自动置反功能
        Button(action: {self.isActiveLeft.toggle()}) {
            Image(systemName: "person")
            Text("person")
        }
        //添加一个弹窗，其是父级View中的，而不是上面的Button
        //通过 $isActiveLeft 监听状态，button就可以更改了
        .sheet(isPresented: $isActiveLeft) {
            VStack {
                Text("hello person !")
            }
        }
    }
    
    var rightBarItem: some View {
        Button(action: {self.isActiveRight.toggle()}) {
            Image(systemName: "power")
            Text("power")
        }
        .sheet(isPresented: $isActiveRight) {
            VStack {
                Text("no power !")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
