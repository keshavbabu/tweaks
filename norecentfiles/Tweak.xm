#import <UIKit/UITabBar.h>
%hook UITabBarController

-(void)viewDidLayoutSubviews{
	%orig;
	self.tabBar.hidden = TRUE;
	[self setSelectedIndex:1];
}

-(void)_tabBarItemClicked:(id)arg1{
	[self setSelectedIndex:1];
}

%end