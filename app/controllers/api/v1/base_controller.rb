class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  include Pagy::Backend
  include ApiResponders
  include ApiExceptions
  include Pagination
end