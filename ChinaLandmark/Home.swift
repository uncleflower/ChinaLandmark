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
    
    @State var showingProfile = false
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
                //添加一个navigationBarItem填充一个按钮，并且完成sheet
            .navigationBarItems(trailing:
                Button(action:{self.showingProfile.toggle()}) {
                    Image(systemName: "person.crop.circle")
                        .font(.largeTitle)
                        .padding()
                    }
                )
                .sheet(isPresented: $showingProfile) {
                    Profile()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        //调试的时候可以展示dark模式和放大的辅助器
            Group {
                Home()
                Home().environment(\.colorScheme, .dark)
                Home().environment(\.sizeCategory, .accessibilityExtraLarge)
            }
    }
}


