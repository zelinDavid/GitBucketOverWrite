//
//  LoginViewController.m
//  GitBucketOverWrite
//
//  Created by David on 17/7/13.
//  Copyright © 2017年 David. All rights reserved.
//

#import "LoginViewController.h"
#import "IQKeyboardReturnKeyHandler.h"
#import "DVLoginViewModel.h"


@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UIImageView *passwordImageView;
@property (weak, nonatomic) IBOutlet UITextField *UserTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (weak, nonatomic) IBOutlet UIButton *LoginBtn;
@property (nonatomic, strong) IQKeyboardReturnKeyHandler *returnKeyHandler;
@property(nonatomic, strong,readonly) DVLoginViewModel *viewModel;

@end

@implementation LoginViewController
@dynamic viewModel;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if ([SSKeychain rawLogin]!= nil) {
        self.UserTextfield.text = [SSKeychain rawLogin];
        self.passwordTextfield.text  = [SSKeychain password];
    }
    
    self.returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
    self.returnKeyHandler.lastTextFieldReturnKeyType = UIReturnKeyGo;

 }




- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


-(void)bindViewModel {
     WS(weakSelf)
    [[self rac_signalForSelector:@selector(textFieldShouldReturn:)fromProtocol:@protocol(UITextFieldDelegate)]
     subscribeNext:^(RACTuple *tuple) {
         if ([tuple.first isEqual:weakSelf.passwordTextfield]) {
             
         }
     }];
    
    RAC(self.viewModel,user) =  self.UserTextfield.rac_textSignal;
    RAC(self.viewModel,password) =  self.passwordTextfield.rac_textSignal;
    
    [self.viewModel.signInBtnEnabledSiganl subscribeNext:^(NSNumber *enable) {
        weakSelf.LoginBtn.enabled = [enable boolValue];
    }];
    
    [[self.LoginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [weakSelf.viewModel.loginCommand execute:nil];
    }];
    
    [self.viewModel.loginCommand.errors subscribeNext:^(id x) {
        NSLog(@"登录失败");
        
    }];
    NSLog(@"%@",self.viewModel);

    
}








@end
