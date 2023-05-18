//
//  WeatherModel.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Айдар Шарипов on 14/5/23.
//

import Foundation


struct Weather: Codable {
    let main: Main
}

struct Main: Codable {
    let temp: Double
}


//pass to tableView or CollectionView
