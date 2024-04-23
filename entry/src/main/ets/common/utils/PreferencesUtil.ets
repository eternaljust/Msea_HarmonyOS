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

  async initPreference(storeName: string) {
    try {
      this.preferences = await preferences.getPreferences(this.context, storeName)
    } catch (e) {
      Logger.error(TAG, `Failed to get preferences, error: ${JSON.stringify(e)}`);
    }
  }

  async deletePreferences() {
    try {
      await preferences.deletePreferences(this.context, PREFERENCES_NAME);
    } catch(e) {
      Logger.error(TAG, `Failed to delete preferences, error: ${JSON.stringify(e)}`);
    };
  }

  async put(key: string, value: preferences.ValueType) {
    try {
      await this.preferences?.put(key, value);
      await this.preferences?.flush();
    } catch (e) {
      Logger.error(TAG, `Failed put value of '${key}'. error: ${JSON.stringify(e)}`);
    }
  }

  async get(key: string) {
    try {
      let value = await this.preferences?.get(key, '');
      Logger.info(TAG, `Succeeded get value: ${value} of key: ${key}.`);
      return value
    } catch (e) {
      Logger.error(TAG, `Failed get value of '${key}'. error: ${JSON.stringify(e)}`);
      return ''
    }
  }

  async delete(key: string) {
    try {
      await this.preferences?.delete(key);
      await this.preferences?.flush();
    } catch (e) {
      Logger.error(TAG, `Failed delete value of '${key}'. error: ${JSON.stringify(e)}`);
    }
  }
}
