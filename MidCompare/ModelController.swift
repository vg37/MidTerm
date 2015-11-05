//
//  ModelController.swift
//  Midterm
//
//  Created by Gangisetty,Venugopal on 10/29/15.
//  Copyright © 2015 Gangisetty,Venugopal. All rights reserved.
//

import UIKit

/*
A controller object that manages a simple model -- a collection of month names.

The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.

There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
*/


class ModelController: NSObject, UIPageViewControllerDataSource {
    
    var listOfSubjects: [String] = ["IOS","Data Vis","S/W Evolution"]
    
    
    override init() {
        super.init()
        // Create the data model.
    }
    // Checks whether pageViewController exists for the index recieved as input parameter
    func viewControllerAtIndex(index: Int, storyboard: UIStoryboard) -> DataViewController? {
        // Return the data view controller for the given index.
        if (self.listOfSubjects.count == 0) || (index >= self.listOfSubjects.count) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        guard let dataViewController = storyboard.instantiateViewControllerWithIdentifier("DataViewController") as? DataViewController else{
            return nil
        }
        
        // let dataViewController = storyboard.instantiateViewControllerWithIdentifier("DataViewController") as! DataViewController
        dataViewController.listOfSubjects = self.listOfSubjects[index]
        return dataViewController
    }
    
    // Returns current index of the pageViewController
    func indexOfViewController(viewController: DataViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return listOfSubjects.indexOf(viewController.listOfSubjects!) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    // verifies the value of index for max and min,returns before pageViewController if there exists one, ;
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index--
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    //  verifies the value of index for max and min, returns after pageViewController if there exists one more pageViewController;
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if index == NSNotFound {
            return nil
        }
        
        index++
        if index == self.listOfSubjects.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
}

