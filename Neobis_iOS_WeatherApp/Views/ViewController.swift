//
//  ViewController.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Айдар Шарипов on 14/5/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var weatherViewModel: WeatherViewModel!
    let mainView = MainView()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            weatherViewModel = WeatherViewModel()
            weatherViewModel.bindWeatherViewModelToController = {
                // update UI with weatherData
                DispatchQueue.main.async {
                    //TODO
                }
            }
            
            addMainView()
        }
    
    func addMainView(){
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
    }
}

