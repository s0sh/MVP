//
//  ViewController.swift
//  MVP
//
//  Created by Roman Bigun on 04.03.2021.
//

import UIKit

class CommentViewController: UIViewController, Storyboarded {
    var presenter: CommentViewPresenterProtocol!
    var coordinator: MainCoordinator?
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    }
}
