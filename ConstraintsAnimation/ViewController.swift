//
//  ViewController.swift
//  ConstraintsAnimation
//
//  Created by Afir Thes on 22.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var topMenuConstraint: NSLayoutConstraint!
    
    var isMenuOpen: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        topMenuConstraint.constant = -menuView.frame.size.height + CGFloat(40) + statusBarHeight
        menuView.layer.shadowOpacity = 0.4
        menuView.layer.shadowColor = UIColor.black.cgColor
        menuView.layer.shadowRadius = CGFloat(15.0)
        menuView.layer.shadowOffset = CGSize.zero
        menuView.layer.shadowRadius = CGFloat(15.0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        redButton.layer.cornerRadius = redButton.frame.size.width / 2
        orangeButton.layer.cornerRadius = orangeButton.frame.size.width / 2
        purpleButton.layer.cornerRadius = purpleButton.frame.size.width / 2
    }

    @IBAction func redAction(_ sender: Any) {
        view.backgroundColor = UIColor.red
    }
    
    @IBAction func purpleAction(_ sender: Any) {
        view.backgroundColor = UIColor.purple
    }
    
    @IBAction func orangeAction(_ sender: Any) {
        view.backgroundColor = UIColor.orange
    }
    
    func closeMenu() {
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        //self.view.layoutIfNeeded() // handle pending updates
        
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut) {
            self.topMenuConstraint.constant = -self.menuView.frame.size.height + CGFloat(40) + statusBarHeight
            self.view.layoutIfNeeded()
        }

    }
    
    func openMenu() {
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut) {
            self.topMenuConstraint.constant = CGFloat.zero
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func toggleAction(_ sender: UIButton) {
        
        if isMenuOpen {
            toggleButton.setTitle("Open", for: .normal)
            isMenuOpen = false
            closeMenu()
        } else {
            toggleButton.setTitle("Close", for: .normal)
            isMenuOpen = true
            openMenu()
        }
        
    }
    
}

