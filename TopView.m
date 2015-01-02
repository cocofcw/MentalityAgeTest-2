//
//  TopView.m
//  MentalityAgeTest
//
//  Created by fuchaowen on 14-8-28.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import "TopView.h"

@implementation TopView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView * topview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 80)];
        topview.backgroundColor=[UIColor whiteColor];
        topview.layer.cornerRadius=3;
        topview.layer.masksToBounds=YES;
        UIImageView * mgv=[[UIImageView alloc]initWithFrame:CGRectMake(10, -20, 100, 90)];
        UIImage * img=[UIImage imageNamed:@"img_.png"];
        mgv.image=img;
        [topview addSubview:mgv];
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
