//
//  BookListView.swift
//  SampleObservation
//
//  Created by Hardik Modha on 09/10/24.
//

import SwiftUI

struct BookListView: View {
    
    @State var bookViewModal = BookViewModel()
    @State var isPresented: Bool = false
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($bookViewModal.datasource, id: \.id) { $book in
                    BookCell(book: $book)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Books")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.isPresented = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
            .sheet(isPresented: $isPresented) {
                AddBookView(viewModel: self.bookViewModal, isPresented: $isPresented)
            }
        }
    }
}

#Preview {
    BookListView()
}
