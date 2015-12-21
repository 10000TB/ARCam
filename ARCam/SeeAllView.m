//
//  SeeAllView.m
//  ARCam
//
//  Created by Xuehao(David) Hu on 12/6/15.
//  Copyright © 2015 Xuehao(David) Hu. All rights reserved.
//

#import "SeeAllView.h"
#import "Constants.h"

@interface SeeAllView()

@property (nonatomic, strong) UIView *customNavBar;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIImageView *rightArrowImageView;

@end

@implementation SeeAllView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self createSubViews];
    }
    return self;
}

-(id)init{
    return [self initWithFrame:CGRectZero];
}

-(void)createSubViews{
    [self addSubview:self.customNavBar];
    [self.customNavBar addSubview:self.titleLabel];
    [self.customNavBar addSubview:self.backButton];
    [self.customNavBar addSubview:self.rightArrowImageView];
    [self addSubview:self.CollectionViewContentView];
    
    [self setUpConstraints];
}

//**************************
// sub views
//**************************
-(UIView *)customNavBar{
    if(!_customNavBar){
        _customNavBar = [UIView new];
        _customNavBar.translatesAutoresizingMaskIntoConstraints = NO;
        _customNavBar.backgroundColor = [UIColor whiteColor];
    }
    return _customNavBar;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.text = @"Moments";
        _titleLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
        _titleLabel.font = [UIFont fontWithName:ARCamRegularFont size:16];
    }
    return _titleLabel;
}

-(UIButton *)backButton {
    if(!_backButton){
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_backButton setTitle:@"Go Back" forState:UIControlStateNormal];
        _backButton.titleLabel.textColor = [UIColor colorWithRed:3.0/255.0 green:122.0/255.0 blue:1.0 alpha:1.0];
        [_backButton setTitleColor:[UIColor colorWithRed:3.0/255.0 green:122.0/255.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
        
        [_backButton setUserInteractionEnabled:YES];
        [_backButton addTarget:self.delsgate action:@selector(backButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

-(UIImageView *)rightArrowImageView{
    if(!_rightArrowImageView){
        _rightArrowImageView = [UIImageView new];
        _rightArrowImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _rightArrowImageView.image = [UIImage imageNamed:@"rightArrow.png"];
        [_rightArrowImageView setHidden:YES];
    }
    return _rightArrowImageView;
}

-(UIView *)CollectionViewContentView{
    if(!_CollectionViewContentView){
        _CollectionViewContentView = [UIView new];
        _CollectionViewContentView.translatesAutoresizingMaskIntoConstraints = NO;
        _CollectionViewContentView.backgroundColor = [UIColor whiteColor];
    }
    return _CollectionViewContentView;
}
//***************************
// set up constraints
//***************************
-(void)setUpConstraints{
    NSDictionary *topCustomBarMetrics = @{
                                          @"customNavBarHeight":[NSNumber numberWithFloat:64.f],
                                          
                                          @"backButtonRight":[NSNumber numberWithFloat:0.f],
                                          @"backButtonWidth":[NSNumber numberWithFloat:68.f],
                                          @"backButtonHeight":[NSNumber numberWithFloat:20.48f],
                                          
                                          @"rightArrowRight":[NSNumber numberWithFloat:0.0f],
                                          @"rightArrowBottom":[NSNumber numberWithFloat:8.f],
                                          @"rightArrowHeight":[NSNumber numberWithFloat:26.f],
                                          @"rightArrowWidth":[NSNumber numberWithFloat:6],
                                          
                                          @"titleLabelBottom":[NSNumber numberWithFloat:12.f],
                                          @"titleLabelWidth":[NSNumber numberWithFloat:80.f],
                                          @"titleLabelHeight":[NSNumber numberWithFloat:20.f]
                                          };
    //custom nav bar
    NSArray *customNavBarConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_customNavBar(customNavBarHeight)]" options:0 metrics:topCustomBarMetrics views:NSDictionaryOfVariableBindings(_customNavBar)];
    NSArray *customNavBarConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_customNavBar]-0-|" options:0 metrics:topCustomBarMetrics views:NSDictionaryOfVariableBindings(_customNavBar)];
    [self addConstraints:customNavBarConstraints_H];
    [self addConstraints:customNavBarConstraints_V];
    
    //title label
    NSArray *titleLabelConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_titleLabel(titleLabelHeight)]-titleLabelBottom-|" options:0 metrics:topCustomBarMetrics views:NSDictionaryOfVariableBindings(_titleLabel)];
    NSArray *titleLabelConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_titleLabel(titleLabelWidth)]" options:0 metrics:topCustomBarMetrics views:NSDictionaryOfVariableBindings(_titleLabel)];
    NSLayoutConstraint *titleLabelConstraint_CenterX = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.customNavBar attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    [self addConstraints:titleLabelConstraints_H];
    [self addConstraints:titleLabelConstraints_V];
    [self addConstraint:titleLabelConstraint_CenterX];
    
    //right arrow
    NSArray *rightArrowConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_rightArrowImageView(rightArrowWidth)]-rightArrowRight-|" options:0 metrics:topCustomBarMetrics views:NSDictionaryOfVariableBindings(_rightArrowImageView)];
    NSArray *rightArrowConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_rightArrowImageView(rightArrowHeight)]-rightArrowBottom-|" options:0 metrics:topCustomBarMetrics views:NSDictionaryOfVariableBindings(_rightArrowImageView)];
    [self addConstraints:rightArrowConstraints_H];
    [self addConstraints:rightArrowConstraints_V];
    
    //back button
    NSArray *backButtonConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_backButton(backButtonWidth)]-backButtonRight-[_rightArrowImageView]" options:0 metrics:topCustomBarMetrics views:NSDictionaryOfVariableBindings(_backButton,_rightArrowImageView)];
    NSArray *backButtonConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_backButton(backButtonHeight)]" options:0 metrics:topCustomBarMetrics views:NSDictionaryOfVariableBindings(_backButton)];
    NSLayoutConstraint *backButtonConstraints_CenterY = [NSLayoutConstraint constraintWithItem:self.backButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.rightArrowImageView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    [self addConstraints:backButtonConstraints_H];
    [self addConstraints:backButtonConstraints_V];
    [self addConstraint:backButtonConstraints_CenterY];
    
    //colectionView Content View
    NSArray *collectionViewContentViewConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_CollectionViewContentView]-0-|" options:0 metrics:topCustomBarMetrics views:NSDictionaryOfVariableBindings(_CollectionViewContentView)];
    NSArray *collectionViewContentViewConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_customNavBar]-0-[_CollectionViewContentView]-0-|" options:0 metrics:topCustomBarMetrics views:NSDictionaryOfVariableBindings(_CollectionViewContentView,_customNavBar)];
    [self addConstraints:collectionViewContentViewConstraints_H];
    [self addConstraints:collectionViewContentViewConstraints_V];
    
}


@end
