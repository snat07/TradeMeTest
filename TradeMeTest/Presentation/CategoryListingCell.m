//
//  CategoryListingCell.m
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 17/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import "CategoryListingCell.h"
#import <KASlideShow/KASlideShow.h>

@interface CategoryListingCell()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;


@end

@implementation CategoryListingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) initWithFoundCategory:(FoundCategoryModel *)foundCategory{
    self.nameLabel.text = foundCategory.name;
    self.countLabel.text = [NSString stringWithFormat:@"%d", foundCategory.count];
}

@end
