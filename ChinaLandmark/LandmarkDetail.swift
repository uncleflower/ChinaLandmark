//
//  LandmarkDetail.swift
//  ChinaLandmark
//
//  Created by Jiehao Zhang on 2020/1/29.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    var body: some View {
        
        VStack {
            
            MapView()
                .edgesIgnoringSafeArea(.top)//忽略safeArea（注意和frame定义的顺序）
                .frame(height:350)
            
            Image("tiananmen_250x250")
                .clipShape(Circle())//裁剪
                .overlay(Circle().stroke(Color.white,lineWidth: 4))//覆盖一个东西
                .shadow(radius: 10)
                .offset(x: 0, y: -130) //移动
                .padding(.bottom,-130)//offset和padding经常灵活使用
            
            VStack(alignment: .leading,spacing: 8) {
                    Text("天安门")
                        .font(.title)
                    HStack {
                        Text("北京")
                            .font(.subheadline)
                        Spacer()//中间留空
                        Text("北京市")
                            .font(.subheadline)
                    }
                }
            .padding()
            
            Spacer()
            
        }
        .navigationBarTitle(Text("天安门"),displayMode: .inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LandmarkDetail()
        }
    }
}
