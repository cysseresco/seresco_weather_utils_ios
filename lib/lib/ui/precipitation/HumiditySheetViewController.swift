//
//  WeatherTodaySheetViewController.swift
//  garrigues
//
//  Created by Diego Salcedo on 10/09/22.
//  Copyright © 2022 Seresco. All rights reserved.
//

import UIKit

public class HumiditySheetViewController: UIViewController {
    
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
        label.text = "Municipality"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "Province"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let currentTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(44)
        label.text = "14°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let currentTemperatureImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ic_clear")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let backgroundTemperatures: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.bottomSheetDecorationColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let humidityStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 72
        stackView.axis = .horizontal
        return stackView
    }()
    
    let atSixHumidityView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let atSixTimeLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "06:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let atSixHumidityProgressView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainColor
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let atSixHumidityLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "58%"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let atEighteenHumidityView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let atEighteenTimeLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "18:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let atEighteenHumidityProgressView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainColor
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let atEighteenHumidityLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "58%"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let atTwelveHumidityView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let atTwelveTimeLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "12:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let atTwelveHumidityProgressView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainColor
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let atTwelveHumidityLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "58%"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let atTwentyFourHumidityView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let atTwentyFourTimeLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "24:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let atTwentyFourHumidityProgressView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainColor
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let atTwentyFourHumidityLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "58%"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.isHidden = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    var atSixProgressViewHeightAnchor: NSLayoutConstraint?
    var atTwelveProgressViewHeightAnchor: NSLayoutConstraint?
    var atEighteenProgressViewHeightAnchor: NSLayoutConstraint?
    var atTwentyFourProgressViewHeightAnchor: NSLayoutConstraint?
    var humidityStackViewHeightAnchor: NSLayoutConstraint?

    
    // MARK: - Class Properties
    var municipalityId = ""

    // MARK: - View Life Cycle
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        containerView.layer.cornerRadius = 13
        backgroundTemperatures.layer.cornerRadius = 16
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraints()
        setupInteractions()
        setupData()
    }
    
    func setupData() {
        self.showLoading()
        MeteorologyApi.getWeatherPredictionsKey(municipalityId: municipalityId) { result in
            self.hideLoading()
            self.setupView(prediction: result)
        }
    }
    
    func setupInteractions() {
        clearView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissView)))
    }
    
    func setupView(prediction: MunicipalityPrediction) {
        // loading flow
        titleLabel.text = prediction.name
        subtitleLabel.text = prediction.province
        //todo:: first or [1]
        let todayPrediction = prediction.prediction.days[1]
        let items = todayPrediction.getWeatherItems()
        setupHumidityInfo(items: todayPrediction.relativeHumidity.data)
        setCurrentTemperature(items: items)
    }
   
    func setCurrentTemperature(items: [TemperatureItem]) {
        //todo::with current time hour
        let currentTemperature = items[0]
        currentTemperatureLabel.text = "\(currentTemperature.value)°"
        currentTemperatureImage.image = UIImage(named: currentTemperature.skyStatus?.getWeatherIcon() ?? "")
    }
    
    func setupHumidityInfo(items: [TemperatureItem]) {
        let values = items.filter { $0.time == 6 || $0.time == 12 || $0.time == 18 || $0.time == 24 }
        
        let atSixHumidity = values[0].value
        let atTwelveHumidity = values[1].value
        let atEighteenHumidity = values[2].value
        let atTwentyFourHumidity = values[3].value
        let higherHumidity = [atSixHumidity, atTwelveHumidity, atEighteenHumidity, atTwentyFourHumidity].max() ?? 999
        
        atSixHumidityLabel.text = "\(atSixHumidity)%"
        atTwelveHumidityLabel.text = "\(atTwelveHumidity)%"
        atEighteenHumidityLabel.text = "\(atEighteenHumidity)%"
        atTwentyFourHumidityLabel.text = "\(atTwentyFourHumidity)%"
        
        atSixProgressViewHeightAnchor?.constant = CGFloat(atSixHumidity)
        atTwelveProgressViewHeightAnchor?.constant = CGFloat(atTwelveHumidity)
        atEighteenProgressViewHeightAnchor?.constant = CGFloat(atEighteenHumidity)
        atTwentyFourProgressViewHeightAnchor?.constant = CGFloat(atTwentyFourHumidity)
        humidityStackViewHeightAnchor?.constant = CGFloat(higherHumidity + 64)
    }
    
    func setupLayout() {
        view.addSubview(clearView)
        view.addSubview(containerView)
        
        containerView.addSubview(bottomSheetDecoration)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subtitleLabel)
        containerView.addSubview(currentTemperatureLabel)
        containerView.addSubview(currentTemperatureImage)
        containerView.addSubview(backgroundTemperatures)
        containerView.addSubview(activityIndicator)
        
        backgroundTemperatures.addSubview(humidityStackView)
        
        humidityStackView.addArrangedSubview(atSixHumidityView)
        humidityStackView.addArrangedSubview(atTwelveHumidityView)
        humidityStackView.addArrangedSubview(atEighteenHumidityView)
        humidityStackView.addArrangedSubview(atTwentyFourHumidityView)
        
        atSixHumidityView.addSubview(atSixTimeLabel)
        atSixHumidityView.addSubview(atSixHumidityLabel)
        atSixHumidityView.addSubview(atSixHumidityProgressView)
        
        atTwelveHumidityView.addSubview(atTwelveTimeLabel)
        atTwelveHumidityView.addSubview(atTwelveHumidityLabel)
        atTwelveHumidityView.addSubview(atTwelveHumidityProgressView)
        
        atEighteenHumidityView.addSubview(atEighteenTimeLabel)
        atEighteenHumidityView.addSubview(atEighteenHumidityLabel)
        atEighteenHumidityView.addSubview(atEighteenHumidityProgressView)
        
        atTwentyFourHumidityView.addSubview(atTwentyFourTimeLabel)
        atTwentyFourHumidityView.addSubview(atTwentyFourHumidityLabel)
        atTwentyFourHumidityView.addSubview(atTwentyFourHumidityProgressView)
        
        
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
            
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            bottomSheetDecoration.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 6),
            bottomSheetDecoration.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomSheetDecoration.widthAnchor.constraint(equalToConstant: 38),
            bottomSheetDecoration.heightAnchor.constraint(equalToConstant: 5),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            subtitleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            currentTemperatureLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 10),
            currentTemperatureLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            currentTemperatureImage.topAnchor.constraint(equalTo: currentTemperatureLabel.bottomAnchor, constant: 6),
            currentTemperatureImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            currentTemperatureImage.widthAnchor.constraint(equalToConstant: 70),
            currentTemperatureImage.heightAnchor.constraint(equalToConstant: 70),
            
            backgroundTemperatures.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            backgroundTemperatures.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            backgroundTemperatures.topAnchor.constraint(equalTo: currentTemperatureImage.bottomAnchor, constant: 20),
            backgroundTemperatures.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30),
            
            humidityStackView.centerXAnchor.constraint(equalTo: backgroundTemperatures.centerXAnchor),
            humidityStackView.topAnchor.constraint(equalTo: backgroundTemperatures.topAnchor, constant: 20),
            humidityStackView.bottomAnchor.constraint(equalTo: backgroundTemperatures.bottomAnchor, constant: -20),
            
            atSixHumidityLabel.centerXAnchor.constraint(equalTo: atSixHumidityView.centerXAnchor),
            atSixHumidityProgressView.topAnchor.constraint(equalTo: atSixHumidityLabel.bottomAnchor, constant: 8),
            atSixHumidityProgressView.centerXAnchor.constraint(equalTo: atSixHumidityView.centerXAnchor),
            atSixHumidityProgressView.widthAnchor.constraint(equalToConstant: 16),
            atSixTimeLabel.topAnchor.constraint(equalTo: atSixHumidityProgressView.bottomAnchor, constant: 8),
            atSixTimeLabel.centerXAnchor.constraint(equalTo: atSixHumidityView.centerXAnchor),
            atSixTimeLabel.bottomAnchor.constraint(equalTo: atSixHumidityView.bottomAnchor),
            
            atTwelveHumidityLabel.centerXAnchor.constraint(equalTo: atTwelveHumidityView.centerXAnchor),
            atTwelveHumidityProgressView.topAnchor.constraint(equalTo: atTwelveHumidityLabel.bottomAnchor, constant: 8),
            atTwelveHumidityProgressView.centerXAnchor.constraint(equalTo: atTwelveHumidityView.centerXAnchor),
            atTwelveHumidityProgressView.widthAnchor.constraint(equalToConstant: 16),
            atTwelveTimeLabel.topAnchor.constraint(equalTo: atTwelveHumidityProgressView.bottomAnchor, constant: 8),
            atTwelveTimeLabel.centerXAnchor.constraint(equalTo: atTwelveHumidityView.centerXAnchor),
            atTwelveTimeLabel.bottomAnchor.constraint(equalTo: atTwelveHumidityView.bottomAnchor),
            
            atEighteenHumidityLabel.centerXAnchor.constraint(equalTo: atEighteenHumidityView.centerXAnchor),
            atEighteenHumidityProgressView.topAnchor.constraint(equalTo: atEighteenHumidityLabel.bottomAnchor, constant: 8),
            atEighteenHumidityProgressView.centerXAnchor.constraint(equalTo: atEighteenHumidityView.centerXAnchor),
            atEighteenHumidityProgressView.widthAnchor.constraint(equalToConstant: 16),
            atEighteenTimeLabel.topAnchor.constraint(equalTo: atEighteenHumidityProgressView.bottomAnchor, constant: 8),
            atEighteenTimeLabel.centerXAnchor.constraint(equalTo: atEighteenHumidityView.centerXAnchor),
            atEighteenTimeLabel.bottomAnchor.constraint(equalTo: atEighteenHumidityView.bottomAnchor),
            
            atTwentyFourHumidityLabel.centerXAnchor.constraint(equalTo: atTwentyFourHumidityView.centerXAnchor),
            atTwentyFourHumidityProgressView.topAnchor.constraint(equalTo: atTwentyFourHumidityLabel.bottomAnchor, constant: 8),
            atTwentyFourHumidityProgressView.centerXAnchor.constraint(equalTo: atTwentyFourHumidityView.centerXAnchor),
            atTwentyFourHumidityProgressView.widthAnchor.constraint(equalToConstant: 16),
            atTwentyFourTimeLabel.topAnchor.constraint(equalTo: atTwentyFourHumidityProgressView.bottomAnchor, constant: 8),
            atTwentyFourTimeLabel.centerXAnchor.constraint(equalTo: atTwentyFourHumidityView.centerXAnchor),
            atTwentyFourTimeLabel.bottomAnchor.constraint(equalTo: atTwentyFourHumidityView.bottomAnchor),
        ])
        
        atSixProgressViewHeightAnchor = atSixHumidityProgressView.heightAnchor.constraint(equalToConstant: 10)
        atTwelveProgressViewHeightAnchor = atTwelveHumidityProgressView.heightAnchor.constraint(equalToConstant: 10)
        atEighteenProgressViewHeightAnchor = atEighteenHumidityProgressView.heightAnchor.constraint(equalToConstant: 10)
        atTwentyFourProgressViewHeightAnchor = atTwentyFourHumidityProgressView.heightAnchor.constraint(equalToConstant: 10)
        humidityStackViewHeightAnchor = humidityStackView.heightAnchor.constraint(equalToConstant: (70 + 64))
        
        atSixProgressViewHeightAnchor?.isActive = true
        atTwelveProgressViewHeightAnchor?.isActive = true
        atEighteenProgressViewHeightAnchor?.isActive = true
        atTwentyFourProgressViewHeightAnchor?.isActive = true
        humidityStackViewHeightAnchor?.isActive = true
    }
    
    func showLoading() {
        self.titleLabel.isHidden = true
        self.subtitleLabel.isHidden = true
        self.currentTemperatureLabel.isHidden = true
        self.currentTemperatureImage.isHidden = true
        self.backgroundTemperatures.isHidden = true
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        self.titleLabel.isHidden = false
        self.subtitleLabel.isHidden = false
        self.currentTemperatureLabel.isHidden = false
        self.currentTemperatureImage.isHidden = false
        self.backgroundTemperatures.isHidden = false
        self.activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
    }
    
    // MARK: - Interaction Handling
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}
