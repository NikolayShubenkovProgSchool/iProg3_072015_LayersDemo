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
    layer.emitterSize = CGSizeMake(50, 50);
    
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
    
    [self.view.layer addSublayer:layer];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
