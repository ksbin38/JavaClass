import axios from "axios";


const instance = axios.create({
    baseURL: process.env.REACT_APP_HOST,
    timeout: 10000 // ms단위
});

export default instance;

// request를 날리기 전에 axios가 할 내용
instance.interceptors.request.use((config) => {
    config.headers = {
        Authorization: "",
        'Content-Type': 'application/json'
    }
    return config;
}, error => {
    console.log("intercept에서 오류 발생", error);
    return Promise.reject(error); // 비동기 통신으로 데이터를 날릴 때 정상/비정상적으로 됐는지 여부
});

// response 받고난 후 axios가 할 내용
instance.interceptors.response.use(
    (response) => response,
    async error => {
        // 오류가 발생하면 뭔가를 해라
        return Promise.reject(error);
    }
);