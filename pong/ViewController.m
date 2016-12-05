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
    location = [ touch locationInView:touch.view];
    paddle.center = CGPointMake(location.x, paddle.center.y);
};

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [self touchesBegan: touches withEvent:event];
}
-(void) ballPosition{
    ball.center = CGPointMake(ball.center.x + Xgain, ball.center.y + Ygain);
//    NSLog(@"%f%f", Ball.center.x, Ball.center.y);
    
    if (ball.center.x  < 15) {
        Xgain = labs(Xgain);
    }
    if (ball.center.y  < 15) {
        Ygain= labs(Ygain);
    }
    if (ball.center.x  > [UIScreen mainScreen].bounds.size.width - 15) {
        Xgain = -labs(Xgain);
    }
    if (ball.center.y  >[UIScreen mainScreen].bounds.size.height- 15 ) {
        Ygain = -labs(Xgain);
    }
    if(ball.center.y > paddle.center.y){
        [self blastTheGame];
    }
    if(CGRectIntersectsRect(ball.frame, paddle.frame)){
        Ygain = -labs(Ygain);
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    gameOverView.hidden = YES;
//    scrollView.contentSize = CGSizeMake(1280, 960);
    timer = [ NSTimer scheduledTimerWithTimeInterval:0.08 target:self
                                           selector : @selector(ballPosition) userInfo:nil repeats : YES];
    NSLog(@"%f@%f", ball.center.x, ball.center.y);
    Xgain = 10;
    Ygain = 10;
}

-(void)blastTheGame{
    gameOverView.hidden = NO;
//    ball.hidden = YES;
//    self.view.userInteractionEnabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
