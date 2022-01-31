//
//  DrawPathDetail.swift
//  SwiftUIDemo
//
//  Created by Marshal on 2022/1/19.
//

import SwiftUI

struct DrawPathDetail: View {
    var body: some View {
        ScrollView {
            Text("Hello, DrawPathDetail!")
            VStack {
                triangleView()
                    .frame(width: 200, height: 120)
                Text("三角形")
            }.padding(.top, 10)
            
            VStack {
                circleView()
                    .frame(width: 120, height: 120)
                Text("圆形")
            }.padding(.top, 10)
            
            VStack {
                customView()
                    .frame(width: 120, height: 140)
                Text("自定义图形")
            }.padding(.top, 10)
            
            VStack {
                flexView()
                    .frame(width: 20, height: 20)
                flexView()
                    .frame(width: 40, height: 40)
                flexView()
                    .frame(width: 100, height: 100)
                Text("跟随容器大小缩放的图形")
            }.padding(.top, 10)
            
        }
        .navigationBarTitle("绘制图形")
    }
}

//三角形
struct triangleView: View {
    var body: some View {
        //第一级容器中的两个path，会自动生成两个对象，在父布局展开，实际可以写成两个View
        //每个path的绘制的坐标相当于自己的View容器
        Path { path in
            path.move(to: CGPoint(x: 100, y: 10))
            path.addLine(to: CGPoint(x: 40, y: 110))
            path.addLine(to: CGPoint(x: 160, y: 110))
            path.closeSubpath() //用线段连接起点和终点，形成闭合图形
        }.stroke(LinearGradient(gradient: Gradient(colors: [.red, .green]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1)))
        //stroke绘制线段
        
        Path { path in
            path.move(to: CGPoint(x: 100, y: 10))
            path.addLine(to: CGPoint(x: 40, y: 110))
            path.addLine(to: CGPoint(x: 160, y: 110))
            path.closeSubpath()
        }.fill(LinearGradient(gradient: Gradient(colors: [.red, .green]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1)))
        //fill填充绘制封闭图形，还可以设置颜色
    }
}

//圆形
struct circleView: View {
    var body: some View {
        Path { path in
            path.addRoundedRect(in: CGRect(x: 0, y: 0, width: 120, height: 120), cornerSize: CGSize(width: 60, height: 60))
        }
        .stroke(Color.blue) //线条绘制可以设置线条颜色
        
        Path { path in
            path.addRoundedRect(in: CGRect(x: 0, y: 0, width: 120, height: 120), cornerSize: CGSize(width: 60, height: 60))
        }.fill(Color.blue)
    }
}

//自定义图形
struct customView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 20, y: 40))
            path.addLine(to: CGPoint(x: 20, y: 100))
            //贝塞尔曲线，一个控制点
            path.addQuadCurve(to: CGPoint(x: 100, y: 100), control: CGPoint(x: 60, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 40))
            //连个控制点的贝塞尔曲线
            path.addCurve(to: CGPoint(x: 20, y: 40), control1: CGPoint(x: 60, y: 0), control2: CGPoint(x: 60, y: 80))
        }.stroke(Color.red, lineWidth: 3)
    }
}

//根据当前视图容器大小做一个灵活的View
struct flexView: View {
    var body: some View {
        //通过geometry Reader可以获取当前视图容器的信息
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                
                path.move(to: CGPoint(x: width/2, y: 0))
                path.addLine(to: CGPoint(x: 0, y: height/2))
                path.addLine(to: CGPoint(x: width/2, y: height))
                path.addLine(to: CGPoint(x: width, y: height/2))
                path.closeSubpath()
            }.stroke(Color.yellow)
        }
    }
}

struct DrawPathDetail_Previews: PreviewProvider {
    static var previews: some View {
        DrawPathDetail()
    }
}
