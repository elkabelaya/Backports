//
//  Backport+NavigationTitle.swift
//  BackportsApp
//
//  Created by Elka Belaya on 23.06.2022.
//

import SwiftUI

extension Backport {
    @available(iOS, deprecated: 14, message: "deprecated sinse iOS14")
    @ViewBuilder func navigationTitle(_ title: String) -> some View {
        if #available(iOS 14.0, *) {
            content.navigationTitle(title)
        } else {
            content.navigationBarTitle(title)
        }
        
    }
}
