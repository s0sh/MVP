//
//  CommentPresenter.swift
//  MVP
//
//  Created by Roman Bigun on 04.03.2021.
//

import Foundation

protocol CommentViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol CommentViewPresenterProtocol: AnyObject {
    init(view: CommentViewProtocol, networkingService: NetworkingServiceProtocol)
    func getComments()
    var comments: [Comment]? { get set }
}

class CommentPresenter: CommentViewPresenterProtocol {
    var comments: [Comment]?
    weak var view: CommentViewProtocol?
    let networkService: NetworkingServiceProtocol!
    
    required init(view: CommentViewProtocol, networkingService: NetworkingServiceProtocol) {
        self.view = view
        self.networkService = networkingService
        getComments()
    }
    
    func getComments() {
        networkService.apiToGetCommentsData { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
