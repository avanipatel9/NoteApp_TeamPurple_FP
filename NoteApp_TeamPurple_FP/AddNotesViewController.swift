//
//  AddNotesViewController.swift
//  NoteApp_TeamPurple_FP
//
//  Created by user174608 on 6/20/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

class AddNotesViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource,UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate{
    
   
    
    var locationManager: CLLocationManager!
       var dataManager : NSManagedObjectContext!
       var listArray = [NSManagedObject]()
       var lat: Double!
       var long: Double!
       var textString = String()
       var txtTitle = String()
       var txtnoteCategory = String()
       var categoryPickerData: [String] = [String]()
       var noteDate = Date()
       var imagePicker = UIImagePickerController()
       var imageData = Data()

    @IBOutlet weak var txtAdd: UITextView!
    
    @IBOutlet weak var edtTitle: UITextField!
    
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var txtCategory: UITextField!
    
    @IBOutlet weak var btnAddImage: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var addVoiceBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
                  dataManager = appDelegate.persistentContainer.viewContext;
                  categoryPickerData = ["Work", "Home", "School", "Miscellaneous", "Sports", "Others", "None"]
                  self.categoryPicker.delegate = self
                  self.categoryPicker.dataSource = self

                  categoryPicker.isHidden = true;

                  txtCategory.text = "\(categoryPickerData[6])"
                  txtCategory.isUserInteractionEnabled = false
        
                  noteDate = getDate()
        
              if (CLLocationManager.locationServicesEnabled())
              {
                  locationManager = CLLocationManager()
                  locationManager.delegate = self
                  locationManager.desiredAccuracy = kCLLocationAccuracyBest
                  locationManager.requestAlwaysAuthorization()
                  locationManager.startUpdatingLocation()
                  
              }
    }
    
    func getDate() -> Date{
           let date = Date();
               let dateFormatter = DateFormatter()
               dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
               dateFormatter.locale = NSLocale.current
               dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss" //Specify your format that you want
           
               let strDate = dateFormatter.string(from: date)
           let d = dateFormatter.date(from: strDate)
           return d!
       }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryPickerData.count
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} //class end
