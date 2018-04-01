Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html
  #
  namespace :api do
    namespace :v3 do
      namespace :orders do
        resource :order_placed, except: [:destroy, :index], controller: :order_placed
        resource :order_canceled, except: [:destroy, :index], controller: :order_canceled
        resource :order_confirmed, except: [:destroy, :index], controller: :order_confirmed
        resource :order_validated, except: [:destroy, :index], controller: :order_validated
        resource :order_refused, except: [:destroy, :index], controller: :order_refused
        resource :order_shipped, except: [:destroy, :index], controller: :order_shipped
        resource :order_tracked, except: [:destroy, :index], controller: :order_tracked
        resource :order_delivered, except: [:destroy, :index], controller: :order_delivered
        resource :order_failed, except: [:destroy, :index], controller: :order_failed
        resource :order_reported, except: [:destroy, :index], controller: :order_reported
        resource :order_received, except: [:destroy, :index], controller: :order_received
        resource :order_returned, except: [:destroy, :index], controller: :order_returned
        resource :order_reviewed, except: [:destroy, :index], controller: :order_reviewed
        resource :order_annotated, except: [:destroy, :index], controller: :order_annotated
        resource :order_flagged, except: [:destroy, :index], controller: :order_flagged
        resource :order_archived, except: [:destroy, :index], controller: :order_archived
        #
        # => backoffice streams
        # NOTE: Auth methods are to be set later.
        get 'read_forward', action: :read_forward, controller: :backoffice
        get 'read_backward', action: :read_backward, controller: :backoffice
        root to: 'backoffice#index'
      end
    end
  end
end
