//
//  ViewController.swift
//  No.7
//
//  Created by ktrade on 2020/8/14.
//  Copyright © 2020 Swift. All rights reserved.
//

import UIKit

struct ImageModel {
    let img: UIImage
}

class ViewController: UIViewController {
    
    @IBOutlet weak var imageViews: UIImageView!
    
    let models = [ImageModel(img: UIImage(named: "pic0")!),
                  ImageModel(img: UIImage(named: "pic1")!),
                  ImageModel(img: UIImage(named: "pic2")!),
                  ImageModel(img: UIImage(named: "pic3")!),
                  ImageModel(img: UIImage(named: "pic4")!),
    ]

    var count: Int = 0
    var images = [UIImage]()
    var isTap: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageViews.image = models[count].img
        
        view.backgroundColor = .white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapScreen))
        view.addGestureRecognizer(tap)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    @objc func tapScreen() {
        // 改變背景顏色
        if isTap {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = .black
        }
        isTap = !isTap
        
        // 要輪播的次數
        for k in 0..<5 {
            images.append(models[k].img)
        }
        // 設定動畫(with: 陣列, duration: 幾秒後播放下一張)
        let animatedImage = UIImage.animatedImage(with: images, duration: 2)
        imageViews.image = animatedImage
    }
    
    
}


//
//// 用自己創的 array 設定的方法
//count += 1
//if count < 5 {
//    imageViews.image = models[count].img
//} else if count >= 5{
//     count = 0
//    imageViews.image = models[count].img
//} else {
//    count = 0
//}
