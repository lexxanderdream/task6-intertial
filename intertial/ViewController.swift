//
//  ViewController.swift
//  intertial
//
//  Created by Alexander Zhuchkov on 18.02.2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: -
    lazy var animator = UIDynamicAnimator(referenceView: view)
    var snap: UISnapBehavior?
    
    // MARK: - Subviews
    private let squareView: UIView = {
        let view = UIView()
        
        // Setup
        view.layer.cornerRadius = 20
        view.backgroundColor = .red
        
        view.frame.size = .init(width: 100, height: 100)
        
        return view
    }()

    // MARK: -
    private func setupView() {
        view.addSubview(squareView)
        
        squareView.frame.origin = .init(x: 200, y: 200)
        
        // Tap Gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: -
    @objc
    func viewTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        let location = gestureRecognizer.location(in: view)
        
        if let snap = snap {
            animator.removeBehavior(snap)
        }
        
        let snap = UISnapBehavior(item: squareView, snapTo: location)
        animator.addBehavior(snap)
        
        self.snap = snap
    }
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }


}
