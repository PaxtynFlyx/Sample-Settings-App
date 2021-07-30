//
//  ViewController.swift
//  Sample Settings App
//
//  Created by Nuri Chun on 7/29/21.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingCell.self, forCellReuseIdentifier: SettingCell.identifier)
        tableView.register(SwitchCell.self, forCellReuseIdentifier: SwitchCell.identifier)
        return tableView
    }()
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        navigationController?.navigationBar.topItem?.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .cyan
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    private func configure() {
        models.append(Section(title: "General", options: [
            .staticCell(model: SettingsOption(title: "WiFi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("WiFi Tapped..")
            }),
            .staticCell(model: SettingsOption(title: "Airplane", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
                print("WiFi Tapped..")
            }),
            .staticCell(model: SettingsOption(title: "BlueTooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                print("WiFi Tapped..")
            }),
            .staticCell(model: SettingsOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
                print("WiFi Tapped..")
            })
        ]))
        
        models.append(Section(title: "Information", options: [
            .staticCell(model: SettingsOption(title: "WiFi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("WiFi Tapped..")
            }),
            .staticCell(model: SettingsOption(title: "Airplane", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
                print("WiFi Tapped..")
            }),
            .staticCell(model: SettingsOption(title: "BlueTooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link) {
                print("WiFi Tapped..")
            }),
            .staticCell(model: SettingsOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
                print("WiFi Tapped..")
            })
        ]))
        
        models.append(Section(title: "Location Services", options: [
            .switchCell(model: SettingsSwitchOption(title: "Enable Location", icon: UIImage(systemName: "location"), iconBackgroundColor: .systemTeal, handler: {
                
            }, isOn: true))
        ]))
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.identifier, for: indexPath) as? SettingCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: model)
            
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchCell.identifier, for: indexPath) as? SwitchCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: model)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        
        switch type {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
}


