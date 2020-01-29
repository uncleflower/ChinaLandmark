//
//  LandmarkCell.swift
//  ChinaLandmark
//
//  Created by Jiehao Zhang on 2020/1/29.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI

struct LandmarkCell: View {
    
    let landmark: Landmark
    var body: some View {
        HStack {
            Image(landmark.imageName)
                .resizable()
                .frame(width:50,height: 50)//画布大小
                .cornerRadius(8)
            
            Text(landmark.name)
            Spacer()
        }
    }
}

struct LandmarkCell_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LandmarkCell(landmark: landmarks[1])
            LandmarkCell(landmark: landmarks[2])
            LandmarkCell(landmark: landmarks[3])
            LandmarkCell(landmark: landmarks[4])
        }
        .previewLayout(.fixed(width: 300, height: 70))//显示的大小

    }
}
