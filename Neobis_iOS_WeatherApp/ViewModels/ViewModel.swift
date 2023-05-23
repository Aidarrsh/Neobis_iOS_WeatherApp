//
//  ViewModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Айдар Шарипов on 14/5/23.
//

import Foundation
import UIKit

protocol WeatherViewModelType {
    
    var didTapSearch: (() -> ())? { get set }
    
    var updateSearch: ((Welcome) -> ())? { get set }
    
    var onDataReceived: ((Welcome) -> Void)? { get set }
    
    func fetchWeatherData()
}

class WeatherViewModel: WeatherViewModelType {
    
    private var weatherService: WeatherService!
    private(set) var weatherData : Welcome? {
        didSet {
            self.bindWeatherViewModelToController()
        }
    }
    
    var bindWeatherViewModelToController : (() -> ()) = {}
    
    var onDataReceived: ((Welcome) -> Void)?
    
    var updateSearch: ((Welcome) -> ())?
    
    lazy var didTapSearch: (() -> ())? = { [weak self] in
//        self?.updateSearch?(self?.weatherData ?? Weather(main: Main(temp: 2.0)))
    }
    
    init() {
        self.weatherService = WeatherService()
        fetchWeatherData()
    }
    
    func fetchWeatherData() {
        weatherService.fetchWeather { (weatherData) in
            self.weatherData = weatherData
            self.updateSearch?(weatherData)
        }
    }
}
