//
//  PL1HeartView.m
//  iProg3_072015_LayersDemo
//
//  Created by Nikolay Shubenkov on 01/08/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "PL1HeartView.h"

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
    layer.emitterPosition = self.center;
    layer.emitterSize = CGSizeMake(50, 50);
    layer.emitterShape = @"sphere";
    
    //частицы
    CAEmitterCell *heartCell = [CAEmitterCell emitterCell];
    heartCell.birthRate = 15;
    heartCell.lifetime  = 8;
    heartCell.lifetimeRange = 4;
    heartCell.contents = (id) [[UIImage imageNamed:@"heart"] CGImage];
    
    heartCell.velocity = 100;
    heartCell.emissionRange = 2 * M_PI;
    
    heartCell.spin = 0.5;
    heartCell.scale = 0.1;
    
    layer.emitterCells = @[heartCell];
}


@end
