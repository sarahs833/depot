import React from 'react'

import NoPayType from './NoPayType';
import CreditCardPayType from './CreditCardPayType';
import CheckPayType from './CheckPayType';
import PurchaseOrderPayType from './PurchaseOrderPayType';

class PayTypeSelector extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedPayType: null
    }
  }

  onPayTypeSelected = (event) => {
    this.setState({ selectedPayType: event.target.value });
  }


  render(){
    let PayTypeCustomComponent = NoPayType;
    if(this.state.selectedPayType == 'Credit card') {
      PayTypeCustomComponent = CreditCardPayType;
    } else if (this.state.selectedPayType == 'Check') {
      PayTypeCustomComponent = CheckPayType;
    } else if (this.state.selectedPayType == 'Purchase order') {
      PayTypeCustomComponent = PurchaseOrderPayType;
    }
    return(
      <div>
        <div className='field'>
          <label htmlFor="order pay-type">Pay Type</label>
          <select onChange={this.onPayTypeSelected} id="order_pay_types" name='order[pay_type]'>
            <option value=""> select a payment method</option>
            <option value="Check">Check</option>
            <option value="Credit card">Credit card</option>
            <option value="Purchase order">Purchase order</option>
          </select>
        </div>
        <PayTypeCustomComponent />
      </div>
    )
  }
}

export default PayTypeSelector;
