module Web.View.Articles.New where
import Web.View.Prelude

data NewView = NewView { article :: Article }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ArticlesAction}>Articles</a></li>
                <li class="breadcrumb-item active">Edit Article</li>
            </ol>
        </nav>
        <h1>New Article</h1>
        {renderForm article}
    |]

renderForm :: Article -> Html
renderForm article = formFor article [hsx|
    {textField #author}
    {textField #title}
    {textField #description}
    {textField #slug}
    {textField #body}
    {textField #authorId}
    {submitButton}
|]
