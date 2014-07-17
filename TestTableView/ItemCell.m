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
        self.itemImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 90, 90)];
        [self.contentView addSubview:self.itemImageView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.itemImageView.frame.origin.x+self.itemImageView.frame.size.width+10, self.itemImageView.frame.origin.y, 180, 60)];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [self.contentView addSubview:self.titleLabel];
        
        self.priceLabel =[[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.frame.origin.x, self.titleLabel.frame.origin.y+self.titleLabel.frame.size.height, 100, 30)];
        self.priceLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:self.priceLabel];
    }
    return self;
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
