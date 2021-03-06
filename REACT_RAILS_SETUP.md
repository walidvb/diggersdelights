in request: 
```
export default function(url, options){
    return fetch(url, {
        ...options,
        credentials: 'same-origin', 
        accept: 'application/json', 
        headers: { "Content-Type": "application/json" }
    })
}
```

in postinstall: missing


in Procfile.dev
web: cd client && PORT=3000 npm start
api: bundle exec rails server -p 3001

in package.json:
"proxy": {
    "/api": {
      "target": "http://localhost:3001"
    },
    "/users": {
      "target": "http://localhost:3001"
    },
    "/admin": {
      "target": "http://localhost:3001"
    }
}

https://medium.com/@superhighfives/hey-logan-d73126d71271
in application_controller.rb:
  # Redirects on successful sign in
  def after_sign_in_path_for(resource)
    resource.admin? ? rails_admin.dashboard_path : root_path
  end

in routes.rb:
get '*path', to: "application#fallback_index_html", constraints: ->(request) do
!request.xhr? && request.format.html?
end


https://github.com/facebookincubator/create-react-app/issues/93#issuecomment-282359099
in index.js
```
const render = (Component) => {
    return ReactDOM.render(
        <Provider store={store}>
            <Component/>
        </Provider>,
        document.getElementById('root')
    );
};

render(App);


if (module.hot) {
    module.hot.accept('./App', () => {
        const NextApp = require('./App').default;
        render(NextApp);
    });
}
```


## Add scss
Add to webpack.config.dev.js and webpack.prod.js:
```
{
    test: /\.scss$/,
    use: [
        'style-loader',
        {
        loader: 'css-loader',
        query: {
            modules: true,
            sourceMap: true,
            importLoaders: 2,
            localIdentName: '[name]__[local]___[hash:base64:5]'
        }
        },
        'sass-loader'
    ]
},
```