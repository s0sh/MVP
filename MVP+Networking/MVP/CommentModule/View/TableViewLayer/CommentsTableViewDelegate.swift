//
//  CommentsTableViewDelegate.swift
//  MVP
//
//  Created by Roman Bigun on 04.03.2021.
//

import UIKit

extension CommentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = presenter.comments?[indexPath.row]
        coordinator?.commentDetails(comment: comment)
    }
}
