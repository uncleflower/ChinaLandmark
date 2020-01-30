//
//  UserData.swift
//  ChinaLandmark
//
//  Created by Jiehao Zhang on 2020/1/30.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI
import Combine

//单个变量用@State一个数组用ObservableObje
final class UserData: ObservableObject  {
    //当数据变化时发送更新后的数据给视图，视图就会刷新
    @Published var userLandmarks = landmarks
}
