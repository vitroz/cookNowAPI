var express = require('express'),
	path = require('path'),
	bodyParser = require('body-parser'),
	cons = require('consolidate'),
	dust = require('dustjs-helpers'),
	//pg = require('pg'),
	app = express();

//var connect = "postgres://vitor:root@localhost/recipeDB";
//DATABASE CONNECTION established in /node_modules/db
const db = require('db');

// Assign Dust Engine to .dust files
app.engine('dust', cons.dust);

// Set Default Ext .dust
app.set('view engine', 'dust');
app.set('views', __dirname + '/views');

app.use(express.static(path.join(__dirname, 'public')));

// Body Parser Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

var recipes = require('./controllers/recipes.js')
app.use('/recipes', recipes)

app.get('/', function(req, res){
  res.render('index');	  
});


// Server
app.listen(3000, function(){
	console.log('Server Started on Port 3000');
});