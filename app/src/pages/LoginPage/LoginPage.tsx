import React from "react";
import { Activity } from "../../components/common/Activity/Activity";
import { IconButton } from "../../components/common/Button/Button";
import { Input } from "../../components/common/Input/Input";
import { useUser } from "../../stores";
import "./LoginPage.css";

export const LoginPage = function LoginPage() {
  const user = useUser();
  return (
    <Activity inProgress={user.loginInProgress}>
      <form
        className="r-page-login"
        onSubmit={event => {
          event.preventDefault();
          if (user.loginInProgress) {
            return;
          }
          user.login();
        }}
      >
        <Input
          sizing="large"
          type="password"
          placeholder="API key"
          autoFocus={true}
        />
        <IconButton
          icon="login"
          size="large"
          type="submit"
          disabled={user.loginInProgress}
        />
      </form>
    </Activity>
  );
};
