//
//  ContentView.swift
//  CatFacts
//
//  Created by Irene Sarigu on 14/08/2020.
//  Copyright © 2020 Irene Sarigu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var facts: [CatFact] = []
    
    var body: some View {
        
        VStack {
            ZStack {
                if !facts.isEmpty {
                    ForEach(0..<self.facts.count, id: \.self) { fact in
                        CardView(fact: self.facts[fact]) {
                            withAnimation {
                                self.removeCard(at: fact)
                            }
                        }
                        .stacked(at: fact, in: self.facts.count)
                    }
                }
            }
            Button(action: {
                self.callAPI()
            }, label : {Text("Click Here")})
        }
    }
    
    func removeCard(at index: Int) { facts.removeLast() }
    
    func callAPI() {
        Api().getFacts { (facts) in self.facts = facts
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
