//
//  LunchView.swift
//  Fraakost
//
//  Created by Morten Bøgh on 06/03/2017.
//
//

import UIKit

final class LunchView: UIView {
    private let gradientLayer = CAGradientLayer()
    private let typeLabel = UILabel()
    private let descriptionLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    func setupView() {
        gradientLayer.colors = [#colorLiteral(red: 0.8235294118, green: 0.4352941176, blue: 0.9921568627, alpha: 1).cgColor, #colorLiteral(red: 0.4470588235, green: 0.2156862745, blue: 0.7215686275, alpha: 1).cgColor]
        gradientLayer.cornerRadius = 8
        gradientLayer.opacity = 0.6
        layer.addSublayer(gradientLayer)
        layer.cornerRadius = 8

        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.systemFont(ofSize: 60)
        typeLabel.text = "🥗"
        typeLabel.textAlignment = .center
        addSubview(typeLabel)

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Nudelsalat med strimler af porre, kinaradise, agurk, semsamdressing, kyllingespyd og peanuts"
        descriptionLabel.numberOfLines = 0
        addSubview(descriptionLabel)

        setupConstraints()
    }

    func setupConstraints() {
        typeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        typeLabel.rightAnchor.constraint(equalTo: descriptionLabel.leftAnchor, constant: -12).isActive = true
        typeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        typeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true

        descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}
