module Web.Controller.RegistrationControllers where

import Web.Controller.Prelude
import Web.View.RegistrationControllers.Index
import Web.View.RegistrationControllers.New
import Web.View.RegistrationControllers.Edit
import Web.View.RegistrationControllers.Show

instance Controller RegistrationControllersController where
    action RegistrationControllersAction = do
        registrationControllers <- query @RegistrationController |> fetch
        render IndexView { .. }

    action NewRegistrationControllerAction = do
        let registrationController = newRecord
        render NewView { .. }

    action ShowRegistrationControllerAction { registrationControllerId } = do
        registrationController <- fetch registrationControllerId
        render ShowView { .. }

    action EditRegistrationControllerAction { registrationControllerId } = do
        registrationController <- fetch registrationControllerId
        render EditView { .. }

    action UpdateRegistrationControllerAction { registrationControllerId } = do
        registrationController <- fetch registrationControllerId
        registrationController
            |> buildRegistrationController
            |> ifValid \case
                Left registrationController -> render EditView { .. }
                Right registrationController -> do
                    registrationController <- registrationController |> updateRecord
                    setSuccessMessage "RegistrationController updated"
                    redirectTo EditRegistrationControllerAction { .. }

    action CreateRegistrationControllerAction = do
        let registrationController = newRecord @RegistrationController
        registrationController
            |> buildRegistrationController
            |> ifValid \case
                Left registrationController -> render NewView { .. } 
                Right registrationController -> do
                    registrationController <- registrationController |> createRecord
                    setSuccessMessage "RegistrationController created"
                    redirectTo RegistrationControllersAction

    action DeleteRegistrationControllerAction { registrationControllerId } = do
        registrationController <- fetch registrationControllerId
        deleteRecord registrationController
        setSuccessMessage "RegistrationController deleted"
        redirectTo RegistrationControllersAction

buildRegistrationController registrationController = registrationController
    |> fill @'[]
