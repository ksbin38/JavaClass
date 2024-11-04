import styled from "styled-components";

export const SimpleButton = styled.button`
  background-color: green;
  color: #fff;

  &:hover {
    background-color: blue;
  }
`;

export const LargeButton = styled(SimpleButton)`
  font-size: 50px;
`;
