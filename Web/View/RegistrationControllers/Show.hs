module Web.View.RegistrationControllers.Show where
import Web.View.Prelude

data ShowView = ShowView { registrationController :: RegistrationController }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={RegistrationControllersAction}>RegistrationControllers</a></li>
                <li class="breadcrumb-item active">Show RegistrationController</li>
            </ol>
        </nav>
        <h1>Show RegistrationController</h1>
    |]
