//
//  Home.swift
//  ChinaLandmark
//
//  Created by Jiehao Zhang on 2020/1/31.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    
    //将数据分类得到一个dictionary值的数据
    var categories: [String:[Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: {$0.category}
        )
    }
    var body: some View {
        NavigationView {
            List {
                Image(landmarks[0].imageName)
                    .resizable()
                    .scaledToFill()//填充方法
                    .frame(height: 200)
                    .clipped()//裁剪
                
                ForEach(categories.keys.sorted(),id: \.self) {
                    categoryName in
                    
                    CategoryCell(
                        categoryName:categoryName,
                        landmarks: self.categories[categoryName]!
                    )
                }
                
                NavigationLink(destination:LandmarkList().environmentObject(UserData())) {
                    Text("查看所有地标")
                }
            }
            .navigationBarTitle(Text("精选"))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        //        NavigationView{
        Home()
        //        }
    }
}


