import React, { Component } from 'react';
import {
  Route, Switch, withRouter,
} from 'react-router-dom'
import { connect } from 'react-redux'
import { getUserDetails } from './actions/userActions';


import  styles from './App.scss';
/* eslint-disable */
import '!style-loader!css-loader!sass-loader!./generic_no_transform.scss';
import LinksContainer from './components/links/LinksContainer'
import LinksForm from './components/links/LinksForm';
import LoginForm from './components/user/LoginForm';
import DDMenu from './components/DDMenu';
import NewsletterPage from './components/static/NewsletterPage';
import NotificationsList from './components/notifications/NotificationsList';
import PlayerContainer from './components/player/PlayerContainer';
import Title from './components/Title'

import routes from './routes';


class AppWrapper extends Component {

  render() {
    return (
      <div>
        <DDMenu />
        <LinksContainer />
        <NotificationsList />
      </div>
    )
  }
}

class App extends Component {
  state = {
    loading: true,
  }
  componentDidMount() {
    this.props.getUserDetails();
  }
  componentWillReceiveProps(props){
    this.setState({
      loading: false,
    })
  }
  renderLoading(){
    return <div style={{display: 'flex', height: '100vh', alignItems: 'center', justifyContent: 'center'}}><Title /></div>
  }
  renderAuthenticatedRoutes(){
    return <Switch>
      <Route path={routes.links.new} component={LinksForm} />
      <Route path={"/"} component={AppWrapper} />
    </Switch>
  }
  renderAnonymousRoutes(){
    return <Switch>
      <Route path={routes.user.login} component={LoginForm} />
      <Route path={'/'} component={NewsletterPage} />
    </Switch>
  }
  render() {
    const { loading } = this.state;
    return (
      <div className={[styles.app, styles.appear].join(' ')} >
        { loading ? this.renderLoading() :
          this.props.user.authenticated ? this.renderAuthenticatedRoutes() : this.renderAnonymousRoutes()
        }
      </div>
    );
  }
}


const mapStateToProps = (state, ownProps) => ({
  user: state.user,
})

const mapDispatchToProps = (dispatch) =>({
  getUserDetails: () => dispatch(getUserDetails()),
})

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(App))
