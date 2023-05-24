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
    
    func fetchWeatherData()
}

protocol WeekViewModelType {
    
    var updateWeek: ((weekWelcome) -> ())? { get set}
    
    func fetchWeekWeatherData()
}

class WeatherViewModel: WeatherViewModelType {
    
    private var weatherService: WeatherService!
    private(set) var weatherData : Welcome? {
        didSet {
            self.bindWeatherViewModelToController()
        }
    }
    
    private var weekWeatherService: WeatherService!
    private(set) var weekWeatherData : weekWelcome? {
        didSet {
            self.bindWeekWeatherViewModelController()
        }
    }
    
    var bindWeekWeatherViewModelController : (() -> ()) = {}
    
    var bindWeatherViewModelToController : (() -> ()) = {}
    
    var updateSearch: ((Welcome) -> ())?
    
    var updateWeek: ((weekWelcome) -> ())?
    
    lazy var didTapSearch: (() -> ())? = { [weak self] in
//        self?.updateSearch?(self?.weatherData ?? Weather(main: Main(temp: 2.0)))
    }
    
    init() {
        self.weatherService = WeatherService()
        self.weekWeatherService = WeatherService()
        fetchWeatherData()
        fetchWeekWeatherData()
    }
    
    func fetchWeatherData() {
        weatherService.fetchWeather { (weatherData) in
            self.weatherData = weatherData
            self.updateSearch?(weatherData)
        }
    }
    
    func fetchWeekWeatherData() {
        weekWeatherService.fetchWeekWeather{ (weekWeatherData) in
            self.weekWeatherData = weekWeatherData
            self.updateWeek?(weekWeatherData)
        }
    }
}
