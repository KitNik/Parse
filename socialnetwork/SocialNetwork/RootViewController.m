//
//  ViewController.m
//  SocialNetwork
//
//  Copyright (c) 2015 Nikita. All rights reserved.
//

#import "RootViewController.h"
#import "HomeViewController.h"

#define LOG_IN 0
#define SIGN_UP 1
#define ERROR_KEY @"error"

@interface RootViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *userEmailTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIButton *logInButton;
@property (weak, nonatomic) IBOutlet UIButton *resetPasswordButton;

@end

@implementation RootViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    self.loadingIndicator.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ParseRequests

- (void)signUpUserWithEmail:(NSString *)login andPassword:(NSString *)password {
    [self.loadingIndicator startAnimating];
    SignUpRequest *signUpRequest = [[SignUpRequest alloc] init];
    signUpRequest.delegateSignUpResponse = self;
    [signUpRequest signUpUserLogInByEMail:login password:password];
}

- (void)logInUserByEmail:(NSString *)eMail andPassword:(NSString *)password {
    [self.loadingIndicator startAnimating];
    LogInRequest *logInRequest = [[LogInRequest alloc] init];
    logInRequest.delegateLoginResponse = self;
    [logInRequest logInUserByEmail:eMail andPassword:password];
}

- (void)resetUserPassword:(NSString *)eMail {
    [self.loadingIndicator startAnimating];
    ResetPasswordRequest *resetPasswordRequest = [[ResetPasswordRequest alloc] init];
    resetPasswordRequest.delegateResetPasswordResponse = self;
    [resetPasswordRequest resetPasswordByEmail:eMail];
}

#pragma mark - Actions

- (IBAction)signUp:(id)sender {
    [self showLoadingIndicator:YES];
    if (![self isEnteredUserTextEmpty]) {
        [self signUpUserWithEmail:self.userEmailTextField.text andPassword:self.userPasswordTextField.text];
    } else {
        [self showAlertWithTitle:@"ATTENTION" andMessage:@"The fields must not be empty"];
    }
}

- (IBAction)logIn:(id)sender {
    [self showLoadingIndicator:YES];
    if (![self isEnteredUserTextEmpty]) {
        [self logInUserByEmail:self.userEmailTextField.text andPassword:self.userPasswordTextField.text];
    } else {
        [self showAlertWithTitle:@"ATTENTION" andMessage:@"The fields must not be empty"];
    }
}

- (IBAction)resetPassword:(UIButton *)sender {
    [self showLoadingIndicator:YES];
    if (self.userEmailTextField.text != nil) {
        [self resetUserPassword:self.userEmailTextField.text];
    }
}

#pragma mark - TextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return  YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

#pragma mark - AdditionalMethods

- (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

- (BOOL)isEnteredUserTextEmpty {
    if (self.userPasswordTextField.text == nil ||
        self.userEmailTextField.text == nil) {
        return YES;
    }
    return NO;
}

- (void)showLoadingIndicator:(BOOL)show {
    self.loadingIndicator.hidden = !show;
    self.signUpButton.enabled = !show;
    self.logInButton.enabled = !show;
    self.resetPasswordButton.enabled = !show;
    if (show) {
        [self.loadingIndicator startAnimating];
    } else {
        [self.loadingIndicator stopAnimating];
        self.userPasswordTextField.text = @"";
    }
}

#pragma mark - SignUpResponseDelegate

- (void)responseSignUpWithSuccesed:(BOOL)successed andError:(NSError *)error {
    NSString *password = self.userPasswordTextField.text;
    [self showLoadingIndicator:NO];
    if (successed) {
        NSString *message = @"You are successfully registered!";
        [self showAlertWithTitle:@"SUCCESS" andMessage:message];
        [self logInUserByEmail:self.userEmailTextField.text andPassword:password];
    } else {
        [self showAlertWithTitle:@"ERROR" andMessage:[[error userInfo] objectForKey:ERROR_KEY]];
    }
}

#pragma mark - LoginResponseDelegate

- (void)responseLogInWithUser:(User *)user andError:(NSError *)error {
    [self showLoadingIndicator:NO];
    if (!error) {
        UIStoryboard *storyBoard = self.storyboard;
        HomeViewController *homeViewController = [storyBoard instantiateViewControllerWithIdentifier:@"HomeViewController"];
        homeViewController.user = user;
        [self.navigationController pushViewController:homeViewController animated:YES];
    } else {
        [self showAlertWithTitle:@"ERROR" andMessage:[[error userInfo] objectForKey:ERROR_KEY]];
    }
}

#pragma mark - ResetPasswordDelegate

- (void)responseResetPasswordWithSuccessed:(BOOL)successed andError:(NSError *)error {
    [self showLoadingIndicator:NO];
    if (successed) {
        NSString *message = @"The message with instruction how to reset your password was sent to your E-mail";
        [self showAlertWithTitle:@"ATTENTION" andMessage:message];
    } else {
        [self showAlertWithTitle:@"ERROR" andMessage:[[error userInfo] objectForKey:ERROR_KEY]];
    }
}

@end
