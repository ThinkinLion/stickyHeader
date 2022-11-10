//
//  ContentView.swift
//  stickyHeader
//
//  Created by 1100690 on 2022/11/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        //get safearea top
        GeometryReader { proxy in
            let topEdge = proxy.safeAreaInsets.top
            HomeView(topEdge: topEdge)
                .ignoresSafeArea(.all, edges: .top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
