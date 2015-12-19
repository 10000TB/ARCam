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
        _titleLabel.text = @"The World";
        _titleLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
        _titleLabel.font = [UIFont fontWithName:ARCamRegularFont size:14];
    }
    return _titleLabel;
}

-(UIButton *)backButton {
    if(!_backButton){
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.translatesAutoresizingMaskIntoConstraints = NO;
        _backButton.titleLabel.text = @"Back";
        _backButton.titleLabel.textColor = [UIColor colorWithRed:3.0/255.0 green:122.0/255.0 blue:1.0 alpha:1.0];
    }
    return _backButton;
}

-(UIImageView *)rightArrowImageView{
    if(!_rightArrowImageView){
        _rightArrowImageView = [UIImageView new];
        _rightArrowImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _rightArrowImageView.image = [UIImage imageNamed:@"rightArrow"];
    }
    return _rightArrowImageView;
}

//***************************
// set up constraints
//***************************
-(void)setUpConstraints{

    
    
    
    
}














@end
