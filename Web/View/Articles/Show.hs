module Web.View.Articles.Show where
import Web.View.Prelude

data ShowView = ShowView { article :: Article }

instance View ShowView  where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ArticlesAction}>Articles</a></li>
                <li class="breadcrumb-item active">Show Article</li>
            </ol>
        </nav>
        <h1>Show Article</h1>
    |]
