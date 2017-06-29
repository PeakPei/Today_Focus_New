//
//  News_TableViewCell.h
//  Today_Focus_New
//
//  Created by Derek on 2017/4/27.
//  Copyright © 2017年 Derek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface News_TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *news_shortcut_image;
@property (weak, nonatomic) IBOutlet UILabel *news_title;
@property (weak, nonatomic) IBOutlet UILabel *news_short_title;
@property (weak, nonatomic) IBOutlet UIImageView *medium_icon;
@property (weak, nonatomic) IBOutlet UILabel *medium_name;
@property (weak, nonatomic) IBOutlet UIImageView *conment_icon;
@property (weak, nonatomic) IBOutlet UILabel *comment_num;

@end
