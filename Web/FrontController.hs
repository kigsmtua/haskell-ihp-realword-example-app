module Web.FrontController where
import IHP.RouterPrelude
import IHP.ControllerSupport
import Generated.Types
import Web.Types

-- Controller Imports
import Web.Controller.Articles
import Web.Controller.RegistrationControllers
import Web.Controller.LoginControllers
import Web.Controller.HomeControllers
import IHP.Welcome.Controller

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
        , parseRoute @ArticlesController
        , parseRoute @RegistrationControllersController
        , parseRoute @LoginControllersController
        , parseRoute @HomeControllersController
        ]

instance InitControllerContext WebApplication
