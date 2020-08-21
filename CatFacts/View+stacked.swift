//
//  View+stacked.swift
//  CatFacts
//
//  Created by Irene Sarigu on 21/08/2020.
//  Copyright © 2020 Irene Sarigu. All rights reserved.
//
import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}
