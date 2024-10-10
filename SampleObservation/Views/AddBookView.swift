//
//  AddBookView.swift
//  SampleObservation
//
//  Created by Hardik Modha on 09/10/24.
//

import Foundation
import SwiftUI

struct AddBookView: View {
    
    @Bindable var viewModel: BookViewModel
    @Binding var isPresented: Bool
    
    
    var body: some View {
        
        NavigationStack {
            Form {
                
                Section {
                    TextField("Book Title", text: $viewModel.title)
                    TextField("Book Author", text: $viewModel.author)
                    TextField("Number Of Pages", text: $viewModel.numberOfPages)
                    Toggle("Is available", isOn: $viewModel.isAvailable)
                }
                
                Section {
                    Button {
                        self.viewModel.addBook()
                        self.isPresented = false
                    } label: {
                        HStack {
                            Spacer()
                            Text("Add Book")
                            Spacer()
                        }
                    }
                }
                
            }
            .navigationTitle("Add Book")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddBookView(viewModel: BookViewModel(), isPresented: .constant(false))
}
