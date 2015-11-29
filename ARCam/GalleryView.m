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

@property (nonatomic, strong) UIView *bottomToolBar;
@property (nonatomic, strong) UIButton *shareButton;

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
    [self.customNavBar addSubview:self.leftArrowImageView];
    [self.customNavBar addSubview:self.seeAllLabel];
    [self.customNavBar addSubview:self.nameItTextfield];
    [self.customNavBar addSubview:self.underLineBelowNameIttextfield];
    [self.customNavBar addSubview:self.doneButton];

    [self setUpConstraints];
}

//subviews
-(UIView *)customNavBar{
    if(!_customNavBar){
        _customNavBar = [UIView new];
        _customNavBar.translatesAutoresizingMaskIntoConstraints = NO;
        _customNavBar.backgroundColor = [UIColor blueColor];
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
        _seeAllLabel.font = [UIFont fontWithName:ARCamRegularFont size:14];
    }
    return _seeAllLabel;
}

-(UITextField *)nameItTextfield{
    if(!_nameItTextfield){
        _nameItTextfield = [UITextField new];
        _nameItTextfield.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:@"Tap to Name it!"];
        [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:237.0/255.0 green:6.0/255.0 blue:58.0/255.0 alpha:1.0] range:NSMakeRange(0, attStr.length)];
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
        _doneButton.titleLabel.text = @"Done";
        _doneButton.titleLabel.font = [UIFont fontWithName:ARCamRegularFont size:18];
    }
    return _doneButton;
}

-(UIView *)bottomToolBar{
    if(!_bottomToolBar){
        _bottomToolBar = [UIView new];
        _bottomToolBar.translatesAutoresizingMaskIntoConstraints = NO;
        _bottomToolBar.backgroundColor = [UIColor redColor];
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

//*********************************
// constraints
//*********************************

-(void)setUpConstraints{
    NSDictionary *customNavBarMetrics = @{
                                          @"customNavBarHeight":[NSNumber numberWithFloat:64.f],
                                          
                                          @"leftArrowLeft":[NSNumber numberWithFloat:12.f],
                                          @"leftArrowBottom":[NSNumber numberWithFloat:14.f],
                                          @"leftArrowHeight":[NSNumber numberWithFloat:21.f],
                                          @"leftArrowWidth":[NSNumber numberWithFloat:12.5],
                                          
                                          @"seeAllLabelLeft":[NSNumber numberWithFloat:5.f],
                                          @"seeAllLabelWidth":[NSNumber numberWithFloat:78.f],
                                          @"seeAllLabelHeight":[NSNumber numberWithFloat:20.48f],
                                          
                                          @"nameItTextfieldWidth":[NSNumber numberWithFloat:127.f],
                                          @"nameItTextfieldHeight":[NSNumber numberWithFloat:21.5f],
                                          
                                          @"underlineWidth":[NSNumber numberWithFloat:127.f],
                                          @"underlineHeight":[NSNumber numberWithFloat:1.f],
                                          
                                          @"doneButtonRight":[NSNumber numberWithFloat:12.f],
                                          @"doneButtonWidth":[NSNumber numberWithFloat:43.f],
                                          @"doneButtonHeight":[NSNumber numberWithFloat:22.f]
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
    [self.customNavBar addConstraints:leftArrowConstraints_H];
    [self.customNavBar addConstraints:leftArrowConstraints_V];
    
    //see all label
    //
    NSArray *seeAllLabelConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_seeAllLabel(seeAllLabelHeight)]" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_seeAllLabel)];
    NSArray *seeAllLabelConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_leftArrowImageView]-seeAllLabelLeft-[_seeAllLabel(seeAllLabelWidth)]" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_seeAllLabel,_leftArrowImageView)];
    NSLayoutConstraint *seeAllLabel_CenterYwithLeftArrow = [NSLayoutConstraint constraintWithItem:self.seeAllLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.leftArrowImageView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    [self.customNavBar addConstraints:seeAllLabelConstraints_H];
    [self.customNavBar addConstraints:seeAllLabelConstraints_V];
    [self.customNavBar addConstraint:seeAllLabel_CenterYwithLeftArrow];
    
    //name it textfield
    //
    NSArray *nameIttextfieldConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_nameItTextfield(nameItTextfieldHeight)]" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_nameItTextfield)];
    NSArray *nameItTextfieldCOnstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_nameItTextfield(nameItTextfieldWidth)]" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_nameItTextfield)];
    NSLayoutConstraint *nameItTextfield_CenterXWithCustomNavBar = [NSLayoutConstraint constraintWithItem:self.nameItTextfield attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.customNavBar attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    NSLayoutConstraint *nameItTextfield_CenterYWithLeftArrow = [NSLayoutConstraint constraintWithItem:self.nameItTextfield attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.leftArrowImageView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    [self.customNavBar addConstraints:nameItTextfieldCOnstraints_H];
    [self.customNavBar addConstraints:nameIttextfieldConstraints_V];
    [self.customNavBar addConstraint:nameItTextfield_CenterXWithCustomNavBar];
    [self.customNavBar addConstraint:nameItTextfield_CenterYWithLeftArrow];
    
    //underLine under the textfield
    //
    NSArray *underlineConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_underLineBelowNameIttextfield(underlineHeight)]" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_underLineBelowNameIttextfield)];
    NSArray *underlineConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_underLineBelowNameIttextfield(underlineWidth)]" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_underLineBelowNameIttextfield)];
    NSLayoutConstraint *underline_CenterX = [NSLayoutConstraint constraintWithItem:self.underLineBelowNameIttextfield attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.customNavBar attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    NSLayoutConstraint *underline_TopEqualToTextfieldBottom = [NSLayoutConstraint constraintWithItem:self.underLineBelowNameIttextfield attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.nameItTextfield attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    [self.customNavBar addConstraints:underlineConstraints_H];
    [self.customNavBar addConstraints:underlineConstraints_V];
    [self.customNavBar addConstraint: underline_CenterX];
    [self.customNavBar addConstraint:underline_TopEqualToTextfieldBottom];
    
    //Done button
    //
    NSArray *doneButtonConstraints_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_doneButton(doneButtonHeight)]" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_doneButton)];
    NSArray *doneBUttonConstraints_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_doneButton(doneButtonWidth)]-doneButtonRight-|" options:0 metrics:customNavBarMetrics views:NSDictionaryOfVariableBindings(_doneButton)];
    NSLayoutConstraint *doneButton_CenterYWithLeftArrow = [NSLayoutConstraint constraintWithItem:self.doneButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.leftArrowImageView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    [self.customNavBar addConstraints:doneBUttonConstraints_H];
    [self.customNavBar addConstraints:doneButtonConstraints_V];
    [self.customNavBar addConstraint:doneButton_CenterYWithLeftArrow];
}



@end
