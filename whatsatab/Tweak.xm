@interface WATabBarController : UITabBarController
@property (nonatomic, copy, readwrite) NSArray *items;
-(void)setTabBar:(id)arg1;
-(void)setCameraButtonEnabled:(BOOL)arg1;
-(NSMutableArray *)prefsFix:(NSMutableArray *)arr;
@end

@interface WATabBarCameraButton : UIViewController
@property (nonatomic, assign, readonly) CGRect frame;
@property (nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
-(void)setFrame:(CGRect)arg1;
@end

@interface UITabBarButton : UIView
@property (nonatomic, assign, readonly) CGRect frame;
@end

@interface UITabBarButtonLabel : UILabel
@property (nonatomic, copy, readwrite) NSString *text;
@end
/*
@interface UITabBarItem : UIBarItem
-(NSString *)title;
@end
*/
static BOOL StatusTab = TRUE;
static BOOL CallsTab = TRUE;
static BOOL CameraTab = TRUE;
static BOOL ChatsTab = TRUE;
static BOOL SettingsTab = TRUE;
CGRect cameraFrame;

NSMutableArray<UIViewController *> *vc = [[NSMutableArray alloc] init];

static void reloadSettings() {

    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/private/var/mobile/Library/Preferences/com.agent22922.whatsatab.plist"];
    if(prefs){
      StatusTab = [[prefs objectForKey:@"StatusTab"] boolValue];
	  CallsTab = [[prefs objectForKey:@"CallsTab"] boolValue];
	  CameraTab = [[prefs objectForKey:@"CameraTab"] boolValue];
	  ChatsTab = [[prefs objectForKey:@"ChatsTab"] boolValue];
	  SettingsTab = [[prefs objectForKey:@"SettingsTab"] boolValue];
    }
  }

%hook WATabBarController
	-(void)viewDidLayoutSubviews{
		reloadSettings();
		if([vc count] == 0){
			for(int i = 0;i<5;i++){
				[vc addObject:[self.childViewControllers objectAtIndex:i]];
				[vc objectAtIndex:i].tabBarItem = [self.tabBar.items objectAtIndex:i];
			}
			[self setViewControllers:[self prefsFix:vc] animated:TRUE];
		}
		%orig;
	}
	%new
	-(NSMutableArray *)prefsFix:(NSMutableArray *)arr {
	reloadSettings();
		NSMutableIndexSet *indexes = [[NSMutableIndexSet alloc] init];
		if(!StatusTab)[indexes addIndex:0];
		if(!CallsTab)[indexes addIndex:1];
		if(!CameraTab)[indexes addIndex:2];
		if(!ChatsTab)[indexes addIndex:3];
		if(!ChatsTab&&CameraTab)[indexes addIndex:2]; //camera tab doesnt work without the chats tab for some reasom
		if(!SettingsTab)[indexes addIndex:4];
		if([indexes count]>4)[indexes removeIndex:4];
		[arr removeObjectsAtIndexes:indexes];
		return arr;
	}
%end

%hook UITabBarButton
	-(void)layoutSubviews{
	reloadSettings();
		UITabBarButtonLabel *label = MSHookIvar<UITabBarButtonLabel *>(self,"_label");
		NSString *labelText = [[NSString alloc] initWithString:label.text];
		if([labelText containsString:@"Camera"]){
			cameraFrame = self.frame;
		}
		%orig;
	}
%end

%hook WATabBarCameraButton
	-(void)layoutSubviews{
	reloadSettings();
		self.hidden = TRUE;
		if(CameraTab&&ChatsTab){
			%orig;
			self.hidden = FALSE;
			[self setFrame:cameraFrame];
		}
	}
	-(void)setFrame:(CGRect)arg1{
		%orig(cameraFrame);
	}
	-(CGRect)frame{
		return cameraFrame;
	}
%end