//
//  SharpButton.swift
//  poc_research_section
//
//  Created by nattapon on 23/6/2564 BE.
//

import Foundation
import UIKit

public class SharpButton: UIButton {
    
    private var shapeLayers: [CALayer] = []
    public private(set) var radiusCornor: CGFloat = 0
    public private(set) var fillShapeColor: UIColor = .white
    public private(set) var sharpSide: SharpSide = .none
    
    public init(_ frame: CGRect = .zero,
                fillShapeColor: UIColor = .white,
                radiusCornor: CGFloat = 0,
                sharpSide: SharpSide = .none) {
        super.init(frame: frame)
        self.radiusCornor = radiusCornor
        self.fillShapeColor = fillShapeColor
        self.sharpSide = sharpSide        
        if frame.size == .zero { return }
        
        let rect = CGRect(x: 0,
                          y: 0,
                          width: frame.width,
                          height: frame.height)
        drawShape(rect,
                  kind: sharpSide)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
       
        drawShape(rect,
                  kind: sharpSide)
    }
    
    public func setFillShapeTextColor(_ color: UIColor) {
        self.setTitleColor(color,
                           for: .normal)
    }
    
    public func setFillShapeColor(_ color: UIColor) {
        self.fillShapeColor = color
        
        removeShapeLayers()
        
        let rect = CGRect(x: 0,
                          y: 0,
                          width: frame.width,
                          height: frame.height)
        drawShape(rect,
                  kind: sharpSide)
    }
    
    public func setSharpSide(_ side: SharpSide) {
        self.sharpSide = side
        
        removeShapeLayers()
        
        let rect = CGRect(x: 0,
                          y: 0,
                          width: frame.width,
                          height: frame.height)
        drawShape(rect,
                  kind: sharpSide)
    }
    
}

private extension SharpButton {
    
    func removeShapeLayers() {
        shapeLayers
            .forEach({ $0.removeFromSuperlayer() })
        shapeLayers = []
    }
    
    func drawShape(_ rect: CGRect,
                   kind: SharpSide) {
        switch kind {
        case .rightBottom:
            shapeLayers += invertRightShapeLayers(rect: rect)
            shapeLayers
                .forEach { self.layer.insertSublayer($0,at: 0)}
                        
        case .bothBottom:
            shapeLayers += invertLeftRightShapeLayers(rect: rect)
            shapeLayers
                .forEach { self.layer.insertSublayer($0,at: 0)}
            
        case .leftBottom:
            shapeLayers += invertLeftShapeLayers(rect: rect)
            shapeLayers
                .forEach { self.layer.insertSublayer($0,at: 0)}
            
        case .none:
            shapeLayers += roundShapeLayers(rect: rect)
            shapeLayers
                .forEach { self.layer.insertSublayer($0,at: 0)}
        }
    }
    
    // none activte button
    func roundShapeLayers(rect: CGRect) -> [CAShapeLayer] {
        
        var layers: [CAShapeLayer] = []
        //====== path 1 - Circle top left
        
        let path1 = UIBezierPath(arcCenter: .init(x: radiusCornor,
                                                  y: radiusCornor),
                                 radius: radiusCornor,
                                 startAngle: radiansOf_0_degrees,
                                 endAngle: radiansOf_90_degrees,
                                 clockwise: false)
        path1.close()

        let shapeLayer1: CAShapeLayer = CAShapeLayer()
        shapeLayer1.path = path1.cgPath
        shapeLayer1.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer1)

        //====== path 2 - Circle top right
        
        let path2 = UIBezierPath(arcCenter: .init(x: rect.width - radiusCornor,
                                                  y: radiusCornor),
                                 radius: radiusCornor,
                                 startAngle: radiansOf_180_degrees,
                                 endAngle: radiansOf_90_degrees,
                                 clockwise: true)
        path2.close()

        let shapeLayer2: CAShapeLayer = CAShapeLayer()
        shapeLayer2.path = path2.cgPath
        shapeLayer2.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer2)
        
        //====== path 3 - Circle bottom right
        
        let path3 = UIBezierPath(arcCenter: .init(x: rect.width - radiusCornor,
                                                  y: rect.height - radiusCornor),
                                 radius: radiusCornor,
                                 startAngle: radiansOf_270_degrees,
                                 endAngle: radiansOf_180_degrees,
                                 clockwise: true)
        path3.close()

        let shapeLayer3: CAShapeLayer = CAShapeLayer()
        shapeLayer3.path = path3.cgPath
        shapeLayer3.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer3)
        
        //====== path 4 - Circle bottom right
                
        let path4 = UIBezierPath(arcCenter: .init(x: radiusCornor,
                                                  y: rect.height - radiusCornor),
                                 radius: radiusCornor,
                                 startAngle: radiansOf_0_degrees,
                                 endAngle: radiansOf_270_degrees,
                                 clockwise: true)
        path4.close()

        let shapeLayer4: CAShapeLayer = CAShapeLayer()
        shapeLayer4.path = path4.cgPath
        shapeLayer4.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer4)
        
        // == Path 5 - All rectangle shape
            // // // // // //
        //                     //
        //                     //
        //                     //
        //                     //
            // // // // // //
        
        let path5 = UIBezierPath()
        
        path5.move(to: .init(x: 0,
                             y: radiusCornor))
        path5.addLine(to: .init(x: radiusCornor,
                                y: 0))
        
        path5.addLine(to: .init(x: rect.width - radiusCornor,
                                y: 0))
        path5.addLine(to: .init(x: rect.width,
                                y: radiusCornor))
        
        // ===== draw right bottom curve
        path5.addLine(to: .init(x: rect.width,
                                y: rect.height - radiusCornor))
        path5.addLine(to: .init(x: rect.width - radiusCornor,
                                y: rect.height))
        
        // =======
        path5.addLine(to: .init(x: radiusCornor,
                                y: rect.height))
        path5.addLine(to: .init(x: 0,
                                y: rect.height - radiusCornor))
        path5.close()
        
        let shapeLayer5: CAShapeLayer = CAShapeLayer()
        shapeLayer5.path = path5.cgPath
        shapeLayer5.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer5)
        
        return layers
    }
    
    // left active button
    func invertRightShapeLayers(rect: CGRect) -> [CAShapeLayer] {
        
        var layers: [CAShapeLayer] = []
        
        //====== path 1 - Circle top left
        
        let path1 = UIBezierPath(arcCenter: .init(x: radiusCornor,
                                                  y: radiusCornor),
                                 radius: radiusCornor,
                                 startAngle: radiansOf_0_degrees,
                                 endAngle: radiansOf_90_degrees,
                                 clockwise: false)
        path1.close()

        let shapeLayer1: CAShapeLayer = CAShapeLayer()
        shapeLayer1.path = path1.cgPath
        shapeLayer1.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer1)

        //====== path 2 - Circle top right
        
        let path2 = UIBezierPath(arcCenter: .init(x: rect.width - radiusCornor,
                                                  y: radiusCornor),
                                 radius: radiusCornor,
                                 startAngle: radiansOf_180_degrees,
                                 endAngle: radiansOf_90_degrees,
                                 clockwise: true)
        path2.close()

        let shapeLayer2: CAShapeLayer = CAShapeLayer()
        shapeLayer2.path = path2.cgPath
        shapeLayer2.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer2)
        
        //====== path 3 - Circle bottom right
        
        let path3 = UIBezierPath(arcCenter: .init(x: rect.width - radiusCornor,
                                                  y: rect.height - radiusCornor),
                                 radius: radiusCornor,
                                 startAngle: radiansOf_270_degrees,
                                 endAngle: radiansOf_180_degrees,
                                 clockwise: true)
        path3.close()

        let shapeLayer3: CAShapeLayer = CAShapeLayer()
        shapeLayer3.path = path3.cgPath
        shapeLayer3.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer3)
        
        //====== path 4 - Circle bottom right
                
        let path4 = UIBezierPath(arcCenter: .init(x: radiusCornor,
                                                  y: rect.height - radiusCornor),
                                 radius: radiusCornor,
                                 startAngle: radiansOf_0_degrees,
                                 endAngle: radiansOf_270_degrees,
                                 clockwise: true)
        path4.close()

        let shapeLayer4: CAShapeLayer = CAShapeLayer()
        shapeLayer4.path = path4.cgPath
        shapeLayer4.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer4)
        
        
        // == Path 5 - All rectangle shape
            // // // // // //
        //                     //
        //                     //
        //                     //
        //                     //
            // // // // // //
        
        let path5 = UIBezierPath()
        
        path5.move(to: .init(x: 0,
                             y: radiusCornor))
        path5.addLine(to: .init(x: radiusCornor,
                                y: 0))
        
        path5.addLine(to: .init(x: rect.width - radiusCornor,
                                y: 0))
        path5.addLine(to: .init(x: rect.width,
                                y: radiusCornor))
        
        // ===== draw right bottom curve
        path5.addLine(to: .init(x: rect.width,
                                y: rect.height - radiusCornor))
        path5.addArc(withCenter: CGPoint(x: rect.width + radiusCornor,
                                         y: rect.height - radiusCornor),
                     radius: radiusCornor,
                     startAngle: radiansOf_180_degrees,
                     endAngle: radiansOf_90_degrees,
                     clockwise: false)
        path5.addLine(to: .init(x: rect.width + radiusCornor,
                                y: rect.height))
        
        // =======
        path5.addLine(to: .init(x: radiusCornor,
                                y: rect.height))
        path5.addLine(to: .init(x: 0,
                                y: rect.height - radiusCornor))
        path5.close()
        
        let shapeLayer5: CAShapeLayer = CAShapeLayer()
        shapeLayer5.path = path5.cgPath
        shapeLayer5.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer5)
        
        return layers
        
    }
    
    // right active button
    func invertLeftShapeLayers(rect: CGRect) -> [CAShapeLayer] {
        
        var layers: [CAShapeLayer] = []
        
        //====== path 1 - Circle top left
        
        let path1 = UIBezierPath(arcCenter: .init(x: radiusCornor,
                                                  y: radiusCornor),
                                 radius: radiusCornor,
                                 startAngle: radiansOf_0_degrees,
                                 endAngle: radiansOf_90_degrees,
                                 clockwise: false)
        path1.close()

        let shapeLayer1: CAShapeLayer = CAShapeLayer()
        shapeLayer1.path = path1.cgPath
        shapeLayer1.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer1)

        //====== path 2 - Circle top right
        
        let path2 = UIBezierPath(arcCenter: .init(x: rect.width - radiusCornor,
                                                  y: radiusCornor),
                                 radius: radiusCornor,
                                 startAngle: radiansOf_180_degrees,
                                 endAngle: radiansOf_90_degrees,
                                 clockwise: true)
        path2.close()

        let shapeLayer2: CAShapeLayer = CAShapeLayer()
        shapeLayer2.path = path2.cgPath
        shapeLayer2.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer2)
        
        //====== path 3 - Circle bottom right
        
        let path3 = UIBezierPath(arcCenter: .init(x: rect.width - radiusCornor,
                                                  y: rect.height - radiusCornor),
                                 radius: radiusCornor,
                                 startAngle: radiansOf_270_degrees,
                                 endAngle: radiansOf_180_degrees,
                                 clockwise: true)
        path3.close()

        let shapeLayer3: CAShapeLayer = CAShapeLayer()
        shapeLayer3.path = path3.cgPath
        shapeLayer3.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer3)
        
        //====== path 4 - Circle bottom right
                
        let path4 = UIBezierPath(arcCenter: .init(x: radiusCornor,
                                                  y: rect.height - radiusCornor),
                                 radius: radiusCornor,
                                 startAngle: radiansOf_0_degrees,
                                 endAngle: radiansOf_270_degrees,
                                 clockwise: true)
        path4.close()

        let shapeLayer4: CAShapeLayer = CAShapeLayer()
        shapeLayer4.path = path4.cgPath
        shapeLayer4.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer4)
        
        // == Path 5 - All rectangle shape
            // // // // // //
        //                     //
        //                     //
        //                     //
        //                     //
            // // // // // //
        
        let path5 = UIBezierPath()
        
        path5.move(to: .init(x: 0,
                             y: radiusCornor))
        path5.addLine(to: .init(x: radiusCornor,
                                y: 0))
        
        path5.addLine(to: .init(x: rect.width - radiusCornor,
                                y: 0))
        path5.addLine(to: .init(x: rect.width,
                                y: radiusCornor))
        
        // =======
        path5.addLine(to: .init(x: rect.width,
                                y: rect.height - radiusCornor))
        path5.addLine(to: .init(x: rect.width - radiusCornor,
                                y: rect.height))
                           
        // ===== draw left bottom curve
        path5.addLine(to: .init(x: 0 - radiusCornor,
                                y: rect.height))
        path5.addArc(withCenter: CGPoint(x: 0 - radiusCornor,
                                         y: rect.height - radiusCornor),
                     radius: radiusCornor,
                     startAngle: radiansOf_90_degrees,
                     endAngle: radiansOf_0_degrees,
                     clockwise: false)
        
        path5.addLine(to: .init(x: 0,
                                y: radiusCornor))
        
        path5.close()
        
        let shapeLayer5: CAShapeLayer = CAShapeLayer()
        shapeLayer5.path = path5.cgPath
        shapeLayer5.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer5)
        
        return layers
    }
        
    // bothBottom active button
    func invertLeftRightShapeLayers(rect: CGRect) -> [CAShapeLayer] {
        
        var layers: [CAShapeLayer] = []
        
        //====== path 1 - Circle top left
        
        let path1 = UIBezierPath(arcCenter: .init(x: radiusCornor,
                                                  y: radiusCornor),
                                 radius: radiusCornor,
                                 startAngle: radiansOf_0_degrees,
                                 endAngle: radiansOf_90_degrees,
                                 clockwise: false)
        path1.close()

        let shapeLayer1: CAShapeLayer = CAShapeLayer()
        shapeLayer1.path = path1.cgPath
        shapeLayer1.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer1)

        //====== path 2 - Circle top right
        
        let path2 = UIBezierPath(arcCenter: .init(x: rect.width - radiusCornor,
                                                  y: radiusCornor),
                                 radius: radiusCornor,
                                 startAngle: radiansOf_180_degrees,
                                 endAngle: radiansOf_90_degrees,
                                 clockwise: true)
        path2.close()

        let shapeLayer2: CAShapeLayer = CAShapeLayer()
        shapeLayer2.path = path2.cgPath
        shapeLayer2.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer2)
        
        //====== path 3 - Circle bottom right
        
        let path3 = UIBezierPath(arcCenter: .init(x: rect.width - radiusCornor,
                                                  y: rect.height - radiusCornor),
                                 radius: radiusCornor,
                                 startAngle: radiansOf_270_degrees,
                                 endAngle: radiansOf_180_degrees,
                                 clockwise: true)
        path3.close()

        let shapeLayer3: CAShapeLayer = CAShapeLayer()
        shapeLayer3.path = path3.cgPath
        shapeLayer3.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer3)
        
        //====== path 4 - Circle bottom right
                
        let path4 = UIBezierPath(arcCenter: .init(x: radiusCornor,
                                                  y: rect.height - radiusCornor),
                                 radius: radiusCornor,
                                 startAngle: radiansOf_0_degrees,
                                 endAngle: radiansOf_270_degrees,
                                 clockwise: true)
        path4.close()

        let shapeLayer4: CAShapeLayer = CAShapeLayer()
        shapeLayer4.path = path4.cgPath
        shapeLayer4.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer4)
        
        
        // == Path 5 - All rectangle shape
            // // // // // //
        //                     //
        //                     //
        //                     //
        //                     //
            // // // // // //
        
        let path5 = UIBezierPath()
        
        path5.move(to: .init(x: 0,
                             y: radiusCornor))
        path5.addLine(to: .init(x: radiusCornor,
                                y: 0))
        
        path5.addLine(to: .init(x: rect.width - radiusCornor,
                                y: 0))
        path5.addLine(to: .init(x: rect.width,
                                y: radiusCornor))
        
        // ===== draw right bottom curve
        path5.addLine(to: .init(x: rect.width,
                                y: rect.height - radiusCornor))
        path5.addArc(withCenter: CGPoint(x: rect.width + radiusCornor,
                                         y: rect.height - radiusCornor),
                     radius: radiusCornor,
                     startAngle: radiansOf_180_degrees,
                     endAngle: radiansOf_90_degrees,
                     clockwise: false)
        path5.addLine(to: .init(x: rect.width + radiusCornor,
                                y: rect.height))
        
        // ===== draw left bottom curve
        path5.addLine(to: .init(x: 0 - radiusCornor,
                                y: rect.height))
        path5.addArc(withCenter: CGPoint(x: 0 - radiusCornor,
                                         y: rect.height - radiusCornor),
                     radius: radiusCornor,
                     startAngle: radiansOf_90_degrees,
                     endAngle: radiansOf_0_degrees,
                     clockwise: false)
        
        path5.addLine(to: .init(x: 0,
                                y: radiusCornor))
        path5.close()
        
        let shapeLayer5: CAShapeLayer = CAShapeLayer()
        shapeLayer5.path = path5.cgPath
        shapeLayer5.fillColor = fillShapeColor.cgColor
        layers.append(shapeLayer5)
        
        return layers
    }
}

extension SharpButton {
    
    public enum SharpSide {
        case leftBottom
        case rightBottom
        case bothBottom
        case none
    }
    
    // == degrees to radians convertor ==
    private var radiansOf_0_degrees: CGFloat { degreesToRadians(0) }
    private var radiansOf_90_degrees: CGFloat { degreesToRadians(90) }
    private var radiansOf_180_degrees: CGFloat { degreesToRadians(180) }
    private var radiansOf_270_degrees: CGFloat { degreesToRadians(270) }
    
    private func degreesToRadians(_ degrees: CGFloat) -> CGFloat { degrees * .pi / 180 }
    
}
