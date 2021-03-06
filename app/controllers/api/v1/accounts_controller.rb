class Api::V1::AccountsController < ApplicationController

  before_action :set_account, only: [:show, :edit, :update, :destroy]
  after_filter :only => [:index] {set_pagination_headers(:accounts)}

  respond_to :json

  # GET /accounts
  def index
    @accounts = Account.ordered(index_params[:order_by], index_params[:order_asc]).page(index_params[:page]).per(index_params[:per])
    respond_with @accounts
  end

  # GET /accounts/1
  def show
    respond_with @account
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to @account, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      redirect_to @account, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
    redirect_to accounts_url, notice: 'Account was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def account_params
    params.require(:account).permit(:name, :primary_contact_id, :active, :balance)
  end

  def index_params
    params.permit([:order_by, :order_asc, :page, :per])
  end


end