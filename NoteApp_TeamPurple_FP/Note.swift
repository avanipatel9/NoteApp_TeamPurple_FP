//
//  Note.swift
//  NoteApp_TeamPurple_FP
//
//  Created by user174608 on 6/20/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import Foundation
class Note {
    var noteText: String
    var title: String
    var noteCategory: String
    var imageData: Data
    var latitude : Double
    var longitude : Double
    var creationDate: Date
    init() {
        self.noteText = String()
        self.title = String()
        self.noteCategory = String()
        self.imageData = Data()
        self.latitude = Double()
        self.longitude = Double()
        self.creationDate = Date()
    }
}
