//
//  NewsViewController.m
//  Today_Focus_New
//
//  Created by Derek on 2017/4/24.
//  Copyright © 2017年 Derek. All rights reserved.
//

#import "NewsViewController.h"
#import "News_TableViewCell.h"
@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    UIScrollView *Nav_Scroll_View;
    NSArray *Nav_Scroll_View_array;

}

@end

@implementation NewsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.view.backgroundColor=[UIColor whiteColor];
//    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
//    view.backgroundColor=[UIColor colorWithRed:41/255.0 green:160/255.0 blue:42/255.0 alpha:1];
//    [self.navigationController.navigationBar addSubview:view];
    
    Nav_Scroll_View_array=@[@"首页",@"新闻",@"娱乐",@"体育",@"文化",@"教育",@"科技",@"图片",@"搞笑",@"文学"];
   
    Nav_Scroll_View=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.navigationController.navigationBar.frame.size.width, self.navigationController.navigationBar.frame.size.height)];
    for (int i=0; i<Nav_Scroll_View_array.count; i++) {
       UIButton *Nav_button_click=[[UIButton alloc]initWithFrame:CGRectMake(i*52, 0, 52, 40)];
        [Nav_button_click setTitle:[NSString stringWithFormat:@"%@",Nav_Scroll_View_array[i]] forState:UIControlStateNormal];
        [Nav_button_click setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [Nav_Scroll_View addSubview:Nav_button_click];
    }
    
    Nav_Scroll_View.contentSize=CGSizeMake(52 * Nav_Scroll_View_array.count, self.navigationController.navigationBar.frame.size.height);
    Nav_Scroll_View.pagingEnabled=YES;
    Nav_Scroll_View.showsHorizontalScrollIndicator=NO;
    Nav_Scroll_View.showsVerticalScrollIndicator=NO;
    
    [self.navigationController.navigationBar addSubview:Nav_Scroll_View];
    
    
    _dataArray=[[NSMutableArray alloc]initWithCapacity:72];
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame];
    
    [_tableView registerNib:[UINib nibWithNibName:@"News_TableViewCell" bundle:nil] forCellReuseIdentifier:@"cellId"];
    
    _tableView.dataSource=self;
    _tableView.delegate=self;
    
    
    [self.view addSubview:_tableView];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 140;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    News_TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"News_TableViewCell" owner:self options:nil]lastObject];
    }
    cell.news_shortcut_image.image=[UIImage imageNamed:@"news_image.png"];
    cell.news_title.text=@"今天下午，天舟一号在海南文昌发射中心进入宇宙";
    cell.news_short_title.text=@"2017年4月27日，在海南文昌发射中心，天舟一号升空成功，世界各大媒体高度评价中国航天发展。对中国的航天发展赞誉不断，纷纷致电祝贺！";
    cell.medium_icon.image=[UIImage imageNamed:@"news_medium.jpeg"];
    cell.conment_icon.image=[UIImage imageNamed:@"comment.png"];
    cell.comment_num.text=@"880";
    
    
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
