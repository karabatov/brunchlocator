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

    static func filler() -> Cafe {
        return Cafe(name: "That brunch place", descr: "Cozy • Busy", distance: "0.3 km")
    }
}

final class ViewController: UIViewController {
    let allItems: [Cafe]
    var items: [Cafe] = []

    init(items: [Cafe]) {
        self.allItems = items
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

