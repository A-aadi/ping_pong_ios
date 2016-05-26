//
//  ViewController.m
//  pong
//
//  Created by adarshks on 5/20/16.
//  Copyright © 2016 adarshks. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint loaction = [ touch locationInView:touch.view];
    Paddle.center = CGPointMake(loaction.x, Paddle.center.y);
};

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [self touchesBegan: touches withEvent:event];
}
-(void) ballPosition{
    Ball.center = CGPointMake(Ball.center.x + Xgain, Ball.center.y + Ygain);
//    NSLog(@"%f%f", Ball.center.x, Ball.center.y);
    
    if (Ball.center.x  < 15) {
        Xgain = labs(Xgain);
    }
    if (Ball.center.y  < 15) {
        Ygain= labs(Ygain);
    }
    if (Ball.center.x  > [UIScreen mainScreen].bounds.size.width - 15) {
        Xgain = -labs(Xgain);
    }
    if (Ball.center.y  >[UIScreen mainScreen].bounds.size.height- 15 ) {
        Ygain = -labs(Xgain);
    }
    if(CGRectIntersectsRect(Ball.frame, Paddle.frame)){
        Ygain = -labs(Ygain);
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    timer = [ NSTimer scheduledTimerWithTimeInterval:0.05 target:self
                                           selector : @selector(ballPosition) userInfo:nil repeats : YES];
    NSLog(@"%f@%f", Ball.center.x, Ball.center.y);
//    NSLog(@"%ld", Xgain);
//    Paddle.frame = CGRectMake(0.0, 346.0, 30,15);
    Xgain = 10;
    Ygain = 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
