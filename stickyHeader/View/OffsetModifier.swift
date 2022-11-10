//
//  OffsetModifier.swift
//  stickyHeader
//
//  Created by 1100690 on 2022/11/10.
//

import SwiftUI

//get scroll view's offset
struct OffsetModifier: ViewModifier {
    @Binding var offset: CGFloat
    func body(content: Content) -> some View {
        content
            .overlay (
                GeometryReader { proxy -> Color in
//                    let minY = proxy.frame(in: .global).minY
                    //get coordinate space called scroll
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    let maxY = proxy.frame(in: .global).maxY
                    print("offset:\(minY), \(maxY)")
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    return Color.clear
                },
                alignment: .top
            )
    }
}
