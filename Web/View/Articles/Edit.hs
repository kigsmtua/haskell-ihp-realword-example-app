module Web.View.Articles.Edit where
import Web.View.Prelude

data EditView = EditView { article :: Article }

instance View EditView  where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ArticlesAction}>Articles</a></li>
                <li class="breadcrumb-item active">Edit Article</li>
            </ol>
        </nav>
        <h1>Edit Article</h1>
        {renderForm article}
    |]

renderForm :: Article -> Html
renderForm article = formFor article [hsx|
    {textField #title}
    {textField #description}
    {textField #slug}
    {textField #body}
    {textField #authorId}
    {submitButton}
|]
