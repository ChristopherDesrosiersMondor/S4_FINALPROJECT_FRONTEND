import './App.css';

function App() {
  return (
    <div className="App">
     <Fragment>
        <BrowserRouter>
            <Menu className='menu'>
              <MenuItem className='menuItem' as={NavLink} to='/' exact='true'>Home</MenuItem>
              <MenuItem className='menuItem' as={NavLink} to='/popular'>Popular</MenuItem>
            </Menu>

          <Routes>
            <Route exact path='/' element={<Home/>}/>
            <Route exact path='/popular' element={<Popular/>}/>
            <Route path='*' element={<Page404/>}/>
          </Routes>

        </BrowserRouter>
      </Fragment>

    </div>
  );
}

export default App;
