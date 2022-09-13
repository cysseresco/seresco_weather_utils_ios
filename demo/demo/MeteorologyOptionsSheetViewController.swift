//
//  MeteorologyOptionsSheetViewController.swift
//  garrigues
//
//  Created by Diego Salcedo on 11/09/22.
//  Copyright © 2022 Seresco. All rights reserved.
//


import UIKit
import CoreLocation

public protocol MeteorologyOptionsDelegate {
    func selectMeteorologyOption(meteorologyType: MeteorologyType, coordinate: CLLocationCoordinate2D)
}

public class MeteorologyOptionsSheetViewController: UIViewController {
    
    // MARK: - UI Components
    let clearView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let containerView: UIView = {
        let view = UIView()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bottomSheetDecoration: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 2.5
        view.backgroundColor = UIColor.bottomSheetDecorationColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(24)
        label.text = "Seleccione una opción"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let optionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        stackView.axis = .vertical
        return stackView
    }()
    let humidityLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.text = "   Humedad"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let precipitationLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.text = "   Precipitación"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let weatherTodayLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.text = "   Clima Hoy"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let weatherTomorrowLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.text = "   Clima Hoy y Mañana"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let weatherWeeklyLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.text = "   Clima Semanal"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let windLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.text = "   Viento"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var atSixProgressViewHeightAnchor: NSLayoutConstraint?
    var atTwelveProgressViewHeightAnchor: NSLayoutConstraint?
    var atEighteenProgressViewHeightAnchor: NSLayoutConstraint?
    var atTwentyFourProgressViewHeightAnchor: NSLayoutConstraint?
    var humidityStackViewHeightAnchor: NSLayoutConstraint?

    
    // MARK: - Class Properties
    var delegate: MeteorologyOptionsDelegate?
    var coordinates: CLLocationCoordinate2D?

    // MARK: - View Life Cycle
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        containerView.layer.cornerRadius = 13
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraints()
        setupInteractions()
        setupData()
    }
    
    func setupData() {
        
    }
    
    func setupInteractions() {
        clearView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissView)))
        
        let precipitationGesture = MeterologyTypeTapGesture(target: self, action: #selector(self.meteorologyOptionTapped))
        precipitationGesture.meteorologyType = .PRECIPITATION
        precipitationLabel.isUserInteractionEnabled = true
        precipitationLabel.addGestureRecognizer(precipitationGesture)
        
        let humidityGesture = MeterologyTypeTapGesture(target: self, action: #selector(self.meteorologyOptionTapped))
        humidityGesture.meteorologyType = .HUMIDITY
        humidityLabel.isUserInteractionEnabled = true
        humidityLabel.addGestureRecognizer(humidityGesture)
        
        let weatherTodayGesture = MeterologyTypeTapGesture(target: self, action: #selector(self.meteorologyOptionTapped))
        weatherTodayGesture.meteorologyType = .WEATHER_TODAY
        weatherTodayLabel.isUserInteractionEnabled = true
        weatherTodayLabel.addGestureRecognizer(weatherTodayGesture)
        
        let weatherTomorrowGesture = MeterologyTypeTapGesture(target: self, action: #selector(self.meteorologyOptionTapped))
        weatherTomorrowGesture.meteorologyType = .WEATHER_TOMORROW
        weatherTomorrowLabel.isUserInteractionEnabled = true
        weatherTomorrowLabel.addGestureRecognizer(weatherTomorrowGesture)
        
        let weatherWeeklyGesture = MeterologyTypeTapGesture(target: self, action: #selector(self.meteorologyOptionTapped))
        weatherWeeklyGesture.meteorologyType = .WEATHER_WEEKLY
        weatherWeeklyLabel.isUserInteractionEnabled = true
        weatherWeeklyLabel.addGestureRecognizer(weatherWeeklyGesture)
        
        let windGesture = MeterologyTypeTapGesture(target: self, action: #selector(self.meteorologyOptionTapped))
        windGesture.meteorologyType = .WIND
        windLabel.isUserInteractionEnabled = true
        windLabel.addGestureRecognizer(windGesture)
    }
    
    func setupView(prediction: MunicipalityPrediction) {
        
    }
   
    func setupLayout() {
        view.addSubview(clearView)
        view.addSubview(containerView)
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(optionsStackView)
        
        optionsStackView.addArrangedSubview(humidityLabel)
        optionsStackView.addArrangedSubview(precipitationLabel)
        optionsStackView.addArrangedSubview(weatherTodayLabel)
        optionsStackView.addArrangedSubview(weatherTomorrowLabel)
        optionsStackView.addArrangedSubview(weatherWeeklyLabel)
        optionsStackView.addArrangedSubview(windLabel)
    }
    
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            clearView.topAnchor.constraint(equalTo: view.topAnchor),
            clearView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            clearView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            clearView.bottomAnchor.constraint(equalTo: containerView.topAnchor),
            
            containerView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            optionsStackView.topAnchor.constraint(greaterThanOrEqualTo: titleLabel.bottomAnchor, constant: 16),
            optionsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            optionsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            optionsStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30),
            
            humidityLabel.heightAnchor.constraint(equalToConstant: 40),
            precipitationLabel.heightAnchor.constraint(equalToConstant: 40),
            weatherTodayLabel.heightAnchor.constraint(equalToConstant: 40),
            weatherTomorrowLabel.heightAnchor.constraint(equalToConstant: 40),
            weatherWeeklyLabel.heightAnchor.constraint(equalToConstant: 40),
            containerView.heightAnchor.constraint(equalToConstant: 410),
        ])
    }
    
    
    // MARK: - Interaction Handling
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func meteorologyOptionTapped(sender: MeterologyTypeTapGesture) {
        let type = sender.meteorologyType
        if let coords = coordinates {
            dismiss(animated: true, completion: nil)
            delegate?.selectMeteorologyOption(meteorologyType: type, coordinate: coords)
        }
        
    }
}

class MeterologyTypeTapGesture: UITapGestureRecognizer {
    var meteorologyType: MeteorologyType = .PRECIPITATION
}
