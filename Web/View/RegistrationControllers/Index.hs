module Web.View.RegistrationControllers.Index where
import Web.View.Prelude

data IndexView = IndexView { registrationControllers :: [RegistrationController] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={RegistrationControllersAction}>RegistrationControllers</a></li>
            </ol>
        </nav>
        <h1>RegistrationControllers <a href={pathTo NewRegistrationControllerAction} class="btn btn-primary ml-4">+ New</a></h1>
        <table class="table table-responsive">
            <thead>
                <tr>
                    <th>RegistrationController</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>{forEach registrationControllers renderRegistrationController}</tbody>
        </table>
    |]


renderRegistrationController registrationController = [hsx|
    <tr>
        <td>{registrationController}</td>
        <td><a href={ShowRegistrationControllerAction (get #id registrationController)}>Show</a></td>
        <td><a href={EditRegistrationControllerAction (get #id registrationController)} class="text-muted">Edit</a></td>
        <td><a href={DeleteRegistrationControllerAction (get #id registrationController)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
