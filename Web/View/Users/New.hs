module Web.View.Users.New where
import Web.View.Prelude

data NewView = NewView { user :: User }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <div class="auth-page">
            <div class="container page">
              <div class="row">

                <div class="col-md-6 offset-md-3 col-xs-12">
                  <h1 class="text-xs-center">Sign up</h1>
                  <p class="text-xs-center">
                    <a href={NewSessionAction}>Have an account?</a>
                  </p>

                  <ul class="error-messages">
                    <li>That email is already taken</li>
                  </ul>
                  {renderForm user}
                </div>

              </div>
            </div>
        </div>

    |]

renderForm :: User -> Html
renderForm user = formFor user [hsx|
    {textField #username}
    {textField #email}
    {(passwordField #passwordHash) { fieldLabel = "Password"}}
    {submitButton}
|]
