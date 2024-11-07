import { Routes, Route } from "react-router-dom";
import Landing from "./pages/Landing";
import Login from "./pages/user/Login";
import AppLayout from "./layout/AppLayout";

function App() {
  return (
    <AppLayout>
      <Routes>
        <Route path="/" element={<Landing />} />
        <Route path="/user/login" element={<Login />} />
      </Routes>
    </AppLayout>
  );
}

export default App;
