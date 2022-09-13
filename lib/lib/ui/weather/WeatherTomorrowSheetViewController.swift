//
//  WeatherTodaySheetViewController.swift
//  garrigues
//
//  Created by Diego Salcedo on 10/09/22.
//  Copyright © 2022 Seresco. All rights reserved.
//

import UIKit

public class WeatherTomorrowSheetViewController: UIViewController {
    
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
        segmentedControls.isSelected = true
        segmentedControls.selectedSegmentIndex = 0
        let font = UIFont.systemFont(ofSize: 18)
        segmentedControls.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        segmentedControls.insertSegment(withTitle: "Hoy", at: 0, animated: true)
        segmentedControls.insertSegment(withTitle: "Mañana", at: 1, animated: true)
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
        label.text = "12"
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
        label.text = "18"
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
        label.text = "24"
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
            self.setupView(prediction: result)
        }
    }
    
    func setupInteractions() {
        segmentedControls.addTarget(self, action: #selector(changeDay), for: .valueChanged)
        clearView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissView)))
    }
    
    func setupView(prediction: MunicipalityPrediction) {
        segmentedControls.selectedSegmentIndex = 0
        titleLabel.text = prediction.name
        subtitleLabel.text = prediction.province
        if let todayPrediction = prediction.prediction.days.first {
            let items = todayPrediction.getWeatherItems()
            setWeatherInfo(items: items)
            setCurrentTemperature(items: items)
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
        //todo::with current time hour
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
        
        backgroundTemperatures.addSubview(temperaturesStackView)
        
        temperaturesStackView.addArrangedSubview(atSixTemperatureView)
        temperaturesStackView.addArrangedSubview(atTwelveTemperatureView)
        temperaturesStackView.addArrangedSubview(atEighteenTemperatureView)
        temperaturesStackView.addArrangedSubview(atTwentyFourTemperatureView)
        
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
            
            temperaturesStackView.centerXAnchor.constraint(equalTo: backgroundTemperatures.centerXAnchor),
            temperaturesStackView.topAnchor.constraint(equalTo: backgroundTemperatures.topAnchor, constant: 20),
            temperaturesStackView.bottomAnchor.constraint(equalTo: backgroundTemperatures.bottomAnchor, constant: -20),
            
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
        if sender.selectedSegmentIndex == 0 {
            if let todayPrediction = weatherPrediction?.prediction.days.first {
                let items = todayPrediction.getWeatherItems()
                setWeatherInfo(items: items)
                setCurrentTemperature(items: items)
            }
        } else {
            if let tomorrowPrediction = weatherPrediction?.prediction.days[1] {
                let items = tomorrowPrediction.getWeatherItems()
                setWeatherInfo(items: items)
                setCurrentTemperature(items: items)
            }
        }
    }
    
}
