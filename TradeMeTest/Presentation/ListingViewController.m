//
//  ListingViewController.m
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 17/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import "ListingViewController.h"
#import "ListingCell.h"
#import "CategoryListingCell.h"
#import "NetworkManager.h"
#import "DetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIView+LoadingView.h"


static NSString *const kListingCell = @"ListingCell";
static NSString *const kCategoryListingCell = @"CategoryListingCell";
static NSString *const kDetailControllerId = @"detailId";
static NSString *const kListingViewControllerId = @"listingId";

@interface ListingViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) SearchModel   *searchModel;
@property (weak, nonatomic) IBOutlet UITableView *listingTableView;
@property (weak, nonatomic) IBOutlet UIView *categoriesView;
@property (weak, nonatomic) IBOutlet UITableView *categoriesTableView;
@property (weak, nonatomic) IBOutlet UIView *shadowView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *categoriesViewWidth;

@property (nonatomic, strong) NSString *selectedCategory;

@end

@implementation ListingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.categoriesView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.categoriesView.layer.borderWidth = 1.0f;
    self.categoriesTableView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.categoriesTableView.layer.borderWidth = 1.0f;
    self.categoriesView.layer.cornerRadius = 4.0f;
    self.categoriesView.hidden = YES;
    self.shadowView.hidden = YES;
    self.searchTextField.delegate = self;
    UIImage *image = [UIImage imageNamed:@"navigationBar.png"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initWithCategory:(NSString *)categoryId{
    
    __weak typeof(self) wSelf = self;
    self.selectedCategory = categoryId;
    [self.view showLoadingView];
    [[NetworkManager sharedInstance] fetchSearchWithCategoryNumber:categoryId succes:^(SearchModel *searchModel) {
        [self.view hideLoadingView];
        wSelf.searchModel = searchModel;
        [wSelf.listingTableView reloadData];
        [wSelf.categoriesTableView reloadData];
        if (searchModel.foundCategories.count > 0) {
            
            self.categoriesView.hidden = NO;
            self.shadowView.hidden = NO;
        } else{
            self.categoriesView.hidden = YES;
            self.shadowView.hidden = YES;
            self.categoriesViewWidth.constant = 0.f;
        }
    } failure:^(NSError *error) {
        [self.view hideLoadingView];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sorry"
                                                                                 message:@"There was an error with your request, please try again, or take a chance later."
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];
        NSLog(@"%@",error);
    }];
}
- (void)initWithSearch:(NSString *)searchString{
    
    __weak typeof(self) wSelf = self;
    [self.view showLoadingView];
    NSString *searchInCategory = self.selectedCategory ? self.selectedCategory : @"0";
    
    [[NetworkManager sharedInstance] fetchSearchWithSearchWord:searchString categoryNumber:searchInCategory succes:^(SearchModel *searchModel) {
        [self.view hideLoadingView];
        wSelf.searchModel = searchModel;
        [wSelf.listingTableView reloadData];
        [wSelf.categoriesTableView reloadData];
        if (searchModel.foundCategories.count > 0) {
            
            self.categoriesView.hidden = NO;
            self.shadowView.hidden = NO;
        } else{
            self.categoriesView.hidden = YES;
            self.shadowView.hidden = YES;
            self.categoriesViewWidth.constant = 0.f;
        }
        
    } failure:^(NSError *error) {
        [self.view hideLoadingView];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sorry"
                                                                                 message:@"There was an error with your request, please try again, or take a chance later."
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];

        NSLog(@"%@",error);
    }];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.searchModel) {
        if (tableView == self.listingTableView) {
            return self.searchModel.list.count > 20 ? 20 : self.searchModel.list.count;
        }else if (tableView == self.categoriesTableView){
            return self.searchModel.foundCategories.count;
        }
        
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell;
    
    if (tableView == self.listingTableView) {
        ListingCell *cell = [tableView dequeueReusableCellWithIdentifier:kListingCell];
        [cell initWithFoundItem:[self.searchModel.list objectAtIndex:indexPath.row]];
        return cell;
    }
    else if (tableView == self.categoriesTableView){
        CategoryListingCell *cell = [tableView dequeueReusableCellWithIdentifier:kCategoryListingCell];
        [cell initWithFoundCategory:[self.searchModel.foundCategories objectAtIndex:indexPath.row]];
        return cell;
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.listingTableView) {
        [self performSegueWithIdentifier:kDetailControllerId sender:self.listingTableView];
    } else if(tableView == self.categoriesTableView){
        FoundCategoryModel *categorySelected = [self.searchModel.foundCategories objectAtIndex:indexPath.row];
        [self initWithCategory:categorySelected.category];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([sender isKindOfClass:[UITableView class]] || [sender isKindOfClass:[UITableViewCell class]]) {
        if ([segue.identifier isEqualToString:kDetailControllerId]) {
            NSIndexPath *indexPath = [self.listingTableView indexPathForSelectedRow];
            DetailViewController *destViewController = segue.destinationViewController;
            FoundItemModel *itemModel = [self.searchModel.list objectAtIndex:indexPath.row];
            [destViewController initWithListingId:itemModel.listingId];
        }
    }

}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder]; // Dismiss the keyboard.
    
    [self initWithSearch:self.searchTextField.text];
    
    return YES;
}

- (IBAction)didTapCategories:(id)sender {
    self.categoriesView.hidden = NO;
    self.shadowView.hidden = NO;
}
- (IBAction)didTapDone:(id)sender {
    self.categoriesView.hidden = YES;
    self.shadowView.hidden = YES;
}



@end
