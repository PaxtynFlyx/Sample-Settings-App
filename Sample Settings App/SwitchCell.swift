//
//  SwitchCell.swift
//  Sample Settings App
//
//  Created by Nuri Chun on 7/29/21.
//

import UIKit

class SwitchCell: UITableViewCell {
    
    static let identifier = "SwitchCell"
    
    private let iconContainerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        
        return label
    }()
    
    private let switchView: UISwitch = {
        let uiSwitch = UISwitch()
        uiSwitch.tintColor = .systemBlue
        return uiSwitch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainerView)
        contentView.addSubview(switchView)
        iconContainerView.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainerView.frame = CGRect(x: 15, y: 6, width: size, height: size)
        
        switchView.sizeToFit()
        switchView.frame = CGRect(
            x: contentView.frame.size.width - switchView.frame.size.width - 20,
            y: (contentView.frame.size.height - switchView.frame.size.height) / 2,
            width: switchView.frame.width,
            height: switchView.frame.height)
        
        let imageSize: CGFloat = size / 1.5
        iconImageView.frame = CGRect(
            x: (size - imageSize) / 2,
            y: (size - imageSize) / 2,
            width: imageSize,
            height: imageSize)
        
        label.frame = CGRect(
            x: 25 + iconContainerView.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 20 - iconContainerView.frame.size.width,
            height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainerView.backgroundColor = nil
        switchView.isOn = false
    }
    
    public func configure(with model: SettingsSwitchOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainerView.backgroundColor = model.iconBackgroundColor
        switchView.isOn = model.isOn
    }
}

