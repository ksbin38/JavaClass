import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import axios from 'axios';
import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import Swal from 'sweetalert2';

const Login = () => {

    // 페이지 이동 함수
    const navigate = useNavigate();

    const [loginInfo, setLoginInfo] = useState({
        "username": "",
        "password": "",
        "deviceInfo": {
            "deviceId": "2",
            "deviceType": "DEVICE_TYPE_WINDOWS",
            "notificationToken": "111"
        }
    });

    // form의 변경이 일어나면..
    const onChange = (e) => {
        if (e.target.id === 'username') {
            setLoginInfo({
                ...loginInfo,
                username: e.target.value,
            });
        } else if (e.target.id === 'password') {
            setLoginInfo({
                ...loginInfo,
                password: e.target.value,
            });
        }
    };

    const onSubmit = (e) => {
        e.preventDefault();
        console.log(loginInfo);
        axios.post(`${process.env.REACT_APP_HOST}/auth/login`, loginInfo)
        .then((res) => {
            console.log(res);
            const { accessToken, refreshToken, tokenType, expiryDuration } = res.data;
            console.log(accessToken);
            console.log(refreshToken);
            console.log(tokenType);
            console.log(expiryDuration);

            axios.get(`${process.env.REACT_APP_HOST}/user/me`,
                {
                    headers: {
                        Authorization: `${tokenType}${accessToken}`,
                    },
                },
            ).then((res) => {
                console.log(res);
                if (res) {
                    navigate("/"); // 메인 페이지로 이동
                }
            });
        })
        .catch((err) => {
            Swal.fire({
                title: "로그인 오류",
                text: "아이디 또는 비밀번호를 확인하세요.",
                icon: "error",
            });
        });

        
    };

    return (
        <Form className="container" onSubmit={onSubmit}>
          <Form.Group className="mb-3" controlId="username">
            <Form.Label>아이디</Form.Label>
            <Form.Control 
                type="text"
                placeholder="아이디를 입력하세요."
                onChange={onChange} 
            />
          </Form.Group>
    
          <Form.Group className="mb-3" controlId="password">
            <Form.Label>비밀번호</Form.Label>
            <Form.Control 
                type="password"
                placeholder="비밀번호를 입력하세요."
                onChange={onChange} 
            />
          </Form.Group>
          <Button variant="primary" type="submit">
            로그인
          </Button>
        </Form>
    );
};

export default Login;