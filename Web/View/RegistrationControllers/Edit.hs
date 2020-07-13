module Web.View.RegistrationControllers.Edit where
import Web.View.Prelude

data EditView = EditView { registrationController :: RegistrationController }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={RegistrationControllersAction}>RegistrationControllers</a></li>
                <li class="breadcrumb-item active">Edit RegistrationController</li>
            </ol>
        </nav>
        <h1>Edit RegistrationController</h1>
        {renderForm registrationController}
    |]

renderForm :: RegistrationController -> Html
renderForm registrationController = formFor registrationController [hsx|

    {submitButton}
|]
