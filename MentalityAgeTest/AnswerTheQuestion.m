//
//  AnswerTheQuestion.m
//  MentalityAgeTest
//
//  Created by fuchaowen on 14-8-28.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import "AnswerTheQuestion.h"
#import "LeftBtn.h"
#import "RightBtn.h"
#import "Title.h"
#import "MyNavigationBar.h"
@interface AnswerTheQuestion ()

@end

@implementation AnswerTheQuestion

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
    MyNavigationBar * navigationbar=[[MyNavigationBar alloc]initWithFrame:CGRectMake(0, 20, 320, 64)];
    [navigationbar createNavigationBarWithImage:nil andSEL:@selector(backto) andsecsel:@selector(done) andClass:self];
    navigationbar.backgroundColor=[UIColor blackColor];
    [self.view addSubview:navigationbar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)backto
{


}
- (void)done
{


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
