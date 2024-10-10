//
//  SampleObservationApp.swift
//  SampleObservation
//
//  Created by Hardik Modha on 07/10/24.
//

import SwiftUI
import FirebaseCore





@main
struct SampleObservationApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
    }
}
