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
    var annotationCollection=[MKAnnotation]()
    
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
        
        for (index ,i) in items.enumerated(){
            print(index)
            print(i.latitude)
            print(i.longitude)
            
            let location=CLLocation(latitude: i.latitude, longitude: i.longitude)
            let myAnnotation=MKPointAnnotation()
            myAnnotation.coordinate=location.coordinate
            myAnnotation.title="\(i.title)"
            annotationCollection.append(myAnnotation);
            self.mapView.addAnnotation(myAnnotation);
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier="marker"
        var view:MKMarkerAnnotationView
        
        if let dequeuedView=mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView{
            dequeuedView.annotation=annotationCollection as? MKAnnotation;
            view=dequeuedView
        }
    }
}
