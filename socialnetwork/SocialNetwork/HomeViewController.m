//
//  HomeViewController.m
//  SocialNetwork
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *eMailLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *updatedAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *eMailVerifiedLabel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = self.user.name;
    self.eMailLabel.text = self.user.eMail;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd hh:mma"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];

    self.createdAtLabel.text = [formatter stringFromDate:self.user.createdAt];
    self.updatedAtLabel.text = [formatter stringFromDate:self.user.updatedAt];

    self.idLabel.text = self.user.ID;
    self.eMailVerifiedLabel.text = [NSString stringWithFormat:@"%@", self.user.eMailVerfied ? @"YES" : @"NO"];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
