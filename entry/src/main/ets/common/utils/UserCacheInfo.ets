import dataPreferences from '@ohos.data.preferences';
import PreferencesUtil from './PreferencesUtil';
import { UserInfoKey } from '../constants/CommonConstants'

class UserInfo {
  setAuth(value: dataPreferences.ValueType) {
    PreferencesUtil.put(UserInfoKey.AUTH, value)
  }

  getAuth() {
    return PreferencesUtil.get(UserInfoKey.AUTH)
  }
}

export default new UserInfo();

