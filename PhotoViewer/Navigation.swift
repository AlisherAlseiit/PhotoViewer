//
//  Navigation.swift
//  PhotoViewer
//
//  Created by Алишер Алсейт on 24.12.2020.
//

import SwiftUI

struct Navigation: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
   @ViewBuilder var body: some View {
                
        if horizontalSizeClass == .compact {
            
            AppTabNavigation()

        }else {
            AppSideBarNavigation()
        }
        
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
