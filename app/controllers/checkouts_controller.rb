class CheckoutsController < ApplicationController

    def checkout
        @product = Product.find(params[:id])
        billable = current_user.user_products.create(product: @product)
        billable.processor = 'stripe'
        billable.customer
        @checkout_session = billable.payment_processor.checkout({
        payment_intent_data: {
            setup_future_usage: 'off_session',
        },
        line_items: [{
            price_data: {
            currency: 'usd',
            product_data: {
                name: @product.name,
            },
            unit_amount: @product.price,
            },
            quantity: 1,
        }],
        mode: 'payment',
        # These placeholder URLs will be replaced in a following step.
        success_url: 'http://localhost:3000/products?abc=1',
        cancel_url: 'http://localhost:3000/products?abc=2',
        })
    end

end
