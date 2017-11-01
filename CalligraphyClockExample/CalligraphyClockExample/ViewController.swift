//
//  ViewController.swift
//  CalligraphyClockExample
//
//  Created by David on 2017. 7. 6..
//  Copyright © 2017년 kanziw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var h1: UILabel!
    @IBOutlet weak var h2: UILabel!
    @IBOutlet weak var hourChar: UILabel!
    @IBOutlet weak var m1: UILabel!
    @IBOutlet weak var m2: UILabel!
    @IBOutlet weak var m3: UILabel!
    @IBOutlet weak var minChar: UILabel!
    @IBOutlet weak var s1: UILabel!
    @IBOutlet weak var s2: UILabel!
    @IBOutlet weak var s3: UILabel!
    @IBOutlet weak var secChar: UILabel!
    @IBOutlet weak var fullDisplay: UILabel!
    
//    var timer: Timer? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 시간 정보를 표시하기 위해 updateTime 메서드 호출
//        updateTime()
        
        let language = Locale.preferredLanguages[0]
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime(timer:)), userInfo: language, repeats: true)
        updateTime(timer: timer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTime(timer: Timer) {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second], from: date)
        let hour = components.hour! <= 12 ? components.hour : components.hour! - 12
        let minutes = components.minute
        let seconds = components.second
        let hours: Array = ["영", "한", "두", "세", "네", "다섯", "여섯", "일곱", "여덟", "아홉", "열", "열 한", "열 두"]
        let numbers: Array = ["영", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구", "십"]
        
        let timestamp = DateFormatter.localizedString(from: date, dateStyle: .none, timeStyle: .medium)
        fullDisplay.text = timestamp
        
        if hours[hour!].characters.count > 1 {
            h1.text = "\(hours[hour!].characters.first!)"
            h2.text = "\(hours[hour!].characters.last!)"
        } else {
            h1.text = ""
            h2.text = hours[hour!]
        }
        
        hourChar.text = "시"
        
        if minutes! <= 10 {
            m1.text = ""
            m2.text = ""
            m3.text = "\(numbers[minutes!])"
        } else if minutes! < 20 {
            m1.text = ""
            m2.text = "\(numbers[10])"
            m3.text = "\(numbers[minutes!%10])"
        } else {
            if minutes! % 10 == 0 {
                m1.text = ""
                m2.text = "\(numbers[10])"
                m3.text = "\(numbers[minutes!%10])"
            } else {
                m1.text = "\(numbers[minutes!/10])"
                m2.text = "\(numbers[10])"
                m3.text = "\(numbers[minutes!%10])"
            }
        }
        
        minChar.text = "분"
        
        if seconds! <= 10 {
            s1.text = ""
            s2.text = ""
            s3.text = "\(numbers[seconds!])"
        } else if seconds! < 20 {
            s1.text = ""
            s2.text = "\(numbers[10])"
            s3.text = "\(numbers[seconds!%10])"
        } else {
            if seconds! % 10 == 0 {
                s1.text = ""
                s2.text = "\(numbers[seconds!/10])"
                s3.text = "\(numbers[10])"
            } else {
                s1.text = "\(numbers[seconds!/10])"
                s2.text = "\(numbers[10])"
                s3.text = "\(numbers[seconds!%10])"
            }
        }
        
        secChar.text = "초"
        
        if String(describing: timer.userInfo).range(of: "ko") == nil {
            fullDisplay.text = timestamp
        } else {
            fullDisplay.text = ""
        }
    }
}

