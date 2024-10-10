//
//  Book.swift
//  SampleObservation
//
//  Created by Hardik Modha on 09/10/24.
//


import Foundation
import FirebaseFirestore
import FirebaseCore


struct Book: Codable, Identifiable {
    
    @DocumentID var id: String?
    var title: String
    var author: String
    var numberOfPages: Int
    var isAvailable: Bool
    
    init(title: String, author: String, numberOfPages: Int, isAvailable: Bool) {
        self.title = title
        self.author = author
        self.numberOfPages = numberOfPages
        self.isAvailable = isAvailable
    }
}

extension Book: CustomStringConvertible {
    
    var description: String {
        return self.isAvailable ? "In Stock" : "Out of Stock"
    }
}
