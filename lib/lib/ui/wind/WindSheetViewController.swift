//
//  WeatherTodaySheetViewController.swift
//  garrigues
//
//  Created by Diego Salcedo on 10/09/22.
//  Copyright © 2022 Seresco. All rights reserved.
//

import UIKit

public class WindSheetViewController: UIViewController {
    
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
        segmentedControls.insertSegment(withTitle: "00 - 06", at: 0, animated: true)
        segmentedControls.insertSegment(withTitle: "06 - 12", at: 1, animated: true)
        segmentedControls.insertSegment(withTitle: "12 - 18", at: 2, animated: true)
        segmentedControls.insertSegment(withTitle: "18 - 24", at: 3, animated: true)
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
    let circularView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 115
        view.layer.borderWidth = 1
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let arrowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ic_arrow")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let currentKmLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(26)
        label.text = "2"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let kmPerHourLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(16)
        label.text = "km/h"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let kmInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 4
        stackView.axis = .vertical
        return stackView
    }()
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.isHidden = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    let northLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "N"
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let southLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "S"
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let eastLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "E"
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let westLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.text = "O"
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var arrowXAnchor: NSLayoutConstraint?
    var arrowYAnchor: NSLayoutConstraint?
    // MARK: - Class Properties
    private var windPrediction: [Wind]?
    var municipalityId = ""

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
        self.showLoading()
        MeteorologyApi.getWeatherPredictionsKey(municipalityId: municipalityId) { result in
            self.hideLoading()
            self.titleLabel.text = result.name
            self.subtitleLabel.text = result.province
            self.windPrediction = result.prediction.days[1].wind.filter { $0.period == "00-06" || $0.period == "06-12" || $0.period == "12-18" || $0.period == "18-24" }
            self.segmentedControls.selectedSegmentIndex = 0
            self.setupView(index: 0)
        }
    }
    
    func setupInteractions() {
        segmentedControls.addTarget(self, action: #selector(changeDay), for: .valueChanged)
        clearView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissView)))
    }
    
    func setupView(index: Int) {
        if let windPrediction = windPrediction {
            setupArrow(direction: windPrediction[index].direction)
            currentKmLabel.text = "\(windPrediction[index].velocity)"
        }
    }
    

    func setupLayout() {
        view.addSubview(clearView)
        view.addSubview(containerView)
        
        containerView.addSubview(bottomSheetDecoration)
        containerView.addSubview(segmentedControls)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subtitleLabel)
        containerView.addSubview(circularView)
        containerView.addSubview(activityIndicator)
        containerView.addSubview(northLabel)
        containerView.addSubview(southLabel)
        containerView.addSubview(eastLabel)
        containerView.addSubview(westLabel)
        
        
        circularView.addSubview(arrowImage)
        circularView.addSubview(kmInfoStackView)
        
        kmInfoStackView.addArrangedSubview(currentKmLabel)
        kmInfoStackView.addArrangedSubview(kmPerHourLabel)
        
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
            
            northLabel.topAnchor.constraint(greaterThanOrEqualTo: circularView.topAnchor, constant: -15),
            northLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            southLabel.topAnchor.constraint(greaterThanOrEqualTo: circularView.bottomAnchor),
            southLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 10),
            
            eastLabel.leadingAnchor.constraint(greaterThanOrEqualTo: circularView.leadingAnchor),
            eastLabel.centerYAnchor.constraint(equalTo: circularView.centerYAnchor),//, constant: -10),
            
            westLabel.trailingAnchor.constraint(greaterThanOrEqualTo: circularView.trailingAnchor),
            westLabel.centerYAnchor.constraint(equalTo: circularView.centerYAnchor),//, constant: -10),
            
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
            
            circularView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            circularView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            circularView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30),
            circularView.heightAnchor.constraint(equalToConstant: 230),
            circularView.widthAnchor.constraint(equalToConstant: 230),
            
            arrowImage.heightAnchor.constraint(equalToConstant: 50),
            arrowImage.widthAnchor.constraint(equalToConstant: 50),
            
            kmInfoStackView.centerXAnchor.constraint(equalTo: circularView.centerXAnchor),
            kmInfoStackView.centerYAnchor.constraint(equalTo: circularView.centerYAnchor)
        ])
        
        arrowXAnchor = arrowImage.centerXAnchor.constraint(equalTo: circularView.centerXAnchor, constant: 70)
        arrowYAnchor = arrowImage.centerYAnchor.constraint(equalTo: circularView.centerYAnchor)
        arrowXAnchor?.isActive = true
        arrowYAnchor?.isActive = true
    }
    
    func showLoading() {
        self.segmentedControls.isHidden = true
        self.titleLabel.isHidden = true
        self.subtitleLabel.isHidden = true
        self.circularView.isHidden = true
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        self.segmentedControls.isHidden = false
        self.titleLabel.isHidden = false
        self.subtitleLabel.isHidden = false
        self.circularView.isHidden = false
        self.activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
    }
    
    func setupArrow(direction: String) {
        
        switch direction {
        case "O":
            arrowImage.isHidden = false
            arrowImage.image = UIImage(named: "ic_arrow")?.rotate(radians: -CGFloat.pi)
            arrowXAnchor?.constant = -70
            arrowYAnchor?.constant = 0
        case "E":
            arrowImage.isHidden = false
            arrowImage.image = UIImage(named: "ic_arrow")?.rotate(radians: 0)
            arrowXAnchor?.constant = 70
            arrowYAnchor?.constant = 0
        case "S":
            arrowImage.isHidden = false
            arrowImage.image = UIImage(named: "ic_arrow")?.rotate(radians: CGFloat.pi/2)
            arrowXAnchor?.constant = 0
            arrowYAnchor?.constant = 70
        case "N":
            arrowImage.isHidden = false
            arrowImage.image = UIImage(named: "ic_arrow")?.rotate(radians: -CGFloat.pi/2)
            arrowXAnchor?.constant = 0
            arrowYAnchor?.constant = -70
        case "SE":
            arrowImage.isHidden = false
            arrowImage.image = UIImage(named: "ic_arrow")?.rotate(radians: CGFloat.pi/4)
            arrowXAnchor?.constant = 60
            arrowYAnchor?.constant = 60
        case "SO":
            arrowImage.isHidden = false
            arrowImage.image = UIImage(named: "ic_arrow")?.rotate(radians: -(CGFloat.pi + CGFloat.pi/4))
            arrowXAnchor?.constant = -60
            arrowYAnchor?.constant = 60
        case "NE":
            arrowImage.isHidden = false
            arrowImage.image = UIImage(named: "ic_arrow")?.rotate(radians: -CGFloat.pi/4)
            arrowXAnchor?.constant = 60
            arrowYAnchor?.constant = -60
        case "NO":
            arrowImage.isHidden = false
            arrowImage.image = UIImage(named: "ic_arrow")?.rotate(radians: (CGFloat.pi + CGFloat.pi/4))
            arrowXAnchor?.constant = -60
            arrowYAnchor?.constant = -60
        case "C":
            arrowImage.isHidden = true
        default:
            arrowImage.isHidden = true
        }
    }
    
    // MARK: - Interaction Handling
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func changeDay(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            setupView(index: 0)
        case 1:
            setupView(index: 1)
        case 2:
            setupView(index: 2)
        case 3:
            setupView(index: 3)
        default:
            setupView(index: 0)
        }
    }
    
}

extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return rotatedImage ?? self
        }

        return self
    }
}

public enum WindDirection {
    case O, E, S, N, SE, SO, NE, NO, C
    
    var name: String {
        switch self {
        case .O:
            return "O"
        case .E:
            return "E"
        case .S:
            return "S"
        case .N:
            return "N"
        case .SE:
            return "SE"
        case .SO:
            return "SO"
        case .NE:
            return "NE"
        case .NO:
            return "NO"
        case .C:
            return "C"
        }
    }
}
// todo::
//public enum TimePeriod {
//    case
//}
