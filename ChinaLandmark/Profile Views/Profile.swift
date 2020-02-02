//
//  Profile.swift
//  ChinaLandmark
//
//  Created by Jiehao Zhang on 2020/2/1.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI

struct Profile: View {
    
    //系统提供好了很多Environment的变量，editMode也是其中之一
    @Environment(\.editMode) var mode
    
    @State private var profile = User(username: "jiehaoZhang", prefersNotifications: true, prefersSeason: .summer)
    //利用profileCopy完成取消的功能
    @State private var profileCopy = User(username: "jiehaoZhang", prefersNotifications: true, prefersSeason: .summer)
    
    //将Date类型转化为String类型
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年M月d日"
        return dateFormatter
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                if mode?.wrappedValue == .active {
                    Button(action: {
                        self.profile = self.profileCopy
                        //添加动画,所有因为mode改变的视图都会有动画效果
                        self.mode?.animation().wrappedValue = .inactive
                    }) {
                        Text("完成")
                    }
                }
                Spacer()
                EditButton().padding()
            }
            
                
            if mode?.wrappedValue == .inactive {
                List {
                    Text(profile.username)
                        .font(.largeTitle)
                    Text("允许通知: \(profile.prefersNotifications ? "是" : "否")")
                    //rawValue展示枚举型的数据
                    Text("喜欢的季节: \(profile.prefersSeason.rawValue)")
                    //            Text("生日: \(dateFormatter.string(from: profile.birthday))")
                    Text("生日: \(profile.birthday ,formatter: dateFormatter)")
                    VStack(alignment:.leading) {
                        Text("最近的徒步旅行")
                            .font(.headline)
                        HikeView(hike:hikes[0])
                    }
                }
            }else{
                ProfileEditor(profileCopy: $profileCopy)
                //生命周期函数
                .onDisappear{
                    self.profileCopy = self.profile
                }
            }

        }
    .padding()
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
