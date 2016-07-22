//
//  WeatherViewController.swift
//  Weather
//
//  Created by Ayaka Nonaka on 7/3/16.
//  Copyright © 2016 Ayaka Nonaka. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    // MARK: - Properties

    let observation: Observation

    private let containerView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .Vertical
        view.alignment = .Center
        return view
    }()

    private let gradientLayer: CAGradientLayer = {
        let blue = UIColor(red: 78/255.0, green: 208/255.0, blue: 255/255.0, alpha: 1.0)
        let green = UIColor(red: 200/255.0, green: 255/255.0, blue: 192/255.0, alpha: 1.0)
        let gradient = Gradient(startColor: blue, endColor: green)
        return CAGradientLayer.gradientLayer(with: gradient)
    }()

    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFontOfSize(25, weight: UIFontWeightRegular)
        label.textColor = .whiteColor()
        return label
    }()

    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFontOfSize(120, weight: UIFontWeightUltraLight)
        label.textColor = .whiteColor()
        return label
    }()

    private let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFontOfSize(30, weight: UIFontWeightMedium)
        label.textColor = .whiteColor()
        return label
    }()

    // MARK: - Initializers

    init(with observation: Observation) {
        self.observation = observation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(gradientLayer)

        cityLabel.text = observation.displayLocation.fullCityName
        weatherLabel.text = observation.weather
        temperatureLabel.text = String(format: "%.0f°", observation.temperatureFahrenheit)

        containerView.addArrangedSubview(cityLabel)
        containerView.addArrangedSubview(weatherLabel)
        containerView.addArrangedSubview(temperatureLabel)
        view.addSubview(containerView)

        NSLayoutConstraint.activateConstraints([
            containerView.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor),
            containerView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor),
            containerView.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor),
        ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
}
