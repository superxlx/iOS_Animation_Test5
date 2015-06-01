//
//  ViewController.swift
//  iOS_Animation_Test5
//
//  Created by xlx on 15/5/31.
//  Copyright (c) 2015年 xlx. All rights reserved.
//

import UIKit
func delay(#seconds: Double, completion:()->()) {
    let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
    
    dispatch_after(popTime, dispatch_get_main_queue()) {
        completion()
    }
}
class ViewController: UIViewController {

    @IBOutlet weak var avatar_2: AvatarView!
    @IBOutlet weak var avatar: AvatarView!
    override func viewDidLoad() {
        super.viewDidLoad()
       searchForOpponent()

    }
    func searchForOpponent() {
        let avatarSize                           = avatar.frame.size
        let bounceXOffset: CGFloat               = avatarSize.width/1.9
        let morphSize                            = CGSize(
            width: avatarSize.width * 0.85,
            height: avatarSize.height * 1.1)

        let rightBouncePoint                     = CGPoint(
            x: view.frame.size.width/2.0 + bounceXOffset,
            y: avatar.center.y)
        let leftBouncePoint                      = CGPoint(
            x: view.frame.size.width/2.0 - bounceXOffset,
            y: avatar_2.center.y)

        avatar.bounceOffPoint(leftBouncePoint, morphSize: morphSize)
        avatar_2.bounceOffPoint(rightBouncePoint, morphSize: morphSize)


        delay(seconds: 1.0, connectedToOpponent)
    }

    func connectedToOpponent() {
        avatar.shouldTransitionToFinishedState   = true
        avatar_2.shouldTransitionToFinishedState = true

    }



}

