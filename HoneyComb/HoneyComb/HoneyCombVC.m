//
//  HoneyCombVC.m
//  HoneyComb
//
//  Created by Guanghui Liao on 8/15/16.
//  Copyright © 2016 Guanghui Liao. All rights reserved.
//
/**
 *  1.在这个项目中-----在要跳转的控制器中的ViewDidLoad中去设置[UIView Animationg...动画效果是没有用的。   因为在跳转到这个控制器的某一个时刻已经执行了VDL 这一个时刻要么已经在VDL所在的作用域里面用完了。要么就失效了。
 
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
 
 *
 */
#import "HoneyCombVC.h"
#import "BGView.h"
#import "GHProfileVC.h"
#define KCENTERX [UIScreen mainScreen].bounds.size.width * 0.5 - 64
#define KCENTERY [UIScreen mainScreen].bounds.size.height * 0.5 - 64
@interface HoneyCombVC ()
@property (nonatomic, strong)UIButton *centerBtn;
@property (nonatomic, strong)UIButton *leftBtn1;
@property (nonatomic, strong)UIButton *leftBtn2;
@property (nonatomic, strong)UIButton *leftBtn3;
@property (nonatomic, strong)UIButton *rightBtn1;
@property (nonatomic, strong)UIButton *rightBtn2;
@property (nonatomic, strong)UIButton *rightBtn3;
@property (nonatomic, strong)BGView *bgView;

@end

@implementation HoneyCombVC

//- (UIButton *)centerBtn {
//    
//    if (_centerBtn!=nil) {
//        _centerBtn = [[UIButton alloc]init];
//    }
//    return _centerBtn;
//}





- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor cyanColor];
    [self setupBtn];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    

    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:10 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.centerBtn.transform = CGAffineTransformMakeScale(1.0, 1.0);

    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:0.5 delay:0.2 usingSpringWithDamping:0.4 initialSpringVelocity:2 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.leftBtn1.transform = CGAffineTransformMakeScale(1.0, 1.0);
        self.rightBtn1.transform = CGAffineTransformMakeScale(1.0, 1.0);

    } completion:^(BOOL finished) {
        
    }];
    [UIView animateWithDuration:0.5 delay:0.3 usingSpringWithDamping:0.4 initialSpringVelocity:2 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.leftBtn2.transform = CGAffineTransformMakeScale(1.0, 1.0);
        self.rightBtn2.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    } completion:^(BOOL finished) {
        
    }];
    [UIView animateWithDuration:0.5 delay:0.4 usingSpringWithDamping:0.4 initialSpringVelocity:2 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.leftBtn3.transform = CGAffineTransformMakeScale(1.0, 1.0);
        self.rightBtn3.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:2.0 delay:0.3 usingSpringWithDamping:0.4 initialSpringVelocity:2 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.bgView.transform = CGAffineTransformMakeScale(12, 12);
       
    } completion:^(BOOL finished) {
        
    }];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor clearColor]];
    
}

- (void)setupBtn {
    
    //中间扩大的的圆形btn
    BGView *bgView = [[BGView alloc]initWithFrame:CGRectMake(140, 300, 100, 100)];
    bgView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    [bgView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:bgView];
    self.bgView = bgView;
    
    //中间btn
    UIButton *centerBtn = [[UIButton alloc]initWithFrame:CGRectMake(KCENTERX, KCENTERY, 128, 128)];
    [centerBtn setBackgroundImage:[UIImage imageNamed:@"501"] forState:UIControlStateNormal];
    [centerBtn addTarget:self action:@selector(nextTVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:centerBtn];
    self.centerBtn = centerBtn;
    
    //左3
    UIButton *leftBtn3 = [[UIButton alloc]initWithFrame:CGRectMake(KCENTERX, KCENTERY-168, 128, 128)];
    [leftBtn3 setBackgroundImage:[UIImage imageNamed:@"554"] forState:UIControlStateNormal];
    [self.view addSubview:leftBtn3];
    self.leftBtn3 = leftBtn3;
    //左2
    UIButton *leftBtn2 = [[UIButton alloc]initWithFrame:CGRectMake(KCENTERX-47, KCENTERY-88, 128, 128)];
    [leftBtn2 setBackgroundImage:[UIImage imageNamed:@"532"] forState:UIControlStateNormal];
    [self.view addSubview:leftBtn2];
    self.leftBtn2 = leftBtn2;
    //左右1
    UIButton *leftBtn1 = [[UIButton alloc]initWithFrame:CGRectMake(KCENTERX-94, KCENTERY, 128, 128)];
    [leftBtn1 setBackgroundImage:[UIImage imageNamed:@"504"] forState:UIControlStateNormal];
    [self.view addSubview:leftBtn1];
    self.leftBtn1 = leftBtn1;
    
    UIButton *rightBtn1 = [[UIButton alloc]initWithFrame:CGRectMake(KCENTERX+94, KCENTERY, 128, 128)];
    [rightBtn1 setBackgroundImage:[UIImage imageNamed:@"507"] forState:UIControlStateNormal];
    [self.view addSubview:rightBtn1];
    self.rightBtn1 = rightBtn1;
    
    //右2
    UIButton *rightBtn2 = [[UIButton alloc]initWithFrame:CGRectMake(KCENTERX+48, KCENTERY+84, 128, 128)];
    [rightBtn2 setBackgroundImage:[UIImage imageNamed:@"504"] forState:UIControlStateNormal];
    [self.view addSubview:rightBtn2];
    self.rightBtn2 = rightBtn2;
    //右三
    UIButton *rightBtn3 = [[UIButton alloc]initWithFrame:CGRectMake(KCENTERX, KCENTERY+168, 128, 128)];
    [rightBtn3 setBackgroundImage:[UIImage imageNamed:@"560"] forState:UIControlStateNormal];
    [self.view addSubview:rightBtn3];
    self.rightBtn3 = rightBtn3;
    
    //中间btn动画
    centerBtn.transform = CGAffineTransformMakeScale(0.01, 0.01);
    leftBtn1.transform = CGAffineTransformMakeScale(0.01, 0.01);
    leftBtn2.transform = CGAffineTransformMakeScale(0.01, 0.01);
    leftBtn3.transform = CGAffineTransformMakeScale(0.01, 0.01);
    rightBtn1.transform = CGAffineTransformMakeScale(0.01, 0.01);
    rightBtn2.transform = CGAffineTransformMakeScale(0.01, 0.01);
    rightBtn3.transform = CGAffineTransformMakeScale(0.01, 0.01);
}

- (void)nextTVC {
    
    
    NSLog(@"nextTVC");
    
    GHProfileVC *PVC = [[GHProfileVC alloc]init];
    
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:1 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.centerBtn.transform = CGAffineTransformMakeRotation(M_PI_2);
        self.leftBtn1.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.leftBtn2.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.leftBtn3.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.rightBtn1.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.rightBtn2.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.rightBtn3.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.bgView.transform = CGAffineTransformMakeScale(0.01, 0.01);

    } completion:^(BOOL finished) {
      
       [self presentViewController:PVC animated:NO completion:^{

       }];
    }];
    
    
    
}


@end
