//
//  PL1HeartView.h
//  iProg3_072015_LayersDemo
//
//  Created by Nikolay Shubenkov on 01/08/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PL1HeartView : UIView

-(void)setXAcceleration;
-(void)setYAcceleration;
-(void)setNormalAcceleration;

- (void)startEmitting;
- (void)stopEmitting;
- (void)setEmittingPosition:(CGPoint)position;

@end
