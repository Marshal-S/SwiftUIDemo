//
//  AnimationDetail.swift
//  SwiftUIDemo
//
//  Created by Marshal on 2022/1/19.
//

import SwiftUI

//通过扩展自定义转场动画，asymmetric定义，转入和转出动画
//右侧渐变划入，从大变小从显示变成隐藏
extension AnyTransition {
    //想用类名调用得用 static修饰
    static var customTransition: AnyTransition {
        //组合动画改成右侧移入，左侧移出
        let inAnimation = AnyTransition.move(edge: .trailing).combined(with: .opacity)
        let outAnimation = AnyTransition.scale.combined(with: .opacity)
        return .asymmetric(insertion: inAnimation, removal: outAnimation)
    }
}

struct AnimationDetail: View {
    @State var isRoate = false
    @State var isMove = false
    @State var isOpacity = false
    @State var isScale = false
    
    @State var isShowTransition = false
    
    @State var isShowCustom = false
    
    var body: some View {
        Text("Hello, AnimationDetail!")
        VStack {
            VStack {
                Text("给指定View视图自身添加动画")
                    .padding(.top, 10)
                Button {
                    isRoate.toggle()
                } label: {
                    Text("旋转")
                }.padding(.top, 10)
                .rotationEffect(.degrees(isRoate ? 90 : 0))
                .animation(.easeInOut)//慢入慢出过渡
                
                Button("透明") {
                    isOpacity.toggle()
                }.opacity(isOpacity ? 0.1 : 1)
                .animation(.linear) //线性过渡
                .padding(.top, 10)
                
                Button("大小") {
                    isScale.toggle()
                }.scaleEffect(isScale ? 3 : 1)
                .animation(.spring()) //弹性过渡
                .padding(.top, 10)
            }
            
            VStack {
                Text("通过参数来控制其他视图转场动画")
                    .padding(.top, 10)
                Button("切换转场动画") {
                    //可以设置动画时长和过渡曲线来开启动画
                    withAnimation(.easeInOut(duration: 2)) {
                        isShowTransition.toggle() //通过其控制动画
                    }
                }.padding(.top, 10)
                
                if (isShowTransition) {
                    //由于flex布局问题，通过动画切换的会发现整体动画很好玩
                    //虽然别人可以控制动画过渡时间和变换曲线，变化效果取决子自身
                    //例如：缩放、显隐、平移或者混合等
                    //不设置默认效果似乎是溶解，或者opacity过渡
                    HStack {
                        Text("左侧0")
                        Spacer()
                        Text("中间0")
                        Spacer()
                        Text("右侧0")
                    }
                    .padding(.top, 10)
                    
                    
                    //下面是AnyTransition.slide左侧移入，右侧出
                    HStack {
                        Text("左侧1")
                        Spacer()
                        Text("中间1")
                        Spacer()
                        Text("右侧1")
                    }
                    .padding(.top, 10)
                    .transition(.slide)
                    
                    
                    //右侧移入右侧，进出只能有用一个效果
                    HStack {
                        Text("左侧2")
                        Spacer()
                        Text("中间2")
                        Spacer()
                        Text("右侧2")
                    }
                    .padding(.top, 10)
                    .transition(.move(edge: .trailing))
                    
                    
                    //右侧移入右侧出，asymmetric来定义两个，但似乎写出来效果不是很好，也不通用
                    HStack {
                        Text("左侧3")
                        Spacer()
                        Text("中间3")
                        Spacer()
                        Text("右侧3")
                    }
                    .padding(.top, 10)
                    .transition(
                        .asymmetric(insertion: AnyTransition.move(edge: .trailing),
                                    removal: AnyTransition.move(edge: .leading)))
                    
                    
                    //左侧进入右侧出去，通过扩展来解决通用和使用效果问题
                    HStack {
                        Text("左侧4")
                        Spacer()
                        Text("中间4")
                        Spacer()
                        Text("右侧4")
                    }
                    .padding(.top, 10)
                    .transition(.customTransition) //右侧移入右侧出
                }
            }
            
            VStack {
                Text("同时组合控制多个不动动画")
                    .padding(.top, 10)
                Button("切换组合动画") {
                    //可以设置动画时长和过渡曲线来开启动画
                    withAnimation(.easeInOut(duration: 2)) {
                        isShowCustom.toggle() //通过其控制空话
                    }
                }.padding(.top, 10)
                
                if (isShowCustom) {
                    //组合多个动画效果,创建十个view，分别执行不动的动画
                    //侧边慢慢移入
                    HStack {
                        ForEach(1...8, id: \.self) { (num) in
                            Text("\(num)")
                                .animation(.easeOut.delay(Double(num) * 0.5))
                        }
                    }.padding(.top, 10)
                    .transition(.slide)
                    
                    
                    //sping弹性效果移入
                    HStack {
                        ForEach(1...8, id: \.self) { (num) in
                            Text("\(num)")
                                .animation(.spring(dampingFraction: 0.5).delay(Double(num) * 0.5))
                        }
                    }.padding(.top, 10)
                    .transition(.slide)
                }
            }
            
            
            
            
            
            

        }
        
        
    }
    
    
}

struct AnimationDetail_Previews: PreviewProvider {
    static var previews: some View {
        AnimationDetail()
    }
}
