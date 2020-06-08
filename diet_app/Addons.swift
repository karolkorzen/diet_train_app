//
//  Addons.swift
//  diet_app
//
//  Created by Karol Korzeń on 03/06/2020.
//  Copyright © 2020 Karol Korzeń. All rights reserved.
//

import Foundation
import SwiftUI

extension UIColor {
    static let flatDarkCardBackground = UIColor(red: 46, green: 46, blue: 46)
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: a)
    }
}

extension Color {
    public init(decimalRed red: Double, green: Double, blue: Double) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255)
    }
    
    public static var flatDarkBackground: Color {
        return Color(decimalRed: 36, green: 36, blue: 36)
    }
    
    public static var flatDarkCardBackground: Color {
        return Color(decimalRed: 46, green: 46, blue: 46)
    }
}

func vibrate() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
}
