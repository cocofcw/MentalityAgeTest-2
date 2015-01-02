//
//  Result.m
//  MentalityAgeTest
//
//  Created by fuchaowen on 14-8-28.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import "Result.h"
#import "LeftBtn.h"
#import "RightBtn.h"
#import "Title.h"
#import "MyNavigationBar.h"
#import "BottomView.h"
#import "Question.h"
#import "MainPage.h"
#import "UMSocial.h"
#define SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define IS_IPHONE_5_SCREEN [[UIScreen mainScreen] bounds].size.height >= 568.0f && [[UIScreen mainScreen] bounds].size.height < 1024.0f
@interface Result ()
{
    NSString * imgname;

}
@end

@implementation Result

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView * navigationbar=[[UIView alloc]initWithFrame:CGRectMake(0, 10, 320, 64)];
    UIButton * button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setTintColor:[UIColor whiteColor]];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont boldSystemFontOfSize:22];
    [button addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
    button.frame=CGRectMake(240, 0,80 , 80);
    [navigationbar addSubview:button];
    navigationbar.backgroundColor=[UIColor colorWithRed:0.84 green:0.26 blue:0.28 alpha:1];
    [self.view addSubview:navigationbar];
    self.view.backgroundColor=[UIColor colorWithRed:0.84 green:0.26 blue:0.28 alpha:1];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 84, 320, SCREEN_HEIGHT-84)];
    view.backgroundColor=[UIColor colorWithRed:0.84 green:0.26 blue:0.28 alpha:1];
    [self.view addSubview:view];
    UIImageView * topview=[[UIImageView alloc]initWithFrame:CGRectMake(10, 48, 300, 95)];
    //topview.backgroundColor=[UIColor whiteColor];
    topview.layer.cornerRadius=3;
    topview.layer.masksToBounds=YES;
    UIImage * img=[UIImage imageNamed:@"img_03.png"];
    topview.image=img;
    
    [self.view addSubview:topview];
    UIProgressView * progress=[[UIProgressView alloc]initWithFrame:CGRectMake(10, 166, 300, 0)];
    [progress setProgressViewStyle:UIProgressViewStyleDefault];
    progress.transform = CGAffineTransformMakeScale(1.0f,10.0f);
    progress.trackTintColor=[UIColor whiteColor];
    progress.progressTintColor=[UIColor colorWithRed:0.98 green:0.56 blue:0.13 alpha:1];
    progress.progress=1;
    UILabel * pglb=[[UILabel alloc]initWithFrame:CGRectMake(258, 161, 60, 12)];
    pglb.text=@"共30题";
    pglb.textAlignment=NSTextAlignmentCenter;
    pglb.font=[UIFont boldSystemFontOfSize:12];
    [self.view addSubview:progress];
    [self.view addSubview:pglb];
    UIImageView * midview=[[UIImageView alloc]initWithFrame:CGRectMake(10, 190, 300, 220)];
    if (self.myCore>0&&self.myCore<=30) {
        imgname=@"永远萌萌哒_03.png";
        UIImage * curimg=[UIImage imageNamed:imgname];
        midview.image=curimg;
    }
    if (self.myCore>30&&self.myCore<=50) {
        imgname=@"依然很天真_03.png";
        UIImage * curimg=[UIImage imageNamed:imgname];
        midview.image=curimg;
    }
    if (self.myCore>50&&self.myCore<=65) {
        imgname=@"绝对够深沉_03.png";
        UIImage * curimg=[UIImage imageNamed:imgname];
        midview.image=curimg;
    }
    midview.layer.cornerRadius=3;
    midview.layer.masksToBounds=YES;
    [self.view addSubview:midview];
    UIButton * btn=[UIButton buttonWithType:UIButtonTypeSystem];
    if (IS_IPHONE_5_SCREEN) {
        btn.frame=CGRectMake(40, 430, 240, 50);
    }else{
       
        btn.frame=CGRectMake(40, 420, 240, 50);
    
    }
    
    [btn setTitle:@"分享到朋友圈" forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont boldSystemFontOfSize:22];
    btn.tintColor=[UIColor whiteColor];
    btn.backgroundColor=[UIColor colorWithRed:0.98 green:0.56 blue:0.13 alpha:1];
    btn.layer.cornerRadius=3;
    btn.layer.masksToBounds=YES;
    [btn addTarget:self action:@selector(sharemyfriends) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    if (IS_IPHONE_5_SCREEN) {
        BottomView * bv=[[BottomView alloc]init];
        [bv CreateBottomView:@selector(bottombtn) obj:self];
        [self.view addSubview:bv];
    }
   
}
- (void)backto
{
    MainPage * main=[[MainPage alloc]init];
    [self presentViewController:main animated:NO completion:nil];

}
- (void)goback
{
    MainPage * main=[[MainPage alloc]init];
    [self presentViewController:main animated:NO completion:nil];

}
- (void)sharemyfriends
{
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"507fcab25270157b37000010"
                                      shareText:@"友盟社会化分享让您快速实现分享等社会化功能，www.umeng.com/social"
                                     shareImage:[UIImage imageNamed:imgname]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToQzone,UMShareToWechatSession,nil]
                                       delegate:self];
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:@[UMShareToQzone,UMShareToWechatSession] content:@"我测试的心理年龄" image:nil location:nil urlResource:nil presentedController:self completion:^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];
    


}
- (BOOL)isDirectShareInIconActionSheet
{

    return YES;

}
- (void)didFinishGetUMSocialDataResponse:(UMSocialResponseEntity *)response
{
    if (response.responseCode==UMSResponseCodeSuccess) {
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
     

}
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}
- (void)bottombtn
{


}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
