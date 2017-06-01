//
//  CurrentCanteenView.swift
//  Fraakost
//
//  Created by Morten Bøgh on 30/05/2017.
//
//

import UIKit

final class CurrentCanteenView: UIView {
    private let contentView = UIView()
    private let titleLabel = UILabel()
    private let canteenLabel = UILabel()
    private let bottomBorderView = UIView()

    var canteen: Canteen?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    func setupView() {
        backgroundColor = .white

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        addSubview(contentView)

        titleLabel.text = "Min Kantine"
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.textColor = .darkText
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)

        canteenLabel.text = "Aastvej"
        canteenLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        canteenLabel.textAlignment = .center
        canteenLabel.textColor = .purple
        canteenLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(canteenLabel)

        bottomBorderView.backgroundColor = .black
        bottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bottomBorderView)

        setupConstraints()
    }

    func setupConstraints() {
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true

        titleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor).isActive = true

        canteenLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        canteenLabel.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor).isActive = true
        canteenLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true
        canteenLabel.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor).isActive = true

        bottomBorderView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        bottomBorderView.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor).isActive = true
        bottomBorderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        bottomBorderView.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor).isActive = true
    }
}
