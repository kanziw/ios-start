//
//  ViewController.swift
//  LottoDrawExample
//
//  Created by David on 2017. 6. 23..
//  Copyright © 2017년 kanziw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 해당 테이블의 섹션 개수 - 필수 메서드
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        return 1
    }
    
    // 해당 섹션의 셀 개수 - 필수 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lottoNumbers.count
    }
    
    // 샐 생성과 반환 = 필수 메서드
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lottoCell", for: indexPath as IndexPath) as! LottoCell
        
        let row: Int = indexPath.row
        
        cell.number1.text = "\(lottoNumbers[row][0])"
        cell.number2.text = "\(lottoNumbers[row][1])"
        cell.number3.text = "\(lottoNumbers[row][2])"
        cell.number4.text = "\(lottoNumbers[row][3])"
        cell.number5.text = "\(lottoNumbers[row][4])"
        cell.number6.text = "\(lottoNumbers[row][5])"
        
        return cell
    }
    
    var lottoNumbers = Array<Array<Int>>()
    @IBAction func doDraw(_ sender: UIBarButtonItem) {
        lottoNumbers = Array<Array<Int>>()
        
        var originalNumbers = Array(1 ... 45 )
        var index = 0
        
        for _ in 0 ... 4 {
            originalNumbers = Array(1 ... 45)
            var columnArray = Array<Int>()
            
            for _ in 0 ... 5 {
                index = Int(arc4random_uniform(UInt32(originalNumbers.count)))
                columnArray.append(originalNumbers[index])
                originalNumbers.remove(at: index)
            }
            
            columnArray.sort(by: { $0 < $1 })
            lottoNumbers.append(columnArray)
        }
        
        tableView.reloadData()
    }
}

