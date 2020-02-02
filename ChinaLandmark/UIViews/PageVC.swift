//
//  PageVC.swift
//  ChinaLandmark
//
//  Created by Jiehao Zhang on 2020/2/2.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

//4:
import SwiftUI

struct PageVC: UIViewControllerRepresentable{
    
    //SwiftUI转换为UIViewController
//    var page = UIHostingController(rootView: Image(landmarks[0].imageName))
    
    //将所有的图片先转换为SwiftUIView再转换为UIView
//    var pages = featuredLandmarks.map {
//        UIHostingController(rootView:
//            Image($0.imageName)
//            .resizable()
//            .scaledToFill()
//        )
//    }
    
    var pages:[UIViewController]
    
    init() {
        pages = featuredLandmarks.map {
            UIHostingController(rootView:
                Image($0.imageName)
                .resizable()
                .scaledToFill()
            )
        }
    }
    
    //提供中间协调源
    func makeCoordinator() -> Coordinator {
        return Coordinator(pages: pages)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
       let pageVC = UIPageViewController(
            transitionStyle: .scroll,//展示效果
            navigationOrientation: .horizontal//水平效果
        )
        
        //添加dataSource
        //不能直接给定一个class,可以直接用swiftUI提供的方法
//        pageVC.dataSource = xxx(pages: pages)
        pageVC.dataSource = context.coordinator//表示可以直接从上下文中获取中间协调源
        
        return pageVC
    }
    
    func updateUIViewController(_ pageVC: UIPageViewController , context: Context) {
        pageVC.setViewControllers(
            [pages[0]],//展示的第一个页面
            direction: .forward,//左划到下一个页面
            animated: true
        )
    }
    
    //delegate只能在class里面遵循，就设置一个class并且完成class里面两个必选的方法
    //然后赋给pageVC.dataSource
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        
        //将class外的pages传进来
        let pages: [UIViewController]
        
        init(pages: [UIViewController]) {
            self.pages = pages
        }
        //往左滑返回的图片
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            let currentIndex = pages.firstIndex(of: viewController)!
            return currentIndex == 0 ? pages.last : pages[currentIndex - 1]
        }
        //往右滑返回的图片
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            let currentIndex = pages.firstIndex(of: viewController)!
            return currentIndex == pages.count - 1 ? pages.first : pages[currentIndex + 1]
        }
        
        
    }
}

struct PageVC_Previews: PreviewProvider {
    static var previews: some View {
        PageVC()
    }
}
