module Web.View.LoginControllers.Edit where
import Web.View.Prelude

data EditView = EditView { loginController :: LoginController }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={LoginControllersAction}>LoginControllers</a></li>
                <li class="breadcrumb-item active">Edit LoginController</li>
            </ol>
        </nav>
        <h1>Edit LoginController</h1>
        {renderForm loginController}
    |]

renderForm :: LoginController -> Html
renderForm loginController = formFor loginController [hsx|

    {submitButton}
|]
