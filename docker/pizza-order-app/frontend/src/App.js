import React, {useEffect, useState} from 'react';

function App(){
  const [menu, setMenu] = useState([]);
  const [order, setOrder] = useState({item_id:'', qty:1});
  useEffect(()=>{ fetch('/api/menu').then(r=>r.json()).then(setMenu).catch(()=>setMenu([])) },[]);
  const place = ()=> {
    fetch('/api/order',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(order)})
      .then(r=>r.json()).then(d=>alert('Order placed: ' + JSON.stringify(d))).catch(e=>alert('err'));
  };
  return (
    <div style={{fontFamily:'Arial', padding:20}}>
      <h1>Pizza Menu</h1>
      <ul>{menu.map(m=> <li key={m.id}>{m.name} — ${m.price}</li>)}</ul>
      <h3>Place Order</h3>
      <select onChange={e=>setOrder({...order,item_id: Number(e.target.value)})}>
        <option value=''>Select</option>
        {menu.map(m=> <option key={m.id} value={m.id}>{m.name}</option>)}
      </select>
      <input type="number" value={order.qty} onChange={e=>setOrder({...order, qty: Number(e.target.value)})} style={{width:60, marginLeft:10}} />
      <button onClick={place} style={{marginLeft:10}}>Order</button>
    </div>
  );
}

export default App;
