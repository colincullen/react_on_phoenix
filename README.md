A minimal set of instructions for adding React to a Phoenix project
I credit these instructions credits the following website for the minimalist approach - with some minor changes and/or modifications:
https://dewetblomerus.com/2018/11/30/react-on-phoenix-1-4.html

Create your new Phoenix project

mix phx.new react_on_phoenix --no-ecto # Skipping the database to stay minimal

Change your current working directory to the new project directory

cd react_on_phoenix

Commit the generated project to a local git repo

git init
git add .
git commit -m 'Initial commit'

Add the local repo to a remote github repo
git remote add origin https://github.com/[your repo]/react_on_phoenix.git

Pull in the dependencies (per information found at: https://www.valentinog.com/blog/react-webpack-babel/)

Change your current working directory to the front-end part of the Phoenix 1.4 scaffold, which was set up

cd assets 
npm i @babel/core babel-loader @babel/preset-env @babel/preset-react react react-dom --save-dev
Delete the content of the following files and replace it with the specified code

As show by https://www.valentinog.com/blog/react-webpack-babel/

assets/.babelrc

{
  "presets": ["@babel/preset-env", "@babel/preset-react"]
}
assets/js/app.js

import React from 'react'
import ReactDOM from 'react-dom'

const Switchboard = () => <div>This is a React Component!!!</div>

ReactDOM.render(<Switchboard />, document.getElementById('mountPoint'))
lib/switchboard_ex_web/templates/page/index.html.eex

<div id="mountPoint"></div>
Get back to the root directory of the app and start the server

cd ..
mix phx.server
You should now see This is a React Component!!! on the page at http://localhost:4000




# ReactOnPhoenix

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
