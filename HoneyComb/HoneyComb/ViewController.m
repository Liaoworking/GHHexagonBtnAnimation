//
//  ViewController.m
//  HoneyComb
//
//  Created by Guanghui Liao on 8/15/16.
//  Copyright © 2016 Guanghui Liao. All rights reserved.
//

#import "ViewController.h"
#import "HoneyCombVC.h"
/**
 *  项目总结：
 1.在这个项目中-----在要跳转的控制器中的ViewDidLoad中去设置[UIView Animationg...动画效果是没有用的。   因为在跳转到这个控制器的某一个时刻已经执行了VDL 这一个时刻要么已经在VDL所在的作用域里面用完了。要么就失效了。
 
 解决方法：
 1.在ViewWillAppear中去布局控件，提前把所放量改成0.01
 2.在viewDidAppear去执行动画操作，
 
 2.注意点：  千万不要重写loadView的时候去什么都不做，，，要么去掉一个super  要么随便给它一个View
 下面两句任选一：  推荐选第一句。
 - (void)loadView {
 //  [super loadView];
 // self.view = [UIView new];
 
 }
 
 3.  要构造一个和绘图有关的btn  创建一个Btn类的时候其实已经有了系统默认的drawRect方法：
 
 4. 在drawrect的方法中画圆，ARCCenter参数指的是drawRect方法从属的空间的frame上的位置。

 5.之前的一个思想误区：
 自定义btn，并不是在initWithFrame：方法中去重新创建一个新的btn去返回这个btn，
 而是在方法中去设置相应的属性，用self去掉对象方法。
 
 6.设置锚点anchorPoint的作用就是来设置一个定点或者起始点，防止动画往两边延伸，或者是给动画一个定点。
 
 
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor cyanColor]];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    HoneyCombVC *HCVC = [HoneyCombVC new];
    
    [self presentViewController:HCVC animated:NO completion:^{
        [self removeFromParentViewController];
    }];
}



@end
