//
//  ViewController.swift
//  Demo
//
//  Created by Jawad Ali on 09/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import UIKit
import BarAimation
class ViewController: UIViewController {
    var progress = BarLoading()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          print("touches begain")
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.startAnimation(in: view)
          
      }
      override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
          progress.stopAnimation()
        
      }
}

