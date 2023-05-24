//
//  SearchController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Айдар Шарипов on 24/5/23.
//

import Foundation
import UIKit
import SnapKit

class SearchController : UIViewController, UITextFieldDelegate {
    
    var onSearch: ((String) -> Void)?
    
    var weatherViewModel: WeatherViewModelType = WeatherViewModel()
    
    var weekViewModel : WeekViewModelType = WeekViewModel()
    
    let gradientLayer = CAGradientLayer()
    
    let searchView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 50
        
        return view
    }()
    
    let closeButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Vector"), for: .normal)
        
        return button
    }()
    
    let textField : UITextField = {
        let field = UITextField()
        field.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)
        let placeholder = NSAttributedString(string: "SEARCH LOCATION", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 14)!])
        field.attributedPlaceholder = placeholder
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        field.leftView = leftView
        field.leftViewMode = .always
        field.layer.cornerRadius = 20
        field.returnKeyType = .search

        return field
    }()
    
    //let cityName = self.textField.text
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 48/255, green: 162/255, blue: 197/255, alpha: 1.0).cgColor,
            UIColor(red: 0/255, green: 36/255, blue: 47/255, alpha: 1.0).cgColor
        ]
        view.layer.addSublayer(gradientLayer)
        
        addToView()
        setupConstraints()
        textField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()

        if let cityName = textField.text {
            weatherViewModel.fetchWeatherData(for: cityName)
            weekViewModel.fetchWeekWeatherData(for: cityName)
                  
            onSearch?(cityName)
        } else {
            print("No city name found")
        }
         
        closeButtonTapped()
        return true
    }

    
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addToView() {
        view.addSubview(searchView)
        view.addSubview(closeButton)
        view.addSubview(textField)
    }
    
    func setupConstraints() {
        
        searchView.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.centerY)
            make.top.equalToSuperview().inset(80)
        }
        
        closeButton.snp.makeConstraints{ make in
            make.trailing.equalTo(searchView.snp.trailing).inset(15)
            make.top.equalTo(searchView.snp.top).inset(15)
            make.size.equalTo(50)
        }
        
        textField.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(50)
            make.leading.equalToSuperview().inset(50)
            make.top.equalTo(closeButton.snp.bottom)
            make.height.equalTo(40)
        }
    }
}
