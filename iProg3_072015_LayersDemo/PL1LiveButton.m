//
//  PL1LiveButton.m
//  iProg3_072015_LayersDemo
//
//  Created by Nikolay Shubenkov on 01/08/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "PL1LiveButton.h"

#import <pop/Pop.h>

@implementation PL1LiveButton

- (id)initWithCoder:(nonnull NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self){
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self addTarget:self
             action:@selector(scaleToSmallSize)
   forControlEvents:UIControlEventTouchDown];
    
    [self addTarget:self
             action:@selector(scaleToDefaultSize)
   forControlEvents:UIControlEventTouchUpOutside];
    
    [self addTarget:self
             action:@selector(makeSizeBouncing)
   forControlEvents:UIControlEventTouchUpInside];
}

- (void)scaleToSmallSize
{
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue =  [NSValue valueWithCGSize:CGSizeMake(0.9, 0.9)];
    [self.layer pop_addAnimation:scaleAnimation forKey:@"scaleToSmall"];
}

- (void)scaleToDefaultSize
{
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    [self.layer pop_addAnimation:scaleAnimation forKey:@"scaleToDefault"];
}

- (void)makeSizeBouncing
{
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    springAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    springAnimation.springBounciness = 18;
    
    [self.layer pop_addAnimation:springAnimation forKey:@"scaleWithBounce"];
}

@end


