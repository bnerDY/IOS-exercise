//
//  ViewController.m
//  currencyConvertor
//
//  Created by DINGXIN YU on 31/01/2016.
//  Copyright © 2016 DINGXIN YU. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"


@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;

@end

@implementation ViewController

- (IBAction)buttonTapped:(id)sender {
    self.convertButton.enabled = NO;

    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
    
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    self.convertButton.enabled = YES;
    double inputValue = [self.inputField.text floatValue];

    double euroValue = inputValue * currencies.EUR;
    double jpyValue = inputValue * currencies.JPY;
    double gbpValue = inputValue * currencies.GBP;
    NSString *euroString = [NSString stringWithFormat:@"%.2F",euroValue];
    NSString *jpyString = [NSString stringWithFormat:@"%.2F",jpyValue];
    NSString *gbpString = [NSString stringWithFormat:@"%.2F",gbpValue];


    self.currencyA.text = euroString;
    self.currencyB.text = jpyString;
    self.currencyC.text = gbpString;
}

@end
