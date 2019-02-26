//
//  ViewController.swift
//  Concurrency
//
//  Created by apple on 26/02/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func start(_ sender: Any) {
        let aConcurrentQueue =  DispatchQueue.global(qos: .background)
        aConcurrentQueue.async {
            self.T1()
        }
        
        aConcurrentQueue.async {
            self.T2()
        }
    }
    
    @IBOutlet weak var displayer: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
    }
    
    func T1() {
        for i in 1...100000 {
            print("+++++++++++ \(i)")
            DispatchQueue.main.async {
                self.displayer.text = "\(i)"
            }
        }
    }
    
    
    func T2() {
        for i in stride(from: 100, to: 0, by: -1) {
            print("--------- \(i)")
        }
    }

}

