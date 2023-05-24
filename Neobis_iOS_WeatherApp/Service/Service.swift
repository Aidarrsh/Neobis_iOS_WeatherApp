//
//  Service.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Айдар Шарипов on 14/5/23.
//

import Foundation


class WeatherService {
    let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=London&appid=d082522b3afe9b359032ed4b0119d10a&units=metric")
    
    let weekUrl = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=London&appid=d082522b3afe9b359032ed4b0119d10a&units=metric")
    
    func fetchWeather(completion: @escaping (Welcome) -> ()) {
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                print("Data Task Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let weather = try JSONDecoder().decode(Welcome  .self, from: data)
                completion(weather)
            } catch {
                print("falied to convert \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func fetchWeekWeather(completion: @escaping (weekWelcome) -> ()) {
        
        URLSession.shared.dataTask(with: weekUrl!) { (data, response, error) in
            if let error = error {
                print("Data Task Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let weather = try JSONDecoder().decode(weekWelcome  .self, from: data)
                completion(weather)
            } catch {
                print("falied to convert week \(error.localizedDescription)")
            }
        }.resume()
    }
}
