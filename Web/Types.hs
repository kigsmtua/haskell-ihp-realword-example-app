module Web.Types where
import IHP.Prelude
import qualified IHP.Controller.Session
import qualified IHP.ControllerSupport as ControllerSupport
import IHP.ModelSupport
import Application.Helper.Controller
import IHP.ViewSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)

data ViewContext = ViewContext
    { requestContext :: ControllerSupport.RequestContext
    , flashMessages :: [IHP.Controller.Session.FlashMessage]
    , controllerContext :: ControllerSupport.ControllerContext
    , layout :: Layout
    }

data HomeControllersController
    = HomeControllersAction
    | NewHomeControllerAction
    | ShowHomeControllerAction { homeControllerId :: !(Id HomeController) }
    | CreateHomeControllerAction
    | EditHomeControllerAction { homeControllerId :: !(Id HomeController) }
    | UpdateHomeControllerAction { homeControllerId :: !(Id HomeController) }
    | DeleteHomeControllerAction { homeControllerId :: !(Id HomeController) }
    deriving (Eq, Show, Data)

data LoginControllersController
    = LoginControllersAction
    | NewLoginControllerAction
    | ShowLoginControllerAction { loginControllerId :: !(Id LoginController) }
    | CreateLoginControllerAction
    | EditLoginControllerAction { loginControllerId :: !(Id LoginController) }
    | UpdateLoginControllerAction { loginControllerId :: !(Id LoginController) }
    | DeleteLoginControllerAction { loginControllerId :: !(Id LoginController) }
    deriving (Eq, Show, Data)

data RegistrationControllersController
    = RegistrationControllersAction
    | NewRegistrationControllerAction
    | ShowRegistrationControllerAction { registrationControllerId :: !(Id RegistrationController) }
    | CreateRegistrationControllerAction
    | EditRegistrationControllerAction { registrationControllerId :: !(Id RegistrationController) }
    | UpdateRegistrationControllerAction { registrationControllerId :: !(Id RegistrationController) }
    | DeleteRegistrationControllerAction { registrationControllerId :: !(Id RegistrationController) }
    deriving (Eq, Show, Data)

data ArticlesController
    = ArticlesAction
    | NewArticleAction
    | ShowArticleAction { articleId :: !(Id Article) }
    | CreateArticleAction
    | EditArticleAction { articleId :: !(Id Article) }
    | UpdateArticleAction { articleId :: !(Id Article) }
    | DeleteArticleAction { articleId :: !(Id Article) }
    deriving (Eq, Show, Data)
