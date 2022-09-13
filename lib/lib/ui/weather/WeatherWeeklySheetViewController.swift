//
//  WeatherTodaySheetViewController.swift
//  garrigues
//
//  Created by Diego Salcedo on 10/09/22.
//  Copyright © 2022 Seresco. All rights reserved.
//

import UIKit

public class WeatherWeeklySheetViewController: UIViewController {
    
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
    
    let segmentedControls: UISegmentedControl = {
        let segmentedControls = UISegmentedControl()
        if #available(iOS 13.0, *) {
            segmentedControls.selectedSegmentTintColor = .mainColor
        }
        let font = UIFont.systemFont(ofSize: 18)
        segmentedControls.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        segmentedControls.selectedSegmentIndex = 0
        segmentedControls.insertSegment(withTitle: "12", at: 0, animated: true)
        segmentedControls.insertSegment(withTitle: "13", at: 1, animated: true)
        segmentedControls.insertSegment(withTitle: "14", at: 2, animated: true)
        segmentedControls.insertSegment(withTitle: "15", at: 3, animated: true)
        segmentedControls.insertSegment(withTitle: "16", at: 4, animated: true)
        segmentedControls.insertSegment(withTitle: "17", at: 5, animated: true)
        segmentedControls.insertSegment(withTitle: "18", at: 6, animated: true)
        segmentedControls.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControls
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
    let weathersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.axis = .vertical
        return stackView
    }()
    let temperaturesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 60
        stackView.axis = .horizontal
        return stackView
    }()
    let atSixTemperatureView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let atSixTimeLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "06"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let atSixTemperatureImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ic_high_cloudy")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let atSixTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "14°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let atTwelveTemperatureView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let atTwelveTimeLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "06"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let atTwelveTemperatureImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ic_high_cloudy")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let atTwelveTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "14°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let atEighteenTemperatureView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let atEighteenTimeLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "06"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let atEighteenTemperatureImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ic_high_cloudy")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let atEighteenTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "14°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let atTwentyFourTemperatureView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let atTwentyFourTimeLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "06"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let atTwentyFourTemperatureImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ic_high_cloudy")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let atTwentyFourTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "14°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let midDaysTemperaturesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.axis = .horizontal
        stackView.isHidden = true
        return stackView
    }()
    let midMorningWeatherView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let midMorningWeatherTimeLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "00-12"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let midMorningWeatherImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ic_high_cloudy")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let midNightWeatherView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let midNightWeatherTimeLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "12-24"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let midNightWeatherImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ic_high_cloudy")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let maxMinTemperatureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        stackView.axis = .vertical
        stackView.isHidden = true
        return stackView
    }()
    let maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(16)
        label.text = "Máxima temperatura: 25°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(16)
        label.text = "Mínima temperatura: 15°"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.isHidden = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    // MARK: - Class Properties
    private var weatherPrediction: MunicipalityPrediction?
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
            self.weatherPrediction = result
            self.setupView()
        }
    }
    
    func setupInteractions() {
        segmentedControls.addTarget(self, action: #selector(changeDay), for: .valueChanged)
        clearView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissView)))
    }
    
    func setupView() {
        segmentedControls.selectedSegmentIndex = 0
        if let weatherPrediction = weatherPrediction {
            titleLabel.text = weatherPrediction.name
            subtitleLabel.text = weatherPrediction.province
            setupWeatherInfo(day: 0, prediction: weatherPrediction)
        }
    }
    
    func setupWeatherInfo(day: Int, prediction: MunicipalityPrediction) {
        let currentDay = prediction.prediction.days[day]
        let weatherItems = currentDay.getWeatherItems()
        if (!weatherItems.isEmpty) {
            setWeatherInfo(items: weatherItems)
            setCurrentTemperature(items: weatherItems)
            temperaturesStackView.isHidden = false
            maxMinTemperatureStackView.isHidden = true
            midDaysTemperaturesStackView.isHidden = true
        } else {
            setMidDayWeatherInfo(currentDay: currentDay)
        }
    }

    
    func setMidDayWeatherInfo(currentDay: Day) {
        let maxTemperature = currentDay.temperature.max
        let minTemperature = currentDay.temperature.min
        let skyStatus = currentDay.skyStatus.filter { $0.period == "00-12" || $0.period == "12-24" }
        
        temperaturesStackView.isHidden = true
        maxMinTemperatureStackView.isHidden = false
        
        maxTemperatureLabel.text = "Máxima temperatura: \(maxTemperature)°"
        minTemperatureLabel.text = "Mínima temperatura: \(minTemperature)°"
        
        if (!skyStatus.isEmpty) {
            midDaysTemperaturesStackView.isHidden = false
            midMorningWeatherImage.image = UIImage(named: skyStatus[0].description.getWeatherIcon())
            midNightWeatherImage.image = UIImage(named: skyStatus[1].description.getWeatherIcon())
        } else {
            midDaysTemperaturesStackView.isHidden = true
        }
    }
    
    func setWeatherInfo(items: [TemperatureItem]) {
        let atSix = items[0]
        let atTwelve = items[1]
        let atEighteen = items[2]
        let atTwentyfour = items[3]
        
        atSixTemperatureLabel.text = "\(atSix.value)°"
        atSixTemperatureImage.image = UIImage(named: atSix.skyStatus?.getWeatherIcon() ?? "")

        atTwelveTemperatureLabel.text = "\(atTwelve.value)°"
        atTwelveTemperatureImage.image = UIImage(named: atTwelve.skyStatus?.getWeatherIcon() ?? "")

        atEighteenTemperatureLabel.text = "\(atEighteen.value)°"
        atEighteenTemperatureImage.image = UIImage(named: atEighteen.skyStatus?.getWeatherIcon() ?? "")

        atTwentyFourTemperatureLabel.text = "\(atTwentyfour.value)°"
        atTwentyFourTemperatureImage.image = UIImage(named: atTwentyfour.skyStatus?.getWeatherIcon() ?? "")
    }
    
    func setCurrentTemperature(items: [TemperatureItem]) {
        let currentTemperature = items[0]
        currentTemperatureLabel.text = "\(currentTemperature.value)°"
        currentTemperatureImage.image = UIImage(named: currentTemperature.skyStatus?.getWeatherIcon() ?? "")
    }
    
    func setupLayout() {
        view.addSubview(clearView)
        view.addSubview(containerView)
        
        containerView.addSubview(bottomSheetDecoration)
        containerView.addSubview(segmentedControls)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subtitleLabel)
        containerView.addSubview(currentTemperatureLabel)
        containerView.addSubview(currentTemperatureImage)
        containerView.addSubview(backgroundTemperatures)
        containerView.addSubview(activityIndicator)
        
        //backgroundTemperatures.addSubview(temperaturesStackView)
        backgroundTemperatures.addSubview(weathersStackView)
        
        weathersStackView.addArrangedSubview(temperaturesStackView)
        weathersStackView.addArrangedSubview(midDaysTemperaturesStackView)
        weathersStackView.addArrangedSubview(maxMinTemperatureStackView)
        
        maxMinTemperatureStackView.addArrangedSubview(maxTemperatureLabel)
        maxMinTemperatureStackView.addArrangedSubview(minTemperatureLabel)
        
        temperaturesStackView.addArrangedSubview(atSixTemperatureView)
        temperaturesStackView.addArrangedSubview(atTwelveTemperatureView)
        temperaturesStackView.addArrangedSubview(atEighteenTemperatureView)
        temperaturesStackView.addArrangedSubview(atTwentyFourTemperatureView)
        
        midDaysTemperaturesStackView.addArrangedSubview(midMorningWeatherView)
        midDaysTemperaturesStackView.addArrangedSubview(midNightWeatherView)
        
        midMorningWeatherView.addSubview(midMorningWeatherTimeLabel)
        midMorningWeatherView.addSubview(midMorningWeatherImage)
        
        midNightWeatherView.addSubview(midNightWeatherTimeLabel)
        midNightWeatherView.addSubview(midNightWeatherImage)
        
        atSixTemperatureView.addSubview(atSixTimeLabel)
        atSixTemperatureView.addSubview(atSixTemperatureImage)
        atSixTemperatureView.addSubview(atSixTemperatureLabel)
        
        atTwelveTemperatureView.addSubview(atTwelveTimeLabel)
        atTwelveTemperatureView.addSubview(atTwelveTemperatureImage)
        atTwelveTemperatureView.addSubview(atTwelveTemperatureLabel)
        
        atEighteenTemperatureView.addSubview(atEighteenTimeLabel)
        atEighteenTemperatureView.addSubview(atEighteenTemperatureImage)
        atEighteenTemperatureView.addSubview(atEighteenTemperatureLabel)
        
        atTwentyFourTemperatureView.addSubview(atTwentyFourTimeLabel)
        atTwentyFourTemperatureView.addSubview(atTwentyFourTemperatureImage)
        atTwentyFourTemperatureView.addSubview(atTwentyFourTemperatureLabel)
        
        
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
            
            segmentedControls.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            segmentedControls.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: segmentedControls.bottomAnchor, constant: 14),
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
            
            weathersStackView.centerXAnchor.constraint(equalTo: backgroundTemperatures.centerXAnchor),
            weathersStackView.topAnchor.constraint(equalTo: backgroundTemperatures.topAnchor, constant: 20),
            weathersStackView.bottomAnchor.constraint(equalTo: backgroundTemperatures.bottomAnchor, constant: -20),
            
            atSixTimeLabel.topAnchor.constraint(equalTo: atSixTemperatureView.topAnchor),
            atSixTimeLabel.centerXAnchor.constraint(equalTo: atSixTemperatureView.centerXAnchor),
            atSixTemperatureImage.topAnchor.constraint(equalTo: atSixTimeLabel.bottomAnchor, constant: 8),
            atSixTemperatureImage.centerXAnchor.constraint(equalTo: atSixTemperatureView.centerXAnchor),
            atSixTemperatureImage.widthAnchor.constraint(equalToConstant: 30),
            atSixTemperatureImage.heightAnchor.constraint(equalToConstant: 30),
            atSixTemperatureLabel.topAnchor.constraint(equalTo: atSixTemperatureImage.bottomAnchor, constant: 8),
            atSixTemperatureLabel.centerXAnchor.constraint(equalTo: atSixTemperatureView.centerXAnchor),
            atSixTemperatureLabel.bottomAnchor.constraint(equalTo: atSixTemperatureView.bottomAnchor),
            
            atTwelveTimeLabel.topAnchor.constraint(equalTo: atTwelveTemperatureView.topAnchor),
            atTwelveTimeLabel.centerXAnchor.constraint(equalTo: atTwelveTemperatureView.centerXAnchor),
            atTwelveTemperatureImage.topAnchor.constraint(equalTo: atTwelveTimeLabel.bottomAnchor, constant: 8),
            atTwelveTemperatureImage.centerXAnchor.constraint(equalTo: atTwelveTemperatureView.centerXAnchor),
            atTwelveTemperatureImage.widthAnchor.constraint(equalToConstant: 30),
            atTwelveTemperatureImage.heightAnchor.constraint(equalToConstant: 30),
            atTwelveTemperatureLabel.topAnchor.constraint(equalTo: atTwelveTemperatureImage.bottomAnchor, constant: 8),
            atTwelveTemperatureLabel.centerXAnchor.constraint(equalTo: atTwelveTemperatureView.centerXAnchor),
            atTwelveTemperatureLabel.bottomAnchor.constraint(equalTo: atTwelveTemperatureView.bottomAnchor),
            
            atEighteenTimeLabel.topAnchor.constraint(equalTo: atEighteenTemperatureView.topAnchor),
            atEighteenTimeLabel.centerXAnchor.constraint(equalTo: atEighteenTemperatureView.centerXAnchor),
            atEighteenTemperatureImage.topAnchor.constraint(equalTo: atEighteenTimeLabel.bottomAnchor, constant: 8),
            atEighteenTemperatureImage.centerXAnchor.constraint(equalTo: atEighteenTemperatureView.centerXAnchor),
            atEighteenTemperatureImage.widthAnchor.constraint(equalToConstant: 30),
            atEighteenTemperatureImage.heightAnchor.constraint(equalToConstant: 30),
            atEighteenTemperatureLabel.topAnchor.constraint(equalTo: atEighteenTemperatureImage.bottomAnchor, constant: 8),
            atEighteenTemperatureLabel.centerXAnchor.constraint(equalTo: atEighteenTemperatureView.centerXAnchor),
            atEighteenTemperatureLabel.bottomAnchor.constraint(equalTo: atEighteenTemperatureView.bottomAnchor),
            
            atTwentyFourTimeLabel.topAnchor.constraint(equalTo: atTwentyFourTemperatureView.topAnchor),
            atTwentyFourTimeLabel.centerXAnchor.constraint(equalTo: atTwentyFourTemperatureView.centerXAnchor),
            atTwentyFourTemperatureImage.topAnchor.constraint(equalTo: atTwentyFourTimeLabel.bottomAnchor, constant: 8),
            atTwentyFourTemperatureImage.centerXAnchor.constraint(equalTo: atTwentyFourTemperatureView.centerXAnchor),
            atTwentyFourTemperatureImage.widthAnchor.constraint(equalToConstant: 30),
            atTwentyFourTemperatureImage.heightAnchor.constraint(equalToConstant: 30),
            atTwentyFourTemperatureLabel.topAnchor.constraint(equalTo: atTwentyFourTemperatureImage.bottomAnchor, constant: 8),
            atTwentyFourTemperatureLabel.centerXAnchor.constraint(equalTo: atTwentyFourTemperatureView.centerXAnchor),
            atTwentyFourTemperatureLabel.bottomAnchor.constraint(equalTo: atTwentyFourTemperatureView.bottomAnchor),
            
            midMorningWeatherTimeLabel.topAnchor.constraint(equalTo: midMorningWeatherView.topAnchor),
            midMorningWeatherTimeLabel.centerXAnchor.constraint(equalTo: midMorningWeatherView.centerXAnchor),
            midMorningWeatherImage.topAnchor.constraint(equalTo: midMorningWeatherTimeLabel.bottomAnchor, constant: 8),
            midMorningWeatherImage.centerXAnchor.constraint(equalTo: midMorningWeatherView.centerXAnchor),
            midMorningWeatherImage.bottomAnchor.constraint(equalTo: midMorningWeatherView.bottomAnchor),
            midMorningWeatherImage.widthAnchor.constraint(equalToConstant: 30),
            midMorningWeatherImage.heightAnchor.constraint(equalToConstant: 30),
            
            midNightWeatherTimeLabel.topAnchor.constraint(equalTo: midNightWeatherView.topAnchor),
            midNightWeatherTimeLabel.centerXAnchor.constraint(equalTo: midNightWeatherView.centerXAnchor),
            midNightWeatherImage.topAnchor.constraint(equalTo: midNightWeatherTimeLabel.bottomAnchor, constant: 8),
            midNightWeatherImage.centerXAnchor.constraint(equalTo: midNightWeatherView.centerXAnchor),
            midNightWeatherImage.bottomAnchor.constraint(equalTo: midNightWeatherView.bottomAnchor),
            midNightWeatherImage.widthAnchor.constraint(equalToConstant: 30),
            midNightWeatherImage.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    func showLoading() {
        self.segmentedControls.isHidden = true
        self.titleLabel.isHidden = true
        self.subtitleLabel.isHidden = true
        self.currentTemperatureLabel.isHidden = true
        self.currentTemperatureImage.isHidden = true
        self.backgroundTemperatures.isHidden = true
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        self.segmentedControls.isHidden = false
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
    
    @objc func changeDay(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            if let weatherPrediction = weatherPrediction {
                setupWeatherInfo(day: 0, prediction: weatherPrediction)
            }
        case 1:
            if let weatherPrediction = weatherPrediction {
                setupWeatherInfo(day: 1, prediction: weatherPrediction)
            }
        case 2:
            if let weatherPrediction = weatherPrediction {
                setupWeatherInfo(day: 2, prediction: weatherPrediction)
            }
        case 3:
            if let weatherPrediction = weatherPrediction {
                setupWeatherInfo(day: 3, prediction: weatherPrediction)
            }
        case 4:
            if let weatherPrediction = weatherPrediction {
                setupWeatherInfo(day: 4, prediction: weatherPrediction)
            }
        case 5:
            if let weatherPrediction = weatherPrediction {
                setupWeatherInfo(day: 5, prediction: weatherPrediction)
            }
        case 6:
            if let weatherPrediction = weatherPrediction {
                setupWeatherInfo(day: 6, prediction: weatherPrediction)
            }
        default:
            if let weatherPrediction = weatherPrediction {
                setupWeatherInfo(day: 0, prediction: weatherPrediction)
            }
        }
    }
    
}
