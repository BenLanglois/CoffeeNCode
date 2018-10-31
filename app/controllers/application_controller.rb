class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # def hello # added our own function to say something friendly
    #     render html: "hello, world!"
    # end
end
