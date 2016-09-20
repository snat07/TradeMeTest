//
//  DetailViewController.m
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 17/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import "DetailViewController.h"
#import "ItemDetailModel.h"
#import "ItemPhotoModel.h"
#import "NetworkManager.h"
#import "UIView+LoadingView.h"
#import <QuartzCore/QuartzCore.h>

@interface DetailViewController ()<KASlideShowDataSource, KASlideShowDelegate>

@property (weak, nonatomic) IBOutlet KASlideShow *slideshowView;
@property (nonatomic, strong) ItemDetailModel *itemDetailModel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *suburbLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UITextView *bodyText;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *slideShowHeight;


@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed:@"navigationBar.png"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
    
    self.slideshowView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.slideshowView.layer.borderWidth = 1.0f;
   }

- (void)initWithListingId:(int)listingId{
    __weak typeof(self) wSelf = self;
    [self.view showLoadingView];
    [[NetworkManager sharedInstance] fetchItemDetailWithListingId:listingId succes:^(ItemDetailModel *itemDetailModel) {
        [self.view hideLoadingView];
        wSelf.itemDetailModel = itemDetailModel;
        [wSelf configureView];
        if (itemDetailModel.photos.count > 0) {
            [wSelf configureSlideShow];
        }
        else {
            wSelf.slideshowView.hidden  = YES;
            wSelf.slideShowHeight.constant = 0.f;
        }
        

    } failure:^(NSError *error) {
        [self.view showLoadingView];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sorry"
                                                                           message:@"There was an error with your request, please try again, or take a chance later."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];
        NSLog(@"%@",error);
    }];
}

- (void)configureSlideShow{
    self.slideshowView.datasource = self;
    self.slideshowView.delegate = self;
    [self.slideshowView setTransitionType:KASlideShowTransitionSlideHorizontal];
    [self.slideshowView setImagesContentMode:UIViewContentModeScaleAspectFill];
    [self.slideshowView addGesture:KASlideShowGestureSwipe];
    if (self.itemDetailModel.photos.count > 1) {
        self.pageControl.numberOfPages = self.itemDetailModel.photos.count;
        self.pageControl.currentPage = 0;
    } else{
        self.pageControl.hidden = YES;
    }

}

- (void)configureView{
    self.titleLabel.text = self.itemDetailModel.title;
    self.userLabel.text = self.itemDetailModel.memberNickname;
    self.suburbLabel.text = self.itemDetailModel.suburb;
    self.priceLabel.text = self.itemDetailModel.priceDisplay;
    self.bodyText.text = self.itemDetailModel.body;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSObject *)slideShow:(KASlideShow *)slideShow objectAtIndex:(NSUInteger)index
{
    ItemPhotoModel *itemPhotoModel =  [self.itemDetailModel.photos objectAtIndex:index];
    self.pageControl.currentPage = index;
    return [NSURL URLWithString:[itemPhotoModel.value objectForKey:@"Gallery"]];
}

- (NSUInteger)slideShowImagesNumber:(KASlideShow *)slideShow
{
    return self.itemDetailModel.photos.count;
}


@end
