#line 1 "Tweak.xm"
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


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class WATabBarController; @class WATabBarCameraButton; @class UITabBarButton; 
static void (*_logos_orig$_ungrouped$WATabBarController$viewDidLayoutSubviews)(_LOGOS_SELF_TYPE_NORMAL WATabBarController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WATabBarController$viewDidLayoutSubviews(_LOGOS_SELF_TYPE_NORMAL WATabBarController* _LOGOS_SELF_CONST, SEL); static NSMutableArray * _logos_method$_ungrouped$WATabBarController$prefsFix$(_LOGOS_SELF_TYPE_NORMAL WATabBarController* _LOGOS_SELF_CONST, SEL, NSMutableArray *); static void (*_logos_orig$_ungrouped$UITabBarButton$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL UITabBarButton* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$UITabBarButton$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL UITabBarButton* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WATabBarCameraButton$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL WATabBarCameraButton* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$WATabBarCameraButton$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL WATabBarCameraButton* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$WATabBarCameraButton$setFrame$)(_LOGOS_SELF_TYPE_NORMAL WATabBarCameraButton* _LOGOS_SELF_CONST, SEL, CGRect); static void _logos_method$_ungrouped$WATabBarCameraButton$setFrame$(_LOGOS_SELF_TYPE_NORMAL WATabBarCameraButton* _LOGOS_SELF_CONST, SEL, CGRect); static CGRect (*_logos_orig$_ungrouped$WATabBarCameraButton$frame)(_LOGOS_SELF_TYPE_NORMAL WATabBarCameraButton* _LOGOS_SELF_CONST, SEL); static CGRect _logos_method$_ungrouped$WATabBarCameraButton$frame(_LOGOS_SELF_TYPE_NORMAL WATabBarCameraButton* _LOGOS_SELF_CONST, SEL); 

#line 47 "Tweak.xm"

	static void _logos_method$_ungrouped$WATabBarController$viewDidLayoutSubviews(_LOGOS_SELF_TYPE_NORMAL WATabBarController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
		reloadSettings();
		if([vc count] == 0){
			for(int i = 0;i<5;i++){
				[vc addObject:[self.childViewControllers objectAtIndex:i]];
				[vc objectAtIndex:i].tabBarItem = [self.tabBar.items objectAtIndex:i];
			}
			[self setViewControllers:[self prefsFix:vc] animated:TRUE];
		}
		_logos_orig$_ungrouped$WATabBarController$viewDidLayoutSubviews(self, _cmd);
	}
	
	static NSMutableArray * _logos_method$_ungrouped$WATabBarController$prefsFix$(_LOGOS_SELF_TYPE_NORMAL WATabBarController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSMutableArray * arr) {
	reloadSettings();
		NSMutableIndexSet *indexes = [[NSMutableIndexSet alloc] init];
		if(!StatusTab)[indexes addIndex:0];
		if(!CallsTab)[indexes addIndex:1];
		if(!CameraTab)[indexes addIndex:2];
		if(!ChatsTab)[indexes addIndex:3];
		if(!ChatsTab&&CameraTab)[indexes addIndex:2]; 
		if(!SettingsTab)[indexes addIndex:4];
		if([indexes count]>4)[indexes removeIndex:4];
		[arr removeObjectsAtIndexes:indexes];
		return arr;
	}



	static void _logos_method$_ungrouped$UITabBarButton$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL UITabBarButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	reloadSettings();
		UITabBarButtonLabel *label = MSHookIvar<UITabBarButtonLabel *>(self,"_label");
		NSString *labelText = [[NSString alloc] initWithString:label.text];
		if([labelText containsString:@"Camera"]){
			cameraFrame = self.frame;
		}
		_logos_orig$_ungrouped$UITabBarButton$layoutSubviews(self, _cmd);
	}



	static void _logos_method$_ungrouped$WATabBarCameraButton$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL WATabBarCameraButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	reloadSettings();
		self.hidden = TRUE;
		if(CameraTab&&ChatsTab){
			_logos_orig$_ungrouped$WATabBarCameraButton$layoutSubviews(self, _cmd);
			self.hidden = FALSE;
			[self setFrame:cameraFrame];
		}
	}
	static void _logos_method$_ungrouped$WATabBarCameraButton$setFrame$(_LOGOS_SELF_TYPE_NORMAL WATabBarCameraButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect arg1){
		_logos_orig$_ungrouped$WATabBarCameraButton$setFrame$(self, _cmd, cameraFrame);
	}
	static CGRect _logos_method$_ungrouped$WATabBarCameraButton$frame(_LOGOS_SELF_TYPE_NORMAL WATabBarCameraButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
		return cameraFrame;
	}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$WATabBarController = objc_getClass("WATabBarController"); MSHookMessageEx(_logos_class$_ungrouped$WATabBarController, @selector(viewDidLayoutSubviews), (IMP)&_logos_method$_ungrouped$WATabBarController$viewDidLayoutSubviews, (IMP*)&_logos_orig$_ungrouped$WATabBarController$viewDidLayoutSubviews);{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSMutableArray *), strlen(@encode(NSMutableArray *))); i += strlen(@encode(NSMutableArray *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSMutableArray *), strlen(@encode(NSMutableArray *))); i += strlen(@encode(NSMutableArray *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$WATabBarController, @selector(prefsFix:), (IMP)&_logos_method$_ungrouped$WATabBarController$prefsFix$, _typeEncoding); }Class _logos_class$_ungrouped$UITabBarButton = objc_getClass("UITabBarButton"); MSHookMessageEx(_logos_class$_ungrouped$UITabBarButton, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$UITabBarButton$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$UITabBarButton$layoutSubviews);Class _logos_class$_ungrouped$WATabBarCameraButton = objc_getClass("WATabBarCameraButton"); MSHookMessageEx(_logos_class$_ungrouped$WATabBarCameraButton, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$WATabBarCameraButton$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$WATabBarCameraButton$layoutSubviews);MSHookMessageEx(_logos_class$_ungrouped$WATabBarCameraButton, @selector(setFrame:), (IMP)&_logos_method$_ungrouped$WATabBarCameraButton$setFrame$, (IMP*)&_logos_orig$_ungrouped$WATabBarCameraButton$setFrame$);MSHookMessageEx(_logos_class$_ungrouped$WATabBarCameraButton, @selector(frame), (IMP)&_logos_method$_ungrouped$WATabBarCameraButton$frame, (IMP*)&_logos_orig$_ungrouped$WATabBarCameraButton$frame);} }
#line 104 "Tweak.xm"
