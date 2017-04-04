//
//  Macro.h
//  ProjectTemplate
//

#ifndef Macro_h
#define Macro_h

#define KTextField(tag)             (UITextField*)[self.view viewWithTag:tag]
#define KButton(tag)                (UIButton *)[self.view viewWithTag:tag]
#define windowWidth                 [UIScreen mainScreen].bounds.size.width
#define windowHeight                [UIScreen mainScreen].bounds.size.height

#define KNSLOCALIZEDSTRING(key)     NSLocalizedString(key, nil)

#define APPDELEGATE                 (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define mainStoryboard              [UIStoryboard storyboardWithName:@"Main" bundle:nil]
#define storyboardForName(X)        [UIStoryboard storyboardWithName:X bundle:nil]

#define NSUSERDEFAULT               [NSUserDefaults standardUserDefaults]

#define AppColor                    [UIColor colorWithRed:229.0/255.0f green:88.0/255.0f blue:40.0/255.0f alpha:1.0f]
#define AppLightColor                    [UIColor colorWithRed:124.0/255.0f green:173.0/255.0f blue:200.0/255.0f alpha:1.0f]

#define AppFont(X)                  [UIFont systemFontOfSize:X]

#define DEGREES_TO_RADIANS(degrees) (M_PI * (degrees) / 180.0)
#define LABEL_FONT @"Helvetica"
#define LABEL_SIZE 12

#define _DeviceType       @"iOS"

//log label

#define LOG_LEVEL           1

#define LogInfo(frmt, ...)                 if(LOG_LEVEL) NSLog((@"%s" frmt), __PRETTY_FUNCTION__, ## __VA_ARGS__)

#define RGBCOLOR(r,g,b,a)               [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define TRIM_SPACE(str)                 [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]

/****************** Validation Alerts ****************************/

#define             BLANK_FirstNAME                             "Please enter first name."
#define             Mini_FirstNAME                              "Please enter atleast two character of first name."
#define             BLANK_LastNAME                              "Please enter last name."
#define             Mini_LastNAME                               "Please enter atleast two character of last name."
#define             BLANK_EMAIL                                 "Please enter email address."
#define             BLANK_USERNAME                              "Please enter username."
#define             BLANK_PASSWORD                              "Please enter password."
#define             BLANK_REVIEW                                "Please enter review."
#define             VALID_FirstNAME                             "Please enter valid first name."
#define             VALID_LastNAME                              "Please enter valid last name."
#define             VALID_EMAIL                                 "Please enter valid email address."
#define             VALID_USERNAME                              "Please enter valid username."
#define             VALID_PHONE                                 "Please enter valid phone number."
#define             BLANK_PHONE                                 "Please enter phone number."
#define             BLANK_ADDRESS                               "Please enter address."
#define             BLANK_OLD_PASSWORD                          "Please enter old password."
#define             BLANK_NEW_PASSWORD                          "Please enter new password."
#define             BLANK_CONFIRM_PASSWORD                      "Please enter confirm password."
#define             VALID_PASSWORD                              "Password must be at least 6 characters."
#define             VALID_OLD_PASSWORD                          "Old password must be of atleast 6 characters."
#define             VALID_NEW_PASSWORD                          "New password must be of atleast 6 characters."
#define             PASSWORD_CONFIRM_PASSWORD_NOT_MATCH         "Password and confirm password must be same."
#define             BLANK_DOB                                   "Please select date of birth."
#define             BLANK_STORENAME                             "Please enter any store/brand name."
#define             VALID_URL                                   "Please enter valid website url."
#define             VALID_FacebookURL                           "Please enter valid facebook url."
#define             VALID_TwitterURL                            "Please enter valid twitter url."
#define             VALID_InstagramURL                          "Please enter valid instagram url."
#define             STREET_ADDRESS                              "Please enter street address."
#define             BLANK_CITY                                  "Please enter city name."
#define             BLANK_STATE                                 "Please enter state name."
#define             BLANK_COUNTRY                               "Please enter country name."
#define             BLANK_ZIP                                   "Please enter ZIP code."
#define             Valid_ZIP                                   "Zip code must be at least 5 characters."
#define             BLANK_EXPIRY                                "Please enter expiry date."
#define             BLANK_CARDNO                                "Please enter card number."
#define             BLANK_CVV                                   "Please enter CVV."
#define             Blank                                       ""
#import                                                         "Header.h"
#define             SUCESS_REGISTRATION                         "Successfully Registered."

// Sandbox
#define  _SERVICE_BASE_URL                           @"http://172.16.0.8/RND/SSridevi/Drupal7.38/Drupal/mob/"
#define   _RESPONSE_CODE             "responseCode"
#define   _RESPONSE_MESSAGE     "responseMessage"
#define  _USER_ID_LOCAL               "userid"
#define   _RESPONSE_SUCCESS_CODE       200
// live
//#define  _SERVICE_BASE_URL                        @"BASE URL"



#endif /* Macro_h */
