module Web.Routes where
import IHP.RouterPrelude
import Generated.Types
import Web.Types

-- Generator Marker
instance AutoRoute ArticlesController
instance AutoRoute SessionsController

type instance ModelControllerMap WebApplication Article = ArticlesController
instance AutoRoute UsersController
type instance ModelControllerMap WebApplication User = UsersController

