//
//  Title.m
//  MentalityAgeTest
//
//  Created by fuchaowen on 14-8-28.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import "Title.h"

@implementation Title

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame=CGRectMake(65, -10, 200, 84);
        self.text=@"你的心理年龄是多少";
        self.textColor=[UIColor whiteColor];
        self.textAlignment=NSTextAlignmentLeft;
        self.font=[UIFont boldSystemFontOfSize:22];
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
