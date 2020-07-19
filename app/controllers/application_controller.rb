class ApplicationController < ActionController::Base

#  ログイン後にそれぞれの遷移画面を設定
def after_sign_in_path_for(resource)
	# １つの値に対して複数の候補の中で一致するものを探す場合case分がいい
	case resource
	when Admin
			admins_homes_top_path
	when Owner
			owners_homes_top_path
	when User
			homes_top_path
	end
end

end
