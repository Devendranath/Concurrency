//
//  ViewController.swift
//  Concurrency
//
//  Created by apple on 26/02/19.
//  Copyright © 2019 iOSProofs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var operationQueue: OperationQueue!
    
//    @IBAction func start(_ sender: Any) {
//        let aConcurrentQueue =  DispatchQueue.global(qos: .background)
//        aConcurrentQueue.async {
//            self.T1()
//        }
//
//        aConcurrentQueue.async {
//            self.T2()
//        }
//    }
    
    @IBAction func start(_ sender: Any) {

        operationQueue = OperationQueue()

        let aBlockOperation = BlockOperation {
            self.T1()
        }

        let bBlockOperation = BlockOperation {
            self.T2()
        }
        
        
        let cBlockOperation = BlockOperation {
            self.T3()
        }
        
        cBlockOperation.addDependency(aBlockOperation)
        
        print(aBlockOperation.queuePriority.rawValue)
        print(bBlockOperation.queuePriority.rawValue)
//       aBlockOperation.queuePriority = .veryLow
        operationQueue.addOperations([aBlockOperation, bBlockOperation, cBlockOperation], waitUntilFinished: true)
        operationQueue.maxConcurrentOperationCount = 2

//        let aConcurrentQueue =  DispatchQueue.global(qos: .background)
//        aConcurrentQueue.async {
//            self.T1()
//        }
//
//        aConcurrentQueue.async {
//            self.T2()
//        }
    }
    
    
//    @IBAction func start(_ sender: Any) {
//        let operationQueue = OperationQueue()
//    }
    
    
    @IBOutlet weak var displayer: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
    }
    
    func T1() {
        for i in 1...100000 {
            
            if i == 1000 {
                operationQueue.cancelAllOperations()
            }
            print("+++++++++++ \(i)")
            OperationQueue.main.addOperation {
                self.displayer.text = "\(i)"
            }
        }
    }
    
    
    func T2() {
        for i in stride(from: 100, to: 0, by: -1) {
            print("--------- \(i)")
        }
    }

    func T3() {
        for i in stride(from: 100, to: 0, by: -1) {
            print("************** \(i) \n \n \n")
        }
    }
}

