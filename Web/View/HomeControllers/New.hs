module Web.View.HomeControllers.New where
import Web.View.Prelude

data NewView = NewView { homeController :: HomeController }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={HomeControllersAction}>HomeControllers</a></li>
                <li class="breadcrumb-item active">Edit HomeController</li>
            </ol>
        </nav>
        <h1>New HomeController</h1>
        {renderForm homeController}
    |]

renderForm :: HomeController -> Html
renderForm homeController = formFor homeController [hsx|

    {submitButton}
|]
