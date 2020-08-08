//
//  SearchView.swift
//  Crane
//
//  Created by captain on 2020/7/28.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var query: String
    let repos:[Repo]
    let onCommit: () -> Void
    
    var body: some View {
        
        NavigationView {
            List {
                TextField("Type someting", text: $query, onCommit: onCommit)
                ForEach(repos) { repo in
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text(repo.name).font(.headline)
                            Text(repo.description).font(.subheadline)
                        }
                    }
                }
                NavigationLink(destination: RepertotyView()) {
                    Text("repertoty")
                }
                
                List(repos, id: \.self) { repo in
                    NavigationLink(destination: RepertotyView()) {
                        Text(repo.name)
                    }
                }
            }.navigationBarTitle("Nav")
        }
        
    }
    
}


struct SearchContainerView: View {
    @EnvironmentObject var repoStore: ReposStore
    @State private var query: String = "Swift"
    
    var body: some View {
        SearchView(query: $query, repos: repoStore.repos, onCommit: fetch)
            .onAppear(perform: fetch)
    }
    
    private func fetch() {
        repoStore.fetch(matching: query)
    }
}



struct RepertotyView: View {
    var body: some View {
        List {
            NavigationLink(destination: RepertotyView()) {
                Text("gogogogogo")
            }.navigationBarTitle("nav")
        }
    }
}
