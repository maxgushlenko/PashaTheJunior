//
//  DrawView.swift
//  Belaz
//
//  Created by Pavel Tsiareschcanka on 5/23/19.
//  Copyright © 2019 Pavel Tsiareschcanka. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    //BODY
    
    var secondDownPoint: CGPoint {
        return CGPoint(x: bounds.midX + (bounds.midX/7), y: bounds.midY + (bounds.midY/5))
    }
    var backPoint: CGPoint {
        return CGPoint(x: bounds.midX - ((6 * bounds.midX)/7), y: bounds.midY - (bounds.midY/4))
    }
    var secondBakPoint: CGPoint {
        return CGPoint(x: bounds.midX - ((5 * bounds.midX)/7), y: bounds.midY - (bounds.midY/2))
    }
    var upperPoint: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY - (bounds.midY/2))
    }
    var secondUpperPoint: CGPoint {
        return CGPoint(x: bounds.midX + (bounds.midX/7), y: bounds.midY - (3 * (bounds.midY/4)))
    }
    var forwardPoint: CGPoint {
        return CGPoint(x: bounds.midX + ((6 * bounds.midX)/7), y: bounds.midY - (3 * (bounds.midY/4)))
    }
    var secondForwardPoint: CGPoint {
        return CGPoint(x: bounds.midX + ((6 * bounds.midX)/7), y: bounds.midY - (bounds.midY/2))
    }
    var downPoint: CGPoint {
        return CGPoint(x: bounds.midX + ((2 * bounds.midX)/7), y: bounds.midY - (bounds.midY/2))
    }
    
    //WHEELS
    
    var height: CGFloat {
        return min(bounds.size.width, bounds.size.height)
    }
    
    var centerBackWheel: CGPoint {
        return CGPoint(x: bounds.midX - ((4 * bounds.midX)/7), y: bounds.midY + (2 * (bounds.midY/4)))
    }
    
    var centerForwardWheel: CGPoint {
        return CGPoint(x: bounds.midX + ((3 * bounds.midX)/7), y: bounds.midY + (2 * (bounds.midY/4)))
    }
    
    //CABIN
    
    var firstCabinPoint: CGPoint {
        return CGPoint(x: bounds.midX + ((4.2 * bounds.midX)/7), y: bounds.midY)
    }
    var secondCabinPoint: CGPoint {
        return CGPoint(x: bounds.midX + ((3.5 * bounds.midX)/7), y: bounds.midY - (1.5 * (bounds.midY/4)))
    }
    var thirdCabinPoint: CGPoint {
        return CGPoint(x: bounds.midX + ((2 * bounds.midX)/7), y: bounds.midY - (1.5 * (bounds.midY/4)))
    }
    var fourCabinPoint: CGPoint {
        return CGPoint(x: bounds.midX + ((2 * bounds.midX)/7), y: bounds.midY)
    }
    
    //BUMPER
    
    var firstBumperPoint: CGPoint {
        return CGPoint(x: bounds.midX + ((4.2 * bounds.midX)/7), y: bounds.midY)
    }
    var secondBumperPoint: CGPoint {
        return CGPoint(x: bounds.midX + ((6 * bounds.midX)/7), y: bounds.midY)
    }
    var thirdBumperPoint: CGPoint {
        return CGPoint(x: bounds.midX + ((6 * bounds.midX)/7), y: bounds.midY + (3 * (bounds.midY/4)))
    }
    var fourBumperPoint: CGPoint {
        return CGPoint(x: bounds.midX + ((5 * bounds.midX)/7), y: bounds.midY + (3 * (bounds.midY/4)))
    }
    var fiveBumperPoint: CGPoint {
        return CGPoint(x: bounds.midX + ((5 * bounds.midX)/7), y: bounds.midY + (1 * (bounds.midY/4)))
    }
    
    //GAS TANK
    
    var firstTankPoint: CGPoint {
        return CGPoint(x: bounds.midX + (bounds.midX/7), y: bounds.midY + (1 * (bounds.midY/4)))
    }
    var secondTankPoint: CGPoint {
        return CGPoint(x: bounds.midX + (bounds.midX/7), y: bounds.midY + (3 * (bounds.midY/4)))
    }
    var thirdTankPoint: CGPoint {
        return CGPoint(x: bounds.midX - ((1.9 * bounds.midX)/7), y: bounds.midY + (3 * (bounds.midY/4)))
    }
    var fourTankPoint: CGPoint {
        return CGPoint(x: bounds.midX - ((1.9 * bounds.midX)/7), y: bounds.midY + (1 * (bounds.midY/4)))
    }
    
    // MARK: -
    //PATH FOR BODY
    
    func pathForBody() -> UIBezierPath {
        let line = UIBezierPath()
        line.lineWidth = 2
        line.move(to: secondDownPoint)
        line.addLine(to: backPoint)
        line.addLine(to: secondBakPoint)
        line.addLine(to: upperPoint)
        line.addLine(to: secondUpperPoint)
        line.addLine(to: forwardPoint)
        line.addLine(to: secondForwardPoint)
        line.addLine(to: downPoint)
        line.addLine(to: secondDownPoint)
        
        return line
    }
    
    //PATH FOR BACK WHEEL
    
    func pathForBackWheel() -> UIBezierPath {
        let line = UIBezierPath()
        line.lineWidth = 2
        line.addArc(withCenter: centerBackWheel, radius: height / 4.1, startAngle: 0, endAngle:  2 * CGFloat.pi, clockwise: true)
        return line
    }
    
    //PATH FOR FORWARD WHEEL
    
    func pathForForwardWheel() -> UIBezierPath {
        let line = UIBezierPath()
        line.lineWidth = 2
        line.addArc(withCenter: centerForwardWheel, radius: height / 4.3, startAngle: 0, endAngle:  2 * CGFloat.pi, clockwise: true)
        return line
    }
    
    //PATH FOR CABIN
    
    func pathForCabin() -> UIBezierPath {
        let line = UIBezierPath()
        line.lineWidth = 2
        line.move(to: firstCabinPoint)
        line.addLine(to: secondCabinPoint)
        line.addLine(to: thirdCabinPoint)
        line.addLine(to: fourCabinPoint)
        line.addLine(to: firstCabinPoint)
        
        return line
    }
    
    //PATH FOR BUMPER
    
    func pathForBumper() -> UIBezierPath {
        let line = UIBezierPath()
        line.lineWidth = 2
        line.move(to: firstBumperPoint)
        line.addLine(to: secondBumperPoint)
        line.addLine(to: thirdBumperPoint)
        line.addLine(to: fourBumperPoint)
        line.addLine(to: fiveBumperPoint)
        line.addLine(to: firstBumperPoint)
        
        return line
    }
    
    //PATH FOR TANK
    
    func pathForTank() -> UIBezierPath {
        let line = UIBezierPath()
        line.lineWidth = 2
        line.move(to: firstTankPoint)
        line.addLine(to: secondTankPoint)
        line.addLine(to: thirdTankPoint)
        line.addLine(to: fourTankPoint)
        line.addLine(to: firstTankPoint)
        
        return line
    }
    
    override func draw(_ rect: CGRect) {
        
        UIColor.black.setStroke()
        UIColor.yellow.setFill()
        pathForBody().stroke()
        pathForBody().fill()
        pathForBumper().stroke()
        pathForBumper().fill()
        UIColor.blue.setFill()
        pathForCabin().stroke()
        pathForCabin().fill()
        pathForTank().stroke()
        pathForTank().fill()
        UIColor.gray.setFill()
        pathForBackWheel().stroke()
        pathForBackWheel().fill()
        pathForForwardWheel().stroke()
        pathForForwardWheel().fill()
    }
    
}
