//
//  ViewController.m
//  CustomErrorObjectiveCExample
//
//  Created by wade on 2023/01/16.
//

#import "ViewController.h"

#import "CustomErrorObjectiveCExample-Swift.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    NSError *customError1 = [[CustomError alloc] init];
    NSError *customError2 = [[CustomError alloc] initWithDomain:@"CustomErrorExample" code:-1 userInfo:nil];
    
    NSLog(@"%@", customError1);
    NSLog(@"%@", customError2);
    
    SampleError *sampleError1 = [[SampleError alloc] initWithType:SampleErrorTypeSample1];
    
    NSLog(@"%@", sampleError1);
    
    if (sampleError1.code == SampleErrorTypeSample2) {
        NSLog(@"same");
    }else {
        NSLog(@"not same");
    }
    
    HttpError *badRequestError = [HttpError clientErrorWithType:HttpClientErrorTypeBadRequest];
    HttpError *internalServerError = [HttpError serverErrorWithType:HttpServerErrorTypeInternalServerError];
    
    NSLog(@"%@", badRequestError);
    NSLog(@"%@", internalServerError.localizedDescription);
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
