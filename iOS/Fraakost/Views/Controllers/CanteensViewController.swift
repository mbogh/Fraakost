//
//  CanteensViewController.swift
//  Fraakost
//
//  Created by Morten Bøgh on 01/06/2017.
//
//

import UIKit

protocol CanteensViewControllerDelegate: class {
    func canteensViewController(_ canteensViewController: CanteensViewController, didSelectCanteen canteen: Canteen)
}

final class CanteensViewController: UITableViewController {
    fileprivate let viewModel: CanteensViewModel
    weak var delegate: CanteensViewControllerDelegate?

    init(viewModel: CanteensViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Temp")
    }
}

// MARK: - UITableViewDataSource
extension CanteensViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(inSection: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Temp", for: indexPath)
        let canteen = viewModel.canteen(forRowAt: indexPath)
        cell.textLabel?.text = canteen.name
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CanteensViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let canteen = viewModel.canteen(forRowAt: indexPath)
        delegate?.canteensViewController(self, didSelectCanteen: canteen)
    }
}
