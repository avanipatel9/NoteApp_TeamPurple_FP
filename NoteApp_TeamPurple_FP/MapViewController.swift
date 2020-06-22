//
//  MapViewController.swift
//  NoteApp_TeamPurple_FP
//
//  Created by user176498 on 6/22/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit
import MapKit
import CoreData
import CoreLocation

class MapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    var listArray=[NSManagedObject]()
    var items:[Note]=[];
    let locationManager=CLLocationManager()
    var dataManager:NSManagedObjectContext!
    var annonationCollection=[MKAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.delegate=self
        mapView.showsUserLocation=true
        
        let appDelegate=UIApplication.shared.delegate as! AppDelegate;
        dataManager=appDelegate.persistentContainer.viewContext
        
        readData();
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func readData(){
        
        let request=NSFetchRequest<NSFetchRequestResult>(entityName: "Notes");
        do {
            let result=try dataManager.fetch(request);
            print(result.count)
            
            listArray=result as! [NSManagedObject]
            print(listArray.count)
            
            for item in listArray{
                
                let noteModel=Note()
                noteModel.title=item.value(forKey: "title") as! String
                noteModel.noteText=item.value(forKey: "text") as! String
                noteModel.latitude=item.value(forKey: "latitude") as! Double
                noteModel.longitude=item.value(forKey: "longitude") as! Double
                items.append(noteModel)
            }
        
        } catch {
            print("FAILED")
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
