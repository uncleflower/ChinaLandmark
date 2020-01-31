//
//  LandmarkList.swift
//  ChinaLandmark
//
//  Created by Jiehao Zhang on 2020/1/29.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI


struct LandmarkList: View {
    
    @State private var showFavoritesOnly = false
    //环境对象
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            List{
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("只展示收藏")
                }
                
                //在list中加其他元素可以用ForEach将数据打包
                ForEach(userData.userLandmarks) { landmark in
                    
//                    if self.showFavoritesOnly {
//                        if landmark.isFavorite {
//                            //在跳转界面的同时生成环境变量
//                            NavigationLink(destination:LandmarkDetail(landmark: landmark).environmentObject(self.userData)) {
//                                LandmarkCell(landmark: landmark)
//                            }
//                        }
//                    }else{
//                        NavigationLink(destination:LandmarkDetail(landmark: landmark).environmentObject(self.userData)) {
//                            LandmarkCell(landmark: landmark)
//                        }
//                    }
                    
                    //推荐以下判断的方式：
            if !self.showFavoritesOnly || landmark.isFavorite{
                                   NavigationLink(
                                       destination: LandmarkDetail(landmark: landmark).environmentObject(self.userData)
                                   ){
                                       LandmarkCell(landmark: landmark)
                                   }
                               }
                    
                    
                }
            }
            .navigationBarTitle(Text("中国地标"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        ForEach(["iPhone 8","iPhone XS"]) { deviceName in
//            LandmarkList()
//            .previewDevice(PreviewDevice(rawValue: deviceName))
//            .previewDisplayName(deviceName)
//        }
        LandmarkList().environmentObject(UserData())
    }
}
