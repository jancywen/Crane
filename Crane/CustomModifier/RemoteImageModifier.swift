//
//  RemoteImageModifier.swift
//  Crane
//
//  Created by captain on 2020/8/13.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI
import class Kingfisher.KingfisherManager


extension Image {
    func fetchingRemoteImage(from url: URL) ->some View {
        ModifiedContent(content: self, modifier: RemoteImageModifier(url: url))
    }
}

struct RemoteImageModifier: ViewModifier {
    let url: URL
    @State private var fetchedImage: UIImage? = nil
    
    func body(content: Content) -> some View {
        if let image = fetchedImage {
            return Image(uiImage: image)
                .resizable()
                .eraseToAnyView()
        }
        return content
            .onAppear(perform: fetch)
            .eraseToAnyView()
    }
    private func fetch() {
        KingfisherManager.shared.retrieveImage(with: url) { (result) in
            self.fetchedImage = try? result.get().image
        }
    }
}

extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}
