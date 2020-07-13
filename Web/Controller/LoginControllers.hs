module Web.Controller.LoginControllers where

import Web.Controller.Prelude
import Web.View.LoginControllers.Index
import Web.View.LoginControllers.New
import Web.View.LoginControllers.Edit
import Web.View.LoginControllers.Show

instance Controller LoginControllersController where
    action LoginControllersAction = do
        loginControllers <- query @LoginController |> fetch
        render IndexView { .. }

    action NewLoginControllerAction = do
        let loginController = newRecord
        render NewView { .. }

    action ShowLoginControllerAction { loginControllerId } = do
        loginController <- fetch loginControllerId
        render ShowView { .. }

    action EditLoginControllerAction { loginControllerId } = do
        loginController <- fetch loginControllerId
        render EditView { .. }

    action UpdateLoginControllerAction { loginControllerId } = do
        loginController <- fetch loginControllerId
        loginController
            |> buildLoginController
            |> ifValid \case
                Left loginController -> render EditView { .. }
                Right loginController -> do
                    loginController <- loginController |> updateRecord
                    setSuccessMessage "LoginController updated"
                    redirectTo EditLoginControllerAction { .. }

    action CreateLoginControllerAction = do
        let loginController = newRecord @LoginController
        loginController
            |> buildLoginController
            |> ifValid \case
                Left loginController -> render NewView { .. } 
                Right loginController -> do
                    loginController <- loginController |> createRecord
                    setSuccessMessage "LoginController created"
                    redirectTo LoginControllersAction

    action DeleteLoginControllerAction { loginControllerId } = do
        loginController <- fetch loginControllerId
        deleteRecord loginController
        setSuccessMessage "LoginController deleted"
        redirectTo LoginControllersAction

buildLoginController loginController = loginController
    |> fill @'[]
