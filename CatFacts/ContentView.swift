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
        List(facts) { fact in
            Text(fact.text)
        }.onAppear {
            Api().getFacts { (facts) in
                self.facts = facts
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
