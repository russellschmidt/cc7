class Donor < ApplicationRecord
  include Stripe::Callbacks

  before_create :create_stripe_customer

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :addresses, as: :addressable
  has_many :donations


  def do_donor_transaction(type, amount, stripe_token)
    card = save_credit_card(stripe_token)

    if donated = donate(amount, card)
      subscribe if type == 'subscription'

      deposited
    end
  end

  def stripe_customer
    Stripe::Customer.retrieve(stripe_customer_id)
  end

  def donate(amount, card)
    customer = stripe_customer

    Stripe::Charge.create(
      amount: amount,
      currency: 'usd',
      customer: customer.id,
      card: card.id,
      description: "Charge for #{email}"
    )

    customer.account_balance += amount
    customer.save
  rescue => e
    false
  end

  private
    def subscribe
      stripe_customer.subscriptions.create(plan:'monthly')
    end

    def create_stripe_customer
      customer = Stripe::Customer.create(email: email, account_balance: 0)
      self.stripe_customer_id = customer.id
    end

    def save_credit_card(card_token)
      stripe_customer.cards.create(card: card_token)
    end

end
