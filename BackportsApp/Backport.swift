//
//  Backport.swift
//  BackportsApp
//
//  Created by Elka Belaya on 23.06.2022.
//
import SwiftUI

struct Backport<Content: View> {
    let content: Content
}

extension View {
    var backport: Backport<Self> { Backport (content: self)}
}

