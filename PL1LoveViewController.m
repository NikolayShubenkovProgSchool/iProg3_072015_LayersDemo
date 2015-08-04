//
//  PL1LoveViewController.m
//  iProg3_072015_LayersDemo
//
//  Created by Nikolay Shubenkov on 01/08/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "PL1LoveViewController.h"
#import "PL1HeartView.h"

@interface PL1LoveViewController ()
@property (weak, nonatomic) IBOutlet PL1HeartView *heartView;


@end

@implementation PL1LoveViewController
- (IBAction)leftAceleration:(id)sender {
    [self.heartView setXAcceleration];
}
- (IBAction)upAceleration:(id)sender {
    [self.heartView setYAcceleration];
}
- (IBAction)normalAceleration:(id)sender {
    [self.heartView setNormalAcceleration];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}


-(void)showHeartsFromTouches:(nonnull NSSet*)touches
{
    UITouch *touch = [touches anyObject];
    CGPoint aPoint = [touch locationInView:self.heartView];
    [self.heartView setEmittingPosition:aPoint];
    [self.heartView startEmitting];
#warning вот вызов метода
    [self.heartView setAccelerationDuringNow:aPoint.x :aPoint.y];
}

- (void)touchesBegan:(nonnull NSSet*)touches withEvent:(nullable UIEvent *)event
{
    [self showHeartsFromTouches:touches];
    

}

- (void)touchesMoved:(nonnull NSSet*)touches withEvent:(nullable UIEvent *)event
{
    [self showHeartsFromTouches:touches];
    
}

- (void)touchesEnded:(nonnull NSSet*)touches withEvent:(nullable UIEvent *)event
{
   
    [self.heartView stopEmitting];
    
}

- (void)touchesCancelled:(nullable NSSet*)touches withEvent:(nullable UIEvent *)event
{
    [self.heartView stopEmitting];
}

@end
