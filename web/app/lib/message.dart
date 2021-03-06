part of gf2lib;

class Messages {
  static get(id) {
    var lang = getDisplayLang();
    return _MESSAGES[id][lang];
  }
  
  static final Map SUPPORTED_LANGUAGES = {"en": true, "ch": true};
  
  static final _MESSAGES = {
    "TITLE": {"en": "(GF)^2", "ch": "功夫2"},
    "HELLO": {"en": "Hello to (GF)^2", "ch": "欢迎"},
    "HOME": {"en": "Home", "ch": "首页"},
    "ABOUT": {"en": "About", "ch": "关于"},
    "CONTACT": {"en": "Contact", "ch": "联系方式"},
    "SELECT_LANGUAGE": {"en": "Language", "ch": "语言"},
    "LOGIN": {"en": "Login", "ch": "登陆"},
    "LOGOUT": {"en": "Logout", "ch": "登出"},
    "SIGNUP": {"en": "Sign up", "ch": "注册"},
    "SIGNUP_NOW": {"en": "Sign up for free", "ch": "免费注册"},
    "EMAIL": {"en": "Email Address", "ch": "电子邮箱"},
    "LANGUAGE_CHINESE": {"en": "Chinese", "ch": "中文"},
    
    "HOME_PAGE_TITLE": {"en": "Free TOEFL Practice Online", "ch": "托福在线全真模考"},
    "TEST_MODE": {"en": "Online Test", "ch": "全真模考"},
    "PRACTICE_MODE": {"en": "Free Practice", "ch": "在线练习"},
    
    // Signup page
    "CREATE_ACCOUNT": {"en": "Create a new account", "ch": "注册新账号"},
    "NICKNAME": {"en": "Nickname (Optional)", "ch": "昵称（可选）"},
    "PASSWORD": {"en": "Password (at least 6 characters)", "ch": "密码（至少6位）"},
    "PASSWORD_REPEAT": {"en": "Repeat password", "ch": "确认密码"},
    "PASSWORD_TOO_SHORT": {"en": "Password (at least 6 characters)", "ch": "密码（至少6位）"},
    "PASSWORD_MOT_MATCH": {"en": "Passwords don't match", "ch": "密码不一致"},
    "EMAIL_INVALID": {"en": "Invalid email address", "ch": "邮箱地址有误"},
    "EMAIL_TAKEN": {"en": "The Email address has been taken", "ch": "该邮箱已被使用"},
    "LOGIN_HINT": {"en": "Have an account? Login now >>", "ch": "已有账号？立即登录》"},
    
    // Login
    "LOGIN_FAILURE_MSG": {"en": "The username or password you entered is incorrect", "ch": "用户名或密码错误"},
    "SIGNUP_HINT": {"en": "Have no account? Sign up for free >>", "ch": "没有账号？免费注册》"},
    "FIND_PASSWORD": {"en": "Password", "ch": "找回密码"}
  };
  
  static getDisplayLang() {
    if (displayLanguage == '') {
      if (window.localStorage.containsKey(LOCAL_STORAGE_DISPLAY_LANGUAGE) &&
          window.localStorage[LOCAL_STORAGE_DISPLAY_LANGUAGE] != '') {
        displayLanguage = window.localStorage[LOCAL_STORAGE_DISPLAY_LANGUAGE];
      } else {
        // Default to local setting;
        String lang = window.navigator.language; 
        // Slice "en-US"
        lang = lang.substring(0, 2);
        displayLanguage = lang;
      }
      if (!SUPPORTED_LANGUAGES.containsKey(displayLanguage)) {
        displayLanguage = 'en';
      }
    }
    return displayLanguage;
  }
  
  static setLanguage(lang) {
    displayLanguage = lang;
    window.localStorage[LOCAL_STORAGE_DISPLAY_LANGUAGE] = displayLanguage;
    watchers.dispatch();
  }
  
  static String displayLanguage = '';
  
  static String LOCAL_STORAGE_DISPLAY_LANGUAGE = "DISPLAY_LANGUAGE";
}
