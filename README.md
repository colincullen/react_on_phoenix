# React on Phoenix Minimal Setup

A minimal set of instructions for adding React to a Phoenix project
I credit these instructions to the following website for this minimalist approach - with some minor changes and/or modifications:
https://dewetblomerus.com/2018/11/30/react-on-phoenix-1-4.html

#### Create your new Phoenix project (use --no-ecto to skip the database - staying minimal)
```
mix phx.new react_on_phoenix --no-ecto
```
#### Change your current working directory to the new project directory
```
cd react_on_phoenix
```
#### Commit the generated project to a local git repo to save your work
```
git init
git add .
git commit -m 'Initial commit'
```
#### Add the local repo to a remote github repo
```
git remote add origin https://github.com/[your account name]/react_on_phoenix.git
```
#### Pull in the npm dependencies
(per information found at: https://www.valentinog.com/blog/react-webpack-babel/)

Change your current working directory to the front-end part of the Phoenix 1.4 scaffold, which was setup when the Phoenix project was created by Mix in the first step
```
cd assets 
npm i @babel/core babel-loader @babel/preset-env @babel/preset-react react react-dom --save-dev
```
Delete the content of the following files and replace it with the specified code
As show by https://www.valentinog.com/blog/react-webpack-babel/

```
assets/.babelrc
```
```
{
  "presets": ["@babel/preset-env", "@babel/preset-react"]
}
```
```
assets/js/app.js
```
```javascript
import React from 'react'
import ReactDOM from 'react-dom'

ReactDOM.render(<h3>Hello, React!</h3>, document.getElementById('root'))
```
lib/react_on_phoenix_web/templates/page/index.html.eex
```
<div id="root"></div>
```
#### Because the web page response was changed one of the tests will need to be fixed

To see the failing test change back to the project directory root and execute the tests using Mix by entering
```
mix test
```
The right side value, "Welcome to Phoenix!", will no longer match because it no longer exists.

The failing test is
```
test/react_on_phoenix_web/controllers/page_controller_test.exs
```
Replace the line 
```
assert html_response(conn, 200) =~ "Welcome to Phoenix!"
```
with
```
assert html_response(conn, 200) =~ "root"
```
Re-run the tests using Mix - all tests should pass now

#### Finally, from the root directory of the app, start the server
```
cd ..
mix phx.server
```
You should now see ```Hello, React!``` on the page at http://localhost:4000
