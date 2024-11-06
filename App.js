/**
 * 기능별로 작은 스토어를 만든다.
 * 이 작은 스토어를 슬라이스라고 부른다.
 * 작은 스토어 여러개를 만들면 이것들을 합쳐서 리덕스가 요구하는
 * 큰 스토어로 리덕스 툴킷이 알아서 만들어준다.
 */

import { Provider, useDispatch, useSelector } from "react-redux";
import store from "./store";
import { up } from "./counterSlice";

function Counter() {
  const dispatch = useDispatch();
  const count = useSelector(state => {
    console.log(state);
    return state.counter.value;
  });
  return (
    <div>
      <button
        type="button"
        onClick={() => {
          // dispatch({type: "counterSlice/up", step: 2});
          dispatch(up(2));
        }}
      >
        +
      </button>{count}
    </div>
  );
}

function App() {
  return (
    <Provider store={store}>
      <div>
        <Counter />
      </div>
    </Provider>
  );
}

export default App;
