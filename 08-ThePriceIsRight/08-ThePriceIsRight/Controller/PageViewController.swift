//
//  PageViewController.swift
//  08-ThePriceIsRight
//
//  Created by Macabuku on 12/1/19.
//  Copyright © 2019 Macabuku. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    lazy var pageViewControllers: [UIViewController] = {
        return [self.createNewViewController(name: "RoomsVC"),
                self.createNewViewController(name: "BathsVC"),
                self.createNewViewController(name: "CarsVC"),
                self.createNewViewController(name: "YearVC"),
                self.createNewViewController(name: "SizeVC"),
                self.createNewViewController(name: "ConditionVC")]
        
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        
        if let firstVC = self.pageViewControllers.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
    
    func createNewViewController(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:name)
        
    }
    
    

    
    
    //MARK: Métodos de UIPageViewController Data Source para saber los VC de antes y después
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = self.pageViewControllers.index(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        
        if previousIndex >= 0 {
            return self.pageViewControllers[previousIndex]
        }
        return nil
    }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = self.pageViewControllers.index(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        
        if nextIndex < self.pageViewControllers.count {
            return self.pageViewControllers[nextIndex]
        }
        return nil
    }
    

}
