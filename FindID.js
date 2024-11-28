import axios from "axios";
import { useState } from "react";
import Swal from "sweetalert2";
import { useNavigate } from "react-router-dom";
import { useDispatch } from "react-redux";
import { setTokenInfo } from "../hooks/tokenSlice";
import { setUserInfo } from "../hooks/userSlice";

const FindID = () => {
    const navigate = useNavigate();

    // 이메일을 형식에 맞게 입력했는지 확인
    function rightMail(str) {
        return /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/.test(str);
    }

    const [email, setEmail] = useState("");

      function onChangeEmail(e) {
    
        // 입력받은 이메일 저장
        setEmail(e.target.value);
    
        if(e.target.value.length > 0){
          instance.get("/checkEmail/" + e.target.value)
            .then((data) => {
              let isExist = data.isExist;
              emailCheck = true;
              emailDup = isExist;
              // 이메일 형식에 맞게 적었으나 이미 존재할 경우
              if (rightMail(e.target.value) === true) {
                setErrorEmail({
                  ...errorEmail,
                  email: true,
                  rightEmail: true,
                  usingEmail: true
                });
                // 인증코드 전송버튼 비활성화
                setSendMail(true);
              } else if (rightMail(e.target.value) === false) {
                // 이메일 형식에 맞지 않게 적은 경우
                setErrorEmail({
                  ...errorEmail,
                  email: true,
                  rightEmail: false,
                  usingEmail: false
                });
                // 인증코드 전송버튼 비활성화
                setSendMail(true);
              } else {
                // 이메일 형식에 맞게 적고 이메일이 존재하지 않을 경우(사용 가능)
                setErrorEmail({
                  ...errorEmail,
                  email: true,
                  rightEmail: true,
                  usingEmail: false
                });
                emailCheck = true;
                // 인증코드 전송버튼 활성화
                setSendMail(false);
              }
            });
        }
      };

    // const rightEmail = document.querySelector('.rightEmail');

    //   document.querySelector('#findID').addEventListener('click', function(e) {
    //     rightEmail.classList.add('hide');

    //     e.preventDefault();
    //     const email = document.querySelector('#email').value?.trim();
    //     fetch('/member/findID/' + email)
    //     .then((res) => res.json())
    //     .then((data) => {
    //       console.log(data);
    //       const {result, message} = data;
    //       // 입력받은 이메일로 체크한 뒤 결과에 따라 아이디를 알려주거나 입력오류 메시지 표시
    //       if (result == false) {
    //         alert(message);
    //         rightEmail.classList.remove('hide');
    //       } else {
    //         alert(message);
    //       }
    //     });
    //   });

    return (
        <>
            <form className="findIdForm">
                <h2>아이디 찾기</h2>
                <label for="email"> 이메일 </label>
                <input
                    type="text"
                    name="email"
                    id="email"
                    placeholder="등록한 이메일을 입력하세요."
                    autocomplete="off"
                    onChange={onChangeEmail}
                    required
                />
                <div className="rightEmail hide">* 이메일을 다시 확인해주세요.</div>
                <button id="findID" type="submit">아이디 찾기</button>
                <a href="/login" id="login">로그인</a>
                <div className="lostFound">
                    <a href="/findPW">비밀번호 찾기</a>
                </div>
            </form>
        </>
    );
};

export default FindID;