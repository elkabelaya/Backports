//
//  ContentView.swift
//  BackportsApp
//
//  Created by Elka Belaya on 22.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var  searchText: String = ""
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVStack {
                    ForEach (0..<10) {_ in
                        Text("Hello, world!")
                        .padding()
                    }
                }
            }
            .backport.navigationTitle("BackportTitle")
            .backport.searchable(text: $searchText, prompt: "Search...")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
