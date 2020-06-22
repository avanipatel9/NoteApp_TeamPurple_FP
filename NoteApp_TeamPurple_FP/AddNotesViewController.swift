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
    
    
    @IBOutlet weak var txtCategory: UITextField!
    
    @IBOutlet weak var btnAddImage: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var addVoiceBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
