import axios from "axios";
import {useState} from "react";
import Swal from "sweetalert2";

function App() {
  const actionLogin = () => {
    console.log(loginRequest);
  }

  const [loginRequest, setLoginRequest] = useState({
    username: "",
    password: "",
    deviceInfo: {
      deviceId: "2",
      deviceType: "DEVICE_TYPE_WINDOWS",
      notificationToken: "111",
    },
  });
  const onChange = (e) => {
    console.log(e.target.id, e.target.value);
    switch (e.target.id) {
      case "username":
        setLoginRequest({
          ...loginRequest,
          username: e.target.value,
        });
        break;
      case "password":
        setLoginRequest({
          password: e.target.value,
          ...loginRequest,
        });
        break;
      default:
        break;
    }
  };

  const onSubmit = (e) => {
    e.preventDefault();
    console.table(loginRequest);

    axios.post('http://localhost:8080/api/auth/login', loginRequest).then((res) => {
      const {data} = res;
      console.log(data);
    })
    .catch((err) => {
      // 417: 로그인 실패(아이디, 비밀번호 잘못 입력)
      console.log(err.status);
      if (err.status === 417) {
        // alert("아이디 또는 비밀번호를 확인하세요.");
        Swal.fire({
          icon: "error",
          title: "로그인 오류",
          text: "아이디 또는 비밀번호를 확인하세요.",
        });
      }
    })
  };

  return (
    <form onSubmit={onSubmit}>
      <p>
        <label htmlFor="username">아이디</label>
        <input
          type="text"
          id="username"
          value={loginRequest.username}
          onChange={onChange} 
        />
      </p>
      <p>
        <label htmlFor="password">비밀번호</label>
        <input type="password" id="password" />
      </p>
      <button type="submit">로그인</button>
    </form>
  );
}

export default App;
