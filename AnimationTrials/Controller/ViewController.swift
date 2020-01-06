//
//  ViewController.swift
//  AnimationTrials
//
//  Created by Hüsamettin  Eyibil on 6.01.2020.
//  Copyright © 2020 Hüsamettin  Eyibil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
    }
    
    let cardView : UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        view.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.layer.masksToBounds = true
        return view
    }()
    
    let button : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tap me to see what's behind me", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.font = UIFont(name: "Chalkduster", size: 26)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.textColor = .lightGray
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        return button
    }()

    private func setupLayouts() {
        view.addSubview(cardView)
        cardView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        cardView.addSubview(button)
        button.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: cardView.leftAnchor).isActive = true
    }
    
    @objc
    private func didTapButton(_ sender : UIButton) {
        let secondVC = SecondViewController()
        secondVC.transitioningDelegate = self
        present(secondVC, animated: true, completion: nil)
    }

}

extension ViewController : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FlipPresentAnimationController(originFrame: cardView.frame)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let _ = dismissed as? SecondViewController else {
            return nil
        }
        return FlipDismissAnimationController(destinationFrame: cardView.frame)
    }
}

