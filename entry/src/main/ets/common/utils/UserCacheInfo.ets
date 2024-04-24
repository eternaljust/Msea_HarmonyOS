import dataPreferences from '@ohos.data.preferences';
import { PreferencesUtil } from './PreferencesUtil';
import { UserInfoKey } from '../../model/LoginModel'

export class UserInfo {
  private preferencesUtil: PreferencesUtil = PreferencesUtil.getInstance();
  private static instance: UserInfo;

  static getInstance(): UserInfo {
    if (!UserInfo.instance) {
      UserInfo.instance = new UserInfo();
    }
    return UserInfo.instance;
  }

  setAuth(value: dataPreferences.ValueType) {
    this.preferencesUtil.put(UserInfoKey.AUTH, value)
  }

  getAuth(): dataPreferences.ValueType {
    return this.preferencesUtil.get(UserInfoKey.AUTH)
  }

  reset() {
    this.preferencesUtil.clear();
  }
}

