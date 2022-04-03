//
//  ContentView.swift
//  TimerSTBC
//
//  Created by Vahtee Boo on 03.04.2022.
//

import SwiftUI


struct ContentView: View {
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    
    //    Current Time
    /*
     @State private var currentDate = Date()
     var dateFormatter: DateFormatter {
     let formatter = DateFormatter()
     //        formatter.dateStyle = .medium //optional
     formatter.timeStyle = .medium //optional
     return formatter
     }
     */
    //    Countdown
    /*
     @State private var count = 10
     @State private var finishedText: String? = nil
     */
    //    Countdown to date
    /*
     @State private var timerRemainig = ""
     let futureDate = Calendar.current.date(byAdding: .hour, value: 5, to: Date())
     
     
     func updateTimerRemainig() {
     let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureDate ?? Date())
     let minute = remaining.minute ?? 0
     let second = remaining.second ?? 0
     timerRemainig = "\(minute) min and \(second) secs"
     }
     
     //    func updateTimerRemainig() {
     //        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate ?? Date())
     //        let hour = remaining.hour ?? 0
     //        let minute = remaining.minute ?? 0
     //        let second = remaining.second ?? 0
     //        timerRemainig = "\(hour):\(minute):\(second)"
     //    }
     */
//    Animation counter
    @State private var count = 0
    
    var body: some View {
        ZStack {
            RadialGradient(
                colors: [Color("ColorGInner"), Color("ColorGOutter")],
                center: .center,
                startRadius: 5,
                endRadius: 500)
            .ignoresSafeArea()
            
            //            Text(dateFormatter.string(from: currentDate)) //Current time
            //            Text(finishedText ?? "\(count)") //Countdown
            //       //    Countdown to date
            //             Text(timerRemainig)
            VStack(spacing: 10) {
                Circle()
                    .offset(x: count == 1 ? 80 : 0)
                Circle()
                    .offset(x: count == 2 ? -80 : 0)
                Circle()
                    .offset(x: count == 3 ? 80 : 0)
                Circle()
                    .offset(x: count == 4 ? -80 : 0)
                Circle()
                    .offset(x: count == 5 ? 80 : 0)
                Circle()
                    .offset(x: count == 6 ? -80 : 0)
                Circle()
                    .offset(x: count == 7 ? 80 : 0)
                Circle()
                    .offset(x: count == 8 ? -80 : 0)
                Circle()
                    .offset(x: count == 9 ? 80 : 0)
                Circle()
                    .offset(x: count == 10 ? -80 : 0)
            }
//            .frame(width: 150)
            .padding()
            .foregroundColor(.white)
        }
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 1.0)) {
                count = count == 10 ? 1 : count + 1
            }
        }
            //    Countdown to date
            /*
             .onReceive(timer) { _ in
             updateTimerRemainig()
             }
             */
            // Countdown
            /*
             //        .onReceive(timer) { _ in
             //            if count <= 1 {
             //                finishedText = "Wow!"
             //            } else {
             //                count -= 1
             //            }
             //        }
             */
            //current time
            /*
             //        .onReceive(timer) { value in
             //            currentDate = value
             //        }
             */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
