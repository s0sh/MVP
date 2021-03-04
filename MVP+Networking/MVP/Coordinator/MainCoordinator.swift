//
//  MainCoordinator.swift
//
//  Created by Roman Bigun on 26.01.2021.
//
import UIKit

enum LounchingStrategy {
    case commentList
    case commentDetails(Comment?)
}

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        // this splits by the dot and uses everything after, giving "MyViewController" or whatever controller instantiated
        let className = fullName.components(separatedBy: ".")[1]
        // load our storyboard. Storiboard name should be the sane as class name in my case
        let storyboard = UIStoryboard(name: className, bundle: Bundle.main)
        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start(strategy: LounchingStrategy)
}

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
   
    func commentsList() {
        let vc = ModuleBuilder.buildCommentModule()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func commentDetails(comment: Comment?) {
        let vc = ModuleBuilder.buildCommentDetailModule(comment: comment)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    private func coordinatorFabric(strategy: LounchingStrategy) {
        switch strategy {
        case .commentList:
            commentsList()
        case .commentDetails(let comment):
            commentDetails(comment: comment)
        }
    }
    
    func changeStrategy(strategy: LounchingStrategy) {
        coordinatorFabric(strategy: strategy)
    }
    
    func start(strategy: LounchingStrategy) {
        coordinatorFabric(strategy: strategy)
    }
}
