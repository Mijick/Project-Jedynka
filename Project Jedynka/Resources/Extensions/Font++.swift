//
//  Font++.swift of Project Jedynka
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2024 Mijick. Licensed under MIT License.


import SwiftUI

extension Font {
    static func bold(_ size: CGFloat) -> Font { .custom("Inter-Bold", size: size) }
    static func semiBold(_ size: CGFloat) -> Font { .custom("Inter-SemiBold", size: size) }
    static func medium(_ size: CGFloat) -> Font { .custom("Inter-Medium", size: size) }
    static func regular(_ size: CGFloat) -> Font { .custom("Inter-Regular", size: size) }
}
