//
//  LandmarkList.swift
//  ChinaLandmark
//
//  Created by Jiehao Zhang on 2020/1/29.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI

extension String {
    
}

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                NavigationLink(destination:Text("hello")) {
                    LandmarkCell(landmark: landmark)
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
        LandmarkList()
    }
}
