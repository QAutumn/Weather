//
//  QueryViewController.swift
//  Weather
//
//  Created by 澈水 on 2022/4/6.
//

import UIKit
import SnapKit

protocol QueryViewControllerDelegate {
    func didChangeCity(city: String)
}

class QueryViewController: UIViewController {
    
    var delegate: QueryViewControllerDelegate?
    
    lazy var titleLabel:UILabel = {
        let title = UILabel()
        title.text = "请输入要查询的城市"
        title.font = UIFont.systemFont(ofSize: 40)
        return title
    }()
    
    lazy var textField: UITextField = {
        UITextField()
    }()
    
    lazy var searchBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("搜索🔍", for: .normal)
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchBtn.addTarget(self, action: #selector(queryWeather), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
        }
        
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(50)
        }
        
        view.addSubview(searchBtn)
        searchBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(50)
            make.height.equalTo(20)
            make.width.equalTo(50)
        }
        
    }
    
    @objc func queryWeather(){
        if let text = textField.text {
            delegate?.didChangeCity(city: text)
        }
    }
}
