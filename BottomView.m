//
//  BottomView.m
//  MentalityAgeTest
//
//  Created by fuchaowen on 14-8-28.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import "BottomView.h"
#define SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height
#define IS_IPHONE_5_SCREEN [[UIScreen mainScreen] bounds].size.height >= 568.0f && [[UIScreen mainScreen] bounds].size.height < 1024.0f
@implementation BottomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithRed:0.21 green:0.21 blue:0.21 alpha:1];
        if (IS_IPHONE_5_SCREEN) {
            self.frame=CGRectMake(0, SCREEN_HEIGHT-70, 320, 70);
        }else{
        
        self.frame=CGRectMake(0, SCREEN_HEIGHT-50, 320, 50);
        
        }
        
    }
    return self;
}
- (void)CreateBottomView:(SEL)sel obj:(id)object
{
    UIImageView * imgv;
    if (IS_IPHONE_5_SCREEN) {
        imgv=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
    }else{
    
    imgv=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 40, 40)];
    }
    
    UIImage * img=[UIImage imageNamed:@"IMG_2343.JPG"];
    imgv.image=img;
    [self addSubview:imgv];
    UILabel * lb1=[[UILabel alloc]initWithFrame:CGRectMake(70, 5, 120, 30)];
    lb1.font=[UIFont boldSystemFontOfSize:12];
    lb1.text=@"心理年龄测试";
    lb1.textColor=[UIColor whiteColor];
    UILabel * lb2=[[UILabel alloc]initWithFrame:CGRectMake(70, 20, 170, 30)];
    lb2.textAlignment=NSTextAlignmentLeft;
    lb2.text=@"来这里，做各种测试，了解自己";
    lb2.textColor=[UIColor whiteColor];
    lb2.font=[UIFont boldSystemFontOfSize:12];
    [self addSubview:lb1];
    [self addSubview:lb2];
    UIButton * btn=[UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"关注" forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor greenColor];
    btn.tintColor=[UIColor whiteColor];
    btn.titleLabel.font=[UIFont boldSystemFontOfSize:19];
    if (IS_IPHONE_5_SCREEN) {
        btn.frame=CGRectMake(240, 15, 70, 40);
    }else
    {
        
        btn.frame=CGRectMake(250, 10, 60, 30);
    }
    
    btn.layer.cornerRadius=3;
    btn.layer.masksToBounds=YES;
    [btn addTarget:object action:sel forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
