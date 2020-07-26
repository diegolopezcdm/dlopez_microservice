1. chmod +x to database/deploy.sh and run it. 
Then docker-compose build, up to set up database postgres, mongo and rabbit

2. run ./mvn spring-boot:run on components

3. set rabbit url
export RABBIT_URI=amqp://admin:admin@localhost/admin

4. run zipkin (with personas ms running)
java -jar zipkin-server-2.21.4-exec.jar

5. web zipkin http://localhost:9411/zipkin

6. web rabbit http://localhost:15672/

7. web discovery service http://localhost:8761/

#NOTES

--cargo
select * from esq_ctas_clientes.tbl_clientes
select * from esq_ctas_clientes.tbl_cuentas
select * from esq_ctas_clientes.tbl_movimientos

--abono
select * from esq_ctas_recaudadoras.tbl_clientes
select * from esq_ctas_recaudadoras.tbl_cuentas
select * from esq_ctas_recaudadoras.tbl_movimientos

MS PAGO
http://localhost:8073/mspago/procesar/cargo/abono

MSBPAGO
http://localhost:8074/msbpago/procesar/cargo/abono
{
"cuentacargo":"11205060709500",
"cuentaabono":"11206060709890",
"monto":10.00,
"causal":"PAGO TELEFONO",
"pagador":"15865658",
"acreedor":"20602649412"
}

#base
REGISTER-DISCOVER
CONFIG-SERVER
MANAGEMENT-PROPERTIES (CONEXION)

#payments (orchestrated transaction)
CONEXION
MS-ABONO
MS-CARGO
MS-PAGO
APIGATEWAY-INTERNAL
MSB-PAGO
APIGATEWAY-PUBLIC
MS-SECURITY

#personas (zipikng and security)
MS-PERSONA
APIGATEWAY-INTERNAL
MSB-PERSONA
MS-SECURITY
APIGATEWAY-PUBLIC

#consultas (external api consumption and mongo)
SPRING-BOOT-PAGOLINEA
MS-CONSULTA
APIGATEWAY-INTERNAL
MS-CB-CONSULTA
MSB-CONSULTA

sudo passwd root --> para cambiar contraseña de usuario 
su root --> poner la contraseña