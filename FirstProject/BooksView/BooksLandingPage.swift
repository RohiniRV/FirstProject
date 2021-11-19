//
//  BooksLandingPage.swift
//  FirstProject
//
//  Created by rvaidya on 18/11/21.
//

import SwiftUI

struct BooksLandingPage: View {
    var body: some View {
        TabView {
            Text("To read")
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                    Text("To read")
                }
            Text("In Progress")
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("In Progress")

                }
            Text("Done")
                .tabItem {
                    Image(systemName: "character.book.closed.fill")
                    Text("Done")

                }
            
        }

    }
}

struct BooksLandingPage_Previews: PreviewProvider {
    static var previews: some View {
        BooksLandingPage()
    }
}
