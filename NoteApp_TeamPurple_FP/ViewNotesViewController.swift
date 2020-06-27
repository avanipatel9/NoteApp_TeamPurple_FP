//
//  ViewNotesViewController.swift
//  NoteApp_TeamPurple_FP
//
//  Created by Avani Patel on 6/22/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit
import CoreLocation
import AVKit

class ViewNotesViewController: UIViewController {
  
   
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var items: [Note] = [];
    @IBOutlet weak var notesImage: UIImageView!
    

    
    @IBOutlet weak var lblCreationDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = "Title: \(items[0].title)"
        lblCategory.text = "Category: \(items[0].noteCategory)"
        lblDescription.text = " \(items[0].noteText)"
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
                        self.lblCity.text = " City: \(placemark!.locality!)"

                    }
                }
            }

        // Do any additional setup after loading the view.
    }
     var isPlaying = false
    var audioPlayer : AVAudioPlayer!
    func display_alert(msg_title : String , msg_desc : String ,action_title : String)
       {
           let ac = UIAlertController(title: msg_title, message: msg_desc, preferredStyle: .alert)
           ac.addAction(UIAlertAction(title: action_title, style: .default)
           {
               (result : UIAlertAction) -> Void in
           _ = self.navigationController?.popViewController(animated: true)
           })
           present(ac, animated: true)
       }
       func getDocumentsDirectory() -> URL
       {
           let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
           let documentsDirectory = paths[0]
           return documentsDirectory
       }
    func getFileUrl() -> URL
    {
        let filename = "myRecording.m4a"
        let filePath = getDocumentsDirectory().appendingPathComponent(filename)
    return filePath
    }
    
    @IBAction func playAudio(_ sender: UIButton) {
        if(isPlaying)
        {
            audioPlayer.stop()
          //  btnRecord.isEnabled = true
           // btnPlay?.setTitle("Play", for: .normal)
            isPlaying = false
        }
        else
        {
            if FileManager.default.fileExists(atPath: getFileUrl().path)
            {
              //  btnRecord.isEnabled = false
               // btnPlay?.setTitle("pause", for: .normal)
                prepare_play()
                audioPlayer?.play()
                isPlaying = true
            }
            else
            {
                display_alert(msg_title: "Error", msg_desc: "Audio file is missing.", action_title: "OK")
            }
        }
    }
    func prepare_play()
       {
           do
           {
               audioPlayer = try AVAudioPlayer(contentsOf: getFileUrl())
               audioPlayer.delegate = self as? AVAudioPlayerDelegate
               audioPlayer.prepareToPlay()
           }
           catch{
               print("Error")
           }
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
