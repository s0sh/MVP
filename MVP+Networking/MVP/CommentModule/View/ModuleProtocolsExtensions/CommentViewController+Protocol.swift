//
//  CommentViewController+Protocol.swift
//  MVP
//
//  Created by Roman Bigun on 04.03.2021.
//

import Foundation
extension CommentViewController: CommentViewProtocol {
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
