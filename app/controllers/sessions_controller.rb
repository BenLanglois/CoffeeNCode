class SessionsController < ApplicationController
    def new
        @error_message = ''
    end

    def create
        @error_message = ''
        user = User.find_by(email: params[:session][:email]) # find user somehow
        if user != nil and user.authenticate(params[:session][:password]) # user exists AND has the correct login password
            # Log the user in and redirect to the user's show page.
            log_in(user)
            redirect_to user_url(user)
        else
            @error_message = "Incorrect username or password"
            # error handling, display error message
            render 'new'
        end
    end

    def destroy
        log_out
        redirect_to root_url
    end
end
