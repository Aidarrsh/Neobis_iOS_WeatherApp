//
//  WeatherDayview.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Айдар Шарипов on 24/5/23.
//
import Foundation
import UIKit
import SnapKit

class WeatherDayView: UIView {
    
    let tempLabel : UILabel = {
        let tempLabel = UILabel()
        tempLabel.text = "10°C"
        tempLabel.textColor = .black
        tempLabel.font = UIFont(name: "Montserrat-Regular", size: 12)
        return tempLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(tempLabel)
        tempLabel.snp.makeConstraints{ make in
            make.centerX.equalTo(snp.centerX)
            make.bottom.equalTo(snp.bottom).inset(10)
        }
    }
}
