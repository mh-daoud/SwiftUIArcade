//
//  TimerPublisherView.swift
//  Flashzilla
//
//  Created by Mac on 23/03/2024.
//

import SwiftUI

struct TimerPublisherView: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer, perform: { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                
                counter += 1
            })
    }
}

#Preview {
    TimerPublisherView()
}
