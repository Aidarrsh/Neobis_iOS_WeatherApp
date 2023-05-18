//
//  ViewModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Айдар Шарипов on 14/5/23.
//

import Foundation
import UIKit

class WeatherViewModel {
    private var weatherService: WeatherService!
    private(set) var weatherData : Weather! {
        didSet {
            self.bindWeatherViewModelToController()
        }
    }
    
    var bindWeatherViewModelToController : (() -> ()) = {}
    
    init() {
        self.weatherService = WeatherService()
        fetchWeatherData()
    }
    
    func fetchWeatherData() {
        weatherService.fetchWeather { (weatherData) in
            self.weatherData = weatherData
        }
    }
}
