module Web.View.HomeControllers.Index where
import Web.View.Prelude

data IndexView = IndexView { homeControllers :: [HomeController] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={HomeControllersAction}>HomeControllers</a></li>
            </ol>
        </nav>
        <h1>HomeControllers <a href={pathTo NewHomeControllerAction} class="btn btn-primary ml-4">+ New</a></h1>
        <table class="table table-responsive">
            <thead>
                <tr>
                    <th>HomeController</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>{forEach homeControllers renderHomeController}</tbody>
        </table>
    |]


renderHomeController homeController = [hsx|
    <tr>
        <td>{homeController}</td>
        <td><a href={ShowHomeControllerAction (get #id homeController)}>Show</a></td>
        <td><a href={EditHomeControllerAction (get #id homeController)} class="text-muted">Edit</a></td>
        <td><a href={DeleteHomeControllerAction (get #id homeController)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
