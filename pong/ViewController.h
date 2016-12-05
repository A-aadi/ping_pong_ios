//
//  ViewController.h
//  pong
//
//  Created by adarshks on 5/20/16.
//  Copyright © 2016 adarshks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UIImageView *paddle;
    IBOutlet UIImageView *ball;
    long Ygain;
    long Xgain;
    NSTimer *timer;
    __weak IBOutlet UIScrollView *scrollView;
    __weak IBOutlet UILabel *gameOverView;
    CGPoint location;
}



@end

