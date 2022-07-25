//
//  Backport+Searchable.swift
//  BackportsApp
//
//  Created by Elka Belaya on 25.07.2022.
//

import SwiftUI

class SearchBar: NSObject, ObservableObject {
    
    @Published var text: String = ""
    let searchController: UISearchController = UISearchController(searchResultsController: nil)
    
    init(text: Binding<String>, placeholder: String) {
        super.init()
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchResultsUpdater = self
        self.searchController.hidesNavigationBarDuringPresentation = false

    }
}

extension SearchBar: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchBarText = searchController.searchBar.text {
            self.text = searchBarText
        }
    }
}

struct SearchBarModifier: ViewModifier {
    
    let searchBar: SearchBar
    
    func body(content: Content) -> some View {
        content
            .overlay(
                ViewControllerResolver { viewController in
                    viewController.navigationItem.searchController = self.searchBar.searchController
                }
                    .frame(width: 0, height: 0)
            )
    }
}

extension Backport {
    @available(iOS, deprecated: 15, message: "deprecated sinse iOS15")
    @ViewBuilder func searchable(text: Binding<String>, prompt: String) -> some View {
        if #available(iOS 15.0, *) {
            content.searchable(text: text,
                               placement: .navigationBarDrawer(displayMode: .always),
                               prompt: prompt)
        } else {
            content.modifier(SearchBarModifier(searchBar: .init(text: text, placeholder: prompt)))
        }
    }
}
