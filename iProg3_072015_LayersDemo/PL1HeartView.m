//
//  PL1HeartView.m
//  iProg3_072015_LayersDemo
//
//  Created by Nikolay Shubenkov on 01/08/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "PL1HeartView.h"
#import "PL1LoveViewController.h"
@interface PL1HeartView ()

@property (weak, nonatomic) CAEmitterCell *cell;

@end

@implementation PL1HeartView

- (id)initWithCoder:(nonnull NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self){
        [self setup];
    }
    
    return self;
}

//Layer нашего вью будет объектом данного класса,
//т.е. будет генерировать частицы
+ (Class)layerClass
{
    return [CAEmitterLayer class];
}

- (void)setup
{
    self.clipsToBounds = YES;
    //Контейнер частиц
    CAEmitterLayer *layer = (CAEmitterLayer *)self.layer;
    layer.frame = self.bounds;
    layer.emitterPosition = CGPointMake(-50, -50);
    layer.emitterSize = CGSizeMake(50, 50);

    //частицы
    CAEmitterCell *heartCell = [CAEmitterCell emitterCell];
    heartCell.birthRate = 0;
    heartCell.lifetime  = 8;
    heartCell.lifetimeRange = 4;
    heartCell.contents = (id) [[UIImage imageNamed:@"heart"] CGImage];
    
    heartCell.velocity = 100;
    heartCell.emissionRange = 2 * M_PI;

    heartCell.spin = 0.5;
    heartCell.scale = 0.1;
    heartCell.name = @"love";
    self.cell = heartCell;

    
    layer.emitterCells = @[heartCell];
}

#warning сам вызов изменения акселерации при вождении пальцем по экрану
-(void)setAccelerationDuringNow:(CGFloat)x :(CGFloat)y
{
    self.cell.xAcceleration = x;
    self.cell.yAcceleration = y;
}

-(void)setXAcceleration
{
    self.cell.yAcceleration = 0;
    self.cell.xAcceleration = 170;
}

-(void)setYAcceleration
{
    self.cell.xAcceleration = 0;
    self.cell.yAcceleration = -270;
}

-(void)setNormalAcceleration
{
    self.cell.xAcceleration = 0;
    self.cell.yAcceleration = 0;
}

- (void)setEmittingPosition:(CGPoint)position
{
    CAEmitterLayer *layer = (CAEmitterLayer *)self.layer;
    layer.emitterPosition = position;
    [self startEmitting];
}

-(BOOL)checkTouchInViewForPoint:(CGPoint)point
{
    CGRect boundsRect = self.bounds;
    return CGRectContainsPoint(boundsRect, point);
}


- (void)stopEmitting
{
    CAEmitterLayer *layer = (CAEmitterLayer *)self.layer;
    [layer setValue:@0 forKeyPath:@"emitterCells.love.birthRate"];
    layer.emitterPosition = CGPointMake(-50, -50);
}

- (void)startEmitting
{
    CAEmitterLayer *layer =  (CAEmitterLayer *)self.layer;
    if (![self checkTouchInViewForPoint:layer.emitterPosition]) {
        return;
    }
    [UIView animateWithDuration:0.5
                     animations:^{
                         CAEmitterLayer *layer = (CAEmitterLayer *)self.layer;
                         [layer setValue:@15 forKeyPath:@"emitterCells.love.birthRate"];

                     }];
}




//CAEmitterLayer *layer = (CAEmitterLayer *)self.layer;
//[layer setValue:@15 forKey:@"heart"];











@end
