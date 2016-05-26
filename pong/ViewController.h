//
//  ViewController.h
//  pong
//
//  Created by adarshks on 5/20/16.
//  Copyright © 2016 adarshks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UIImageView *Paddle;
    IBOutlet UIImageView *Ball;
    long Ygain;
    long Xgain;
    NSTimer *timer;
}



@end

