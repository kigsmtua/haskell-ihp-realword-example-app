module Web.View.HomeControllers.Edit where
import Web.View.Prelude

data EditView = EditView { homeController :: HomeController }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={HomeControllersAction}>HomeControllers</a></li>
                <li class="breadcrumb-item active">Edit HomeController</li>
            </ol>
        </nav>
        <h1>Edit HomeController</h1>
        {renderForm homeController}
    |]

renderForm :: HomeController -> Html
renderForm homeController = formFor homeController [hsx|

    {submitButton}
|]
