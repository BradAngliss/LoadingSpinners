//
//  SquareFadeInOutSpinner.swift
//  LoadingSpinners
//
//  Created by Brad Angliss on 07/04/2024.
//

import Foundation
import SwiftUI

struct SquareFadeInOutSpinner: View {
    @State var rotate = 0.0
    
    @State var square1: Double = 0.0
    @State var square1Size: Double = 30
    
    @State var square2: Double = 0.0
    @State var square2Size: Double = 30
    
    @State var square3: Double = 0.0
    @State var square3Size: Double = 30
    
    @State var square4: Double = 0.0
    @State var square4Size: Double = 30
    
    var body: some View {
        bounceBallSpinner
    }
    
    @ViewBuilder
    private var bounceBallSpinner: some View {
        let size: Double = 30
        let bounceHeight: Double = 20
        let speed: Double = 0.5
        let delay: Double = 0.5
        let asyncAfterDelay = 0.25
        let autoreverse: Bool = true
        VStack {
            HStack {
                Group {
                    Rectangle()
                        .fill(Color(hex: "#A27035"))
                        .frame(width: square1Size, height: square1Size)
                    //                    .opacity(square1)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: speed)
                                .delay(delay)
                                .repeatForever(autoreverses: autoreverse))
                            {
//                                .opacity((30 / square1Size) / )
                                square1Size = square1Size == 0 ? 30 : 0
                            }
                        }
                }
                .frame(width: 30, height: 30)
                Group {
                    Rectangle()
                        .fill(Color(hex: "#A27035"))
                        .frame(width: square2Size, height: square2Size)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + asyncAfterDelay) {
                                withAnimation(Animation.easeInOut(duration: speed)
                                    .delay(delay)
                                    .repeatForever(autoreverses: autoreverse))
                                {
                                    square2Size = square2Size == 0 ? 30 : 0
                                }
                            }
                        }
                }
                .frame(width: 30, height: 30)
            }
            HStack {
                Group {
                    Rectangle()
                        .fill(Color(hex: "#A27035"))
                        .frame(width: square3Size, height: square3Size)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + (asyncAfterDelay * 3)) {
                                withAnimation(Animation.easeInOut(duration: speed)
                                    .delay(delay)
                                    .repeatForever(autoreverses: autoreverse))
                                {
                                    square3Size = square3Size == 0 ? 30 : 0
                                }
                            }
                        }
                }
                .frame(width: 30, height: 30)
                Group {
                    Rectangle()
                        .fill(Color(hex: "#A27035"))
                        .frame(width: square4Size, height: square4Size)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + (asyncAfterDelay * 2)) {
                                withAnimation(Animation.easeInOut(duration: speed)
                                    .delay(delay)
                                    .repeatForever(autoreverses: autoreverse))
                                {
                                    square4Size = square4Size == 0 ? 30 : 0
                                }
                            }
                        }
                }
                .frame(width: 30, height: 30)
            }
        }
    }
}

#Preview {
    SquareFadeInOutSpinner()
}
