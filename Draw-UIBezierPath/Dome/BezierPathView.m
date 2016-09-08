//
//  BezierPathView.m
//  Dome
//
//  Created by liubaojian on 16/8/27.
//  Copyright © 2016年 liubaojian. All rights reserved.
//

#import "BezierPathView.h"
#import <objc/runtime.h>

//由角度获取弧度 有弧度获取角度
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)

@implementation BezierPathView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews
{
    
}
- (void)drawRect:(CGRect)rect {
    
    SEL selector = NSSelectorFromString([NSString stringWithFormat:@"forDrow%@",self.typeStr]);
    IMP imp = [self methodForSelector:selector];
    void (*func)(id, SEL) = (void *)imp;
    func(self, selector);
   
}
- (void)forDrow0
{
    //边框
    UIBezierPath *bezierP = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)];
    [[UIColor blueColor] set];
    bezierP.lineWidth = 10;
    bezierP.lineCapStyle = kCGLineCapSquare;
    [bezierP stroke];//
}
- (void)forDrow1
{
    //内部填充颜色
    UIBezierPath *bezierP = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)];
    [[UIColor redColor] set];
    [bezierP fill];
}

- (void)forDrow2
{
    //带边框的矩形
    UIBezierPath *bezierP = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)];
    [[UIColor redColor] set];
    [bezierP fill];
    [[UIColor blueColor] set];
    [bezierP stroke];
}

- (void)forDrow3
{
    // 根据一个Rect 画一个椭圆曲线  Rect为正方形时 画的是一个圆
    UIBezierPath *oval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 120)];
    [[UIColor redColor] set];
    [oval fill];
    [[UIColor blueColor] set];
    [oval stroke];
}

- (void)forDrow4
{
    // 根据一个Rect 针对四角中的某个或多个角设置圆角
    UIBezierPath *roundedRect2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 120, 80) byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 30)];
    [[UIColor blackColor] set];
    [roundedRect2 fill];
    [[UIColor orangeColor] set];
    [roundedRect2 stroke];

}

- (void)forDrow5
{
    // 以某个中心点画弧线
    UIBezierPath *arcPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 200) radius:100 startAngle:0 endAngle:degreesToRadian(90) clockwise:YES];
    [[UIColor magentaColor] set];
     arcPath.lineWidth = 2;
    [arcPath stroke];
}

- (void)forDrow6
{
    // 添加一个弧线
    UIBezierPath *arcPath2 = [UIBezierPath bezierPath];
    [arcPath2 moveToPoint:CGPointMake(50, 280)];
    [arcPath2 addArcWithCenter:CGPointMake(200, 280) radius:100 startAngle:degreesToRadian(180) endAngle:degreesToRadian(360) clockwise:YES];
    // 添加一个UIBezierPath
    [arcPath2 appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 280) radius:80 startAngle:0 endAngle:M_PI*2 clockwise:YES]];
    [[UIColor purpleColor] set];
    [arcPath2 stroke];
}


- (void)forDrow7
{
    
    UIBezierPath *framePath;
    CGFloat arrowWidth = 14;
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect rectangle = CGRectInset(CGRectMake(20, 90, 300, CGRectGetWidth(self.bounds)-100), 80,30);//内构矩形
    
    CGPoint p[3] = {
        //中心点的x坐标
        {CGRectGetMidX(self.bounds)-arrowWidth/2, CGRectGetWidth(self.bounds)-6},
        
        {CGRectGetMidX(self.bounds)+arrowWidth/2, CGRectGetWidth(self.bounds)-6},
        
        {CGRectGetMidX(self.bounds), CGRectGetHeight(self.bounds)-4}
        
    };
    
    CGPathAddRoundedRect(path, NULL, rectangle, 5, 5);
    CGPathAddLines(path, NULL, p, 3);
    CGPathCloseSubpath(path);
    framePath = [UIBezierPath bezierPathWithCGPath:path];
    CGPathRelease(path);
    
    [[UIColor brownColor] set];
    [framePath stroke];

}

- (void)forDrow8
{
    // 三角形
    UIBezierPath *triangle = [UIBezierPath bezierPath];
    [triangle moveToPoint:CGPointMake(145, 165)];
    [triangle addLineToPoint:CGPointMake(190, 240)];
    [triangle addLineToPoint:CGPointMake(100, 240)];
    [triangle closePath];
    [[UIColor greenColor] set];
    [triangle stroke];
}
- (void)forDrow9
{
    //两次贝塞尔曲线
    UIBezierPath *quadBe2 = [UIBezierPath bezierPath];
    [quadBe2 moveToPoint:CGPointMake(160, 200)];
    [quadBe2 addQuadCurveToPoint:CGPointMake(260, 200) controlPoint:CGPointMake(210, 50)];
    quadBe2.lineWidth = 1.5f;
    quadBe2.lineCapStyle = kCGLineCapSquare;
    quadBe2.lineJoinStyle = kCGLineJoinRound;
    [[UIColor purpleColor] set];
    [quadBe2 stroke];
}

- (void)forDrow10
{
    // 三次贝塞尔曲线
    UIBezierPath *threePath = [UIBezierPath bezierPath];
    [threePath moveToPoint:CGPointMake(30, 250)];
    [threePath addCurveToPoint:CGPointMake(260, 230) controlPoint1:CGPointMake(120, 180) controlPoint2:CGPointMake(150, 260)];
    threePath.lineWidth = 1.5f;
    threePath.lineCapStyle = kCGLineCapSquare;
    threePath.lineJoinStyle = kCGLineJoinRound;
    [[UIColor brownColor] set];
    [threePath stroke];
}

- (void)forDrow11
{
    //曲线间断连接
    UIBezierPath *quadBe = [UIBezierPath bezierPath];
    [quadBe moveToPoint:CGPointMake(30, 200)];
    [quadBe addQuadCurveToPoint:CGPointMake(130, 200) controlPoint:CGPointMake(80, 150)];
    
    UIBezierPath *quadBe2 = [UIBezierPath bezierPath];
    [quadBe2 moveToPoint:CGPointMake(200, 200)];
    [quadBe2 addQuadCurveToPoint:CGPointMake(300, 200) controlPoint:CGPointMake(250, 150)];
    [quadBe2 appendPath:quadBe];
    quadBe2.lineWidth = 1.5f;
    quadBe2.lineCapStyle = kCGLineCapSquare;
    quadBe2.lineJoinStyle = kCGLineJoinRound;
    [[UIColor redColor] set];
    [quadBe2 stroke];
    
}



@end
