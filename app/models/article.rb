class Article < ApplicationRecord
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response




  private

  def render_not_found_response
    render json:{ error:"Artist Not Found"}, status: :not_found
  end

  def render_unprocessable_entity_response
    render json:{ errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

end
