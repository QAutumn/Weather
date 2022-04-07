//
//  ViewController.swift
//  Weather
//
//  Created by 澈水 on 2022/4/6.
//

import UIKit
import CoreLocation
import SnapKit


class ViewController: UIViewController {
    lazy var searchBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "magnifyingglass"), for: .normal)
        btn.tintColor = .label
        return btn
    }()
    
    lazy var tempLabel: UILabel = {
        let tempLabel = UILabel()
        tempLabel.font = UIFont.systemFont(ofSize: 30)
        return tempLabel
        
    }()
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        return icon
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    let locationManager = CLLocationManager()
    let weather = Weather()
    var qv = QueryViewController()
    
    
    //当页面加载的时候调用--系统调用，不需要我们自己调用
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()//请求授权获取当前位置
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers//设定位置精度
        locationManager.requestLocation()//请求用户位置
        setupUI()
        qv.delegate = self
    }
    
    func setupUI() {
        view.addSubview(searchBtn)
        searchBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(50)
            make.size.equalTo(50)
        }
        
        view.addSubview(tempLabel)
        tempLabel.snp.makeConstraints { make in
            make.top.equalTo(searchBtn.snp.bottom).offset(10)
            make.right.equalToSuperview().offset(50)
        }
        
        view.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(300)
        }
        
        view.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.left.equalToSuperview().offset(50)
        }
        
    }
}


