//
//  ViewNotesViewController.swift
//  NoteApp_TeamPurple_FP
//
//  Created by Avani Patel on 6/22/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit
import CoreLocation

class ViewNotesViewController: UIViewController {
  
   
    var items: [Note] = [];
    @IBOutlet weak var notesImage: UIImageView!
    
    @IBOutlet weak var txtViewNote: UITextView!
    
    @IBOutlet weak var lblCreationDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtViewNote.text = "Title: \(items[0].title)"
        txtViewNote.text = "Category: \(items[0].noteCategory)"
        txtViewNote.text = " \(items[0].noteText)"
        notesImage.image = UIImage(data:items[0].imageData)
        //let d = getDate()
        lblCreationDate.text = "Created on :   \(items[0].creationDate.formatDate())"  //needs to format date
        let location = CLLocation(latitude: items[0].latitude, longitude: items[0].longitude)

                let geocoder = CLGeocoder()
                var placemark: CLPlacemark?

                geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                  if error != nil {
        //            print("something went horribly wrong")
                  }
                  if let placemarks = placemarks {
                    placemark = placemarks.first
                    DispatchQueue.main.async {
        //              self.locationTF.text = (placemark?.locality!)
                        self.txtViewNote.text = " City: \(placemark!.locality!)"

                    }
                }
            }

        // Do any additional setup after loading the view.
    }
    

    

}
extension Date
{
    func formatDate() -> String
    {
     
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM-dd, yyyy   HH:mm:ss"
        
        return dateFormatterPrint.string(from: self)
    }
    func formatShortDate() -> String{
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM-dd, yyyy"
        
        return dateFormatterPrint.string(from: self)
    }
}
