//
//  ViewController.m
//  twitterShare
//
//  Created by DINGXIN YU on 26/02/2016.
//  Copyright © 2016 DINGXIN YU. All rights reserved.
//

#import "ViewController.h"
#import "Social/Social.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;

- (void) configureTweetTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self configureTweetTextView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showShareAction:(id)sender {
    if ([self.tweetTextView isFirstResponder]) {
        [self.tweetTextView resignFirstResponder];
    }

    UIAlertController *acitonController = [UIAlertController alertControllerWithTitle:@"Test Title" message:@"Tweet your note" preferredStyle:UIAlertControllerStyleAlert];

    [self presentViewController:acitonController animated:YES completion:nil];

}

- (void) configureTweetTextView{
    self.tweetTextView.layer.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0].CGColor;

    self.tweetTextView.layer.cornerRadius = 10.0;

    self.tweetTextView.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;

    self.tweetTextView.layer.borderWidth = 2.0;

}

@end
