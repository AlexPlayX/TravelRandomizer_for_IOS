//
//  HistoryView.swift
//  TrevalRandomizer_IOS
//
//  Created by Alexey on 11/21/19.
//  Copyright © 2019 Алексей. All rights reserved.
//

import Foundation
import UIKit
import CoreData

var indexTap:Int = 0

class HistoryView:ViewController, UITableViewDataSource, UITableViewDelegate{


   // var description: String = ""


        var placeList = [PlaseListData]()
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeList.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellMas
        let place = placeList[indexPath.row]
        cell.title.text = place.value(forKey: "contry") as? String
        cell.sub.text = place.value(forKey: "city") as? String
        return cell
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if editingStyle == .delete {

            context.delete(placeList[indexPath.row])
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do {
                placeList = try context.fetch(PlaseListData.fetchRequest())
            } catch let error as NSError {
                print("Could not save\(error),\(error.userInfo)")
            }
            tableView.reloadData()
        }
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       indexTap=indexPath.row
        print(indexTap)
    }
    public func savePlace(contry:String,info:String,image:String) {
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let place = PlaseListData(entity: PlaseListData.entity(), insertInto: context)
            place.setValue(contry, forKey: "contryData")
            place.setValue(info, forKey: "infoData")
            place.setValue(image, forKey: "imageData")
            do{
                try context.save()
                placeList.append(place)
            } catch let error as NSError {
                print("Could not save\(error),\(error.userInfo)")
            }

    }


    override func viewDidLoad() {
        super.viewDidLoad()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        do {
            let result = try context.fetch(PlaseListData.fetchRequest())
            placeList = result as![PlaseListData]
        } catch let error as NSError {
            print("Could not save\(error),\(error.userInfo)")
        }

        //        tableView.reloadData()
    }
}
