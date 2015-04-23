# Importamos express
express = require('express')

# Ruteamos usando el objeto express.router()
router = express.Router()


### GET home page. ###

# Ruteamos   ---   Parseamos la ruta / y devolvemos el index.
#router.get '/', (req, res, next) ->    
#  res.render 'index', title: 'Express'
#  return
#module.exports = router

module.exports =
  index: (req, res) ->
    res.render 'index', { title: 'Predictive Recursive Descent Parser' }
    
    
    
    