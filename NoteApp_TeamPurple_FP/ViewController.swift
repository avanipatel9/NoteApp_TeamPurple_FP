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

    func sortNotes(plus details: SortDetails) {
        switch details {
        case .bydate:
            items.sort { $0.creationDate.compare($1.creationDate as Date) == .orderedAscending }
        case .bytitle:
            items.sort { $0.title.compare($1.title as String) == .orderedAscending }
        }
    allNotesTV.reloadData()
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
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

}//class end

