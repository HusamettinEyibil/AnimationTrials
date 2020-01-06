//
//  SecondViewController.swift
//  AnimationTrials
//
//  Created by Hüsamettin  Eyibil on 6.01.2020.
//  Copyright © 2020 Hüsamettin  Eyibil. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "images")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let button : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .darkGray
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.setTitle("Turn Back", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont(name: "Chalkduster", size: 26)
        button.addTarget(self, action: #selector(turnButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private func setupLayouts() {
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        view.addSubview(button)
        button.widthAnchor.constraint(equalToConstant: 255).isActive = true
        button.heightAnchor.constraint(equalToConstant: 75).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    @objc
    private func turnButtonTapped(_ sender : UIButton) {
        dismiss(animated: true, completion: nil)
    }


}
