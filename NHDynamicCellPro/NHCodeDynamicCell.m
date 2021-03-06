//
//  NHCodeDynamicCell.m
//  NHDynamicCellPro
//
//  Created by hu jiaju on 15/11/18.
//  Copyright © 2015年 hu jiaju. All rights reserved.
//

#import "NHCodeDynamicCell.h"

@implementation NHCodeDynamicCell

- (void)awakeFromNib {
    // Initialization code
    [self _initSetup];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _initSetup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _initSetup];
    }
    return self;
}

//- (void)prepareForReuse {
//    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//    [super prepareForReuse];
//}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    weakify(self)
    [_label makeConstraints:^(MASConstraintMaker *make) {
        strongify(self)
        make.top.equalTo(self.contentView).offset(15);
        make.left.equalTo(self.contentView).offset(100);
        make.right.equalTo(self.contentView).offset(-50);
        make.bottom.mas_equalTo(self.subLabel.mas_top).offset(-20);
        //make.height.mas_greaterThanOrEqualTo(@20).priorityHigh(1000);
    }];
    
    [_subLabel makeConstraints:^(MASConstraintMaker *make) {
        strongify(self)
        make.top.mas_equalTo(self.label.mas_bottom).offset(20);
        make.left.equalTo(self.contentView).offset(50);
        make.right.equalTo(self.contentView).offset(-100);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10).priorityLow(998);
    }];
    
}

- (void)_initSetup {
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.subLabel];
//    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.label.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 150;
    self.subLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 150;
}

- (UILabel *)label {
    if (_label == nil) {
        UIFont *font = [UIFont systemFontOfSize:15];
        _label = [[UILabel alloc] init];
        _label.font = font;
        _label.numberOfLines = 0;
    }
    return _label;
}

- (UILabel *)subLabel {
    if (_subLabel == nil) {
        UIFont *font = [UIFont systemFontOfSize:15];
        _subLabel = [[UILabel alloc] init];
        _subLabel.font = font;
        _subLabel.numberOfLines = 0;
    }
    return _subLabel;
}

@end
