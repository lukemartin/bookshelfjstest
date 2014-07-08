# Modules
express = require 'express'
coffee  = require 'coffee-script'
knex    = require('knex')
  client:     'mysql'
  connection:
    host:     '127.0.0.1'
    user:     'root'
    password: ''
    database: 'bookshelf_test'
    charset:  'utf8'

bookshelf = require('bookshelf') knex
app       = express()

app.set 'bookshelf', bookshelf

# Models
User = bookshelf.Model.extend
  tableName: 'users'
  hasTimestamps: true
  posts: ->
    this.hasOne Post

Post = bookshelf.Model.extend
  tableName: 'posts'
  hasTimestamps: true
  user: ->
    this.belongsTo User

app.get '/', (req, res) ->
  new User {}
  .fetchAll
    withRelated: 'posts'
  .then (model) ->
    res.send model

app.get '/new', (req, res) ->
  new User
    name: 'Lukez'
  .save()
  .then((model) ->
    res.send model
  )

# App
app.listen 7777
console.log 'app listening on 7777'
