//
//  ViewController.swift
//  brunchlocator
//
//  Created by Yuri Karabatov on 17/12/2018.
//  Copyright © 2018 Yuri Karabatov. All rights reserved.
//

import UIKit

struct Cafe {
    let name: String
    let descr: String
    let distance: String
    let review: String

    static func filler() -> Cafe {
        return Cafe(name: "That brunch place", descr: "Cozy • Busy", distance: "0.3 km", review: "Not a bad place for brunch.")
    }
}

final class ViewController: UIViewController, UISearchResultsUpdating, UITableViewDataSource {
    let allItems: [Cafe]
    var items: [Cafe] = []

    private let tableView = UITableView(frame: CGRect.zero, style: .plain)
    private var searchController: UISearchController!
    private var selectedIndexPath: IndexPath?

    init(items: [Cafe]) {
        self.allItems = items
        self.items = items
        super.init(nibName: nil, bundle: nil)

        title = "Brunch near you"

        let controller = UISearchController(searchResultsController: nil)
        controller.searchResultsUpdater = self
        searchController = controller

        navigationItem.searchController = searchController
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.register(UINib(nibName: "BrunchTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: BrunchTableViewCell.reuseIdentifier)

        tableView.dataSource = self
    }

    // MARK: UISearchResultsUpdating

    func updateSearchResults(for searchController: UISearchController) {
        //
    }

    // MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BrunchTableViewCell.reuseIdentifier, for: indexPath) as! BrunchTableViewCell

        let cafe = items[indexPath.row]
        cell.configure(cafe: cafe)
        if let sip = selectedIndexPath?.row {
            cell.configure(grayedOut: indexPath.row != sip, expanded: indexPath.row == sip)
        } else {
            cell.configure(grayedOut: false, expanded: false)
        }

        return cell
    }
}

