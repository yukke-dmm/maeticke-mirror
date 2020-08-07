class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

# #  ログイン後にそれぞれの遷移画面を設定
# 	def after_sign_in_path_for(resource)
# 	# １つの値に対して複数の候補の中で一致するものを探す場合case分がいい
# 		case resource
# 		when Admin
# 			admin_homes_top_path
# 		when Owner
# 			owner_homes_top_path
# 		when User
# 			homes_top_path
# 		end
# 	end
# 結局分けなかったのでコメントアウトで残しておく

	protected
	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:category_id,:introduce,:image,:address,:postcode,:average_price,:phone_number])
	end
end
