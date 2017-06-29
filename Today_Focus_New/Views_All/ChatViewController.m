//
//  ChatViewController.m
//  Today_Focus_New
//
//  Created by Derek on 2017/4/24.
//  Copyright © 2017年 Derek. All rights reserved.
//

#import "ChatViewController.h"
#import "Chat_pic_TableViewCell.h"
@interface ChatViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}
@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"美图微讯";
    self.view.backgroundColor=[UIColor whiteColor];
//    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
//    view.backgroundColor=[UIColor colorWithRed:41/255.0 green:160/255.0 blue:42/255.0 alpha:1];
//    [self.navigationController.navigationBar addSubview:view];
    
    _dataArray=[[NSMutableArray alloc]initWithCapacity:72];
    
    for (int j=4; j<=8; j++) {
        NSString *str=[NSString stringWithFormat:@"liuyuxin%d.jpg",j];
        [_dataArray addObject:str];
        
    }
    
    
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [_tableView registerNib:[UINib nibWithNibName:@"Chat_pic_TableViewCell" bundle:nil] forCellReuseIdentifier:@"cellId"];
    [self.view addSubview:_tableView];
    
    
    
    

    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 500;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Chat_pic_TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"Chat_pic_TableViewCell" owner:self options:nil]lastObject];
    }
    cell.pic_title.text=@"明星写真：刘雨欣，美呆了整个世界";
    
    for (int i=4; i<=8; i++) {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake((i-4)*tableView.frame.size.width, 0, self.view.frame.size.width, cell.scroll_image.frame.size.height)];
        imageView.image=[UIImage imageNamed:_dataArray[i-4]];
        
        [cell.scroll_image addSubview:imageView];
    }
    cell.scroll_image.pagingEnabled=YES;
    cell.scroll_image.bounces=NO;
    cell.scroll_image.layer.shadowColor=[UIColor colorWithRed:81/255.0 green:162/255.0 blue:248/255.0 alpha:1].CGColor;
    cell.scroll_image.layer.shadowOffset=CGSizeMake(0, 10);
    cell.scroll_image.showsHorizontalScrollIndicator=NO;
    cell.scroll_image.showsVerticalScrollIndicator=NO;
    
    cell.scroll_image.contentSize=CGSizeMake((_dataArray.count-1)*tableView.frame.size.width, cell.scroll_image.frame.size.height);
   
    
    cell.pic_short_title.text=@"这是一组明星刘雨欣的写照照片，画面十分唯美，青春气息十足，十分抢镜头。喜欢的可以收藏观看，后期持续更新，欢迎光顾！";
    cell.pic_short_title.userInteractionEnabled=NO;
    cell.pic_short_title.textColor=[UIColor grayColor];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
