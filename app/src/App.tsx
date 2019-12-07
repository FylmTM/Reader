import React, { useEffect } from "react";
import { Activity } from "./components/common/Activity/Activity";
import { Error } from "./components/Error/Error";
import { LoginPage } from "./pages/LoginPage/LoginPage";
import { Routes } from "./Routes";
import { useApp, useUser } from "./stores";

export const App = function App() {
  const { initialized, init } = useApp();
  const user = useUser();

  useEffect(() => {
    if (initialized === false) {
      init();
    }
  }, [initialized, init]);

  if (initialized === false) {
    return (
      <>
        <Error />
        <Activity inProgress={true} />
      </>
    );
  }

  if (user.current == null) {
    return (
      <>
        <Error />
        <LoginPage />
      </>
    );
  }

  return <Routes />;
};
