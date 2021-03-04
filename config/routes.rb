Rails.application.routes.draw do
    # 職員
	namespace :staff do
		root "top#index"
		get "login" => "sessions#new", as: :login
		post "session" => "sessions#create", as: :session
		delete "session" => "sessions#destroy"
	end
	# 管理者
	namespace :admin do
		root "top#index"
		get "login" => "sessions#new", as: :login
		post "session" => "sessions#create", as: :session
		delete "session" => "sessions#destroy"
	end
	# 顧客
	namespace :customer do
		root "top#index"
	end
end
