//
//  CategoryCell.swift
//  ChinaLandmark
//
//  Created by Jiehao Zhang on 2020/1/31.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI

struct CategoryCell: View {
    
    var categoryName: String
    var landmarks:[Landmark]
    var body: some View {
        VStack(alignment:.leading) {
            Text(categoryName)
                .font(.headline)
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 15){
                    ForEach(landmarks) {
                        landmark in
                        
                        CategoryItem(landmark: landmark)
                    }
                }
            }
        }
        .padding(.top,8)
        .padding(.bottom,8)
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(
            categoryName:landmarks[0].category,
            landmarks: Array(landmarks.prefix(4))
        )
    }
}

struct CategoryItem: View {
    let landmark: Landmark
    
    var body: some View {
        NavigationLink(
        destination: LandmarkDetail(landmark: landmark).environmentObject(UserData())
        ) {
            VStack(alignment:.leading) {
                Image(landmark.imageName)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 155,height: 155)
                    .cornerRadius(5)
                Text(landmark.name)
                    .font(.caption)
                    .foregroundColor(.primary)
            }
        }
    }
}
