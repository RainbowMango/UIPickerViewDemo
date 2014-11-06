//
//  ViewController.swift
//  UIPickerViewDemo
//
//  Created by ruby on 14-11-2.
//  Copyright (c) 2014年 ruby. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    // 设置父类和子类数据
    var catagoryBig = ["衣服饰品", "食品酒水", "居家物业", "行车交通"]
    var catagorySmall = ["日常用品", "水电煤气", "房租", "物业管理", "维修保养"]
    
    // 选中的大类和子类
    var selectBigCatagory: String!
    var selectSmallCatagory: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 将delegate和dataSource设置给自己
        pickerView.delegate = self
        pickerView.dataSource = self
        
        //设置选中的大类和子类初始值
        self.selectBigCatagory = self.catagoryBig[0]
        self.selectSmallCatagory = self.catagorySmall[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 返回两个滚动轴
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // 设置每个滚动轴的条目数量
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return self.catagoryBig.count
        case 1:
            return self.catagorySmall.count
        default:
            println("No such component!")
            return 0
        }
    }

    // 设置每个滚动轴的数据
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        switch component {
        case 0:
            return self.catagoryBig[row]
        case 1:
            return self.catagorySmall[row]
        default:
            println("No such component!")
            return String()
        }
    }
    
    // 选中滚动轴时更新label
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            self.selectBigCatagory = self.catagoryBig[row]
        case 1:
            self.selectSmallCatagory = self.catagorySmall[row]
        default:
            println("No such component!")
        }
        
        self.resultLabel.text = self.selectBigCatagory + "--" + self.selectSmallCatagory
    }
}

