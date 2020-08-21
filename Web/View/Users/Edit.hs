module Web.View.Users.Edit where
import Web.View.Prelude

data EditView = EditView { user :: User }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={UsersAction}>Users</a></li>
                <li class="breadcrumb-item active">Edit User</li>
            </ol>
        </nav>
        <h1>Edit User</h1>
        {renderForm user}
    |]

renderForm :: User -> Html
renderForm user = formFor user [hsx|
    {textField #email}
    {textField #username}
    {textField #bio}
    {textField #image}
    {textField #passwordHash}
    {textField #failedLoginAttempts}
    {submitButton}
|]
