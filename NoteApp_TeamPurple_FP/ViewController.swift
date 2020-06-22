//
//  ViewController.swift
//  NoteApp_TeamPurple_FP
//
//  Created by Avani Patel on 6/20/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate
{
   
    var dataManager : NSManagedObjectContext!
    var listArray = [NSManagedObject]()
    var items: [Note] = []
    var searchArray : [Note] = []
    var sortedArray : [Note] = []
    var issearch = false

    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    @IBOutlet weak var allNotesTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.allNotesTV.delegate = self;
         self.allNotesTV.dataSource = self;
         self.searchBar.delegate = self;
         let   appDelegate = UIApplication.shared.delegate as! AppDelegate;
            dataManager = appDelegate.persistentContainer.viewContext;
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           <#code#>
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           <#code#>
       }

}//class end

