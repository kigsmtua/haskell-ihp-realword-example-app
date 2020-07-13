module Web.View.HomeControllers.Show where
import Web.View.Prelude

data ShowView = ShowView { homeController :: HomeController }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={HomeControllersAction}>HomeControllers</a></li>
                <li class="breadcrumb-item active">Show HomeController</li>
            </ol>
        </nav>
        <h1>Show HomeController</h1>
    |]
