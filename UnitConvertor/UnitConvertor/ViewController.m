//
//  ViewController.m
//  UnitConvertor
//
//  Created by DINGXIN YU on 28/01/2016.
//  Copyright © 2016 DINGXIN YU. All rights reserved.
//

#import "ViewController.h"

double convertMeterToFeet(double unitOneValue){
    double unitTwoValue;
    unitTwoValue = 3.28084 * unitOneValue;
    return unitTwoValue;

}
double convertMeterToMile(double unitOneValue){
    double unitTwoValue;
    unitTwoValue = 0.00062137121212121 * unitOneValue;
    return unitTwoValue;

}
double convertMeterToInch(double unitOneValue){
    double unitTwoValue;
    unitTwoValue = 39.37008 * unitOneValue;
    return unitTwoValue;

}

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputField;


@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;

@property (weak, nonatomic) IBOutlet UILabel *outputField;

@end

@implementation ViewController

- (IBAction)updateButton:(id)sender {
    NSMutableString *buf = [NSMutableString new];

    double userInput = [self.inputField.text doubleValue];

    if (self.segmentController.selectedSegmentIndex == 0) {
        double unitTwoValue = convertMeterToFeet(userInput);
        [buf appendString: [@(unitTwoValue) stringValue]];

    }else if (self.segmentController.selectedSegmentIndex == 1) {
        double unitThreeValue = convertMeterToMile(userInput);
        [buf appendString: [@(unitThreeValue) stringValue]];
    }else{
        double unitFourValue = convertMeterToInch(userInput);
        [buf appendString: [@(unitFourValue) stringValue]];
    }

    self.outputField.text = buf;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
