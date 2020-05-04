//
//  UIColorExtension.swift
//  Component
//
//  Created by 鈴木 公章 on 2020/05/05.
//

import UIKit

extension UIColor {
    public convenience init(hex: String, alpha: CGFloat = 1.0) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }

    public func convert(to color: UIColor, multiplier: CGFloat) -> UIColor? {
        let _multiplier = min(max(multiplier, 0), 1)

        let components = cgColor.components ?? []
        let toComponents = color.cgColor.components ?? []

        if components.isEmpty || components.count < 3 || toComponents.isEmpty || toComponents.count < 3 {
            return nil
        }

        var results: [CGFloat] = []

        for index in 0 ... 3 {
            let result = (toComponents[index] - components[index]) * abs(_multiplier) + components[index]
            results.append(result)
        }

        return UIColor(red: results[0], green: results[1], blue: results[2], alpha: results[3])
    }

    public func imageFill(size: CGSize, cornerRadius: CGFloat = 0) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { context in

            let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            let cornerRadiusPath = UIBezierPath(roundedRect: rect,
                                                cornerRadius: cornerRadius)
            self.setFill()
            cornerRadiusPath.fill()

            context.cgContext.addPath(cornerRadiusPath.cgPath)
        }
    }

    public func imageBorder(size: CGSize, cornerRadius: CGFloat = 0, lineWidth: CGFloat = 1) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { context in

            let rect = CGRect(x: lineWidth / 2,
                              y: lineWidth / 2,
                              width: size.width - lineWidth,
                              height: size.height - lineWidth)

            let cornerRadiusPath = UIBezierPath(roundedRect: rect,
                                                cornerRadius: cornerRadius)
            cornerRadiusPath.lineWidth = lineWidth
            self.setStroke()
            cornerRadiusPath.stroke()

            context.cgContext.addPath(cornerRadiusPath.cgPath)
        }
    }
}
