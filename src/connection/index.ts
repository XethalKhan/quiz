import mysql from 'mysql';

let connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'questions'
});

connection.connect(function(err) {
    if (err) throw err;
});

export const sql = connection;