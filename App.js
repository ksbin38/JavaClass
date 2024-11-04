import styled from "styled-components";
import { SimpleButton, LargeButton } from "./components/StyleCss";
import React from "react";

const ReactButton = (props) => {
  return <button className={props.className}>{props.children}</button>
};

const ReactLargeButton = styled(ReactButton)`
  font-size: 50px;
`;

const PrimaryButton = styled.button`
  color: ${(props) => (props.primary === "true" ? "white" : "black")};
  background-color: ${(props) => (props.primary === "true" ? "blue" : "gray")};
`;

function App() {
  return (
    <>
      <SimpleButton type="button">버튼</SimpleButton>
      <LargeButton type="button">버튼</LargeButton>
      <ReactButton>React</ReactButton>
      <ReactLargeButton>React Large</ReactLargeButton>
      <PrimaryButton>Primary</PrimaryButton>
      <PrimaryButton primary="true">Primary</PrimaryButton>
    </>
  )
}

export default App;
