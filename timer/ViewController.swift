//
//  ViewController.swift
//  timer
//
//  Created by 神山駿 on 2021/02/08.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var stop: UIButton!
    
    var timer = Timer()
    var count = Int()
    var imageArray = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        stop.isEnabled = true
        count = 0
        
        for i in 0..<5 {
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        }
        
        image.image = UIImage(named: "0")
    }

    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    @objc func timerUpdate(){
        count += 1
        
        if (count > 4){
            count = 0
        }
        image.image = imageArray[count]
    }
    
    @IBAction func start(_ sender: Any) {
        start.isEnabled = false
        startTimer()
        stop.isEnabled = true
    }
    
    @IBAction func stop(_ sender: Any) {
        start.isEnabled = true
        timer.invalidate()
        stop.isEnabled = false
    }
}

