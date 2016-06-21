//
//  ViewController.swift
//  Rolltheball
//
//  Created by Dân Tơi on 6/20/16.
//  Copyright © 2016 Dân Tơi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var ball = UIImageView()
    var deltaangle = CGFloat()
    var timer = NSTimer()
    
    @IBAction func coban(sender: AnyObject) {
        for view in self.view.subviews {
            if view is UIImageView{
                view.removeFromSuperview()
            }
        }
        addball()
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(rollright), userInfo: nil, repeats: true)
    }
    @IBAction func nangcao(sender: AnyObject) {
        for view in self.view.subviews {
            if view is UIImageView{
                view.removeFromSuperview()
            }
        }
        addball()
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(downright), userInfo: nil, repeats: true)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    func addball()
    {
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ball.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.5)
        self.view.addSubview(ball)
    }

   func downright()
   {
        if ball.center.x > self.view.bounds.size.width - 32
        {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(downleft), userInfo: nil, repeats: true)
        }
        if ball.center.y > self.view.bounds.size.height - 32
        {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(upright), userInfo: nil, repeats: true)
        }
        else
        {
            deltaangle = deltaangle + 0.1
            print (deltaangle)
            ball.transform = CGAffineTransformMakeRotation(deltaangle)
            UIView.animateWithDuration(0.02, animations:
            {
                self.ball.center = CGPointMake(self.ball.center.x + 32*0.1, self.ball.center.y + 32*0.1)
            })
        }
    }
    func upright()
    {
        if ball.center.x > self.view.bounds.size.width - 32
        {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(upleft), userInfo: nil, repeats: true)
        }
        if ball.center.y < 32
        {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(downright), userInfo: nil, repeats: true)
        }
        else
        {
            deltaangle = deltaangle - 0.1
            print (deltaangle)
            ball.transform = CGAffineTransformMakeRotation(deltaangle)
            UIView.animateWithDuration(0.02, animations:
                {
                    self.ball.center = CGPointMake(self.ball.center.x + 32*0.1, self.ball.center.y - 32*0.1)
            })
        }
    }
    func downleft()
    {
        if ball.center.x <  32
        {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(downright), userInfo: nil, repeats: true)
        }
        if ball.center.y > self.view.bounds.size.height - 32
        {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(upleft), userInfo: nil, repeats: true)
        }
        else
        {
            deltaangle = deltaangle - 0.1
            print (deltaangle)
            ball.transform = CGAffineTransformMakeRotation(deltaangle)
            UIView.animateWithDuration(0.02, animations:
                {
                    self.ball.center = CGPointMake(self.ball.center.x - 32*0.1, self.ball.center.y + 32*0.1)
            })
        }
    }
    
    func upleft()
    {
        if ball.center.x <  32
        {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(upright), userInfo: nil, repeats: true)
        }
        if ball.center.y <  32
        {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(downleft), userInfo: nil, repeats: true)
        }
        else
        {
            deltaangle = deltaangle + 0.1
            print (deltaangle)
            ball.transform = CGAffineTransformMakeRotation(deltaangle)
            UIView.animateWithDuration(0.02, animations:
                {
                    self.ball.center = CGPointMake(self.ball.center.x - 32*0.1, self.ball.center.y - 32*0.1)
            })
        }
    }
    
    func rollright()
    {
        if ball.center.x > self.view.bounds.size.width - 32
        {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(rollleft), userInfo: nil, repeats: true)
        }
        else
        {
            deltaangle = deltaangle + 0.1
            print (deltaangle)
            ball.transform = CGAffineTransformMakeRotation(deltaangle)
            UIView.animateWithDuration(0.02, animations:
                {
                    self.ball.center = CGPointMake(self.ball.center.x + 32*0.1, self.ball.center.y )
            })
        }
    }
    func rollleft()
    {
        if ball.center.x < 32
        {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(rollright), userInfo: nil, repeats: true)
        }
        else
        {
            deltaangle = deltaangle - 0.1
            print (deltaangle)
            ball.transform = CGAffineTransformMakeRotation(deltaangle)
            UIView.animateWithDuration(0.02, animations:
                {
                    self.ball.center = CGPointMake(self.ball.center.x - 32*0.1, self.ball.center.y )
            })
        }
    }


}

