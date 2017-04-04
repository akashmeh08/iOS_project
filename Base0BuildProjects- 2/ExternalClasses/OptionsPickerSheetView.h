
//

#import <UIKit/UIKit.h>


typedef void(^OptionPickerSheetBlock)(NSString  *selectedText,NSInteger selectedIndex);
typedef void(^OptionPickerSheetBlockForCountryPicker)(NSMutableDictionary  *selectedDict,NSInteger selectedIndex);

@interface OptionsPickerSheetView : UIView<UIPickerViewDataSource, UIPickerViewDelegate>

+ (id)sharedPicker;

-(void)showPickerSheetWithOptions:(NSArray *)options AndComplitionblock:(OptionPickerSheetBlock )block;
//+(void)removePickerView;
-(void)showPickerSheetWithCountryFlags:(OptionPickerSheetBlockForCountryPicker)block;
@end
