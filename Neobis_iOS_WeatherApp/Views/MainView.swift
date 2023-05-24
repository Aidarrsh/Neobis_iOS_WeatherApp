//
//  MainView.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Айдар Шарипов on 14/5/23.
//

import Foundation
import UIKit
import SnapKit

class MainView : UIView {
    
    let gradientLayer = CAGradientLayer()
    
    let sizeInfoView = 230
    
    let searchButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ant-design_search-outlined"), for: .normal)
        return button
    }()
    
    let dateLabel: UILabel = {
        let cLabel = UILabel()
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, dd MMMM yyyy"
        let dateString = formatter.string(from: date)
        
        cLabel.text = dateString
        cLabel.textColor = .white
        cLabel.font = .systemFont(ofSize: 14)
        
        return cLabel
    }()

    
    let cityLabel : UILabel = {
        let cLabel = UILabel()
        cLabel.text = "Add city here"
        cLabel.textColor = .white
        cLabel.font = .boldSystemFont(ofSize: 40)
        
        return cLabel
    }()
    
    let countryLabel : UILabel = {
        let cLabel = UILabel()
        cLabel.text = "Add country here"
        cLabel.textColor = .white
        cLabel.font = .systemFont(ofSize: 20)
        
        return cLabel
    }()
    
    let infoView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 50.0
        view.layer.masksToBounds = false
        return view
    }()
    
    let mainImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image 3-5")
        
        return image
    }()

    let tempLabel : UILabel = {
        let cLabel = UILabel()
        cLabel.text = "10°C"
        cLabel.font = UIFont(name: "Montserrat-Light", size: 90)
        
        return cLabel
    }()
    
    let windStatus : UILabel = {
        let cLabel = UILabel()
        cLabel.text = "Wind status"
        cLabel.font = .boldSystemFont(ofSize: 14)
        cLabel.textColor = .white
        
        return cLabel
    }()
    
    let windStatusValue : UILabel = {
        let cLabel = UILabel()
        cLabel.text = "mph"
        cLabel.font = .systemFont(ofSize: 24)
        cLabel.textColor = .white
        
        return cLabel
    }()
    
    let visibilityStatus : UILabel = {
        let cLabel = UILabel()
        cLabel.text = "Visibility"
        cLabel.font = .boldSystemFont(ofSize: 14)
        cLabel.textColor = .white
        
        return cLabel
    }()
    
    let visibilityStatusValue : UILabel = {
        let cLabel = UILabel()
        cLabel.text = "miles"
        cLabel.font = .systemFont(ofSize: 24)
        cLabel.textColor = .white
        
        return cLabel
    }()
    
    let humidityStatus : UILabel = {
        let cLabel = UILabel()
        cLabel.text = "Humidity"
        cLabel.font = .boldSystemFont(ofSize: 14)
        cLabel.textColor = .white
        
        return cLabel
    }()
    
    let humidityStatusValue : UILabel = {
        let cLabel = UILabel()
        cLabel.text = "%"
        cLabel.font = .systemFont(ofSize: 24)
        cLabel.textColor = .white
        
        return cLabel
    }()
    
    let pressureStatus : UILabel = {
        let cLabel = UILabel()
        cLabel.text = "Air pressure"
        cLabel.font = .boldSystemFont(ofSize: 14)
        cLabel.textColor = .white
        
        return cLabel
    }()
    
    let pressureStatusValue : UILabel = {
        let cLabel = UILabel()
        cLabel.text = "mb"
        cLabel.font = .systemFont(ofSize: 24)
        cLabel.textColor = .white
        
        return cLabel
    }()
    
    let weekView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 50
        
        return view
    }()
    
    let weekLabel : UILabel = {
        let cLabel = UILabel()
        cLabel.text = "The Next 5 days"
        cLabel.textColor = .black
        cLabel.font = UIFont(name: "Montserrat-Bold", size: 14)
        
        return cLabel
    }()
    
    let view1 : WeatherDayView = {
        let view = WeatherDayView()
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor(red: 212/255, green: 212/255, blue: 212/255, alpha: 1.0).cgColor
        view.layer.borderWidth = 0.8
        
        
        return view
    }()
    
    let view2 : WeatherDayView = {
        let view = WeatherDayView()
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor(red: 212/255, green: 212/255, blue: 212/255, alpha: 1.0).cgColor
        view.layer.borderWidth = 0.8
        
        
        return view
    }()
    
    let view3 : WeatherDayView = {
        let view = WeatherDayView()
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor(red: 212/255, green: 212/255, blue: 212/255, alpha: 1.0).cgColor
        view.layer.borderWidth = 0.8
        
        
        return view
    }()
    
    let view4 : WeatherDayView = {
        let view = WeatherDayView()
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor(red: 212/255, green: 212/255, blue: 212/255, alpha: 1.0).cgColor
        view.layer.borderWidth = 0.8
        
        
        return view
    }()
    
    let view5 : WeatherDayView = {
        let view = WeatherDayView()
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor(red: 212/255, green: 212/255, blue: 212/255, alpha: 1.0).cgColor
        view.layer.borderWidth = 0.8
        
        
        return view
    }()
    
    let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
    
    let day1Label : UILabel = {
        let cLabel = UILabel()
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        cLabel.text = dateFormatter.string(from: tomorrow!)
        cLabel.textColor = .black
        cLabel.font = UIFont(name: "Montserrat-Medium", size: 10)
        
        return cLabel
    }()
    
    let day2Label : UILabel = {
        let cLabel = UILabel()
        let tomorrow = Calendar.current.date(byAdding: .day, value: 2, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        cLabel.text = dateFormatter.string(from: tomorrow!)
        cLabel.textColor = .black
        cLabel.font = UIFont(name: "Montserrat-Medium", size: 10)
        
        return cLabel
    }()
    
    let day3Label : UILabel = {
        let cLabel = UILabel()
        let tomorrow = Calendar.current.date(byAdding: .day, value: 3, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        cLabel.text = dateFormatter.string(from: tomorrow!)
        cLabel.textColor = .black
        cLabel.font = UIFont(name: "Montserrat-Medium", size: 10)
        
        return cLabel
    }()
    
    let day4Label : UILabel = {
        let cLabel = UILabel()
        let tomorrow = Calendar.current.date(byAdding: .day, value: 4, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        cLabel.text = dateFormatter.string(from: tomorrow!)
        cLabel.textColor = .black
        cLabel.font = UIFont(name: "Montserrat-Medium", size: 10)
        
        return cLabel
    }()
    
    let day5Label : UILabel = {
        let cLabel = UILabel()
        let tomorrow = Calendar.current.date(byAdding: .day, value: 5, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        cLabel.text = dateFormatter.string(from: tomorrow!)
        cLabel.textColor = .black
        cLabel.font = UIFont(name: "Montserrat-Medium", size: 10)
        
        return cLabel
    }()

    let developerLabel : UILabel = {
        let cLabel = UILabel()
        cLabel.text = "Developed by @irwingb"
        cLabel.textColor = .black
        cLabel.font = UIFont(name: "Montserrat-Light", size: 14)
        
        return cLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [
            UIColor(red: 48/255, green: 162/255, blue: 197/255, alpha: 1.0).cgColor,
            UIColor(red: 0/255, green: 36/255, blue: 47/255, alpha: 1.0).cgColor
        ]
        layer.addSublayer(gradientLayer)
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        addSubview(searchButton)
        addSubview(dateLabel)
        addSubview(cityLabel)
        addSubview(countryLabel)
        addSubview(infoView)
        addSubview(mainImage)
        addSubview(tempLabel)
        addSubview(windStatus)
        addSubview(windStatusValue)
        addSubview(visibilityStatus)
        addSubview(visibilityStatusValue)
        addSubview(humidityStatus)
        addSubview(humidityStatusValue)
        addSubview(pressureStatus)
        addSubview(pressureStatusValue)
        addSubview(weekView)
        addSubview(weekLabel)
        addSubview(stackView)
        [view1, view2, view3, view4, view5].forEach { stackView.addArrangedSubview($0) }
        addSubview(day1Label)
        addSubview(day2Label)
        addSubview(day3Label)
        addSubview(day4Label)
        addSubview(day5Label)
        addSubview(developerLabel)
    }
    
    func setupConstraints(){
        searchButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(50)
            make.trailing.equalToSuperview().inset(25)
        }
        
        dateLabel.snp.makeConstraints{ make in
            make.top.equalTo(searchButton).inset(10)
            make.centerX.equalToSuperview()
        }
        
        cityLabel.snp.makeConstraints{ make in
            make.top.equalTo(dateLabel).inset(15)
            make.centerX.equalToSuperview()
        }
        
        countryLabel.snp.makeConstraints{ make in
            make.top.equalTo(cityLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        infoView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(countryLabel.snp.bottomMargin).offset(30)
            make.height.equalTo(sizeInfoView)
            make.width.equalTo(sizeInfoView)
        }
        infoView.layer.cornerRadius = CGFloat(sizeInfoView/2)
        
        mainImage.snp.makeConstraints{ make in
            make.top.equalTo(infoView.snp.top).inset(15)
            make.centerX.equalTo(infoView.snp.centerX)
            make.height.equalTo(75)
            make.width.equalTo(75)
        }
        
        tempLabel.snp.makeConstraints{ make in
            make.centerX.equalTo(infoView.snp.centerX)
            make.centerY.equalTo(infoView.snp.centerY).offset(10)
        }
        
        windStatus.snp.makeConstraints{ make in
            make.centerX.equalToSuperview().offset(-80)
            make.top.equalTo(infoView.snp.bottom).offset(20)
        }
        
        windStatusValue.snp.makeConstraints{ make in
            make.centerX.equalTo(windStatus)
            make.top.equalTo(windStatus.snp.bottom).offset(5)
        }
        
        visibilityStatus.snp.makeConstraints{ make in
            make.centerX.equalToSuperview().offset(80)
            make.top.equalTo(infoView.snp.bottom).offset(20)
        }
        
        visibilityStatusValue.snp.makeConstraints{ make in
            make.centerX.equalTo(visibilityStatus)
            make.top.equalTo(visibilityStatus.snp.bottom).offset(5)
        }
        
        humidityStatus.snp.makeConstraints{ make in
            make.centerX.equalTo(windStatus)
            make.top.equalTo(windStatusValue.snp.bottom).offset(20)
        }
        
        humidityStatusValue.snp.makeConstraints{ make in
            make.centerX.equalTo(humidityStatus)
            make.top.equalTo(humidityStatus.snp.bottom).offset(5)
        }
        
        pressureStatus.snp.makeConstraints{ make in
            make.centerX.equalTo(visibilityStatus)
            make.top.equalTo(visibilityStatusValue.snp.bottom).offset(20)
        }
        
        pressureStatusValue.snp.makeConstraints{ make in
            make.centerX.equalTo(visibilityStatus)
            make.top.equalTo(pressureStatus.snp.bottom).offset(5)
        }
        
        weekView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.top.equalTo(humidityStatusValue.snp.bottom).offset(30)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        weekLabel.snp.makeConstraints{ make in
            make.top.equalTo(weekView.snp.top).inset(50)
            make.leading.equalTo(weekView.snp.leading).inset(12)
        }
        
        stackView.snp.makeConstraints{ make in
            make.bottom.equalTo(weekView.snp.bottom).inset(100)
            make.height.equalTo(80)
            make.leading.equalTo(weekView.snp.leading).inset(10)
            make.trailing.equalTo(weekView.snp.trailing).inset(10)
//            make.top.equalTo(weekLabel.snp.bottom).offset(40)
        }
        
        day1Label.snp.makeConstraints{ make in
            make.bottom.equalTo(view1.snp.top).offset(-5)
            make.centerX.equalTo(view1.snp.centerX)
        }
        
        day2Label.snp.makeConstraints{ make in
            make.bottom.equalTo(view2.snp.top).offset(-5)
            make.centerX.equalTo(view2.snp.centerX)
        }
        
        day3Label.snp.makeConstraints{ make in
            make.bottom.equalTo(view3.snp.top).offset(-5)
            make.centerX.equalTo(view3.snp.centerX)
        }
        
        day4Label.snp.makeConstraints{ make in
            make.bottom.equalTo(view4.snp.top).offset(-5)
            make.centerX.equalTo(view4.snp.centerX)
        }
        
        day5Label.snp.makeConstraints{ make in
            make.bottom.equalTo(view5.snp.top).offset(-5)
            make.centerX.equalTo(view5.snp.centerX)
        }
        
        developerLabel.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(30)
        }
    }
}
