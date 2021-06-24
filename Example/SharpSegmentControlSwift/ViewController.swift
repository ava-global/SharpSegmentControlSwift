//
//  ViewController.swift
//  SharpSegmentControlSwift
//
//  Created by nattaponGolf123 on 06/24/2021.
//  Copyright (c) 2021 nattaponGolf123. All rights reserved.
//

import UIKit
import SharpSegmentControlSwift

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // 0 button will crashed
//        let rect0 = CGRect(x: 0,
//                          y: 100,
//                          width: UIScreen.main.bounds.width,
//                          height: 36)
//        let segmentControl0 = SharpSegmentControl(frame: rect0,
//                                                 btnTitles: [],
//                                                 activeColor: .green,
//                                                 inactiveColor: .clear,
//                                                 radiusCornor: 10.0)
//        segmentControl0.backgroundColor = .red
//        self.view.addSubview(segmentControl0)
        
        // over 5 button will crashed
//        let rect6 = CGRect(x: 0,
//                          y: 100,
//                          width: UIScreen.main.bounds.width,
//                          height: 36)
//        let segmentControl6 = SharpSegmentControl(frame: rect6,
//                                                 btnTitles: ["btn1",
//                                                             "btn2",
//                                                             "btn3",
//                                                             "btn4",
//                                                             "btn5",
//                                                             "btn6"],
//                                                 activeColor: .green,
//                                                 inactiveColor: .clear,
//                                                 radiusCornor: 10.0)
//        segmentControl6.backgroundColor = .red
//        self.view.addSubview(segmentControl6)
        
        // 1 button
//        let rect = CGRect(x: 0,
//                          y: 100,
//                          width: UIScreen.main.bounds.width,
//                          height: 36)
//        let segmentControl = SharpSegmentControl(frame: rect,
//                                                 btnTitles: ["btn1"],
//                                                 activeColor: .green,
//                                                 inactiveColor: .clear,
//                                                 radiusCornor: 10.0)
//        segmentControl.backgroundColor = .red
//        self.view.addSubview(segmentControl)
//        
//        // 2 button
//        let rect2 = CGRect(x: 0,
//                          y: 140,
//                          width: UIScreen.main.bounds.width,
//                          height: 36)
//        let segmentControl2 = SharpSegmentControl(frame: rect2,
//                                                 btnTitles: ["btn1",
//                                                             "btn2"],
//                                                 activeColor: .green,
//                                                 inactiveColor: .clear,
//                                                 radiusCornor: 10.0)
//        segmentControl2.backgroundColor = .red
//        self.view.addSubview(segmentControl2)
//        
//        // 3 button
//        let rect3 = CGRect(x: 0,
//                          y: 180,
//                          width: UIScreen.main.bounds.width,
//                          height: 36)
//        let segmentControl3 = SharpSegmentControl(frame: rect3,
//                                                 btnTitles: ["btn1",
//                                                             "btn2",
//                                                             "btn3"],
//                                                 activeColor: .green,
//                                                 inactiveColor: .clear,
//                                                 radiusCornor: 10.0)
//        segmentControl3.backgroundColor = .red
//        self.view.addSubview(segmentControl3)
//        
//        // 4 button
//        let rect4 = CGRect(x: 0,
//                          y: 220,
//                          width: UIScreen.main.bounds.width,
//                          height: 36)
//        let segmentControl4 = SharpSegmentControl(frame: rect4,
//                                                 btnTitles: ["btn1",
//                                                             "btn2",
//                                                             "btn3",
//                                                             "btn4"],
//                                                 activeColor: .green,
//                                                 inactiveColor: .clear,
//                                                 radiusCornor: 10.0)
//        segmentControl4.backgroundColor = .red
//        self.view.addSubview(segmentControl4)
//        
//        // 5 button
//        let rect5 = CGRect(x: 0,
//                          y: 260,
//                          width: UIScreen.main.bounds.width,
//                          height: 36)
//        let segmentControl5 = SharpSegmentControl(frame: rect5,
//                                                 btnTitles: ["btn1",
//                                                             "btn2",
//                                                             "btn3",
//                                                             "btn4",
//                                                             "btn5"],
//                                                 activeColor: .green,
//                                                 inactiveColor: .clear,
//                                                 radiusCornor: 10.0)
//        segmentControl5.backgroundColor = .red
//        segmentControl5.onTappedSegmentControl = onTappedSegmentControl
//        self.view.addSubview(segmentControl5)
        
        
    }

    func onTappedSegmentControl(_ segmentIndex: Int) {
        print("onTappedSegmentControl")
        
        let xOffset = CGFloat(segmentIndex) * scrollView.frame.width
        scrollView.setContentOffset(.init(x: xOffset,
                                          y: 0),
                                    animated: true)
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollViewDidScroll at offset \(scrollView.contentOffset)")
                
    }
    
}
