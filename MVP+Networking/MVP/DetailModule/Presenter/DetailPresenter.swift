//
//  DetailPresenter.swift
//  MVP
//
//  Created by Roman Bigun on 03.03.2021.
//

import Foundation
//Input
protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}
//Output
protocol DetailViewPresenterProtocol {
    init(view: DetailViewProtocol, networkService: NetworkingServiceProtocol, comment: Comment?)
    func viewLoaded()
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    var networkService: NetworkingServiceProtocol!
    var comment: Comment?
    
    required init(view: DetailViewProtocol, networkService: NetworkingServiceProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }
    
    public func viewLoaded() {
        view?.setComment(comment: comment)
    }
}
