import './style.css';
import { createStore } from 'redux';
import { Provider, useSelector, useDispatch } from 'react-redux';
// provider: state를 어떤 컴포넌트에 제공할 것인지 정한다.
// useSelector: 어떤 state값을 쓰고싶은지 선택
// useDispatch: state값을 변경할 때 사용
// connect: 재사용성을 보장할 때

/**
 * state를 어떻게 바꿀건지 결정하는 함수
 * redux는 각각의 state를 불변하게 유지하는데, 값을 변경하기 위해서는 현재의 객체가 복제되어 새로운 state를 리턴해야 한다.
 * @param {*} currentState : 현재의 상태(state 값)
 * @param {*} action : 값을 어떻게 바꿀것인가에 대한 요청
 * @returns 
 */
function reducer(currentState, action) {
  // state가 정의되어 있지 않을 경우 기본값인 1을 리턴한다.
  if (currentState === undefined) {
    return {
      number: 1,
    };
  }
  const newState = {...currentState}; // 값이 여러개 붙을 수 있기 때문에 ...을 붙임
  if (action.type === "PLUS") {
    newState.number++;
  }
  return newState;
}

const store = createStore(reducer);

function Left1(props) {
  return (
    <div>
      <h1>Left1</h1>
      <Left2></Left2>
    </div>
  );
}

function Left2(props) {
  console.log("Left2");
  return (
    <div>
      <h1>Left2</h1>
      <Left3></Left3>
    </div>
  );
}

function Left3(props) {
  console.log("Left3");
  // function f(state) {
  //   console.log(state);
  //   return state.number;
  // }
  // const number = useSelector(f);
  // 위 코드를 아래의 한줄로 표기 가능
  const number = useSelector(state => state.number);
  return (
    <div>
      <h1>Left3 : {number}</h1>
    </div>
  );
}

function Right1(props) {
  return (
    <div>
      <h1>Right1</h1>
      <Right2></Right2>
    </div>
  );
}

function Right2(props) {
  return (
    <div>
      <h1>Right2</h1>
      <Right3></Right3>
    </div>
  );
}

function Right3(props) {
  // 버튼을 클릭하면 dispatch를 가져온다.
  // dispatch는 useDispatch를 이용해서 가져올 수 있다.
  const dispatch = useDispatch();
  return (
    <div>
      <h1>Right3</h1>
      <button
        type='button'
        onClick={() => (
          // 값을 증가시키기 위해 임의로 정한 key와 value를 파라미터로 넣는다.
          dispatch({type: "PLUS"})
        )}
      >
        +
      </button>
    </div>
  );
}

function App() {
  return (
    <div id="container">
      <h1>Root</h1>
      <div id="grid">
        <Provider store={store}>
          <Left1></Left1>
          <Right1></Right1>
        </Provider>
      </div>
    </div>
  );
}

export default App;
