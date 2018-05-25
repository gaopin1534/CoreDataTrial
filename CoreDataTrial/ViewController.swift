//
//  ViewController.swift
//  CoreDataTrial
//
//  Created by 高松　幸平 on 2018/05/25.
//  Copyright © 2018年 gaopin1534. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let moc = appDelegate.persistentContainer.viewContext
        let moc2 = pc().viewContext
        let entity = Person(context: moc)
        entity.name = "alpha"
        entity.age = 20
        print(try! moc.fetch(NSFetchRequest<Person>(entityName: "Person")))
        try! moc.save()
        print(try! moc2.fetch(NSFetchRequest<Person>(entityName: "Person")))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func pc() -> NSPersistentContainer {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "CoreDataTrial")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }

}

