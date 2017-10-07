//
//  MealTableViewController.swift
//  apple_tutorial
//
//  Created by 大友一樹 on 2017/10/04.
//  Copyright © 2017年 大友一樹. All rights reserved.
//

import UIKit
import os.log
import Firebase

class TestTableViewController: UITableViewController {
    
    // MARK: Properties
    var articles = [Article]()
    
        var ref: DatabaseReference!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("start load db")
        ref = Database.database().reference().child("article")
        
        ref.observe(.childAdded, with: { snapshot in
            
            let x = snapshot.value as! Dictionary<String, String>
            let t: String = x["title"] ?? "No title"
            let c: String = x["content"] ?? "No content"
            
            guard let art = Article(title: t, content: c) else {
                fatalError("Unable to instantiate art")
            }
            print("test")
            self.articles += [art]
            self.tableView.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
        print("end fetch")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
//        navigationItem.leftBarButtonItem = editButtonItem
            print("first")
//            loadArticles()
//        if let savedMeals = loadMeals() {
//            meals += savedMeals
//        }
//        else {
//            // Load the sample data
//            loadSampleMeals()
//        }

        ///////////// Firebase test //////////////
//        print("_________firebase proessed___________")
//        ref = Database.database().reference()
//
//        // 子ノード condition への参照
//        let raw_articles = self.ref.child("article")
//        print(raw_articles)
//
////        let userID = FIRAuth.auth()?.currentUser?.uid
//
////        ref.child("article").child("1").observeSingleEvent(of: .value, with: { (snapshot) in
////            print(snapshot)
////        })
//
//        ref.child("article").observeSingleEvent(of: .value, with: { (snapshot) in
////            print(String(describing: type(of: snapshot)))
////            print(String(describing: type(of: snapshot.value)))
////            if let snap = snapshot.value as? NSArray {
////            let snap = snapshot.value as! NSArray
////            print(String(describing: type(of: snap)))
//            for x in snapshot.value as! [Dictionary<String, String>] {
////                print(String(describing: type(of: x)))
////                print(x["title"])
////                let art = x as! NSDictionary
//                let t: String = x["title"] ?? "No title"
//                let c: String = x["title"] ?? "No content"
////                let t = x["title"] as! String
////                let c = x["content"] as! String
//                print(t, c)
//
//            }
//        }) { (error) in
//            print(error.localizedDescription)
//        }
        
                // クラウド上で、ノード condition に変更があった場合のコールバック処理
//                conditionRef.observe(.value) { (snap: DataSnapshot) in
//                    print("ノードの値が変わりました！: \((snap.value as AnyObject).description)")
//                }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Actions
//    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
//        if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
//
//            if let selectedIndexPath = tableView.indexPathForSelectedRow {
//                // Update an existing meal.
//                meals[selectedIndexPath.row] = meal
//                tableView.reloadRows(at: [selectedIndexPath], with: .none)
//            }
//            else {
//                saveMeals()
//
//
//                // Add a new meal.
//                let newIndexPath = IndexPath(row: meals.count, section: 0)
//
//                meals.append(meal)
//                tableView.insertRows(at: [newIndexPath], with: .automatic)
//            }
//
//            // Save the meals
//            saveMeals()
//
//        }
//
//    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
//        loadArticles()
        print("test article count", articles.count)
        return articles.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        print("test2")
        
        let cellIdentifier = "testTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TestTableViewCell  else {
            fatalError("The dequeued cell is not an instance of TestTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let article = articles[indexPath.row]
        
        cell.title.text = article.title
        cell.content.text = article.content
//        cell.ratingControl.rating = meal.rating
        
        return cell
    }
    
//     MARK: Private function
    private func loadArticles() {
        print("start load db")
        ref = Database.database().reference().child("article")
        
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            for x in snapshot.value as! [Dictionary<String, String>] {
                let t: String = x["title"] ?? "No title"
                let c: String = x["content"] ?? "No content"

                guard let art = Article(title: t, content: c) else {
                    fatalError("Unable to instantiate art")
                }
                print("test")
                self.articles += [art]
            }

            self.tableView.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
        print("end fetch")

    }
    
    private func saveMeals() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(articles, toFile: Meal.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Meals successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save meals...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadMeals() -> [Meal]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Meal.ArchiveURL.path) as? [Meal]
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            articles.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the tab   le view
        }
    }
    
    
    
     // Override to support rearranging the table view.
//     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//        print("sync")
//       DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(5), execute: {tableView.reloadData()})
//     }
//
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        super.prepare(for: segue, sender: sender)
//
//        switch(segue.identifier ?? "") {
//
//        case "AddItem":
//            os_log("Adding a new meal.", log: OSLog.default, type: .debug)
//        case "ShowDetail":
//            guard let mealDetailViewController = segue.destination as? MealViewController else {
//                fatalError("Unexpected destination: \(segue.destination)")
//            }
//
//            guard let selectedMealCell = sender as? MealTableViewCell else {
//                fatalError("Unexpected sender: \(String(describing: sender))")
//            }
//
//            guard let indexPath = tableView.indexPath(for: selectedMealCell) else {
//                fatalError("The selected cell is not being displayed by the table")
//            }
//
//            let selectedMeal = meals[indexPath.row]
//            mealDetailViewController.meal = selectedMeal
//        default:
//            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
//        }
//    }
    
    
    
    
}

