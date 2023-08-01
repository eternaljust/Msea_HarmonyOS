import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';
import Logger from  '../common/utils/Logger'

export default class EntryAbility extends UIAbility {
    onCreate(want, launchParam) {
        Logger.info('Ability onCreate');
    }

    onDestroy() {
        Logger.info('Ability onDestroy');
    }

    onWindowStageCreate(windowStage: window.WindowStage) {
        // Main window is created, set main page for this ability
        Logger.info('Ability onWindowStageCreate');

        windowStage.loadContent('pages/Index', (err, data) => {
            if (err.code) {
                Logger.error('Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
                return;
            }
            Logger.info('Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
        });
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        Logger.info('Ability onWindowStageDestroy');
    }

    onForeground() {
        // Ability has brought to foreground
        Logger.info('Ability onForeground');
    }

    onBackground() {
        // Ability has back to background
        Logger.info('Ability onBackground');
    }
}
