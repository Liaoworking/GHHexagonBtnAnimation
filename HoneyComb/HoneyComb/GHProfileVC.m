//
//  GHProfileVC.m
//  HoneyComb
//
//  Created by Guanghui Liao on 8/15/16.
//  Copyright © 2016 Guanghui Liao. All rights reserved.
//

#import "GHProfileVC.h"
#define KCENTERX [UIScreen mainScreen].bounds.size.width * 0.5
#define KCENTERY [UIScreen mainScreen].bounds.size.height * 0.5
@interface GHProfileVC () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UIScrollView *SV;
@end

@implementation GHProfileVC 

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIScrollView *SV = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    SV.center = CGPointMake(KCENTERX, KCENTERY + 200);
    SV.backgroundColor = [UIColor yellowColor];
    SV.contentSize = CGSizeMake(0, 730);
    SV.bounces = NO;
    SV.showsVerticalScrollIndicator = NO;
    
    
    
    [self.view addSubview:SV];
    
    self.SV = SV;
    [self setupSV];
    
}

- (void)setupSV {
    
    //分界的上部分View
    UIView *cyanView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width , KCENTERY - 200)];
    cyanView.backgroundColor = [UIColor cyanColor];
    [self.SV addSubview:cyanView];
    
    UIButton *centerBtn = [[UIButton alloc]initWithFrame:CGRectMake(KCENTERX-64, KCENTERY-265, 128, 128)];
    [centerBtn setBackgroundImage:[UIImage imageNamed:@"501"] forState:UIControlStateNormal];
    [centerBtn addTarget:self action:@selector(myProfile) forControlEvents:UIControlEventTouchUpInside];
    centerBtn.transform = CGAffineTransformMakeRotation(M_PI_2);
    [self.SV addSubview:centerBtn];
    
    //头像下面的label
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 180, 180, 20) ];
    nameLabel.text = @"这里显示用户名！";
    [self.SV addSubview:nameLabel];
    
    
    UITableView *GHTableView = [[UITableView alloc]initWithFrame:CGRectMake(20, 200, 335, 500)];
    GHTableView.dataSource = self;
    GHTableView.delegate = self;
    [GHTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"123"];
    [self.SV addSubview:GHTableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  100;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    
    cell.textLabel.text = @"2222";
    
    return cell;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView animateWithDuration:0.5 animations:^{
        self.SV.transform = CGAffineTransformMakeTranslation(0, -200);

    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor cyanColor]];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}

- (void)myProfile {
    
    
    
    
}

@end
