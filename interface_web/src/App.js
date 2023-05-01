import { Component, Fragment } from 'react';
import './App.css';
import { Menu, MenuItem } from 'semantic-ui-react';
import { BrowserRouter, NavLink, Route, Routes } from 'react-router-dom';
import Connexion from './Composants/Connexion';
import AccountCreation from './Composants/AccountCreation';
import Popular from './Composants/Popular';
import Home from './Composants/Home';
import Page404 from './Composants/Page404';

class App extends Component{
  render() {
    return (
      <div className="App">
       <Fragment>
          <BrowserRouter>
              <Menu className='menu'>
                <MenuItem className='menuItem' as={NavLink} to='/' exact='true'>Home</MenuItem>
                <MenuItem className='menuItem' as={NavLink} to='/popular'>Popular</MenuItem>
                <MenuItem className='menuItem' as={NavLink} to='/accountcreation'>Creation Compte</MenuItem>
                <MenuItem className='menuItem' as={NavLink} to='/connexion'>Connexion</MenuItem>
              </Menu>
  
            <Routes>
              <Route exact path='/' element={<Home/>}/>
              <Route path='/popular' element={<Popular/>}/>
              <Route path='/accountcreation' element={<AccountCreation/>}/>
              <Route path='/connexion' element={<Connexion/>}/>
              <Route path='*' element={<Page404/>}/>
            </Routes>
  
          </BrowserRouter>
        </Fragment>
  
      </div>
    );
  }

}

export default App;
