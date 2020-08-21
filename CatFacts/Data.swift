//
//  Data.swift
//  CatFacts
//
//  Created by Irene Sarigu on 14/08/2020.
//  Copyright © 2020 Irene Sarigu. All rights reserved.
//

import SwiftUI

struct Status: Codable {
    let verified: Bool?
    let sentCount: Int?
}

struct CatFact: Codable, Identifiable {
    let _id = UUID()
    let used: Bool
    let source: String
    let type: String
    let deleted: Bool
    let user : String
    let text : String
    let __v : Int?
    let updatedAt: String
    let createdAt: String
    let status: Status?
    
    //Needed as this is an identifiable
    let id = UUID()
}

class Api {
    func getFacts(completion: @escaping ([CatFact]) -> ()) {
        guard let url = URL(string: "https://cat-fact.herokuapp.com/facts/random?animal_type=cat&amount=10") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _,_) in
            //let facts = try! JSONDecoder().decode([CatFact].self, from: data!)
            //print(facts.count)
            let facts = ["hello", "fouaeoiufoarf", "new", "why"]
            DispatchQueue.main.async {
               // completion(facts)
            }
        }.resume()
    }
}

/*
 //When call is made to  https://cat-fact.herokuapp.com/facts/random?animal_type=cat&amount=1
 
 We get the following results back:
 
 {"used":true,
 "source":"user",
 "type":"cat",
 "deleted":false,
 "_id":"58e00a000aac31001185ed15",
 "user":"58e007480aac31001185ecef",
 "text":"Female cats are typically
 right-pawed while male cats are
 typically
 left-pawed.",
 "__v":0,
 "updatedAt":"2020-08-11T20:20:4
 .239Z",
 "createdAt":"2018-01-05T21:20:03
 .882Z",
 "status":{"verified":true,
 "sentCount":1}}
 */
