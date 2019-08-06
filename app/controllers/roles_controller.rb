# frozen_string_literal: true

# License: AGPL-3.0-or-later WITH Web-Template-Output-Additional-Permission-3.0-or-later
class RolesController < ApplicationController
  include Controllers::NonprofitHelper

  before_action :authenticate_nonprofit_admin!

  def create
    role = Role.create_for_nonprofit(role_params[:name].to_sym, role_params[:email], FetchNonprofit.with_params(params))
    json_saved role, 'User successfully added!'
  end

  def destroy
    role = Role.find(params[:id])
    roles = role.user.roles.where(host_id: params[:nonprofit_id], name: role.name)
    if roles.empty?
      render json: { error: "We couldn't find that admin" }, status: :unprocessable_entity
    else
      roles.destroy_all
      flash[:notice] = 'User successfully removed'
      render json: {}
     end
  end

  private

  def role_params
    params.require(:role).permit(:name, :email)
  end
end
