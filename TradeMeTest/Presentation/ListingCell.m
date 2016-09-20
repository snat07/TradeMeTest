//
//  ListingCell.m
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 17/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import "ListingCell.h"
#import "UIImageView+AFNetworking.h"

@interface ListingCell()

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;


@end

@implementation ListingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) initWithFoundItem:(FoundItemModel *)foundItem{
    self.titleLabel.text = foundItem.title;
    self.subTitleLabel.text = foundItem.subtitle ? foundItem.subtitle : foundItem.suburb;
    self.priceLabel.text = foundItem.priceDisplay;
    [self.thumbnailImageView setImageWithURL:[NSURL URLWithString:foundItem.pictureHref] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
}

@end
