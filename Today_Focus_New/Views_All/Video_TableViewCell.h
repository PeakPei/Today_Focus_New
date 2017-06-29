//
//  Video_TableViewCell.h
//  Today_Focus_New
//
//  Created by Derek on 2017/4/27.
//  Copyright © 2017年 Derek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Video_TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *video_image_shortcut;
@property (weak, nonatomic) IBOutlet UIImageView *video_head_icon;
@property (weak, nonatomic) IBOutlet UILabel *video_head_icon_name;
@property (weak, nonatomic) IBOutlet UIImageView *play_time_count;
@property (weak, nonatomic) IBOutlet UILabel *play_time_count_num;
@property (weak, nonatomic) IBOutlet UIImageView *video_comment;

@property (weak, nonatomic) IBOutlet UIImageView *video_share;
@property (weak, nonatomic) IBOutlet UIImageView *video_play_icon;

@end
