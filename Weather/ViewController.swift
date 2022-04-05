//
//  ViewController.swift
//  Weather
//
//  Created by 澈水 on 2022/4/5.
//

import UIKit

class ViewController: UIViewController {

    lazy var searchButton: UIButton = makeSearchButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func makeSearchButton() -> UIButton {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "magnifyingglass.circle"), for: .normal)
        return btn 
    }
}

