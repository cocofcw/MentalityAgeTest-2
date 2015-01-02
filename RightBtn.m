//
//  RightBtn.m
//  MentalityAgeTest
//
//  Created by fuchaowen on 14-8-27.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import "RightBtn.h"

@implementation RightBtn

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame=CGRectMake(235, 0, 60, 64);
        UILabel * lb=[[UILabel alloc]initWithFrame:CGRectMake(7, 0, 60, 64)];
        lb.text=@"下一题";
        lb.font=[UIFont fontWithName:@"TrebuchetMS-Bold" size:17];
        lb.textColor=[UIColor whiteColor];
        lb.textAlignment=NSTextAlignmentCenter;
        [self addSubview:lb];
//        UIView * v1=[[UIView alloc]initWithFrame:CGRectMake(0,0, 6, 6)];
//        v1.backgroundColor=[UIColor whiteColor];
//        v1.layer.cornerRadius=3;
//        v1.layer.masksToBounds=YES;
//        [self addSubview:v1];
//        UIView * v2=[[UIView alloc]initWithFrame:CGRectMake(12,0, 6, 6)];
//        v2.backgroundColor=[UIColor whiteColor];
//        v2.layer.cornerRadius=3;
//        v2.layer.masksToBounds=YES;
//        [self addSubview:v2];
//        UIView * v3=[[UIView alloc]initWithFrame:CGRectMake(24,0, 6, 6)];
//        v3.backgroundColor=[UIColor whiteColor];
//        v3.layer.cornerRadius=3;
//        v3.layer.masksToBounds=YES;
//        [self addSubview:v3];
    }
    return self;
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
