//
//  GalleryView.m
//  ARCam
//
//  Created by Xuehao(David) Hu on 11/28/15.
//  Copyright © 2015 Xuehao(David) Hu. All rights reserved.
//

#import "GalleryView.h"
#import "Constants.h"

@interface GalleryView()

@property (nonatomic, strong) UIView *customNavBar;
@property (nonatomic, strong) UIImageView *leftArrowImageView;
@property (nonatomic, strong) UILabel *seeAllLabel;
@property (nonatomic, strong) UIView *underLineBelowNameIttextfield;
@property (nonatomic, strong) UIButton *doneButton;

@property (nonatomic, strong) UIView *galleryImageContainerView;

@property (nonatomic, strong) UIView *bottomToolBar;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIButton *trashButton;

@end

@implementation GalleryView

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
//    self.backgroundColor = [UIColor whiteColor];
    [self.customNavBar addSubview:self.leftArrowImageView];
    [self.customNavBar addSubview:self.seeAllLabel];
    [self.customNavBar addSubview:self.nameItTextfield];
    [self.customNavBar addSubview:self.underLineBelowNameIttextfield];
    [self.customNavBar addSubview:self.doneButton];

    [self addSubview:self.galleryImageContainerView];
    
    [self addSubview:self.bottomToolBar];
    [self.bottomToolBar addSubview:self.shareButton];
    [self.bottomToolBar addSubview:self.searchButton];
    [self.bottomToolBar addSubview:self.trashButton];
    
    [self setUpConstraints];
}

//subviews
-(UIView *)customNavBar{
    if(!_customNavBar){
        _customNavBar = [UIView new];
        _customNavBar.translatesAutoresizingMaskIntoConstraints = NO;
        _customNavBar.backgroundColor = [UIColor whiteColor];
    }
    return _customNavBar;
}

-(UIImageView *)leftArrowImageView{
    if(!_leftArrowImageView){
        _leftArrowImageView = [UIImageView new];
        _leftArrowImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _leftArrowImageView.image = [UIImage imageNamed:@"leftArrow"];
    }
    return _leftArrowImageView;
}

-(UILabel *)seeAllLabel{
    if(!_seeAllLabel){
        _seeAllLabel = [UILabel new];
        _seeAllLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _seeAllLabel.text = @"See All";
        _seeAllLabel.textColor = [UIColor colorWithRed:3.0/255.0 green:122.0/255.0 blue:1.0 alpha:1.0];
        _seeAllLabel.font = [UIFont fontWithName:ARCamRegularFont size:16];
    }
    return _seeAllLabel;
}

-(UITextField *)nameItTextfield{
    if(!_nameItTextfield){
        _nameItTextfield = [UITextField new];
        _nameItTextfield.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:@" Tap to Name it!"];
        [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:237.0/255.0 green:6.0/255.0 blue:58.0/255.0 alpha:0.5] range:NSMakeRange(0, attStr.length)];
        _nameItTextfield.attributedPlaceholder = attStr;
        
    }
    return _nameItTextfield;
}

-(UIView *)underLineBelowNameIttextfield{
    if(!_underLineBelowNameIttextfield){
        _underLineBelowNameIttextfield = [UIView new];
        _underLineBelowNameIttextfield.translatesAutoresizingMaskIntoConstraints = NO;
        _underLineBelowNameIttextfield.backgroundColor = [UIColor colorWithRed:151.0/255.0 green:151.0/255.0 blue:151.0/255.0 alpha:1.0];
    }
    return _underLineBelowNameIttextfield;
}

-(UIButton *)doneButton{
    if(!_doneButton){
        _doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _doneButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_doneButton setTitle:@"Go Back" forState:UIControlStateNormal];
        _doneButton.titleLabel.font = [UIFont fontWithName:ARCamRegularFont size:16];
        _doneButton.titleLabel.textColor = [UIColor colorWithRed:3.0/255.0 green:122.0/255.0 blue:1.0 alpha:1.0];
        
        [_doneButton addTarget:self.delegate action:@selector(goBackButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [_doneButton setUserInteractionEnabled:YES];
    }
    return _doneButton;
}

-(UIView *)bottomToolBar{
    if(!_bottomToolBar){
        _bottomToolBar = [UIView new];
        _bottomToolBar.translatesAutoresizingMaskIntoConstraints = NO;
        _bottomToolBar.backgroundColor = [UIColor whiteColor];
    }
    return _bottomToolBar;
}

-(UIButton *)shareButton{
    if(!_shareButton){
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _shareButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_shareButton setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    }
    return _shareButton;
}

-(UIButton *)searchButton{
    if(!_searchButton){
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _searchButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_searchButton setBackgroundImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
        [_searchButton setHidden:YES];
    }
    return _searchButton;
}

-(UIButton *)trashButton{
    if(!_trashButton){
        _trashButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _trashButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_trashButton setBackgroundImage:[UIImage imageNamed:@"trash"] forState:UIControlStateNormal];
    }
    return _trashButton;
}

-(UIView *)galleryImageContainerView{
    if (!_galleryImageContainerView) {
        _galleryImageContainerView = [UIView new];
        _galleryImageContainerView.translatesAutoresizingMaskIntoConstraints = NO;
        _galleryImageContainerView.backgroundColor = [UIColor whiteColor];
    }
    return _galleryImageContainerView;
}
//*********************************
// constraints
//*********************************

-(void)setUpConstraints{
    NSDictionary *customNavBarMetrics = @{
                                          @"customNavBarHeight":[NSNumber numberWithFloat:64.f],
                                          
                                          @"leftArrowLeft":[NSNumber numberWithFloat:0.0f],
                                          @"leftArrowBottom":[NSNumber numberWithFloat:8.f],
                                          @"leftArrowHeight":[NSNumber numberWithFloat:26.f],
                                          @"leftArrowWidth":[NSNumber numberWithFloat:25],
                                          
                                          @"seeAllLabelLeft":[NSNumber numberWithFloat:0.f],
                                          @"seeAllLabelWidth":[NSNumber numberWithFloat:78.f],
                                          @"seeAllLabelHeight":[NSNumber numberWithFloat:20.48f],
                                          
                                          @"nameItTextfieldWidth":[NSNumber numberWithFloat:127.f],
                                          @"nameItTextfieldHeight":[NSNumber numberWithFloat:21.5f],
                                          
                                          @"underlineWidth":[NSNumber numberWithFloat:127.f],
                                          @"underlineHeight":[NSNumber numberWithFloat:1.f],
                                          
                                          @"doneButtonRight":[NSNumber numberWithFloat:5.f],
                                          @"doneButtonWidth":[NSNumber numberWithFloat:63.f],
                                          @"doneButtonHeight":[NSNumber numberWithFloat:22.f]
                                          };
    
    NSDictionary *galleryImageContainerViewMetrics = @{
                                        
                                                       };
    
    
    NSDictionary *bottomToolBarMetrics = @{
                                           @"bottomToolBarHeight":[NSNumber numberWithFloat:48.f],
                                           
                                           @"shareButtonHeight":[NSNumber numberWithFloat:60.f],
                                           @"shareButtonWidth":[NSNumber numberWithFloat:54.f],
                                           @"shareButtonLeft":[NSNumber numberWithFloat:0.f],
                                           
                                           @"searchButtonHeight":[NSNumber numberWithFloat:60.f],
                                           @"searchButtonWidth":[NSNumber numberWithFloat:54.f],
                                           
                                           @"trashButtonHeight":[NSNumber numberWithFloat:52.f],
                                           @"trashButtonWidth":[NSNumber numberWithFloat:50.f],
                                           @"trashButtonRight":[NSNumber numberWithFloat:0.0f]
                                           };
    
    
    //Custom Nav Bar Constraints
    //
    NSArray *customNavBarConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_customNavBar(customNavBarHeight)]" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_customNavBar)];
    NSArray *customNavBarConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_customNavBar]-0-|" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_customNavBar)];
    [self addConstraints:customNavBarConstraints_H];
    [self addConstraints:customNavBarConstraints_V];
    
    //left arrow
    //
    NSArray *leftArrowConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_leftArrowImageView(leftArrowHeight)]-leftArrowBottom-|" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_leftArrowImageView)];
    NSArray *leftArrowConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftArrowLeft-[_leftArrowImageView(leftArrowWidth)]" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_leftArrowImageView)];
    [self addConstraints:leftArrowConstraints_H];
    [self addConstraints:leftArrowConstraints_V];
    
    //see all label
    //
    NSArray *seeAllLabelConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_seeAllLabel(seeAllLabelHeight)]" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_seeAllLabel)];
    NSArray *seeAllLabelConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_leftArrowImageView]-seeAllLabelLeft-[_seeAllLabel(seeAllLabelWidth)]" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_seeAllLabel,_leftArrowImageView)];
    NSLayoutConstraint *seeAllLabel_CenterYwithLeftArrow = [NSLayoutConstraint constraintWithItem:self.seeAllLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.leftArrowImageView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-1.0];
    [self addConstraints:seeAllLabelConstraints_H];
    [self addConstraints:seeAllLabelConstraints_V];
    [self addConstraint:seeAllLabel_CenterYwithLeftArrow];
    
    //name it textfield
    //
    NSArray *nameIttextfieldConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_nameItTextfield(nameItTextfieldHeight)]" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_nameItTextfield)];
    NSArray *nameItTextfieldCOnstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_nameItTextfield(nameItTextfieldWidth)]" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_nameItTextfield)];
    NSLayoutConstraint *nameItTextfield_CenterXWithCustomNavBar = [NSLayoutConstraint constraintWithItem:self.nameItTextfield attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.customNavBar attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    NSLayoutConstraint *nameItTextfield_CenterYWithLeftArrow = [NSLayoutConstraint constraintWithItem:self.nameItTextfield attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.leftArrowImageView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-2.0];
    [self addConstraints:nameItTextfieldCOnstraints_H];
    [self addConstraints:nameIttextfieldConstraints_V];
    [self addConstraint:nameItTextfield_CenterXWithCustomNavBar];
    [self addConstraint:nameItTextfield_CenterYWithLeftArrow];
    
    //underLine under the textfield
    //
    NSArray *underlineConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_underLineBelowNameIttextfield(underlineHeight)]" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_underLineBelowNameIttextfield)];
    NSArray *underlineConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_underLineBelowNameIttextfield(underlineWidth)]" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_underLineBelowNameIttextfield)];
    NSLayoutConstraint *underline_CenterX = [NSLayoutConstraint constraintWithItem:self.underLineBelowNameIttextfield attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.customNavBar attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    NSLayoutConstraint *underline_TopEqualToTextfieldBottom = [NSLayoutConstraint constraintWithItem:self.underLineBelowNameIttextfield attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.nameItTextfield attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    [self addConstraints:underlineConstraints_H];
    [self addConstraints:underlineConstraints_V];
    [self addConstraint: underline_CenterX];
    [self addConstraint:underline_TopEqualToTextfieldBottom];
    
    //Done button
    //
    NSArray *doneButtonConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_doneButton(doneButtonHeight)]" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_doneButton)];
    NSArray *doneBUttonConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_doneButton(doneButtonWidth)]-doneButtonRight-|" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_doneButton)];
    NSLayoutConstraint *doneButton_CenterYWithLeftArrow = [NSLayoutConstraint constraintWithItem:self.doneButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.leftArrowImageView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-1.0];
    [self addConstraints:doneBUttonConstraints_H];
    [self addConstraints:doneButtonConstraints_V];
    [self addConstraint:doneButton_CenterYWithLeftArrow];
    
    //bottom tool bar
    NSArray *bottomToolBarConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_bottomToolBar(bottomToolBarHeight)]-0-|" options:0 metrics:bottomToolBarMetrics views:NSDictionaryOfVariableBindings(_bottomToolBar)];
    NSArray *bottomToolBarConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_bottomToolBar]-0-|" options:0 metrics:bottomToolBarMetrics views:NSDictionaryOfVariableBindings(_bottomToolBar)];
    [self addConstraints:bottomToolBarConstraints_H];
    [self addConstraints:bottomToolBarConstraints_V];
    
    //share button
    NSArray *shareButtonConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_shareButton(shareButtonHeight)]" options:0 metrics:bottomToolBarMetrics views:NSDictionaryOfVariableBindings(_shareButton)];
    NSArray *shareButtonConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-shareButtonLeft-[_shareButton(shareButtonWidth)]" options:0 metrics:bottomToolBarMetrics views:NSDictionaryOfVariableBindings(_shareButton)];
    NSLayoutConstraint *shareButton_CenterY = [NSLayoutConstraint constraintWithItem:self.shareButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.bottomToolBar attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    [self addConstraints:shareButtonConstraints_H];
    [self addConstraints:shareButtonConstraints_V];
    [self addConstraint:shareButton_CenterY];
    
    //search button
    NSArray *searchButtonConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_searchButton(searchButtonHeight)]" options:0 metrics:bottomToolBarMetrics views:NSDictionaryOfVariableBindings(_searchButton)];
    NSArray *searchButtonConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_searchButton(searchButtonWidth)]" options:0 metrics:bottomToolBarMetrics views:NSDictionaryOfVariableBindings(_searchButton)];
    NSLayoutConstraint *searchButton_CenterX = [NSLayoutConstraint constraintWithItem:self.searchButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.bottomToolBar attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    NSLayoutConstraint *searchButton_CenterY = [NSLayoutConstraint constraintWithItem:self.searchButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.bottomToolBar attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    [self addConstraints:searchButtonConstraints_H];
    [self addConstraints:searchButtonConstraints_V];
    [self addConstraint:searchButton_CenterX];
    [self addConstraint:searchButton_CenterY];
    
    //search button
    NSArray *trashButtonConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_trashButton(trashButtonHeight)]" options:0 metrics:bottomToolBarMetrics views:NSDictionaryOfVariableBindings(_trashButton)];
    NSArray *trashButtonConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_trashButton(trashButtonWidth)]-trashButtonRight-|" options:0 metrics:bottomToolBarMetrics views:NSDictionaryOfVariableBindings(_trashButton)];
    NSLayoutConstraint *trashButton_CenterY = [NSLayoutConstraint constraintWithItem:self.trashButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.bottomToolBar attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    [self addConstraints:trashButtonConstraints_H];
    [self addConstraints:trashButtonConstraints_V];
    [self addConstraint:trashButton_CenterY];
    
    //gallery image container view
    NSArray *galleryImageContainerViewConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_customNavBar]-0-[_galleryImageContainerView]-0-[_bottomToolBar]" options:0 metrics:galleryImageContainerViewMetrics views:NSDictionaryOfVariableBindings(_customNavBar,_galleryImageContainerView,_bottomToolBar)];
    NSArray *galleryImageContainerViewConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_galleryImageContainerView]-0-|" options:0 metrics:galleryImageContainerViewMetrics views:NSDictionaryOfVariableBindings(_galleryImageContainerView)];
    [self addConstraints:galleryImageContainerViewConstraints_H];
    [self addConstraints:galleryImageContainerViewConstraints_V];
}



@end
