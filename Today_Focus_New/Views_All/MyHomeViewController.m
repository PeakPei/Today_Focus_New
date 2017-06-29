//
//  MyHomeViewController.m
//  Today_Focus_New
//
//  Created by Derek on 2017/4/24.
//  Copyright © 2017年 Derek. All rights reserved.
//

#import "MyHomeViewController.h"
#define screen_width self.view.frame.size.width
#define screen_heght self.view.frame.size.height
@interface MyHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    UIView *bgview;
    UIScrollView *scrollview;
    UIView *view_scroll;
    
    //封装九宫格
    int num_of_squareness;//九宫格的矩形数量，多少个
    int num_of_squareness_horizontal; //每一行数量
    int squareness_width;//矩形宽
    int squareness_height;//矩形高
    int squareness_padding_to_top;//矩形距离上方的距离
    int squareness_padding_to_bottom;//矩形距离下方的距离
    int squareness_avage_distence_horizental;//水平方向每一个的平均距离
    
    int squareness_avage_distence_vertical;//垂直方向的每一个的平均距离
    UIView *squareness_view;//矩形视图
    
    //统计各自的数量
    int k_num;
    
    
    UITableView *Browses_the_record_tableview;//浏览记录表
    UITableView *Collection_tableview;//收藏表

}
@end

@implementation MyHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 44)];
    view.backgroundColor=[UIColor orangeColor];
    [self.navigationController.navigationBar addSubview:view];
    self.navigationController.navigationBarHidden=YES;
    
    bgview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 0.8 * screen_width)];
    

    
    bgview.backgroundColor=[UIColor colorWithRed:41/255.0 green:160/255.0 blue:42/255.0 alpha:1];
    UIImageView *bgimageview=[[UIImageView alloc]initWithFrame:bgview.frame];
    bgimageview.image=[UIImage imageNamed:@"34243.jpg"];
    [bgview addSubview:bgimageview];

    UIImageView *portral=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    portral.clipsToBounds=YES;
    portral.layer.cornerRadius=100/2;
    portral.center=CGPointMake(bgview.frame.size.width/2, bgview.frame.size.height/3);
    portral.image=[UIImage imageNamed:@"headicon.png"];
    [bgview addSubview:portral];
    [self.view addSubview:bgview];
    
    UILabel *name_lable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    name_lable.center=CGPointMake(bgview.frame.size.width/2, bgview.frame.size.height/3+65
                                  );
    name_lable.text=@"一千年以后DE";
    name_lable.font=[UIFont systemFontOfSize:15];
    name_lable.textColor=[UIColor whiteColor];
    //name_lable.backgroundColor=[UIColor redColor];
    name_lable.textAlignment=NSTextAlignmentCenter;
    [bgview addSubview:name_lable];
    
    UILabel *bref_sentense=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 250, 30)];
    bref_sentense.center=CGPointMake(bgview.frame.size.width/2, bgview.frame.size.height/3+65+30);
    bref_sentense.text=@"简介：这世界没有奇迹，唯有自己创造奇迹";
    bref_sentense.textAlignment=NSTextAlignmentCenter;
    bref_sentense.textColor=[UIColor whiteColor];
    bref_sentense.font=[UIFont systemFontOfSize:12];
    bref_sentense.backgroundColor=[UIColor clearColor];
    [bgview addSubview:bref_sentense];
    
    UIView *button_view=[[UIView alloc]initWithFrame:CGRectMake(0, bgview.frame.size.height-50, bgview.frame.size.width, 50)];
    button_view.alpha=0.6;
    button_view.backgroundColor=[UIColor whiteColor];
    
    UIButton *button_one=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, bgview.frame.size.width/3,50)];
    [button_one setTitle:@"我的资料" forState:UIControlStateNormal];
    button_one.titleLabel.font=[UIFont systemFontOfSize:14];
    [button_one setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button_view addSubview:button_one];
    
    UIButton *button_two=[[UIButton alloc]initWithFrame:CGRectMake(button_one.frame.size.width,0, bgview.frame.size.width/3,50)];
    [button_two setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button_two setTitle:@"浏览记录" forState:UIControlStateNormal];
    button_two.titleLabel.font=[UIFont systemFontOfSize:14];
    [button_view addSubview:button_two];

    UIButton *button_three=[[UIButton alloc]initWithFrame:CGRectMake(button_one.frame.size.width+button_two.frame.size.width, 0, bgview.frame.size.width/3,50)];
    [button_three setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button_three setTitle:@"我的收藏" forState:UIControlStateNormal];
    button_three.titleLabel.font=[UIFont systemFontOfSize:14];
    [button_view addSubview:button_three];

    
    [bgview addSubview:button_view];
    
    
    
    
    [self creat_scrollview];
    
    
    
   
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 50;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    int m=0;
    if ([tableView isEqual:Browses_the_record_tableview]) {
         m=30;
        
    }else if([tableView isEqual:Collection_tableview]){
        m=20;
    }
    return m;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if ([tableView isEqual:Browses_the_record_tableview]) {
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellid"];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellid"];
        }
        cell.textLabel.text=[NSString stringWithFormat:@"这是第%ld条浏览记录",indexPath.row];
        cell.imageView.image=[UIImage imageNamed:@"headicon.png"];
        return cell;
    }else if([tableView isEqual:Collection_tableview]){
    
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellid_2"];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellid_2"];
        }
        cell.textLabel.text=[NSString stringWithFormat:@"这是第%ld条收藏记录",indexPath.row];
        cell.imageView.image=[UIImage imageNamed:@"34243.jpg"];
        return cell;
    }
    
    return nil;
}
-(void)creat_scrollview{
    scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, bgview.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-bgview.frame.size.height-44)];
    
    for (int i=0; i<3; i++) {
        view_scroll=[[UIView alloc]initWithFrame:CGRectMake(i * screen_width, 0, screen_width, screen_heght)];
        if (i==0) {
            
            view_scroll.backgroundColor=[UIColor colorWithRed:199/255.0 green:199/255.0 blue:199/255.0 alpha:1];
            
            [self creat_squareness];
            
        }else if (i==1){
            view_scroll.backgroundColor=[UIColor grayColor];
            
            
        [view_scroll addSubview:[self creat_Browses_the_record_tableview]];
            
        }else{
            view_scroll.backgroundColor=[UIColor greenColor];
            
        [view_scroll addSubview:[self creat_Collection_tableview]];
            
        }
        
        [scrollview addSubview:view_scroll];
    }
    
    scrollview.contentSize=CGSizeMake(3*screen_width, scrollview.frame.size.height);
    scrollview.showsHorizontalScrollIndicator=NO;
    scrollview.showsVerticalScrollIndicator=NO;
    scrollview.bounces=NO;
    
    scrollview.pagingEnabled=YES;
    
    [self.view addSubview:scrollview];
}
-(UITableView *)creat_Browses_the_record_tableview{
    
    Browses_the_record_tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, scrollview.frame.size.height) style:UITableViewStylePlain];
    Browses_the_record_tableview.delegate=self;
    Browses_the_record_tableview.dataSource=self;
    return Browses_the_record_tableview;
    

}
-(UITableView *)creat_Collection_tableview{
    Collection_tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_width, scrollview.frame.size.height) style:UITableViewStylePlain];
    Collection_tableview.delegate=self;
    Collection_tableview.dataSource=self;
    return Collection_tableview;
}
-(void)creat_squareness{
    
    //先定义你的九宫格的具体需要
    num_of_squareness=9;
    num_of_squareness_horizontal=4;
    
    //在设定每一个格子的宽和高时候，要明确屏幕的宽度，否则会出现重叠，超过屏幕。
    squareness_width=50;
    squareness_height=50;
    squareness_avage_distence_horizental=(screen_width-squareness_width * num_of_squareness_horizontal)/(num_of_squareness_horizontal+1);
    squareness_avage_distence_vertical=30;
    
    
    k_num=0;
    
    NSLog(@"screen=%lf",screen_width);
    NSLog(@"h=%d",squareness_avage_distence_horizental);
    
    //开始自动绘制九宫格
    for (int i=0; i<100; i++) {
        for (int j=0; j<num_of_squareness_horizontal; j++) {
            
            if (k_num==num_of_squareness) {
                NSLog(@"k_um=%d",k_num);
                break;//达到设定的数量就停止追加格子
            }
            
            
            squareness_view= [[UIView alloc]initWithFrame:CGRectMake(squareness_avage_distence_horizental * (j+1)+(j)*squareness_width, squareness_height * (i)+(i+1)*squareness_avage_distence_vertical, squareness_width, squareness_height)];
            squareness_view.backgroundColor=[UIColor whiteColor];
            [view_scroll addSubview:squareness_view];
            
            k_num=k_num+1;//计算数量
        }
    }
    
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
