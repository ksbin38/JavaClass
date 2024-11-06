import { configureStore } from "@reduxjs/toolkit";
import counterSlice from "./counterSlice";

// 슬라이스를 모아서 스토어로 만든다.
const store = configureStore({
    reducer: {
      counter: counterSlice.reducer,
    },
  });

  export default store;