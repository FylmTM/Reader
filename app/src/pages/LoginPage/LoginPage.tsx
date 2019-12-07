import React from "react";
import { useUser } from "../../stores";
import { Activity } from "../../components/common/Activity/Activity";
import { Button } from "../../components/common/Button/Button";
import { Input } from "../../components/common/Input/Input";
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
          large={true}
          type="password"
          placeholder="API key"
          autoFocus={true}
        />
        <Button
          icon="login"
          size="large"
          type="submit"
          disabled={user.loginInProgress}
        />
      </form>
    </Activity>
  );
};
