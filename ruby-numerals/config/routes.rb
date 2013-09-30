RubyNumerals::Application.routes.draw do
  root :to => 'numerals#index'
  post 'numerals', to: 'numerals#transform', as: 'transform'
end
