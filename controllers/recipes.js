var express = require('express')
var router = express.Router()

const db = require('db');

router.get('/', function(req, res){
	db.query('SELECT * FROM receita', (err, result) => {
	  if(err){
	  	return console.error('error', err);
	  }
	  res.send(result.rows[0]);
	});
});

module.exports = router