import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <h1>Runtime Config</h1>
        <p>
         ENV: {window.__RUNTIME_CONFIG__.ENV}
         </p>
         <p>
         API URL: {window.__RUNTIME_CONFIG__.API_URL} 
        </p>
      </header>
    </div>
  );
}

export default App;
