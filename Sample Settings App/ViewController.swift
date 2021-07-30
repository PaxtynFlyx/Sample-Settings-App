//
//  ViewController.swift
//  Sample Settings App
//
//  Created by Nuri Chun on 7/29/21.
//

import UIKit

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: () -> Void
}

class ViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingCell.self, forCellReuseIdentifier: SettingCell.identifier)
        
        return tableView
    }()
    
    var models = [SettingsOption]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.backgroundColor = .cyan
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    private func configure() {
        self.models = Array(0...50).compactMap({
            SettingsOption(title: "Item \($0)", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink, handler: {
                
            })
        })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.identifier, for: indexPath) as? SettingCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: model)
        
        return cell
    }
}


