//
//  ViewController.m
//  TradeMeTest
//
//  Created by Sebastian Natalevich on 17/9/16.
//  Copyright © 2016 sebastianNatalevich. All rights reserved.
//

#import "MainViewController.h"
#import "NetworkManager.h"
#import "CategoryModel.h"
#import "ListingViewController.h"
#import "UIView+LoadingView.h"

static NSString *const kListingViewControllerId = @"listingId";
static NSString *const kCategoryCell = @"categoryCell";

@interface MainViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)        CategoryModel *categoryModel;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIImage *image = [UIImage imageNamed:@"navigationBar.png"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCategoryCell];
    self.searchTextField.delegate = self;
    
    [self.view showLoadingView];
    __weak typeof(self) wSelf = self;
    [[NetworkManager sharedInstance] fetchCategoryWithNumnber:@"0" succes:^(CategoryModel *categoryModel) {
        wSelf.categoryModel = categoryModel;
        [wSelf.tableView reloadData];
        [wSelf.view hideLoadingView];
    } failure:^(NSError *error) {
        [wSelf.view hideLoadingView];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sorry"
                                                                                 message:@"There was an error with your request, please try again, or take a chance later."
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:nil];
        NSLog(@"%@",error);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.categoryModel) {
        return self.categoryModel.subcategories.count;
    }
    return 0;    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCategoryCell];
    
    CategoryModel *subCategory = [self.categoryModel.subcategories objectAtIndex:indexPath.row];
    cell.textLabel.text = subCategory .name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:kListingViewControllerId sender:self.tableView];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kListingViewControllerId]) {
        ListingViewController *destViewController = segue.destinationViewController;
        if (sender == self.tableView) {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            CategoryModel *categorySelected = [self.categoryModel.subcategories objectAtIndex:indexPath.row];
            [destViewController initWithCategory:categorySelected.number];
            
        } else if (sender == self.searchTextField){
            [destViewController initWithSearch:self.searchTextField.text];
        }
        
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder]; // Dismiss the keyboard.
    
    [self performSegueWithIdentifier:kListingViewControllerId sender:self.searchTextField];
    
    return YES;
}

@end
