import Logger from '../common/utils/Logger';
import { httpRequestGet, httpRequestPost } from '../common/utils/NetworkUtil'

class LoginViewModel {
  getData() {
    httpRequestGet('https://www.chongbuluo.com/').then((data) => {
      Logger.info('get http data success', data.data);
    }).catch((err) => {
      Logger.error('get http data failed', err.message);
    });
  }

  postData() {
    let loginfield = encodeURIComponent('username');
    let questionid = '0';
    let username = encodeURIComponent('');
    let password = encodeURI('');
    let answer = encodeURIComponent('');
    let params = `&loginfield=${loginfield}&username=${username}&questionid=${questionid}&answer=${answer}&password=${password}`;
    let url = 'https://www.chongbuluo.com/member.php?mod=logging&action=login&loginsubmit=yes' + params;

    Logger.info(url);
    httpRequestPost(url).then((data) => {
      Logger.info('post http data success', data.data);
    }).catch((err) => {
      Logger.error('post http data failed', err.message);
    });
  }
}

export default new LoginViewModel();