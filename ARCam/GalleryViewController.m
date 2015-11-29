//
//  GalleryViewController.m
//  ARCam
//
//  Created by Xuehao(David) Hu on 11/28/15.
//  Copyright © 2015 Xuehao(David) Hu. All rights reserved.
//

#import "GalleryViewController.h"
#import "GalleryView.h"

@interface GalleryViewController ()

@property (nonatomic, strong) GalleryView *view;

@end

@implementation GalleryViewController
@dynamic view;

-(void)loadView{
    self.view = [GalleryView new];
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
