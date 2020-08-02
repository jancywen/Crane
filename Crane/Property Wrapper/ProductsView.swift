//
//  ProductsView.swift
//  Crane
//
//  Created by captain on 2020/7/28.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI


struct FilterView: View {
    @Binding var showFavorited: Bool
    var body: some View {
        Toggle(isOn: $showFavorited) {
            Text("Change filter")
        }
    }
}

struct ProductsView: View {
    
    let products: [Product] = [Product(id: 1, title: "product-1", isFavorited: false),
                               Product(id: 2, title: "product-2", isFavorited: false),
                               Product(id: 3, title: "product-3", isFavorited: true),
                               Product(id: 4, title: "product-4", isFavorited: false),]
    @State private var showFavorited: Bool = false
    
    var body: some View {
        List {
//            Button(action: {self.showFavorited.toggle()},
//                   label: {Text("Change filter")})
            
            FilterView(showFavorited: $showFavorited)
            
            ForEach(products) { product in
                if !self.showFavorited || product.isFavorited {
                    Text(product.title)
                }
            }
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}



struct Product: Identifiable {
    var id: Int
    
    var title:String
    var isFavorited: Bool
}
