//
//  Question.m
//  MentalityAgeTest
//
//  Created by fuchaowen on 14-8-28.
//  Copyright (c) 2014年 com.fuchaowen.www. All rights reserved.
//

#import "Question.h"
#import "LeftBtn.h"
#import "RightBtn.h"
#import "Title.h"
#import "MyNavigationBar.h"
#import "BottomView.h"
#import "Result.h"
#import "Quest.h"
#define SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define IS_IPHONE_5_SCREEN [[UIScreen mainScreen] bounds].size.height >= 568.0f && [[UIScreen mainScreen] bounds].size.height < 1024.0f
@interface Question ()
{
    UIProgressView * progress;
    int count;
    int coco;
    int index;
    UILabel * labt;
    UILabel * lb;
}
@end

@implementation Question

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        count=0;
        coco=0;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    MyNavigationBar * navigationbar=[[MyNavigationBar alloc]initWithFrame:CGRectMake(0, 20, 320, 64)];
//    [navigationbar createNavigationBarWithImage:nil andSEL:@selector(previous) andsecsel:@selector(next) andClass:self];
//    navigationbar.backgroundColor=[UIColor colorWithRed:0.84 green:0.26 blue:0.28 alpha:1];
//    [self.view addSubview:navigationbar];
    self.view.backgroundColor=[UIColor colorWithRed:0.84 green:0.26 blue:0.28 alpha:1];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 84, 320, SCREEN_HEIGHT-84)];
    view.backgroundColor=[UIColor colorWithRed:0.84 green:0.26 blue:0.28 alpha:1];
    [self.view addSubview:view];
    UIImageView * topview=[[UIImageView alloc]initWithFrame:CGRectMake(10, 62, 300, 95)];
    topview.layer.cornerRadius=3;
    topview.layer.masksToBounds=YES;
    UIImage * img=[UIImage imageNamed:@"img_03.png"];
    topview.image=img;
    
    [self.view addSubview:topview];
    progress=[[UIProgressView alloc]initWithFrame:CGRectMake(10, 176, 300, 0)];
    [progress setProgressViewStyle:UIProgressViewStyleDefault];
    progress.transform = CGAffineTransformMakeScale(1.0f,10.0f);
    progress.trackTintColor=[UIColor whiteColor];
    progress.progressTintColor=[UIColor colorWithRed:0.98 green:0.56 blue:0.13 alpha:1];
    UILabel * pglb=[[UILabel alloc]initWithFrame:CGRectMake(258, 171, 60, 12)];
    pglb.text=@"共30题";
    pglb.textAlignment=NSTextAlignmentCenter;
    pglb.font=[UIFont boldSystemFontOfSize:12];
    progress.progress=0.0;
    [self.view addSubview:progress];
    [self.view addSubview:pglb];
    if (IS_IPHONE_5_SCREEN) {
         labt=[[UILabel alloc]initWithFrame:CGRectMake(20, 191, 40, 60)];
    }else{
    
          labt=[[UILabel alloc]initWithFrame:CGRectMake(20, 176, 40, 60)];
    }
   
    labt.text=[NSString stringWithFormat:@"%d.",count+1];
    labt.textAlignment=NSTextAlignmentCenter;
    labt.textColor=[UIColor whiteColor];
    labt.font=[UIFont boldSystemFontOfSize:25];
    [self.view addSubview:labt];
    if (IS_IPHONE_5_SCREEN) {
        lb=[[UILabel alloc]initWithFrame:CGRectMake(65, 148, 255, 150)];
    }else{
     
         lb=[[UILabel alloc]initWithFrame:CGRectMake(65, 168, 255, 80)];
    
    }
    
    Quest * qu=[[self questionsarray] objectAtIndex:0];
    lb.text=qu.content;
    lb.textColor=[UIColor whiteColor];
    lb.font=[UIFont fontWithName:@"TrebuchetMS-Bold" size:19];
    [lb setLineBreakMode:NSLineBreakByWordWrapping];
    lb.numberOfLines=0;
    lb.textAlignment=NSTextAlignmentNatural;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:lb.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:1.0];//调整行间距
    [paragraphStyle setLineHeightMultiple:1.0];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [lb.text length])];
    lb.attributedText = attributedString;
    [self.view addSubview:lb];
    UIView * line;
    if (IS_IPHONE_5_SCREEN) {
        line=[[UIView alloc]initWithFrame:CGRectMake(10, 321, 300, 1)];
    }else
    {
         line=[[UIView alloc]initWithFrame:CGRectMake(10, 251, 300, 1)];
        
    }
    
    line.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:line];
    NSArray * arr=[[NSArray alloc]initWithObjects:@"是",@"不是",@"其他", nil];
    for (int i=0; i<3; i++) {
        UIButton * anbtn=[UIButton buttonWithType:UIButtonTypeSystem];
        if (IS_IPHONE_5_SCREEN) {
             anbtn.frame=CGRectMake(30, 341+50*i, 260, 40);
        }else{
        
              anbtn.frame=CGRectMake(30, 270+50*i, 260, 40);
        }
       
        [anbtn setTitle:[arr objectAtIndex:i] forState:UIControlStateNormal];
        anbtn.backgroundColor=[UIColor whiteColor];
        anbtn.tag=100+i;
        anbtn.tintColor=[UIColor grayColor];
        anbtn.titleLabel.font=[UIFont boldSystemFontOfSize:19];
        anbtn.layer.cornerRadius=5;
        anbtn.layer.masksToBounds=YES;
        anbtn.layer.shadowColor=[UIColor blackColor].CGColor;
        anbtn.layer.shadowRadius=2;
        anbtn.layer.shadowOffset=CGSizeMake(2, 2);
        [anbtn addTarget:self action:@selector(nextquestion:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:anbtn];
        
    }
    BottomView * bv=[[BottomView alloc]init];
    [bv CreateBottomView:@selector(bottombtn) obj:self];
    [self.view addSubview:bv];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)previous
{
    UIButton * btn1=(UIButton*)[self.view viewWithTag:100];
    UIButton * btn2=(UIButton*)[self.view viewWithTag:101];
    UIButton * btn3=(UIButton*)[self.view viewWithTag:102];
    btn1.hidden=YES;
    btn2.hidden=YES;
    btn3.hidden=YES;
    index--;
    NSMutableArray * indexarr=[self questionsarray];
    if (index>=0) {
        Quest * quest=[indexarr objectAtIndex:index];
        labt.text=@"";
        labt.text=[NSString stringWithFormat:@"%d.",index+1];
        lb.text=@"";
        lb.text=quest.content;
        if (lb.numberOfLines>1) {
            lb.frame=CGRectMake(65, 156, 255, 100);
            [self.view addSubview:lb];
        }
    }else{
    
        index=0;
    
    }
}
- (void)next
{
    index++;
    UIButton * btn1=(UIButton*)[self.view viewWithTag:100];
    UIButton * btn2=(UIButton*)[self.view viewWithTag:101];
    UIButton * btn3=(UIButton*)[self.view viewWithTag:102];
    btn1.hidden=YES;
    btn2.hidden=YES;
    btn3.hidden=YES;
     NSMutableArray * indexarr=[self questionsarray];
    if (index<=count) {
        Quest * quest=[indexarr objectAtIndex:index];
        labt.text=@"";
        labt.text=[NSString stringWithFormat:@"%d.",index+1];
        lb.text=@"";
        lb.text=quest.content;
        if (lb.numberOfLines>1) {
            lb.frame=CGRectMake(65, 156, 255, 150);
            [self.view addSubview:lb];
        }
    }else{
    
        btn1.hidden=NO;
        btn2.hidden=NO;
        btn3.hidden=NO;
        
        index=count;
    
    }


}
- (void)nextquestion:(UIButton*)btn
{
    
    index=count;
    NSLog(@"count=%d",count);
    progress.progress+=0.0333;
    if (count>28) {
        Result * rlt=[[Result alloc]init];
        rlt.myCore=coco;
       
        [self presentViewController:rlt animated:NO completion:nil];
    }else{
    
    NSMutableArray * allquest=[self questionsarray];
    Quest * qt=[allquest objectAtIndex:count+1];
    NSArray * corearr=[qt.core componentsSeparatedByString:@","];
    if (btn.tag==100) {
        
        coco=coco+[[corearr objectAtIndex:0] intValue];
        
    }
    if (btn.tag==101) {
        coco=coco+[[corearr objectAtIndex:1] intValue];
    }
    if (btn.tag==102) {
        coco=coco+[[corearr objectAtIndex:2] intValue];
    }
    labt.text=@"";
    labt.text=[NSString stringWithFormat:@"%d.",count+2];
    lb.text=@"";
    lb.text=qt.content;
      NSLog(@"mycore=%d",coco);
        if (lb.numberOfLines>1) {
            lb.frame=CGRectMake(65, 156, 255, 150);
            [self.view addSubview:lb];
            
        }
    count++;
    }
    
}
- (void)done
{
    

}
- (void)bottombtn
{


}
- (NSMutableArray*)questionsarray
{
    
    NSArray * questions=[NSArray arrayWithObjects:@"下决心做某事后便立刻去做。",@"往往凭经验办事。",@"对任何事情都有探索精神。",@"说话慢而且罗索。",@"健忘。",@"怕烦心、怕做事、不想活动。",@"喜欢计较小事。",@"喜欢参加各种活动。",@"日益固执起来。",@"对什么事情都有好奇心。",@"有强烈的生活追求。",@"难以控制感情。",@"容易嫉妒别人，易悲伤。",@"见到不合理的事不那么气愤了。",@"不喜欢看推理小说。",@"对电影和爱情小说日益失去兴趣。",@"做事情缺乏持久性。",@"不愿意改变旧习惯。",@"喜欢回忆过去。 ",@"学习新鲜事物感到困难。",@"十分注意自己身体的变化。" ,@"生活兴趣的范围变小了。",@"看书的速度加快。",@"动作不够灵活。",@"消除疲劳感很慢。",@"晚上不如早晨和上午头脑清醒。",@"对生活中的挫折感到烦恼。",@"缺乏自信心。",@"集中精力思考有困难。",@"工作效率低。",nil];
    NSArray * cores=[NSArray arrayWithObjects:@"0,2,1",@"2,0,1",@"0,4,2",@"4,0,2",@"4,0,2",@"4,0,2",@"2,0,1",@"0,2,1",@"4,0,2",@"0,2,1",@"0,4,2",@"0,2,1",@"2,0,1",@"2,0,1",@"2,0,1",@"2,0,1",@"4,0,2",@"2,0,1",@"4,0,2",@"2,0,1",@"2,0,1",@"2,0,1",@"2,0,1",@"2,0,1",@"2,0,1",@"2,0,1",@"2,0,1",@"2,0,1",@"2,0,1",@"2,0,1", nil];
    NSMutableArray * quests=[NSMutableArray arrayWithCapacity:1];
    for (int i=0; i<questions.count; i++) {
        Quest * qst=[[Quest alloc]initWithContent:[questions objectAtIndex:i] core:[cores objectAtIndex:i]];
        [quests addObject:qst];
    }
    return quests;

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
