//
//  MainPage.m
//  MentalityAgeTest
//
//  Created by fuchaowen on 14-8-27.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import "MainPage.h"
#import "LeftBtn.h"
#import "RightBtn.h"
#import "Title.h"
#import "BottomView.h"
#import "Question.h"
#define SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define IS_IPHONE_5_SCREEN [[UIScreen mainScreen] bounds].size.height >= 568.0f && [[UIScreen mainScreen] bounds].size.height < 1024.0f
@interface MainPage ()
{
    LeftBtn * left;
    RightBtn * right;
}
@end

@implementation MainPage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    MyNavigationBar * navigationbar=[[MyNavigationBar alloc]initWithFrame:CGRectMake(0, 20, 320, 64)];
//    [navigationbar createNavigationBarWithImage:nil andSEL:@selector(backto) andsecsel:@selector(done) andClass:self];
//    navigationbar.backgroundColor=[UIColor blackColor];
//    [self.view addSubview:navigationbar];
//    self.view.backgroundColor=[UIColor blackColor];
     [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
   // UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 84, 320, SCREEN_HEIGHT-20)];
    self.view.backgroundColor=[UIColor colorWithRed:0.84 green:0.26 blue:0.28 alpha:1];
    //[self.view addSubview:view];
    UIImageView * topview=[[UIImageView alloc]initWithFrame:CGRectMake(10, 22, 300, 95)];
    //topview.backgroundColor=[UIColor whiteColor];
    topview.layer.cornerRadius=3;
    topview.layer.masksToBounds=YES;
    UIImage * img=[UIImage imageNamed:@"img_03.png"];
    topview.image=img;
   
    [self.view addSubview:topview];
    UIView * midview;
    UIImageView * imgmid;
    if (IS_IPHONE_5_SCREEN) {
        midview=[[UIView alloc]initWithFrame:CGRectMake(10, 130, 300, 260)];
        imgmid=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 260)];
    }else{
    
        midview=[[UIView alloc]initWithFrame:CGRectMake(10, 130, 300, 200)];
        imgmid=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 200)];
    
    }
    
    midview.backgroundColor=[UIColor whiteColor];
    midview.layer.cornerRadius=3;
    midview.layer.masksToBounds=YES;
    [self.view addSubview:midview];
    
    UIImage * igmid=[UIImage imageNamed:@"img_06.png"];
    imgmid.image=igmid;
    [midview addSubview:imgmid];
    UIButton * btn=[UIButton buttonWithType:UIButtonTypeSystem];
    if (IS_IPHONE_5_SCREEN) {
        btn.frame=CGRectMake(40, 420, 240, 50);
    }else{
    
        btn.frame=CGRectMake(40, 350, 240, 50);
    }
    
    [btn setTitle:@"开始测试" forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont boldSystemFontOfSize:22];
    btn.tintColor=[UIColor whiteColor];
    btn.backgroundColor=[UIColor colorWithRed:0.98 green:0.56 blue:0.13 alpha:1];
    btn.layer.cornerRadius=3;
    btn.layer.masksToBounds=YES;
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    BottomView * bv=[[BottomView alloc]init];
    [bv CreateBottomView:@selector(bottombtn) obj:self];
    [self.view addSubview:bv];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)backto
{
    NSLog(@"左边的");

}
- (void)done
{
   NSLog(@"右边的");

}
- (void)bottombtn
{


}
- (void)test
{
    Question * quest=[[Question alloc]init];
    [self presentViewController:quest animated:NO completion:nil];
}

@end
