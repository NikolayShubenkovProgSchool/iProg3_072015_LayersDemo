//
//  PL1LoveViewController.m
//  iProg3_072015_LayersDemo
//
//  Created by Nikolay Shubenkov on 01/08/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "PL1LoveViewController.h"

@interface PL1LoveViewController ()

@property (nonatomic, strong) CAEmitterLayer *emitter;

@end

@implementation PL1LoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createLoveLayer];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    self.emitter.beginTime = CACurrentMediaTime();
    self.emitter.lifetime  = 1;
}

- (void)touchesMoved:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    self.emitter.emitterPosition = [[touches anyObject] locationInView:self.view];
    self.emitter.renderMode = kCAEmitterLayerAdditive;
}

- (void)touchesEnded:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    self.emitter.lifetime  = 0;
}

- (void)createLoveLayer
{
    //Контейнер частиц
    CAEmitterLayer *layer = [CAEmitterLayer new];
    layer.frame = self.view.bounds;
    layer.emitterPosition = self.view.center;
    layer.emitterShape = @"sphere";
    layer.emitterSize = CGSizeMake(50, 50);
    self.emitter = layer;
    self.emitter.lifetime = 0;
    
    //частицы
    CAEmitterCell *heartCell = [CAEmitterCell emitterCell];
    heartCell.birthRate = 15;
    heartCell.lifetime  = 14;

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
