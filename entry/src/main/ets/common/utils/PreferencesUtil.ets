import Logger from './Logger';
import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';

const PREFERENCES_NAME = 'MseaPreferences';
const TAG = '[PreferencesUtil]';

export class PreferencesUtil {
  private preferences?: preferences.Preferences;
  private context = getContext(this) as common.UIAbilityContext;
  private static instance: PreferencesUtil;

  constructor() {
    this.initPreference(PREFERENCES_NAME);
  }

  public static getInstance(): PreferencesUtil {
    if (!PreferencesUtil.instance) {
      PreferencesUtil.instance = new PreferencesUtil();
    }
    return PreferencesUtil.instance;
  }

  initPreference(storeName: string) {
    try {
      let options: preferences.Options = { name: storeName }
      this.preferences = preferences.getPreferencesSync(this.context, options);
    } catch (e) {
      Logger.error(TAG, `Failed to get preferences, error: ${JSON.stringify(e)}`);
    }
  }

  put(key: string, value: preferences.ValueType) {
    try {
      this.preferences?.putSync(key, value);
      this.preferences?.flush();
      Logger.info(TAG, `Succeeded set value: ${value} of key: ${key}.`);
    } catch (e) {
      Logger.error(TAG, `Failed put value of '${key}'. error: ${JSON.stringify(e)}`);
    }
  }

  get(key: string): preferences.ValueType {
    try {
      let value = this.preferences?.getSync(key, '');
      if (value == undefined) {
        value = '';
      }
      Logger.info(TAG, `Succeeded get value: ${value} of key: ${key}.`);
      return value;
    } catch (e) {
      Logger.error(TAG, `Failed get value of '${key}'. error: ${JSON.stringify(e)}`);
      return '';
    }
  }

  delete(key: string) {
    try {
      this.preferences?.deleteSync(key);
      this.preferences?.flush();
    } catch (e) {
      Logger.error(TAG, `Failed delete value of '${key}'. error: ${JSON.stringify(e)}`);
    }
  }

  clear() {
    try {
      this.preferences?.clearSync();
      this.preferences?.flush();
    } catch (e) {
      Logger.error(TAG, `Failed clear preferences. error: ${JSON.stringify(e)}`);
    }
  }
}
