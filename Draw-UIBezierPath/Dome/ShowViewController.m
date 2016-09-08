//
//  ShowViewController.m
//  Dome
//
//  Created by liubaojian on 16/8/28.
//  Copyright © 2016年 liubaojian. All rights reserved.
//

#import "ShowViewController.h"
#import "BezierPathView.h"

@interface ShowViewController ()

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title =  self.titleStr;
    
    BezierPathView *bezierP = [[BezierPathView alloc]initWithFrame:self.view.bounds];
    bezierP.typeStr = self.cellTag ;
    [self.view addSubview:bezierP];
        
}



@end
