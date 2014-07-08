
exports.up = (knex, Promise) ->
  knex.schema.createTable 'users', (table) ->
    table.increments().primary()
    table.string('name')
    table.timestamps()

exports.down = (knex, Promise) ->
  knex.schema.dropTable 'users'