module Web.View.LoginControllers.New where
import Web.View.Prelude

data NewView = NewView { loginController :: LoginController }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={LoginControllersAction}>LoginControllers</a></li>
                <li class="breadcrumb-item active">Edit LoginController</li>
            </ol>
        </nav>
        <h1>New LoginController</h1>
        {renderForm loginController}
    |]

renderForm :: LoginController -> Html
renderForm loginController = formFor loginController [hsx|

    {submitButton}
|]
