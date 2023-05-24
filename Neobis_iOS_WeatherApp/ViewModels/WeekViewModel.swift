//
//  WeekViewModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Айдар Шарипов on 24/5/23.
//

import Foundation
import UIKit

class WeekViewModel: WeekViewModelType {
    
    private var weekWeatherService: WeatherService!
    private(set) var weekWeatherData : weekWelcome? {
        didSet {
            self.bindWeekWeatherViewModelToController()
        }
    }
    
    var bindWeekWeatherViewModelToController : (() -> ()) = {}
    
    var updateWeek: ((weekWelcome) -> ())?
    
    init() {
        self.weekWeatherService = WeatherService()
        fetchWeekWeatherData()
    }
    
    func fetchWeekWeatherData() {
        weekWeatherService.fetchWeekWeather{ (weekWeatherData) in
            self.weekWeatherData = weekWeatherData
            self.updateWeek?(weekWeatherData)
        }
    }
}
