import React, { useState } from 'react';
import { loadStripe } from '@stripe/stripe-js';
import { Elements, CardElement, useStripe, useElements } from '@stripe/react-stripe-js';
import { PayPalScriptProvider, PayPalButtons } from '@paypal/react-paypal-js';

const stripePromise = loadStripe('your-stripe-public-key');

const CheckoutForm: React.FC<{ amount: number }> = ({ amount }) => {
  const stripe = useStripe();
  const elements = useElements();

  const handleSubmit = async (event: React.FormEvent) => {
    event.preventDefault();

    if (!stripe || !elements) {
      return;
    }

    const { client_secret } = await fetch('/api/payment_intent', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ amount }),
    }).then((r) => r.json());

    const result = await stripe.confirmCardPayment(client_secret, {
      payment_method: {
        card: elements.getElement(CardElement)!,
      },
    });

    if (result.error) {
      console.error(result.error.message);
    } else if (result.paymentIntent && result.paymentIntent.status === 'succeeded') {
      console.log('Payment succeeded');
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <CardElement />
      <button type="submit" disabled={!stripe}>
        Pay
      </button>
    </form>
  );
};

const PointOfSale: React.FC = () => {
  const [products, setProducts] = useState<any[]>([
    { id: 1, name: 'Product 1', price: 100 },
    { id: 2, name: 'Product 2', price: 200 },
    { id: 3, name: 'Product 3', price: 300 },
  ]);
  const [cart, setCart] = useState<any[]>([]);
  const [total, setTotal] = useState<number>(0);
  const [discount, setDiscount] = useState<number>(0);

  const addToCart = (product: any) => {
    setCart([...cart, product]);
    calculateTotal([...cart, product]);
  };

  const calculateTotal = (cart: any[]) => {
    const totalAmount = cart.reduce((acc, item) => acc + item.price, 0);
    setTotal(totalAmount);
    setDiscount(0);
  };

  const applyDiscount = () => {
    const discountAmount = total * 0.1;
    setDiscount(discountAmount);
  };

  return (
    <div>
      <h2>Point of Sale Interface</h2>

      <div>
        <h3>Product List</h3>
        <ul>
          {products.map((product) => (
            <li key={product.id}>
              {product.name} - ${product.price}
              <button onClick={() => addToCart(product)}>Add to Cart</button>
            </li>
          ))}
        </ul>
      </div>

      <div>
        <h3>Cart</h3>
        <ul>
          {cart.map((item, index) => (
            <li key={index}>
              {item.name} - ${item.price}
            </li>
          ))}
        </ul>
        <div>Total: ${total.toFixed(2)}</div>
        {discount > 0 && <div>Discount: -${discount.toFixed(2)}</div>}
        <div>Amount to Pay: ${(total - discount).toFixed(2)}</div>
        <button onClick={applyDiscount}>Apply Discount</button>
        <Elements stripe={stripePromise}>
          <CheckoutForm amount={total - discount} />
        </Elements>
        <PayPalScriptProvider options={{ "client-id": "your-paypal-client-id" }}>
          <PayPalButtons
            createOrder={(data, actions) => {
              return actions.order.create({
                purchase_units: [
                  {
                    amount: {
                      value: (total - discount).toFixed(2),
                    },
                  },
                ],
              });
            }}
            onApprove={(data, actions) => {
              return actions.order.capture().then((details) => {
                console.log('Payment succeeded', details);
              });
            }}
          />
        </PayPalScriptProvider>
      </div>
    </div>
  );
};

export default PointOfSale;
