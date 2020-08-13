//
//  SearchView.swift
//  Crane
//
//  Created by captain on 2020/7/28.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

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

struct SearchView: View {
    
    @Binding var query: String
    let repos:[Repo]
    let onCommit: () -> Void
    
    var body: some View {
        
        NavigationView {
            List {
                TextField("Type someting", text: $query, onCommit: onCommit)
                
                ForEach(repos, content: {RepoRow(repo: $0)})
                
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

struct RepoRow: View {
    let repo: Repo
    var body: some View {
        HStack(alignment: .center) {
            KFImage(URL(string: "https://example.com/image.png")!).placeholder({Image("def_image")})
            
            Image(systemName: "photo")
                .fetchingRemoteImage(from: URL(string: "https://t9.baidu.com/it/u=2268908537,2815455140&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1597894231&t=cf5f9ea61f04a848592b930df81a0194")!)
                .frame(width: 44, height: 44)
            
            VStack(alignment: .leading) {
                Text(repo.name).font(.headline)
//                Text(repo.description )
//                    .foregroundColor(.secondary)
//                    .font(.subheadline)
                ModifiedContent(
                    content: Text(repo.description),
                    modifier: SubheadlineModifier())
            }
        }
    }
}


struct SubheadlineModifier: ViewModifier {

    func body(content: Content) -> some View {
        content.foregroundColor(.secondary).font(.subheadline)
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
