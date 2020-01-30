//
//  LandmarkDetail.swift
//  ChinaLandmark
//
//  Created by Jiehao Zhang on 2020/1/29.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    
    let landmark:Landmark
    
    var body: some View {
        
        VStack {
            
            MapView(landmark: landmark)
                .edgesIgnoringSafeArea(.top)//忽略safeArea（注意和frame定义的顺序）
                .frame(height:350)
            
            Image(landmark.imageName)
                .resizable()
                .frame(width: 250,height: 250)
                .clipShape(Circle())//裁剪
                .overlay(Circle().stroke(Color.white,lineWidth: 4))//覆盖一个东西
                .shadow(radius: 10)
                .offset(x: 0, y: -130) //移动
                .padding(.bottom,-130)//offset和padding经常灵活使用
            
            VStack(alignment: .leading,spacing: 8) {
                Text(landmark.name)
                        .font(.title)
                    HStack {
                        Text(landmark.city)
                            .font(.subheadline)
                        Spacer()//中间留空
                        Text(landmark.province)
                            .font(.subheadline)
                    }
                }
            .padding()
            
            Spacer()
            
        }
        .navigationBarTitle(Text(landmark.city),displayMode: .inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LandmarkDetail(landmark: landmarks[7])
        }
    }
}
