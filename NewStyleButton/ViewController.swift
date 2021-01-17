//
//  ViewController.swift
//  NewStyleButton
//
//  Created by Insu Park on 2021/01/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var gradientTestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let start = UIColor.init(red: 250/255.0,
//                                 green: 250/255.0,
//                                 blue: 250/255.0,
//                                 alpha: 1.0).cgColor
//        let end = UIColor.init(red: 235/255.0,
//                               green: 235/255.0,
//                               blue: 235/255.0,
//                               alpha: 1.0).cgColor
//        self.applyNewmophism()
//        self.view.layoutSubviews()
    }
    
    func applyNewmophism() {
        let start = UIColor.init(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 1.0).cgColor
        let end = UIColor.init(red: 235/255.0, green: 235/255.0, blue: 235/255.0, alpha: 1.0).cgColor
        
        let first = UIColor.init(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0).cgColor
        let second = UIColor.init(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.0).cgColor
        
        
        // 최상단 버튼
        gradientTestButton.addGradientLayerToBorder(with: [first, second],
                                                    locations: [0.0, 1.0],
                                                    frame: gradientTestButton.bounds)
        gradientTestButton.addGradientLayer(with: [start, end],
                                            locations: [0.0, 1.0],
                                            frame: gradientTestButton.bounds)
        
        
        let firstShadow = UIColor.init(red: 255/255.0,
                                       green: 255/255.0,
                                       blue: 255/255.0,
                                       alpha: 1.0)
        let secondShadow = UIColor.init(red: 0/255.0,
                                        green: 0/255.0,
                                        blue: 0/255.0,
                                        alpha: 0.1)
        
        
        
        
        gradientTestButton.layer.applySketchShadow(color: firstShadow,
                                                   opacity: 1.0,
                                                   x: -5,
                                                   y: -7,
                                                   blur: 10,
                                                   spread: 0)
        gradientTestButton.layer.applySketchShadow(color: secondShadow,
                                                   opacity: 1.0,
                                                   x: 5,
                                                   y: 7,
                                                   blur: 10,
                                                   spread: 0)
        
        
        
        
        button.makeCornerRadiusWithShadow(cornerRadius: 22.5,
                                          shadowColor: UIColor.init(red: 0/255.0,
                                                                    green: 0/255.0,
                                                                    blue: 0/255.0,
                                                                    alpha: 0.5),
                                          x: 1,
                                          y: 4,
                                          shadowOpacity: 1.0,
                                          blur: 8)
        secondButton.layer.applySketchShadow(color: UIColor.init(red: 0/255.0,
                                                           green: 0/255.0,
                                                           blue: 0/255.0,
                                                           alpha: 0.15), opacity: 1.0, x: 1, y: 4, blur: 8, spread: 1)
    }
    
    override func viewWillLayoutSubviews() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    //        self.applyNewmophism()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        self.applyNewmophism()
    }
    
    override func viewDidLayoutSubviews() {
        // 오토 레이아웃을 사용하여 그라디언트를 그릴 때 여기서 작송시켜야 함.
        self.applyNewmophism()
    }
    
    
}

extension UIView {
    
    func addGradientLayerToBorder(with colors: [CGColor],
                                  locations: [NSNumber] = [0.0, 1,0],
                                  frame: CGRect = CGRect.zero) {
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors

        
        let shape = CAShapeLayer()
        shape.lineWidth = 1
        shape.path = UIBezierPath(roundedRect: self.bounds,
                                  cornerRadius: self.layer.cornerRadius).cgPath
        
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape

        self.layer.insertSublayer(gradient, at: 0)
    }
   
    func addGradientLayer(with colors: [CGColor],
                          locations: [NSNumber] = [0.0, 1.0],
                          frame: CGRect = CGRect.zero) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        
//        gradientLayer.startPoint = startPoint
//        gradientLayer.endPoint = endPoint
        
        gradientLayer.locations = locations
        gradientLayer.frame = frame
        
        gradientLayer.cornerRadius = self.layer.cornerRadius
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

extension UIButton {
    
    func makeShadow(x: CGFloat,
                    y: CGFloat,
                    color: UIColor,
                    cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize.init(width: x, height: y)
        self.layer.shadowRadius = cornerRadius
    }
    
    func makeCornerRadiusWithShadow(cornerRadius: CGFloat,
                                    shadowColor: UIColor,
                                    x: CGFloat, y: CGFloat,
                                    shadowOpacity: Float,
                                    blur: CGFloat) {
        let shadowLayer = CAShapeLayer()
        self.layer.cornerRadius = cornerRadius
        
//        if spread == 0 {
//            shadowPath = nil
//        } else {
//            let dx = -spread
//            let rect = bounds.insetBy(dx: dx, dy: dx)
//            shadowPath = UIBezierPath(rect: rect).cgPath


        shadowLayer.path = UIBezierPath(roundedRect: self.bounds,
                                        cornerRadius: self.layer.cornerRadius).cgPath
        shadowLayer.fillColor = self.backgroundColor?.cgColor
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowOffset = CGSize(width: x, height: y)
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowRadius = blur / 2.0
        
        self.layer.insertSublayer(shadowLayer, at: 0)
    }
    
    func makeCornerRadiusWithShadow(cornerRadius: CGFloat,
                                    shadowColor: UIColor,
                                    x: CGFloat, y: CGFloat,
                                    shadowOpacity: Float,
                                    blur: CGFloat,
                                    spread: CGFloat) {
        let shadowLayer = CAShapeLayer()
        self.layer.cornerRadius = cornerRadius
        

        shadowLayer.fillColor = self.backgroundColor?.cgColor
        
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowOffset = CGSize(width: x, height: y)
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowRadius = blur / 2.0
        
        if spread == 0 {
            shadowLayer.shadowPath = UIBezierPath(roundedRect: self.bounds,
                                                  cornerRadius: self.layer.cornerRadius).cgPath
        } else {
            let dx = -spread
            let rect = self.bounds.insetBy(dx: dx, dy: dx)
            shadowLayer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
        
        self.layer.insertSublayer(shadowLayer, at: 0)
    }
    
    // shadowOpacity : 10 -> 0.1
    // shadow 의 alpha 와 shadowOpacity 가 나뉘어 있는 이유는 rgba 가 헥스 코드로 들어오게 될 수 있기 때문!
}

extension CALayer {
    
    func applySketchShadow(
        color: UIColor = .black,
        opacity: Float = 0.2,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = opacity
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: self.cornerRadius).cgPath
        }
        masksToBounds = false
    }
    
}

// Sketch 에서 디자이너 분에게 전달받은 내용대로 구현할 수 없음.
//        secondButton.makeShadow(x: 1,
//                                y: 4,
//                                color: UIColor.init(red: 0/255.0,
//                                                    green: 0/255.0,
//                                                    blue: 0/255.0,
//                                                    alpha: 0.5),
//                                cornerRadius: 22.5)


//        secondButton.makeCornerRadiusWithShadow(cornerRadius: 22.5,
//                                                shadowColor: UIColor.init(red: 0/255.0,
//                                                                          green: 0/255.0,
//                                                                          blue: 0/255.0,
//                                                                          alpha: 0.5),
//                                                x: 1,
//                                                y: 4,
//                                                shadowOpacity: 1.0,
//                                                blur: 8,
//                                                spread: 1)
