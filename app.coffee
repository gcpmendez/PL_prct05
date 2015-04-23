###
# Module dependencies
###

express = require('express')
app = express()
sassMiddleware = require('node-sass-middleware')
coffeeMiddleware = require('coffee-middleware')
app.set 'port', process.env.PORT or 5000
app.use '/stylesheets', express.static(__dirname + '/views')
#app.use("/scripts", express.static(__dirname + '/views'));
app.use express.static(__dirname + '/public')
app.use express.static(__dirname + '/views')
app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'
#app.use(express.logger('dev'))
#SASS
app.use sassMiddleware(
  src: __dirname + '/public/stylesheets'
  dest: __dirname + '/public/stylesheets'
  prefix: '/stylesheets'
  debug: true)
#Coffee
app.use coffeeMiddleware(
  src: __dirname
  dest: __dirname + '/views'
  debug: true)
app.get '/', (req, res) ->
  res.render 'index', title: 'Home'
  return
app.get '/test', (request, response) ->
  response.render 'test', title: 'test'
  return
app.listen app.get('port'), ->
  console.log 'Node app is running at localhost:' + app.get('port')
  return
