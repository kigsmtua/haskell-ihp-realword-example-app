module Web.View.LoginControllers.Show where
import Web.View.Prelude

data ShowView = ShowView { loginController :: LoginController }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={LoginControllersAction}>LoginControllers</a></li>
                <li class="breadcrumb-item active">Show LoginController</li>
            </ol>
        </nav>
        <h1>Show LoginController</h1>
    |]
