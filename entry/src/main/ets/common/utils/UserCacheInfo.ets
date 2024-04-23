import dataPreferences from '@ohos.data.preferences';
import { PreferencesUtil } from './PreferencesUtil';
import { UserInfoKey } from '../../model/LoginModel'

class UserInfo {
  setAuth(value: dataPreferences.ValueType) {
    PreferencesUtil.getInstance().put(UserInfoKey.AUTH, value)
  }

  getAuth(): Promise<dataPreferences.ValueType | undefined> {
    return PreferencesUtil.getInstance().get(UserInfoKey.AUTH)
  }
}

export default new UserInfo();

