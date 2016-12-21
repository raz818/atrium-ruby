module Atrium
  class Member
    include ::ActiveAttr::Model
    include ::ActiveAttr::Attributes

    attribute :aggregated_at
    attribute :guid
    attribute :identifier
    attribute :institution_code
    attribute :metadata
    attribute :name
    attribute :status
    attribute :successfully_aggregated_at
    attribute :user_guid


    ##
    # POST /users/:user_guid/members/:member_guid/aggregate
    #
    def aggregate(member_guid)
      # TODO: Pull in user_guid
      endpoint = "users/#{user_guid}/members/#{member_guid}/aggregate"
      member_response = ::Atrium.client.make_request(:post, endpoint)

      member_params = member_response["member"]

      ::Atrium::Member.new(member_params)
    end

    def accounts
      # TODO: Pull in user_guid
      endpoint = "users/#{user_guid}/members/#{member_guid}/account"
      account_response = ::Atrium.client.make_request(:post, endpoint)

      account = account_response["account"].map do |account|
        ::Atrium::Transaction.new(account)
      end
    end

    ##
    # POST /users/:user_guid/members
    #
    def self.create(params)
      endpoint = "/users/#{params[:user_guid]}/members"
      body = member_body(params)
      ::Atrium.client.make_request(:post, endpoint, body)
    end

    def delete
      # TODO: Pull in user_guid
      endpoint = "/users/#{user_guid}/members/#{member_guid}"
      ::Atrium.client.make_request(:delete, endpoint)
    end

    def challenges
      # TODO: Pull in user_guid
      endpoint = "/users/#{user_guid}/members/#{member_guid}/challenges"
      ::Atrium.client.make_request(:get, endpoint)
    end

    def list
      # TODO: Pull in user_guid
      endpoint = "/users/#{user_guid}/members"
      ::Atrium.client.make_request(:get, endpoint)
    end

    def update
    end

    def read_account(account_guid)
    end

    def resume
    end

    ##
    # GET /users/:user_guid/members/:member_guid/status
    #
    def self.status(user_guid, member_guid)
      endpoint = "/users/#{user_guid}/members/#{member_guid}/status"
      ::Atrium.client.make_request(:get, endpoint)
    end

    def transactions(member_guid)
      # TODO: Pull in user_guid
      endpoint = "users/#{user_guid}/members/#{member_guid}/transactions"
      transactions_response = ::Atrium.client.make_request(:post, endpoint)

      transactions = transactions_response["transactions"].map do |transaction|
        ::Atrium::Transaction.new(transaction)
      end
    end

    private

    def self.member_body(params)
      {
        :member => {
          :credentials => params[:credentials],
          :identifier => params[:identifier],
          :institution_code => params[:institution_code],
          :metadata => params[:metadata]
        }
      }
    end
  end
end
