//
//  ViewController.swift
//  NoteApp_TeamPurple_FP
//
//  Created by Avani Patel on 6/20/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate
{
    
    
   
    var dataManager : NSManagedObjectContext!
    var listArray = [NSManagedObject]()
    var items: [Note] = []
    var searchArray : [Note] = []
    var sortedArray : [Note] = []
    var issearch = false

    enum SortDetails {
        case bydate
        case bytitle
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var sortingSegment: UISegmentedControl!
    
    @IBOutlet weak var allNotesTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.allNotesTV.delegate = self;
    self.allNotesTV.dataSource = self;
    self.searchBar.delegate = self;
    let   appDelegate = UIApplication.shared.delegate as! AppDelegate;
       dataManager = appDelegate.persistentContainer.viewContext;
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = []
        searchArray = []
        sortedArray = []
        self.fetchData()
        self.allNotesTV.reloadData()
    }

    func sortNotes(plus details: SortDetails) {
        switch details {
        case .bydate:
            items.sort { $0.creationDate.compare($1.creationDate as Date) == .orderedAscending }
        case .bytitle:
            items.sort { $0.title.compare($1.title as String) == .orderedAscending }
        }
    allNotesTV.reloadData()
    }
    
    func fetchData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes");
                   do {
                       let result = try dataManager.fetch(request);
                       print(result.count)
                           listArray = result as! [NSManagedObject]
                          // print(listArray[0])
                           for item in listArray {
                               let noteData = Note();
                               
                            noteData.noteText = item.value(forKey: "text") as! String
                            noteData.title = item.value(forKey: "title") as! String
                            noteData.noteCategory = item.value(forKey: "category") as! String
                            if let imageData = item.value(forKey: "picture") as? Data{
                               noteData.imageData = imageData
                            }
                            noteData.creationDate = item.value(forKey: "creationDate") as! Date
                            noteData.longitude = item.value(forKey: "longitude") as! Double
                           noteData.latitude = item.value(forKey: "latitude") as! Double
                               items.append(noteData)
                       }
                   } catch {
       
                       print("Failed")
                   }
    }
    
    @IBAction func actionSortingSegment(_ sender: UISegmentedControl) {
        let getIndex = sortingSegment.selectedSegmentIndex
        let byTitle = items.sorted(by: { $0.title.compare($1.title) == .orderedAscending })
        let byDate = items.sorted(by: { $0.creationDate.compare($1.creationDate) == .orderedAscending })
        switch getIndex {
        case 0:
            sortedArray = byTitle
            self.sortNotes(plus: .bytitle)
            // sort by Title
            break
        case 1:
            sortedArray = byDate
            self.sortNotes(plus: .bydate)
            //sort by Date
            break
        default:
            break
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if issearch
        {  return searchArray.count;
        }else{
           return items.count;
         }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell") as! NotesCellTableViewCell
         if issearch{
             cell.notesTitle.text = "\(self.searchArray[indexPath.row].title)"
             cell.notesDate.text = "\(self.searchArray[indexPath.row].creationDate.formatShortDate())"
        }else{
             cell.notesTitle.text = "\(self.items[indexPath.row].title)"
             cell.notesDate.text = "\(self.items[indexPath.row].creationDate.formatShortDate())"
             }
         return cell
    }

}//class end


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
