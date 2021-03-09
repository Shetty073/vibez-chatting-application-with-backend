import React from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import "./App.css";
import "./index.css";
import Chats from "./screens/chats";
import SignUp from "./screens/signup";
import SignIn from "./screens/signin";
import UserSearch from "./screens/usersearch";

function App() {
    return (
        <Router>
            <Switch>
                <Route path='/signin'>
                    <SignIn />
                </Route>
                <Route path='/signup'>
                    <SignUp />
                </Route>
                <Route path='/chats'>
                    <Chats />
                </Route>
                <Route path='/search'>
                    <UserSearch />
                </Route>
            </Switch>
        </Router>
    );
}

export default App;
