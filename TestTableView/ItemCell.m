//
//  ItemCell.m
//  TestTableView
//
//  Created by junzhan on 14-6-29.
//  Copyright (c) 2014年 junzhan. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //添加图片
        self.itemImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 90, 90)];
        [self.contentView addSubview:self.itemImageView];
        //添加label
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.itemImageView.frame.origin.x+self.itemImageView.frame.size.width+10, self.itemImageView.frame.origin.y, 180, 60)];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [self.contentView addSubview:self.titleLabel];
        //添加价格
        self.priceLabel =[[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y+self.titleLabel.frame.size.height, 100, 30)];
        self.priceLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:self.priceLabel];
        
        //添加人气
        self.hotImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.titleLabel.frame.origin.x+self.titleLabel.frame.size.width-15, self.titleLabel.frame.origin.y+10, 24, 24)];
        [self.contentView addSubview:self.hotImageView];
        
        //添加右箭头
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //在点击cell时去掉点击背景颜色
        UIView *clearView = [[UIView alloc] init];
        clearView.backgroundColor = [UIColor clearColor];//分割线也会看不到
        self.selectedBackgroundView = clearView;
    }
    return self;
}

- (void)updateCellWithModel:(ItemModel *)model{
    self.itemImageView.image = [UIImage imageNamed:model.imageName];
    self.hotImageView.image = [UIImage imageNamed:model.hotImageName];
    self.titleLabel.text = model.title;
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %@", model.price];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
