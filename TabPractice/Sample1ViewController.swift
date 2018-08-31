//
//  Sample1ViewController.swift
//  TabPractice
//
//  Created by MaiInagaki on 2018/08/31.
//  Copyright © 2018年 MaiInagaki. All rights reserved.
//

import UIKit

class Sample1ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Sample1ViewController Will Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Sample1ViewController Will Disappear")
    }

}
