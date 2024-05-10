//
//  ContentView.swift
//  PageViewSwiftUI
//
//  Created by Sandra Gomez on 5/9/24.
//

import SwiftUI
class Broadcast: ObservableObject {
    @Published var message = "Shared text"
}

struct ContentView: View {
    @ObservedObject var shareMe = Broadcast()
    var body: some View {
        TabView {
            FirstView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("First tab")
                }
                SecondView()
                    .tabItem {
                        Image(systemName: "car.fill")
                        Text("Second Tab")
                    }
                ThirdView()
                    .tabItem {
                        Image(systemName: "hare.fill")
                        Text("Third Tab")
                    }
            }.environmentObject(shareMe)
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
    struct FirstView: View {
        @EnvironmentObject var junkHere: Broadcast
        var body: some View {
            ZStack {
                Rectangle()
                    .foregroundColor(.yellow)
                Text("First view + \(junkHere.message)")
            }
        }
    }
    
struct SecondView: View {
    @EnvironmentObject var stuffHere: Broadcast
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.purple)
            Text("Second view + \(stuffHere.message)")
        }
    }
}
    
    struct ThirdView: View {
        @EnvironmentObject var anotherString: Broadcast
        var body: some View {
            ZStack {
                Rectangle()
                    .foregroundColor(.red)
                TextField("Type here", text: $anotherString.message)
            }
        }
    }
    
    #Preview {
        ContentView()
    }
