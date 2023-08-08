export const PREFERENCES_NAME = 'MseaPreferences';
export const MESSAGE_DURATION = 3000;

// percent
export const PERCENT_100 = '100%'

export enum LoginFieldItem {
    USERNAME = 'username',
    EMAIL = 'email'
}

export namespace LoginFieldItem {
    export function title(item: LoginFieldItem): string {
        switch (item) {
            case LoginFieldItem.USERNAME:
                return '用户名';
            case LoginFieldItem.EMAIL:
                return '邮箱';
            default:
                return '用户名';
        }
    }
}

export enum LoginQuestionItem {
    NO = '0',
    MOTHER_NAME = '1',
    GRANDPA_NAME = '2',
    FATHER_BORN_CITY = '3',
    ONE_TEACHER_NAME = '4',
    COMPUTER_MODEL = '5',
    FAVORITE_RESTAURANT_NAME = '6',
    LAST_FOUR_DIGITS_OF_DRIVER_LICENSE = '7'
}

export namespace LoginQuestionItem {
    export function title(item: LoginQuestionItem): string {
        switch (item) {
            case LoginQuestionItem.NO:
                return '未设置请忽略';
            case LoginQuestionItem.MOTHER_NAME:
                return '母亲的名字';
            case LoginQuestionItem.GRANDPA_NAME:
                return '爷爷的名字';
            case LoginQuestionItem.FATHER_BORN_CITY:
                return '父亲出生的城市';
            case LoginQuestionItem.ONE_TEACHER_NAME:
                return '您其中一位老师的名字';
            case LoginQuestionItem.COMPUTER_MODEL:
                return '您个人计算机的型号';
            case LoginQuestionItem.FAVORITE_RESTAURANT_NAME:
                return '您最喜欢的餐馆名称';
            case LoginQuestionItem.LAST_FOUR_DIGITS_OF_DRIVER_LICENSE:
                return '驾驶执照最后四位数字';
            default:
                return '未设置请忽略';
        }
    }
}

export class UserInfoKey {
    static readonly AUTH = "authKey";
    static readonly SALT = "saltKey";
    static readonly FORMHASH = "formhashKey";
    static readonly UID = "uidKey";
    static readonly NAME = "nameKey";
    static readonly LEVEL = "levelKey";
    static readonly AVATAR = "avatarKey";
    static readonly FRIEND = "friendKey";
    static readonly REPLY = "replyKey";
    static readonly TOPIC = "topicKey";
    static readonly INTEGRAL = "integralKey";
    static readonly BITS = "bitsKey";
    static readonly VIOLATION = "violationKey";
}