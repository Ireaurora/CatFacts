//
//  ContentView.swift
//  CatFacts
//
//  Created by Irene Sarigu on 14/08/2020.
//  Copyright © 2020 Irene Sarigu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //  @State var facts: [CatFact] = []
    @State var facts: [String] = ["h", "l", "o", "p", "j"]
    
    func removeCard(at index: Int) {
        print(index)
        facts.insert(facts[index], at: facts.endIndex)
        facts.remove(at: index)
    }
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    ForEach(0..<facts.count, id: \.self) { fact in
                        CardView(fact: self.facts[fact]) {
                            withAnimation {
                                self.removeCard(at: fact)
                            }
                        }
                        .stacked(at: fact, in: self.facts.count)
                    }
                }
            }
        }
    }
}

struct CardView: View {
    let fact: String
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    var removal: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 10)
            
            VStack {
                Text(fact)
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
            }
                
            .onEnded { _ in
                if abs(self.offset.width) > 100 {
                    self.removal?()
                } else {
                    self.offset = .zero
                }
            }
        )
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}
