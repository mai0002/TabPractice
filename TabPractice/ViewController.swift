//
//  ViewController.swift
//  TabPractice
//
//  Created by MaiInagaki on 2018/08/31.
//  Copyright © 2018年 MaiInagaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Property
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private lazy var sample1ViewController: Sample1ViewController = {
        let storyborad = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyborad.instantiateViewController(withIdentifier: "Sample1ViewController") as! Sample1ViewController
        add(asChildViewController: viewController)
        return viewController
    }()
    
    private lazy var sample2ViewController: Sample2ViewController = {
        let storyborad = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyborad.instantiateViewController(withIdentifier: "Sample2ViewController") as! Sample2ViewController
        add(asChildViewController: viewController)
        return viewController
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - View Methods
    
    private func setupView() {
        updateView()
    }
    
    private func updateView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            remove(asChildViewController: sample2ViewController)
            add(asChildViewController: sample1ViewController)
        } else {
            remove(asChildViewController: sample1ViewController)
            add(asChildViewController: sample2ViewController)
        }
    }
    
    // MARK: - Action
    
    @IBAction func tapSegmentedControl(_ sender: UISegmentedControl) {
        updateView()
    }
    
    // MARK: - Child View Controller Operation Methods
    
    private func add(asChildViewController viewController: UIViewController) {
        // 子ViewControllerを追加
        addChildViewController(viewController)
        // Subviewとして子ViewControllerのViewを追加
        view.addSubview(viewController.view)
        // 子Viewの設定
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // 子View Controllerへの通知
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // 子View Controllerへの通知
        viewController.willMove(toParentViewController: nil)
        // 子ViewをSuperviewから削除
        viewController.view.removeFromSuperview()
        // 子View Controllerへの通知
        viewController.removeFromParentViewController()
    }
    
}
