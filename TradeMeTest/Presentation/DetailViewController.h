//
//  DetailViewController.h
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 17/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KASlideShow/KASlideShow.h>

@interface DetailViewController : UIViewController<KASlideShowDelegate>

- (void)initWithListingId:(int)listingId;

@end
