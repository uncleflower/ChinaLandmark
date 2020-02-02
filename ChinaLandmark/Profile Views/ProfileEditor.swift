//
//  ProfileEditor.swift
//  ChinaLandmark
//
//  Created by Jiehao Zhang on 2020/2/2.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var profileCopy: User
    var body: some View {
        List{                
            HStack {
                Text("昵称")
                    .bold()
                Divider()
                TextField("昵称",text: $profileCopy.username)
            }
            
            Toggle(isOn: $profileCopy.prefersNotifications) {
                Text("允许通知")
            }

            VStack(alignment: .leading) {
                Text("喜欢的季节")
                    .bold()
//                        多位的选择框框
//                        这里使用allCases的前提是必须遵守CaseIterable协议
                Picker("喜欢的季节", selection: $profileCopy.prefersSeason) {
                    ForEach(User.Season.allCases,id: \.self) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            VStack(alignment:.leading) {
                Text("生日")
                    .bold()
                DatePicker("生日",selection: $profileCopy.birthday,displayedComponents: .date)
            }
            .padding(.top)
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profileCopy: .constant(.default))
    }
}
