module Web.View.LoginControllers.Index where
import Web.View.Prelude

data IndexView = IndexView { loginControllers :: [LoginController] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={LoginControllersAction}>LoginControllers</a></li>
            </ol>
        </nav>
        <h1>LoginControllers <a href={pathTo NewLoginControllerAction} class="btn btn-primary ml-4">+ New</a></h1>
        <table class="table table-responsive">
            <thead>
                <tr>
                    <th>LoginController</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>{forEach loginControllers renderLoginController}</tbody>
        </table>
    |]


renderLoginController loginController = [hsx|
    <tr>
        <td>{loginController}</td>
        <td><a href={ShowLoginControllerAction (get #id loginController)}>Show</a></td>
        <td><a href={EditLoginControllerAction (get #id loginController)} class="text-muted">Edit</a></td>
        <td><a href={DeleteLoginControllerAction (get #id loginController)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
