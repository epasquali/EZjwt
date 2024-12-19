Rails.application.routes.draw do
  mount EzJwt::Engine => "/ez_jwt"
end
