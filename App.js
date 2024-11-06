/**
 * redux: createStore, dispatch, subscribe, getState
 * react redux: useDispatch, useSelector, connect
 * 
 * redux toolkit: configureStore, createSlice, createAsyncThunk
 * 
 * @returns 
 */

import { createStore } from "redux";
import { Provider, useDispatch, useSelector } from "react-redux";
// provider: state를 어떤 컴포넌트에 제공할 것인지 정한다.
// useSelector: 어떤 state값을 쓰고싶은지 선택
// useDispatch: state값을 변경할 때 사용

function reducer(state, action) {
  if (action.type === "up") {
    return {
      ...state,
      value: state.value + action.step,
    };
  }
  return state;
}
const initialState = {value: 0};
const store = createStore(reducer, initialState);

function Counter() {
  const dispatch = useDispatch();
  const count = useSelector(state => state.value);
  return (
    <div>
      <button
        type="button"
        onClick={() => {
          dispatch({type: "up", step: 2})
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
        <Counter></Counter>
      </div>
    </Provider>
  );
}

export default App;
