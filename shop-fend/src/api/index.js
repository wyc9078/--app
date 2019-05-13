
import Vue from 'vue'
import axios from 'axios'
import utils from '../lib';
import { Toast, Loading } from 'vue-ydui/dist/lib.rem/dialog';

axios.defaults.baseURL = 'http://127.0.0.1:3080/api/json';
//axios.defaults.baseURL = 'http://103.95.207.27:3080/api/json';
axios.defaults.timeout = 3000;


// 在前端发生给后端ajax中间进行一次拦截
axios.interceptors.request.use(config => {
    Loading.open('数据正在路上...')
    return config;
}, error => {
    return Promise.reject(error);
});

// 在后端返回数据给前端之前拦截一下，主要做错误码的判断
axios.interceptors.response.use(response => {
    switch (response.data.status) {
        case 200:
            response.data.data = JSON.parse(utils.privateDecrypted(response.data.data))
            Loading.close()
            return response;
            break;
        case 404:
            response.data.data = utils.privateDecrypted(response.data.data)
            Loading.close()
            return response;
            break;
        default:
            Toast({
                mes: '网络请求失败',
                timeout: 1500,
                icon: 'error',
            })
            return response;
            break;
    }

}, error => {
    // 对响应错误做点什么
    return Promise.reject(error);
});


export default {
    /**
    * Get请求
    * @param {*object} params 请求参数
    * {
    *   url: "/index", // url地址
    *   par : { // 请求参数
    *   }
    * }
    */
    get(params) {
        axios.defaults.headers.common['token'] = params.token;
        return new Promise((resole, reject) => {
            axios.get(params.url)
                .then(success => {
                    resole(success.data)
                })
                .catch(error => {
                    Toast({
                        mes: 'GET: 您的网络不好',
                        timeout: 1500,
                        icon: 'error',
                    })
                });
        })
    },

    post(params) {
        axios.defaults.headers.common['token'] = params.token;
        return new Promise((resole, reject) => {
            axios.post(params.url)
                .then(response => {
                    resole(response.data);
                })
                .catch(error => {
                    Loading.close()
                    Toast({
                        mes: 'POST: 您的网络不好',
                        timeout: 1500,
                        icon: 'error',
                    })
                });
        })

    }
}
