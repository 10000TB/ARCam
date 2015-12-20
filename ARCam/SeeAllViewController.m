//
//  SeeAllViewController.m
//  ARCam
//
//  Created by Xuehao(David) Hu on 12/6/15.
//  Copyright © 2015 Xuehao(David) Hu. All rights reserved.
//

#import "SeeAllViewController.h"
#import "SeeAllView.h"
#import "MomentCollectionViewCell.h"

@interface SeeAllViewController ()<SeeAllViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) SeeAllView *view;
@property (nonatomic, strong) UICollectionView *momentsCollectionView;

@end

@implementation SeeAllViewController
@dynamic view;

-(void)loadView{
    self.view = [SeeAllView new];
    self.view.delsgate = self;
    [self.view.CollectionViewContentView addSubview:self.momentsCollectionView];
    
    NSArray *momentsCollectionViewConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_momentsCollectionView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_momentsCollectionView)];
    NSArray *momentsCollectionViewConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_momentsCollectionView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_momentsCollectionView)];
    
    [self.view addConstraints:momentsCollectionViewConstraints_H];
    [self.view addConstraints:momentsCollectionViewConstraints_V];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//**************************************************************
// SeeAllView Delegate Methods
//**************************************************************
-(void)backButtonTapped:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


//**************************************************************
// SubView
//**************************************************************
-(UICollectionView *)momentsCollectionView{
    if(!_momentsCollectionView){
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        _momentsCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _momentsCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
        _momentsCollectionView.backgroundColor = [UIColor whiteColor];
        _momentsCollectionView.dataSource = self;
        _momentsCollectionView.delegate = self;
        
        [_momentsCollectionView registerClass:[MomentCollectionViewCell class] forCellWithReuseIdentifier:@"momentCollectionViewCell"];
    }
    return _momentsCollectionView;
}

//**************************************************************
// Moment Collection View Methods
//**************************************************************
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MomentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"momentCollectionViewCell" forIndexPath:indexPath];
    
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 2, 0, 2);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat screenWidth = [[UIScreen mainScreen]bounds].size.width;
    CGFloat cellWidth = screenWidth/2-10;
    CGFloat cellHeight = screenWidth/2;
    
    return CGSizeMake(cellWidth, cellHeight);
}




@end
