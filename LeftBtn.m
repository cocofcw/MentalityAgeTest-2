//
//  LeftBtn.m
//  MentalityAgeTest
//
//  Created by fuchaowen on 14-8-27.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import "LeftBtn.h"

@implementation LeftBtn

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame=CGRectMake(0, 0, 110, 64);
//        UIImageView * imgv=[[UIImageView alloc]initWithFrame:CGRectMake(-8, 12, 40,40)];
//        UIImage * img=[UIImage imageNamed:@"JKApositionLeft.png"];
//        imgv.image=img;
        UILabel * lb=[[UILabel alloc]initWithFrame:CGRectMake(7, 0, 60, 64)];
        lb.text=@"上一题";
        lb.font=[UIFont fontWithName:@"TrebuchetMS-Bold" size:17];
        lb.textColor=[UIColor whiteColor];
        lb.textAlignment=NSTextAlignmentCenter;
       // [self addSubview:imgv];
        [self  addSubview:lb];
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
