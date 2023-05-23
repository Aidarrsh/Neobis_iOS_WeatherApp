//
//  ViewController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Айдар Шарипов on 14/5/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var weatherViewModel: WeatherViewModelType!
    let mainView = MainView()
    
    var weatherModel: Welcome? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                if let viewController = self {
                    viewController.updateUI()
                }
            }
        }
    }
    
    init(vm: WeatherViewModelType) {
        weatherViewModel = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherViewModel.updateSearch = { [weak self] weather in
            self?.weatherModel = weather
        }
        
        addMainView()
        mainView.searchButton.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
    }
    
    func addMainView() {
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func searchTapped() {
        weatherViewModel.didTapSearch?()
        print("button works")
    }
    
    func updateUI() {
        guard let weatherModel = weatherModel else { return }
        let intTemp: Int = Int(round(weatherModel.main.temp))
        mainView.tempLabel.text = "\(intTemp)°C"
        mainView.cityLabel.text = weatherModel.name
        mainView.countryLabel.text = weatherModel.sys.country
        mainView.windStatusValue.text = "\(Int(weatherModel.wind.speed)) mph"
        mainView.humidityStatusValue.text = "\(weatherModel.main.humidity)%"
        mainView.visibilityStatusValue.text = "\((weatherModel.visibility) / 1760) miles"
        mainView.pressureStatusValue.text = "\(weatherModel.main.pressure) mb"
    }
}
