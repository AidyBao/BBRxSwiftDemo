//
//  ViewController.swift
//  BBRxSwiftDemo
//
//  Created by SJXC on 2021/8/25.
//

import UIKit


class ViewController: UIViewController {


    
    @IBAction func normalAction(_ sender: UIButton) {
        BBNormalUIViewController.show(superV: self)
    }
    
    @IBAction func rxSwift(_ sender: UIButton) {
        BBRxSwiftViewController.show(superV: self)
    }
    
}

