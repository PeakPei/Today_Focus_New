//
//  VideoViewController.m
//  Today_Focus_New
//
//  Created by Derek on 2017/4/24.
//  Copyright © 2017年 Derek. All rights reserved.
//

#import "VideoViewController.h"
#import "Video_TableViewCell.h"
@interface VideoViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *VideoTableView;
    NSMutableArray *VideoArray;
    UIScrollView *Nav_Scroll_View;
    NSArray *Nav_Scroll_View_array;
    
}

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor=[UIColor whiteColor];

    self.navigationController.navigationBarHidden=NO;
    
    
    Nav_Scroll_View_array=@[@"电影",@"音乐",@"创意",@"记录",@"人文",@"社会",@"科学",@"新闻",@"搞笑",@"世界"];
    
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
    
    VideoArray=[[NSMutableArray alloc]initWithCapacity:72];
    VideoTableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    [VideoTableView registerNib:[UINib nibWithNibName:@"Video_TableViewCell" bundle:nil]forCellReuseIdentifier:@"cellId"];
    
    VideoTableView.delegate=self;
    VideoTableView.dataSource=self;
    [self.view addSubview:VideoTableView];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 245;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return 10;

}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    Video_TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"Video_TableViewCell" owner:self options:nil]lastObject];
//        cell=[[Video_TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    cell.video_image_shortcut.image=[UIImage imageNamed:@"video_shortcut.png"];
    cell.video_play_icon.image=[UIImage imageNamed:@"Video_play.png"];
    cell.video_head_icon.image=[UIImage imageNamed:@"headicon.png"];
    cell.play_time_count.image=[UIImage imageNamed:@"playtime.png"];
    cell.play_time_count_num.text=@"10万次";
    cell.video_head_icon_name.text=@"娱乐视频";
    cell.video_comment.image=[UIImage imageNamed:@"comment.png"];
    cell.video_share.image=[UIImage imageNamed:@"share.png"];
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
