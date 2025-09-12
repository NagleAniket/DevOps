import React, {useEffect, useState} from 'react';

function App(){
  const [books, setBooks] = useState([]);
  useEffect(()=>{
    fetch('/api/books')
      .then(r=>r.json())
      .then(setBooks)
      .catch(()=>setBooks([]));
  },[]);
  return (
    <div style={{fontFamily:'Arial', padding:20}}>
      <h1>BookStore</h1>
      {books.length===0 ? <p>Loading or no books...</p> :
        <ul>{books.map(b=> <li key={b.id}><strong>{b.title}</strong> — {b.author}</li>)}</ul>
      }
    </div>
  );
}

export default App;
