module Web.Routes where
import IHP.RouterPrelude
import Generated.Types
import Web.Types

-- Generator Marker
instance AutoRoute HomeControllersController
type instance ModelControllerMap WebApplication HomeController = HomeControllersController

instance AutoRoute LoginControllersController
type instance ModelControllerMap WebApplication LoginController = LoginControllersController

instance AutoRoute RegistrationControllersController
type instance ModelControllerMap WebApplication RegistrationController = RegistrationControllersController

instance AutoRoute ArticlesController
type instance ModelControllerMap WebApplication Article = ArticlesController

