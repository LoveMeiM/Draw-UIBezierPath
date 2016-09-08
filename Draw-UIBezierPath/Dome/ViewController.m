//
//  ViewController.m
//  Dome
//
//  Created by liubaojian on 16/8/27.
//  Copyright © 2016年 liubaojian. All rights reserved.
//

#import "ViewController.h"
#import "ShowViewController.h"


#define HEIGHT                   [UIScreen mainScreen].bounds.size.height
#define WIDTH                    [UIScreen mainScreen].bounds.size.width


@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableV;
    NSArray *ttleArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"BezierPath 效果展示";
    self.automaticallyAdjustsScrollViewInsets = NO;
    tableV = [[UITableView alloc] initWithFrame:CGRectMake(0,64,WIDTH, HEIGHT-65) style:UITableViewStylePlain];
    tableV.backgroundColor=[UIColor whiteColor];
    tableV.delegate=self;
    tableV.dataSource=self;
    tableV.scrollEnabled=YES;
    tableV.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:tableV];

    ttleArray = @[@"边框状矩形",
                 @"实心矩形",
                 @"有边框的实心矩形",
                 @"有边框椭圆曲线",
                 @"四角中的某个或多个角设置圆角",
                 @"以某个中心点画弧线",
                 @"添加一个弧线",
                 @"根据CGPath创建并返回自定义的路径",
                 @"画个三角形",
                 @"一次弯曲的曲线",
                 @"两次弯曲的曲线",
                  @"曲线间断连接"];
    
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return ttleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"firstCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = ttleArray[indexPath.row];
    cell.tag = indexPath.row;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    ShowViewController *showVC = [[ShowViewController alloc]init];
    showVC.cellTag = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    showVC.titleStr = ttleArray[indexPath.row];
    [self.navigationController pushViewController:showVC animated:YES];
    
}




@end
