//
//  MainView.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Айдар Шарипов on 14/5/23.
//

import Foundation
import UIKit

class MainView : UIView {
    
    let gradientLayer = CAGradientLayer()
    
    let searchButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ant-design_search-outlined"), for: .normal)
        
        return button
    }()
    
    let dateLabel : UILabel = {
        let cLabel = UILabel()
        cLabel.text = "Add text here"
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
        view.layer.cornerRadius = 125
        
        
        return view
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
        addToView()
        constraints()
    }
    
    func addToView(){
        addSubview(searchButton)
        addSubview(dateLabel)
        addSubview(cityLabel)
        addSubview(countryLabel)
        addSubview(infoView)
    }
    
    func constraints(){
        searchButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(50)
            make.trailing.equalToSuperview().inset(25)
        }
        
        dateLabel.snp.makeConstraints{ make in
            make.top.equalTo(searchButton).inset(50)
            make.centerX.equalToSuperview()
        }
        
        cityLabel.snp.makeConstraints{ make in
            make.top.equalTo(dateLabel).inset(25)
            make.centerX.equalToSuperview()
        }
        
        countryLabel.snp.makeConstraints{ make in
            make.top.equalTo(cityLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        infoView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(countryLabel.snp.bottomMargin).offset(30)
            make.height.equalTo(250)
            make.width.equalTo(250)
        }
    }
}
