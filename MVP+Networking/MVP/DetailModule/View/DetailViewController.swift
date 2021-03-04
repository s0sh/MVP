//
//  DetailViewController.swift
//  MVP
//
//  Created by Roman Bigun on 03.03.2021.
//

import UIKit

class DetailViewController: UIViewController, Storyboarded {
    @IBOutlet var commentLabel: UILabel!
    var presenter: DetailViewPresenterProtocol!
    var coordinator: MainCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        guard let comment = comment else { return }
        commentLabel.text = comment.body
    }
}
