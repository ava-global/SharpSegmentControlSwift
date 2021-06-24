//
//  SharpSegmentControl.swift
//  poc_research_section
//
//  Created by nattapon on 23/6/2564 BE.
//

import Foundation
import UIKit

public class SharpSegmentControl: UIView {
    
    public private(set) var horizontalStackView: UIStackView!
    public private(set) var selectedIndex: Int = 0
    public private(set) var activeColor: UIColor = UIColor.black
    public private(set) var inactiveColor: UIColor = UIColor.white
            
    public var segmentButtons: [SharpButton] {
        horizontalStackView
            .subviews
            .compactMap { ($0 as? SharpButton) }
    }
    
    public var segmentButtonCount: Int {
        segmentButtons.count
    }
    
    public var onTappedSegmentControl: ((_ segmentIndex: Int) -> ()) = { _ in }
    
    public init(frame: CGRect,
                 btnTitles: [String],
                 activeColor: UIColor,
                 inactiveColor: UIColor,
                 radiusCornor: CGFloat) {
                super.init(frame: frame)
                
                guard
                    btnTitles.count > 0 &&
                        btnTitles.count <= 5
                else { fatalError("required 1-5 button titles") }
                
                // setup stack view
                horizontalStackView = .init(frame: CGRect(x: 0,
                                                          y: 0,
                                                          width: frame.width,
                                                          height: frame.height))
                horizontalStackView.axis = .horizontal
                horizontalStackView.distribution = .fillEqually
                horizontalStackView.backgroundColor = .red
                self.addSubview(horizontalStackView)
                
                // setup horizontalStackView layout
                horizontalStackViewLeadingConstraint.isActive = true
                horizontalStackViewTrailingConstraint.isActive = true
                horizontalStackViewTopConstraint.isActive = true
                horizontalStackViewBottomConstraint.isActive = true
                
                // setup button
                self.activeColor = activeColor
                self.inactiveColor = inactiveColor
                self.selectedIndex = 0
                        
                if btnTitles.count == 1 {
                    let btn = SharpButton(fillShapeColor: activeColor,
                                              radiusCornor: radiusCornor,
                                              sharpSide: .none)
                    btn.setTitle(btnTitles[0],
                                 for: .normal)
                    horizontalStackView.addArrangedSubview(btn)
                }
                else if btnTitles.count > 1 {
                    btnTitles
                        .enumerated()
                        .forEach { reference in
                            let fillShapeColor = (reference.offset == self.selectedIndex) ? activeColor : inactiveColor
                            // create button 0
                            if reference.offset == 0 {
                                let btn = SharpButton(fillShapeColor: fillShapeColor,
                                                          radiusCornor: radiusCornor,
                                                          sharpSide: .rightBottom)
                                btn.setTitle(reference.element,
                                             for: .normal)
                                btn.addTarget(self,
                                              action: #selector(onSegmentTapped),
                                              for: .touchUpInside)
                                
                                horizontalStackView.addArrangedSubview(btn)
                            }
                            // create button 1-5
                            else {
                                let btn = SharpButton(fillShapeColor: fillShapeColor,
                                                          radiusCornor: radiusCornor,
                                                          sharpSide: .none)
                                btn.setTitle(reference.element,
                                             for: .normal)
                                btn.addTarget(self,
                                              action: #selector(onSegmentTapped),
                                              for: .touchUpInside)
                                
                                horizontalStackView.addArrangedSubview(btn)
                            }
                    }
                    
                }
                
            }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func selectSegmentIndex(_ index: Int) {
        guard
            (index >= 0) &&
                (index < segmentButtonCount) &&
                (index != selectedIndex)
        else { return }
        
        self.selectedIndex = index
        
        let buttonSharpSides = buttonSharpSides(selectedIndex: index,
                                                count: segmentButtonCount)
        
        print("buttonSharpSides")
        print(buttonSharpSides)
        
        let buttonSharpColors = buttonShapeColors(selectedIndex: index,
                                                  count: segmentButtonCount,
                                                  activeColor: activeColor,
                                                  inactiveColor: inactiveColor)
        print("buttonSharpColors")
        print(buttonSharpColors)
        
        // update shape and color
        segmentButtons
            .enumerated()
            .forEach { referene in
                // update shape
                referene
                    .element
                    .setSharpSide(buttonSharpSides[referene.offset])
                
                // update shape color
                referene
                    .element
                    .setFillShapeColor(buttonSharpColors[referene.offset])
        }
        
    }      
    
}

private extension SharpSegmentControl {
    
    @objc private func onSegmentTapped(sender: SharpButton) {
        guard
            let segmentIndex = (segmentButtons.firstIndex{ $0 == sender })
        else { return }
        
        print("button index \(segmentIndex) tapped !")
        
        selectSegmentIndex(segmentIndex)
        onTappedSegmentControl(segmentIndex)
    }
    
    // get all shape with selected state
    func buttonSharpSides(selectedIndex: Int,
                          count: Int) -> [SharpButton.SharpSide] {
        guard
            count > 0
        else { return [] }
                        
        if count == 1 {
            return [.none]
        }
                    
        let sharpSides: [SharpButton.SharpSide] = (0..<count)
            .enumerated()
            .map { reference in
                // first button
                if selectedIndex == reference.offset &&
                    reference.offset == 0 {
                    return .rightBottom
                }
                // last button
                else if selectedIndex == reference.offset &&
                            reference.offset == (count-1) {
                    return .leftBottom
                }
                // fall among button
                else if selectedIndex == reference.offset &&
                            reference.offset > 0 &&
                            reference.offset < (count-1) {
                    return .bothBottom
                }
                
                return .none
            }
        
        return sharpSides
    }
    
    func buttonShapeColors(selectedIndex: Int,
                           count: Int,
                           activeColor: UIColor,
                           inactiveColor: UIColor) -> [UIColor] {
        (0..<count)
            .enumerated()
            .map { reference in
                (selectedIndex == reference.offset) ? activeColor : inactiveColor
            }
    }
}

// layout
extension SharpSegmentControl {
        
    var horizontalStackViewLeadingConstraint: NSLayoutConstraint {
        .init(item: horizontalStackView!,
              attribute: .leading,
              relatedBy: .equal,
              toItem: horizontalStackView,
              attribute: .leading,
              multiplier: 1.0,
              constant: 0)
    }
 
    var horizontalStackViewTrailingConstraint: NSLayoutConstraint {
        .init(item: horizontalStackView!,
              attribute: .trailing,
              relatedBy: .equal,
              toItem: horizontalStackView,
              attribute: .trailing,
              multiplier: 1.0,
              constant: 0)
    }
    
    var horizontalStackViewTopConstraint: NSLayoutConstraint {
        .init(item: horizontalStackView!,
              attribute: .top,
              relatedBy: .equal,
              toItem: self,
              attribute: .top,
              multiplier: 1.0,
              constant: 0)
    }
    
    var horizontalStackViewBottomConstraint: NSLayoutConstraint {
        .init(item: horizontalStackView!,
              attribute: .bottom,
              relatedBy: .equal,
              toItem: self,
              attribute: .bottom,
              multiplier: 1.0,
              constant: 0)
    }
}
