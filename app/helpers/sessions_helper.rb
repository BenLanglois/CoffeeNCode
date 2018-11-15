module SessionsHelper
    # Logs in the given user.
    def log_in(user)
        session[:user_id] = user.id
    end

    # Returns the current logged-in user (if any).
    def current_user
        if logged_in?
            return User.find_by(id: session[:user_id])
        end
    end

    def logged_in?
        return session[:user_id] != nil
    end

    def log_out
        session[:user_id] = nil
    end
end
