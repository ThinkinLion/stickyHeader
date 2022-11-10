//
//  HomeView.swift
//  stickyHeader
//
//  Created by 1100690 on 2022/11/10.
//

import SwiftUI

struct HomeView: View {
    //max height
    let maxHeight = UIScreen.main.bounds.height / 2.5
    
    var topEdge: CGFloat
    
    //offset
    @State var offset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                //MARK: Top Navi
                GeometryReader { proxy in
                    TopView(topEdge: topEdge, offset: $offset, maxHeight: maxHeight)
                        .foregroundColor(.white)
//                        .background(Color("#7bbe6a"))
//                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                        .frame(maxWidth: .infinity)
                        //MARK: Sticky Effect
//                        .frame(height: maxHeight + offset, alignment: .bottomLeading)
                        .frame(height: getHeaderHeight(), alignment: .bottomLeading)
                        .background(
                            Color("#eb8e42"),
                            in: CustomCorner(corners: [.bottomRight], radius: getCornerRadius())
                        )
                        .overlay (
                            //Top Navi View
                            HStack(spacing: 15) {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "xmark")
                                    
                                    Image("1628369")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 35, height: 35)
                                        .opacity(topBarTitleOpacity())
                                    
                                    Text("Ja Morant")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .opacity(topBarTitleOpacity())
                                    
                                    Spacer()
                                    Image(systemName: "line.3.horizontal")
                                }
                            }
                                //max height
//                                .frame(height: 80 + topEdge)
                                .frame(height: 80)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                .padding(.top, topEdge)
                            ,alignment: .top
                        )
                }
                .frame(height: maxHeight)
//                .background(Color(.blue))
                //MARK: Fixing at TOP
                .offset(y: -offset)
                .zIndex(1)
                
                //MARK: Sample List
                VStack(spacing: 15) {
                    ForEach(allMessages) { message in
                        CardView(message: message)
                    }
                }
                .padding()
                .zIndex(0)
            }
            .modifier(OffsetModifier(offset: $offset))
        }
        .coordinateSpace(name: "SCROLL")
    }
    
    func getHeaderHeight() -> CGFloat {
        let topHeight = maxHeight + offset
        
        //80 is the constant top navi view height
        //since we included top safe area so we also need to include that too..
        return topHeight > (80 + topEdge) ? topHeight : (80 + topEdge)
    }
    
    func getCornerRadius() -> CGFloat {
        let progress = -offset / (maxHeight - (80 + topEdge))
        let value = 1 - progress
        let radius = value * 50
        return offset < 0 ? radius : 50
    }
    
    func topBarTitleOpacity() -> CGFloat {
        //to start after the main content vanished..
        //we need to eliminate 70 from offset..
//        let progress = -(offset + 70) / (maxHeight - (80 + topEdge))
//        let opacity = 1 - progress
        let progress = -(offset + 60) / (maxHeight - (80 + topEdge))
        return progress
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TopView: View {
    var topEdge: CGFloat
    @Binding var offset: CGFloat
    var maxHeight: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image("1628369")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 75, height: 75)
            
            Text("Ja Morant")
                .font(.largeTitle.bold())
            
            Text("Houston Rockets converted the contract of forward Darius Days to a Two-Way Contract.")
                .fontWeight(.semibold)
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .padding(.bottom)
        .opacity(getOpacity())
    }
    
    //calculate opacity
    func getOpacity() -> CGFloat {
        //70 >> some random amount of time to visible on scroll
        let progress = -offset / 70
        let opacity = 1 - progress
        return offset < 0 ? opacity : 1
    }
}


struct CardView: View {
    var message: MessageModel
    
    var body: some View {
        HStack(spacing: 15) {
            Circle()
                .fill(message.color)
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(message.name)
                    .fontWeight(.bold)
                Text(message.message)
                    .foregroundColor(.secondary)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
