//
//  SearchView.swift
//  Crane
//
//  Created by captain on 2020/7/28.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI


struct RepoRow: View {
    let repo: Repo
    var body: some View {
        VStack(alignment: .leading) {
            Text(repo.name).font(.headline)
            Text(repo.description).font(.subheadline)
        }
    }
}

struct SearchView: View {
    
    @State private var query: String = "Swift"
    @EnvironmentObject var repoStore: ReposStore
    
    var body: some View {
        
        NavigationView {
            List{
                TextField("Type something...", text: $query, onCommit: fetch)
                ForEach(repoStore.repos){ repo in
                    RepoRow(repo: repo)
                }
            }.navigationBarTitle(Text("Search"))
        }.onAppear(perform: fetch)
    }
    
    
    private func fetch() {
        repoStore.fetch(matching: query)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
