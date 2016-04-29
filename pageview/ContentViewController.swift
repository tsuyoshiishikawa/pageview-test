//
//  ContentViewController.swift
//  pageview
//
//  Created by tsuyoshi ishikawa on 2016/03/05.
//  Copyright © 2016年 tsuyoshi ishikawa. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	
	var pageIndex: Int!
	var titleText: String!
	var imageFile: String!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		self.imageView.image = UIImage(named: self.imageFile)
		self.titleLabel.text = self.titleText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
