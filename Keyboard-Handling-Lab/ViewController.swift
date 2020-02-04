//
//  ViewController.swift
//  Keyboard-Handling-Lab
//
//  Created by Matthew Ramos on 2/3/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImageView.layer.cornerRadius = logoImageView.bounds.width / 2
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        logoImageView.alpha = 1
        
        pulseAnimation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        scaleAnimation(0.333)
    }
    
    
    private func pulseAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            self.logoImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: nil)
    }
    
    private func scaleAnimation(_ input: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            self.logoImageView.transform = CGAffineTransform(scaleX: input, y: input)
            self.logoImageView.alpha = 0.0
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        scaleAnimation(3)
    }
    


}

