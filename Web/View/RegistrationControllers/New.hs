module Web.View.RegistrationControllers.New where
import Web.View.Prelude

data NewView = NewView { registrationController :: RegistrationController }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={RegistrationControllersAction}>RegistrationControllers</a></li>
                <li class="breadcrumb-item active">Edit RegistrationController</li>
            </ol>
        </nav>
        <h1>New RegistrationController</h1>
        {renderForm registrationController}
    |]

renderForm :: RegistrationController -> Html
renderForm registrationController = formFor registrationController [hsx|

    {submitButton}
|]
