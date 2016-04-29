//
//  ViewController.swift
//  pageview
//
//  Created by tsuyoshi ishikawa on 2016/03/05.
//  Copyright © 2016年 tsuyoshi ishikawa. All rights reserved.
//　test

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
	
	var pageViewController: UIPageViewController!
	var pageTitles: NSArray!
	var pageImages: NSArray!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		self.pageTitles = NSArray(objects: "Explore", "today xxxxxx", "3", "4")
		self.pageImages = NSArray(objects: "page1", "page2", "page1", "page2")
		
		self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PaveViewController") as! UIPageViewController

		self.pageViewController.dataSource = self
		
		let startVC = self.viewControllerAtIndex(0) as ContentViewController
		let viewControllers = NSArray(object: startVC)
		
		self.pageViewController.setViewControllers(viewControllers as! [UIViewController], direction: .Forward, animated: true, completion: nil)
		
		self.pageViewController.view.frame = CGRectMake(0, 100, self.view.frame.width, self.view.frame.size.height-100)
		
		self.addChildViewController(self.pageViewController)
		self.view.addSubview(self.pageViewController.view)
		self.pageViewController.didMoveToParentViewController(self)
		
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func restartAction(sender: AnyObject) {

		let startVC = self.viewControllerAtIndex(0) as ContentViewController
		let viewControllers = NSArray(object: startVC)

		self.pageViewController.setViewControllers(viewControllers as! [UIViewController], direction: .Forward, animated: true, completion: nil)
		
	}

	func viewControllerAtIndex(index: Int) ->ContentViewController{
		if(self.pageTitles.count==0||index>=self.pageTitles.count){
			return ContentViewController()
		}
		
		var vc: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
		
		vc.imageFile = self.pageImages[index] as! String
		vc.titleText = self.pageTitles[index] as! String
		vc.pageIndex = index
		
		print("index=\(index)")
		
		return vc
		
	}
	
	
	func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
		print("befreo")
		var vc = viewController as! ContentViewController
		var index = vc.pageIndex as Int
		
		if( index==0 || index == NSNotFound){
			return nil
		}
		
		index--
		
		return self.viewControllerAtIndex(index)
	}
	
	func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
		print("after")
		var vc = viewController as! ContentViewController
		var index = vc.pageIndex as Int

	
		if(index == NSNotFound){
			return nil
		}
		
		index++
		
		if(index==self.pageTitles.count){
			return nil
		}
	
		return self.viewControllerAtIndex(index)
		
	}
	
	func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
		return self.pageTitles.count
	}
	
	func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
		return 0
	}
	
	
}

