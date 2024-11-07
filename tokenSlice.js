import { createSlice } from "@reduxjs/toolkit";

const tokenSlice = createSlice({
    name: "tokenSlice",
    initialState: {
        info: {
            accessToken: "",
            refreshToken: "",
            tokenType: "",
            expiryDuration: 0,
        }
    },
    reducers: {
        setTokenInfo: (state, action) => {
            state.info = action.payload
        },
        removeTokenInfo: (state) => {
            state.info = {
                accessToken: "",
                refreshToken: "",
                tokenType: "",
                expiryDuration: 0,
            };
        },
    },
});

export default tokenSlice;
export const { setTokenInfo, removeTokenInfo } = tokenSlice.actions;