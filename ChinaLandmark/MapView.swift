//
//  MapView.swift
//  ChinaLandmark
//
//  Created by Jiehao Zhang on 2020/1/29.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import SwiftUI
import MapKit
//把UIView转化为SwiftUIView

struct MapView: UIViewRepresentable {
    
    let center = CLLocationCoordinate2D(
        latitude: 39.9087243,
        longitude: 116.3952859
    )
    
    let span = MKCoordinateSpan(
        latitudeDelta:0.02,
        longitudeDelta: 0.02
    )
    func makeUIView(context: Context) -> MKMapView { MKMapView() }
    //给定一个View，根据updateUIView更新View

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(
            MKCoordinateRegion(center: center,
            span: span
        ),
            animated: true
        )
    }
    //记录更新的视图
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
