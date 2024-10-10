//
//  BookViewModel.swift
//  SampleObservation
//
//  Created by Hardik Modha on 09/10/24.
//


import Foundation
import Observation
import FirebaseFirestore

@Observable
class BookViewModel {
    
    private let collection: String = "Books"
    private var db = Firestore.firestore()
    private var listener: ListenerRegistration?
    
    var datasource: [Book] = []
    
    var title: String = ""
    var author: String = ""
    var numberOfPages: String = ""
    var isAvailable: Bool = false
    
    
    
    init() {
        self.fetchBooks()
    }
    
    func addBook() {
        let book = Book(title: self.title, author: self.author, numberOfPages: Int(self.numberOfPages) ?? 0, isAvailable: self.isAvailable)
        do {
            let bookRef = try self.db.collection(self.collection).addDocument(from: book)
            print(bookRef)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func updateBook(book: Book) {
        
    }
    
    func deleteBook(book: Book) {
        
    }
    
    func fetchBooks() {
        self.listener = self.db.collection(self.collection).addSnapshotListener { snapshot, error in
            if let error {
                print(error.localizedDescription)
                return
            }
            
            if let snapshot {
                
                self.datasource.removeAll()
                var fetchedBooks: [Book] = []
                
                snapshot.documentChanges.forEach { change in
                    switch change.type {
                    case .added:
                        break
                    case .modified:
                        break
                    case .removed:
                        break
                    }
                }
                
                for document in snapshot.documents {
                    do {
                        let book = try document.data(as: Book.self)
                        fetchedBooks.append(book)
                    } catch let error {
                        print("Error decoding user: \(error)")
                    }
                }
                self.datasource = fetchedBooks
                
            }
        }
        
    }
    
    deinit {
        self.listener?.remove()
        self.listener = nil
    }
    
}
