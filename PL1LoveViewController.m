//
//  PL1LoveViewController.m
//  iProg3_072015_LayersDemo
//
//  Created by Nikolay Shubenkov on 01/08/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "PL1LoveViewController.h"

@interface PL1LoveViewController ()

@end

@implementation PL1LoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createLoveLayer];
    // Do any additional setup after loading the view.
}

- (void)createLoveLayer
{
    //Контейнер частиц
    CAEmitterLayer *layer = [CAEmitterLayer new];
    layer.frame = self.view.bounds;
    layer.emitterPosition = self.view.center;
    layer.emitterShape = @"sphere";
    layer.emitterSize = CGSizeMake(50, 50);

    
    //частицы
    CAEmitterCell *heartCell = [CAEmitterCell emitterCell];
    heartCell.birthRate = 15;
    heartCell.lifetime  = 14;
    heartCell.lifetimeRange = 4;
    heartCell.contents = (id) [[UIImage imageNamed:@"heart"] CGImage];
    heartCell.yAcceleration = 100;
    
    
    heartCell.velocity = 100;
    heartCell.emissionRange = M_PI * 2;
    heartCell.emissionLongitude = M_PI / 2;
    heartCell.emissionLatitude  = M_PI / 2;
    heartCell.spinRange = 5;
    
    heartCell.spin = 0;
    heartCell.scale = 0.1;
    
    layer.emitterCells = @[heartCell];
    
    [self.view.layer addSublayer:layer];
}

@end
