Rails.application.routes.draw do
  mount EzJwt::Engine => "/"
end
