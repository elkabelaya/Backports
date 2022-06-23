//
//  Backport+LazyVStack.swift
//  BackportsApp
//
//  Created by Elka Belaya on 23.06.2022.
//
import SwiftUI

@available(iOS, deprecated: 14, message: "deprecated sinse iOS14")
struct LazyVStack<Content: View>: View {
    let content: () ->  Content
    
    var body: some View {
        if #available(iOS 14.0, *) {
            SwiftUI.LazyVStack(content: content)
        } else {
            VStack(content: content)
        }
    }
    
}
