//
//  BookCell.swift
//  SampleObservation
//
//  Created by Hardik Modha on 09/10/24.
//

import Foundation
import SwiftUI

struct BookCell: View {
    
    @Binding var book: Book
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(book.title)
                    .font(.largeTitle)
                    .bold()
                Text(book.author)
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.secondary, lineWidth: 2)
        )
        
        .padding()
    }
}

#Preview {
    BookCell(book: .constant(Book(title: "C Language", author: "E Balagurusamy", numberOfPages: 100, isAvailable: false)))
}
