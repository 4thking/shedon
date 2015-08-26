class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :prepare_meta_tags, if: "request.get?"

    def configure_permitted_parameters
	    devise_parameter_sanitizer.for(:sign_up) << :first_name
	    devise_parameter_sanitizer.for(:sign_up) << :last_name
	    devise_parameter_sanitizer.for(:account_update) << :first_name
	    devise_parameter_sanitizer.for(:account_update) << :last_name
 	end

 	def prepare_meta_tags(options={})

     site        = "TheShedonist"
     title       = [controller_name, action_name].join(" ")
  	 description = "The Shedonist"
     current_url = request.url

  #   # Let's prepare a nice set of defaults

    defaults = {
      site: 'The Shedonist',
      title:       'The Shedonist',
      description: 'The Shedonist',
      keywords:    %w[Feminism Women Social Justice Liberalism],
      twitter:     {
                    site: '@TheShedonistMag',
                    card: 'summary',
                    description: 'The Shedonist', 
                    },

      og:          {url: current_url,
                    title: 'The Shedonist',
                    description: 'The Shedonist',
                    type: 'website'}
    }


    options.reverse_merge!(defaults)


    set_meta_tags options

   end
end
