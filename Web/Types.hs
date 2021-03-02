module Web.Types where
import IHP.Prelude
import qualified IHP.Controller.Session
import qualified IHP.ControllerSupport as ControllerSupport
import IHP.ModelSupport
import Application.Helper.Controller
import IHP.ViewSupport
import Generated.Types
import IHP.LoginSupport.Types

data WebApplication = WebApplication deriving (Eq, Show)

data ArticlesController
    = ArticlesAction
    | NewArticleAction
    | ShowArticleAction { articleId :: !(Id Article) }
    | CreateArticleAction
    | EditArticleAction { articleId :: !(Id Article) }
    | UpdateArticleAction { articleId :: !(Id Article) }
    | DeleteArticleAction { articleId :: !(Id Article) }
    deriving (Eq, Show, Data)

instance HasNewSessionUrl User where
    newSessionUrl _ = "/NewSession"


data SessionsController
    = NewSessionAction
    | CreateSessionAction
    | DeleteSessionAction
    deriving (Eq, Show, Data)

data UsersController
    = UsersAction
    | NewUserAction
    | ShowUserAction { userId :: !(Id User) }
    | CreateUserAction
    | EditUserAction { userId :: !(Id User) }
    | UpdateUserAction { userId :: !(Id User) }
    | DeleteUserAction { userId :: !(Id User) }
    deriving (Eq, Show, Data)
