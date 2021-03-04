//
//  ModuleBuilder.swift
//  MVP
//
//  Created by Roman Bigun on 04.03.2021.
//

import UIKit

protocol Builder {
    static func buildCommentModule() -> CommentViewController
    static func buildCommentDetailModule(comment: Comment?) -> DetailViewController
}

class ModuleBuilder: Builder {
    static func buildCommentDetailModule(comment: Comment?) -> DetailViewController {
        
        let view = DetailViewController.instantiate()
        let network = NetworkingService()
        let presenter = DetailPresenter(view: view, networkService: network, comment: comment) // DI goes here
        view.presenter = presenter
        return view
    }
    
    static func buildCommentModule() -> CommentViewController {
        let view = CommentViewController.instantiate()
        let network = NetworkingService()
        let presenter = CommentPresenter(view: view, networkingService: network) // DI goes here
        view.presenter = presenter
        return view
    }
}
