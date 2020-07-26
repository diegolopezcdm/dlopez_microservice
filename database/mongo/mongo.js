
db.createUser({ user: "usrdeuda", pwd: "password", roles:[{role: "userAdmin" , db:"dbdeudas"}]});
db.grantRolesToUser("usrdeuda",[{ role: "read", db: "dbdeudas"}] );
db.createCollection('deudas') ;
db.deudas.insert({ cliente: "15865658", nombres: "Jose Diaz Sarmiento", servicio: "PGTR23", monto: "130", transaccion: "", estado: ""});

