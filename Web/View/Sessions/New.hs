module Web.View.Sessions.New where
import Web.View.Prelude
import IHP.AuthSupport.View.Sessions.New


instance View (NewView User) ViewContext where
    html NewView { .. } = [hsx|
        <div class="auth-page">
          <div class="container page">
            <div class="row">

              <div class="col-md-6 offset-md-3 col-xs-12">
                <h1 class="text-xs-center">Sign up</h1>
                <p class="text-xs-center">
                  <a href={NewUserAction}>Need an account?</a>
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
renderForm user = [hsx|
    <form method="POST" action={CreateSessionAction}>
        <fieldset class="form-group">
          <input name="email" class="form-control form-control-lg" type="email" placeholder="Email">
        </fieldset>
        <fieldset class="form-group">
          <input name="password" class="form-control form-control-lg" type="password" placeholder="Password">
        </fieldset>
        <button type="submit" class="btn btn-lg btn-primary pull-xs-right">
          Sign in
        </button>
    </form>
|]
