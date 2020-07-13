module Web.Controller.HomeControllers where

import Web.Controller.Prelude
import Web.View.HomeControllers.Index
import Web.View.HomeControllers.New
import Web.View.HomeControllers.Edit
import Web.View.HomeControllers.Show

instance Controller HomeControllersController where
    action HomeControllersAction = do
        homeControllers <- query @HomeController |> fetch
        render IndexView { .. }

    action NewHomeControllerAction = do
        let homeController = newRecord
        render NewView { .. }

    action ShowHomeControllerAction { homeControllerId } = do
        homeController <- fetch homeControllerId
        render ShowView { .. }

    action EditHomeControllerAction { homeControllerId } = do
        homeController <- fetch homeControllerId
        render EditView { .. }

    action UpdateHomeControllerAction { homeControllerId } = do
        homeController <- fetch homeControllerId
        homeController
            |> buildHomeController
            |> ifValid \case
                Left homeController -> render EditView { .. }
                Right homeController -> do
                    homeController <- homeController |> updateRecord
                    setSuccessMessage "HomeController updated"
                    redirectTo EditHomeControllerAction { .. }

    action CreateHomeControllerAction = do
        let homeController = newRecord @HomeController
        homeController
            |> buildHomeController
            |> ifValid \case
                Left homeController -> render NewView { .. } 
                Right homeController -> do
                    homeController <- homeController |> createRecord
                    setSuccessMessage "HomeController created"
                    redirectTo HomeControllersAction

    action DeleteHomeControllerAction { homeControllerId } = do
        homeController <- fetch homeControllerId
        deleteRecord homeController
        setSuccessMessage "HomeController deleted"
        redirectTo HomeControllersAction

buildHomeController homeController = homeController
    |> fill @'[]
