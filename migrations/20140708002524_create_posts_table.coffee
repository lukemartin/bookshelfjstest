
exports.up = (knex, Promise) ->
  knex.schema.createTable 'posts', (table) ->
    table.increments().primary()
    table.string('title')
    table.text('content')
    table.integer('user_id').unsigned().references('users.id')
    table.timestamps()


exports.down = (knex, Promise) ->
  knex.schema.dropTable 'posts'