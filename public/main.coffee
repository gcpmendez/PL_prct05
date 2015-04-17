main = ->
  parse = make_parse()
  source = document.getElementById('INPUT').value
  string = undefined
  tree = undefined
  try
    tree = parse(source)
    #string = JSON.stringify(tree, ['type', 'value', 'from', 'to'],  4);
    string = JSON.stringify(tree, [
      'key'
      'name'
      'message'
      'value'
      'arity'
      'first'
      'second'
      'third'
      'fourth'
    ], 4)
  catch e
    string = JSON.stringify(e, [
      'name'
      'message'
      'from'
      'to'
      'key'
      'value'
      'arity'
      'first'
      'second'
      'third'
      'fourth'
    ], 4)
  document.getElementById('OUTPUT').innerHTML = string.replace(/&/g, '&amp;').replace(/[<]/g, '&lt;')
  return

'use strict'
$(document).ready ->
  $('#PARSE').click ->
    main()
    return
  return

Object::error = (message, t) ->
  t = t or this
  t.name = 'SyntaxError'
  t.message = message
  throw t
  return
