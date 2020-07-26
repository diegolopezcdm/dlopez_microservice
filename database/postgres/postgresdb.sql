
ALTER DATABASE postgres OWNER TO postgres;

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 16467)
-- Name: esq_ctas_clientes; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA esq_ctas_clientes;


ALTER SCHEMA esq_ctas_clientes OWNER TO postgres;

--
-- TOC entry 12 (class 2615 OID 16419)
-- Name: esq_ctas_recaudadoras; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA esq_ctas_recaudadoras;


ALTER SCHEMA esq_ctas_recaudadoras OWNER TO postgres;

--
-- TOC entry 10 (class 2615 OID 16458)
-- Name: esq_deudas; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA esq_deudas;


ALTER SCHEMA esq_deudas OWNER TO postgres;

--
-- TOC entry 11 (class 2615 OID 16402)
-- Name: esq_pagos; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA esq_pagos;


ALTER SCHEMA esq_pagos OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 16468)
-- Name: esqmicroservicios; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA esqmicroservicios;


ALTER SCHEMA esqmicroservicios OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16476)
-- Name: SEQ_TBL_CUENTAS_TRANSACCION; Type: SEQUENCE; Schema: esq_ctas_clientes; Owner: postgres
--

CREATE SEQUENCE esq_ctas_clientes."SEQ_TBL_CUENTAS_TRANSACCION"
    START WITH 10000
    INCREMENT BY 1
    MINVALUE 10000
    MAXVALUE 99999
    CACHE 1;


ALTER TABLE esq_ctas_clientes."SEQ_TBL_CUENTAS_TRANSACCION" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16478)
-- Name: SEQ_TBL_MOVIMIENTOS; Type: SEQUENCE; Schema: esq_ctas_clientes; Owner: postgres
--

CREATE SEQUENCE esq_ctas_clientes."SEQ_TBL_MOVIMIENTOS"
    START WITH 10000
    INCREMENT BY 1
    MINVALUE 10000
    MAXVALUE 99999
    CACHE 1;


ALTER TABLE esq_ctas_clientes."SEQ_TBL_MOVIMIENTOS" OWNER TO postgres;

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16480)
-- Name: tbl_clientes; Type: TABLE; Schema: esq_ctas_clientes; Owner: postgres
--

CREATE TABLE esq_ctas_clientes.tbl_clientes (
    codigo character varying(15) NOT NULL,
    nombres character varying(200) NOT NULL
);


ALTER TABLE esq_ctas_clientes.tbl_clientes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16483)
-- Name: tbl_cuentas; Type: TABLE; Schema: esq_ctas_clientes; Owner: postgres
--

CREATE TABLE esq_ctas_clientes.tbl_cuentas (
    cuenta character varying(20) NOT NULL,
    cliente character varying(15) NOT NULL,
    monto numeric DEFAULT 0.0 NOT NULL
);


ALTER TABLE esq_ctas_clientes.tbl_cuentas OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16490)
-- Name: tbl_movimientos; Type: TABLE; Schema: esq_ctas_clientes; Owner: postgres
--

CREATE TABLE esq_ctas_clientes.tbl_movimientos (
    codigo integer DEFAULT nextval('esq_ctas_clientes."SEQ_TBL_MOVIMIENTOS"'::regclass) NOT NULL,
    cuenta character varying(20) NOT NULL,
    monto numeric DEFAULT 0.0 NOT NULL,
    transaccion character varying(5) NOT NULL,
    fechamov timestamp without time zone NOT NULL,
    causalmov character varying(120) NOT NULL,
    acreedor character varying(15)
);


ALTER TABLE esq_ctas_clientes.tbl_movimientos OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16420)
-- Name: SEQ_TBL_MOVIMIENTOS; Type: SEQUENCE; Schema: esq_ctas_recaudadoras; Owner: postgres
--

CREATE SEQUENCE esq_ctas_recaudadoras."SEQ_TBL_MOVIMIENTOS"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999
    CACHE 1;


ALTER TABLE esq_ctas_recaudadoras."SEQ_TBL_MOVIMIENTOS" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16422)
-- Name: tbl_clientes; Type: TABLE; Schema: esq_ctas_recaudadoras; Owner: postgres
--

CREATE TABLE esq_ctas_recaudadoras.tbl_clientes (
    codigo character varying(15) NOT NULL,
    nombres character varying(200)
);


ALTER TABLE esq_ctas_recaudadoras.tbl_clientes OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16427)
-- Name: tbl_cuentas; Type: TABLE; Schema: esq_ctas_recaudadoras; Owner: postgres
--

CREATE TABLE esq_ctas_recaudadoras.tbl_cuentas (
    cuenta character varying(20) NOT NULL,
    descripcion character varying(120) NOT NULL,
    cliente character varying(15) NOT NULL,
    monto numeric DEFAULT 0.0 NOT NULL
);


ALTER TABLE esq_ctas_recaudadoras.tbl_cuentas OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16441)
-- Name: tbl_movimientos; Type: TABLE; Schema: esq_ctas_recaudadoras; Owner: postgres
--

CREATE TABLE esq_ctas_recaudadoras.tbl_movimientos (
    codigo integer DEFAULT nextval('esq_ctas_recaudadoras."SEQ_TBL_MOVIMIENTOS"'::regclass) NOT NULL,
    cuenta character varying(20) NOT NULL,
    monto numeric DEFAULT 0.0 NOT NULL,
    transaccion character varying(5) NOT NULL,
    fechamov timestamp without time zone NOT NULL,
    causalmov character varying(120) NOT NULL,
    deudor character varying(15) NOT NULL
);


ALTER TABLE esq_ctas_recaudadoras.tbl_movimientos OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16459)
-- Name: tbl_deudas; Type: TABLE; Schema: esq_deudas; Owner: postgres
--

CREATE TABLE esq_deudas.tbl_deudas (
    codigo integer NOT NULL,
    identificador character varying(15) NOT NULL,
    nombres character varying(200) NOT NULL,
    servicio character varying(15) NOT NULL,
    monto numeric NOT NULL,
    transaccion character varying(5),
    estado character(1)
);


ALTER TABLE esq_deudas.tbl_deudas OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16498)
-- Name: SEQ_PAGO_ID; Type: SEQUENCE; Schema: esq_pagos; Owner: postgres
--

CREATE SEQUENCE esq_pagos."SEQ_PAGO_ID"
    START WITH 10161
    INCREMENT BY 1
    MINVALUE 10000
    MAXVALUE 99999
    CACHE 5;


ALTER TABLE esq_pagos."SEQ_PAGO_ID" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16403)
-- Name: SEQ_TBL_PAGOS; Type: SEQUENCE; Schema: esq_pagos; Owner: postgres
--

CREATE SEQUENCE esq_pagos."SEQ_TBL_PAGOS"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999
    CACHE 1;


ALTER TABLE esq_pagos."SEQ_TBL_PAGOS" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16405)
-- Name: tbl_pagos; Type: TABLE; Schema: esq_pagos; Owner: postgres
--

CREATE TABLE esq_pagos.tbl_pagos (
    codigo integer DEFAULT nextval('esq_pagos."SEQ_TBL_PAGOS"'::regclass) NOT NULL,
    deudor character varying(15) NOT NULL,
    cuentacargo character varying(20) NOT NULL,
    nombres character varying(200) NOT NULL,
    beneficiario character varying(15) NOT NULL,
    razonsocial character varying(200) NOT NULL,
    cuentaabono character varying(20) NOT NULL,
    fechapago timestamp without time zone NOT NULL,
    monto numeric NOT NULL,
    transaccion character varying(5) NOT NULL,
    causal_pago character varying(120) NOT NULL
);


ALTER TABLE esq_pagos.tbl_pagos OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16500)
-- Name: SEQ_TBL_CLIENTE; Type: SEQUENCE; Schema: esqmicroservicios; Owner: postgres
--

CREATE SEQUENCE esqmicroservicios."SEQ_TBL_CLIENTE"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999
    CACHE 1;


ALTER TABLE esqmicroservicios."SEQ_TBL_CLIENTE" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16502)
-- Name: SEQ_TBL_CLIENTE_PRODUCTO; Type: SEQUENCE; Schema: esqmicroservicios; Owner: postgres
--

CREATE SEQUENCE esqmicroservicios."SEQ_TBL_CLIENTE_PRODUCTO"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999
    CACHE 1;


ALTER TABLE esqmicroservicios."SEQ_TBL_CLIENTE_PRODUCTO" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16504)
-- Name: SEQ_TBL_EMPRESA; Type: SEQUENCE; Schema: esqmicroservicios; Owner: postgres
--

CREATE SEQUENCE esqmicroservicios."SEQ_TBL_EMPRESA"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999
    CACHE 1;


ALTER TABLE esqmicroservicios."SEQ_TBL_EMPRESA" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16506)
-- Name: SEQ_TBL_PRODUCTO; Type: SEQUENCE; Schema: esqmicroservicios; Owner: postgres
--

CREATE SEQUENCE esqmicroservicios."SEQ_TBL_PRODUCTO"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999
    CACHE 1;


ALTER TABLE esqmicroservicios."SEQ_TBL_PRODUCTO" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16508)
-- Name: SEQ_TBL_USUARIO; Type: SEQUENCE; Schema: esqmicroservicios; Owner: postgres
--

CREATE SEQUENCE esqmicroservicios."SEQ_TBL_USUARIO"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999
    CACHE 1;


ALTER TABLE esqmicroservicios."SEQ_TBL_USUARIO" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16510)
-- Name: tbl_cliente; Type: TABLE; Schema: esqmicroservicios; Owner: postgres
--

CREATE TABLE esqmicroservicios.tbl_cliente (
    codigo integer DEFAULT nextval('esqmicroservicios."SEQ_TBL_CLIENTE"'::regclass) NOT NULL,
    empresa integer NOT NULL,
    nombres character varying(200)
);


ALTER TABLE esqmicroservicios.tbl_cliente OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16514)
-- Name: tbl_cliente_producto; Type: TABLE; Schema: esqmicroservicios; Owner: postgres
--

CREATE TABLE esqmicroservicios.tbl_cliente_producto (
    codigo integer DEFAULT nextval('esqmicroservicios."SEQ_TBL_CLIENTE_PRODUCTO"'::regclass) NOT NULL,
    cliente integer NOT NULL,
    producto integer NOT NULL,
    monto integer NOT NULL,
    estado character varying(1)
);


ALTER TABLE esqmicroservicios.tbl_cliente_producto OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16518)
-- Name: tbl_empresa; Type: TABLE; Schema: esqmicroservicios; Owner: postgres
--

CREATE TABLE esqmicroservicios.tbl_empresa (
    codigo integer DEFAULT nextval('esqmicroservicios."SEQ_TBL_EMPRESA"'::regclass) NOT NULL,
    razonsocial character varying(200)
);


ALTER TABLE esqmicroservicios.tbl_empresa OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16522)
-- Name: tbl_producto; Type: TABLE; Schema: esqmicroservicios; Owner: postgres
--

CREATE TABLE esqmicroservicios.tbl_producto (
    codigo integer DEFAULT nextval('esqmicroservicios."SEQ_TBL_PRODUCTO"'::regclass) NOT NULL,
    descripcion character varying(200),
    precio integer
);


ALTER TABLE esqmicroservicios.tbl_producto OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16526)
-- Name: tbl_usuario; Type: TABLE; Schema: esqmicroservicios; Owner: postgres
--

CREATE TABLE esqmicroservicios.tbl_usuario (
    id integer DEFAULT nextval('esqmicroservicios."SEQ_TBL_USUARIO"'::regclass) NOT NULL,
    username character varying(10) NOT NULL,
    password character varying(10)
);


ALTER TABLE esqmicroservicios.tbl_usuario OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16530)
-- Name: seq_pago_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_pago_id
    START WITH 10161
    INCREMENT BY 1
    MINVALUE 10000
    MAXVALUE 99999
    CACHE 5;


ALTER TABLE public.seq_pago_id OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16532)
-- Name: serial; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.serial
    START WITH 101
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.serial OWNER TO postgres;

--
-- TOC entry 246 (class 1255 OID 16469)
-- Name: fn_cargo_cuenta(character varying, numeric, character varying, character varying, character varying); Type: FUNCTION; Schema: esq_ctas_clientes; Owner: postgres
--

CREATE FUNCTION esq_ctas_clientes.fn_cargo_cuenta(in_cuenta character varying, in_monto numeric, in_cliente character varying, in_causalmov character varying, in_acreedor character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
 DECLARE resultado VARCHAR(20);
 DECLARE v_transaccion VARCHAR(20);
 DECLARE v_monto NUMERIC;
 
 BEGIN
    resultado:='0000';
    select nextval('esq_ctas_clientes."SEQ_TBL_CUENTAS_TRANSACCION"') into v_transaccion;
	if not exists (select cuenta from esq_ctas_clientes.TBL_CUENTAS where cuenta=in_cuenta)
	 then
	  RAISE EXCEPTION 'Nonexistent Cuenta --> %', in_cuenta;
	end if;
	if not exists (select cuenta from esq_ctas_clientes.TBL_CUENTAS where cliente=in_cliente)
	 then
	  RAISE EXCEPTION 'No existe cliente --> %', in_cliente;
	end if;
	
	
      select monto into v_monto from esq_ctas_clientes.TBL_CUENTAS where cuenta=in_cuenta;
      v_monto:=v_monto-in_monto;
	  if v_monto>0
	  then
	      UPDATE esq_ctas_clientes.TBL_CUENTAS SET monto = v_monto where cuenta=in_cuenta;
		  INSERT  INTO esq_ctas_clientes.TBL_MOVIMIENTOS(cuenta,monto,transaccion,fechamov,causalmov,acreedor) VALUES(in_cuenta,v_monto,v_transaccion,current_timestamp,in_causalmov,in_acreedor); 
		  return resultado|| '- Proceso Conforme '||'- codtransaccion='||v_transaccion;
	  else
	       RAISE EXCEPTION 'Saldo insuficiente para pagar deuda --> %', in_monto;
	  end if;  

	EXCEPTION WHEN others then
    return SQLSTATE || '-' || SQLERRM;
 END;
 $$;


ALTER FUNCTION esq_ctas_clientes.fn_cargo_cuenta(in_cuenta character varying, in_monto numeric, in_cliente character varying, in_causalmov character varying, in_acreedor character varying) OWNER TO postgres;

--
-- TOC entry 247 (class 1255 OID 16470)
-- Name: fn_cargo_cuenta(character varying, numeric, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: esq_ctas_clientes; Owner: postgres
--

CREATE FUNCTION esq_ctas_clientes.fn_cargo_cuenta(in_cuenta character varying, in_monto numeric, in_cliente character varying, in_causalmov character varying, in_acreedor character varying, in_transaccion character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$

 DECLARE resultado VARCHAR(20);
 DECLARE v_monto NUMERIC;
 
 BEGIN
    resultado:='0000';
	if not exists (select cuenta from esq_ctas_clientes.TBL_CUENTAS where cuenta=in_cuenta)
	 then
	  RAISE EXCEPTION 'Nonexistent Cuenta --> %', in_cuenta;
	end if;
	if not exists (select cuenta from esq_ctas_clientes.TBL_CUENTAS where cliente=in_cliente)
	 then
	  RAISE EXCEPTION 'No existe cliente --> %', in_cliente;
	end if;
	
	
      select monto into v_monto from esq_ctas_clientes.TBL_CUENTAS where cuenta=in_cuenta;
      v_monto:=v_monto-in_monto;
	  if v_monto>0
	  then
	      UPDATE esq_ctas_clientes.TBL_CUENTAS SET monto = v_monto where cuenta=in_cuenta;
		  INSERT  INTO esq_ctas_clientes.TBL_MOVIMIENTOS(cuenta,monto,transaccion,fechamov,causalmov,acreedor) VALUES(in_cuenta,v_monto,in_transaccion,current_timestamp,in_causalmov,in_acreedor); 
		  return resultado|| '- Proceso Conforme '||'- codtransaccion='||in_transaccion;
	  else
	       RAISE EXCEPTION 'Saldo insuficiente para pagar deuda --> %', in_monto;
	  end if;  

	EXCEPTION WHEN others then
    return SQLSTATE || '-' || SQLERRM;
 END;
 
$$;


ALTER FUNCTION esq_ctas_clientes.fn_cargo_cuenta(in_cuenta character varying, in_monto numeric, in_cliente character varying, in_causalmov character varying, in_acreedor character varying, in_transaccion character varying) OWNER TO postgres;

--
-- TOC entry 233 (class 1255 OID 16456)
-- Name: fn_abono_cuenta(character varying, numeric, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: esq_ctas_recaudadoras; Owner: postgres
--

CREATE FUNCTION esq_ctas_recaudadoras.fn_abono_cuenta(in_cuenta character varying, in_monto numeric, in_cliente character varying, in_transaccion character varying, in_causalmov character varying, in_deudor character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
 DECLARE resultado VARCHAR(20);
 DECLARE v_transaccion VARCHAR(20);
 DECLARE v_monto NUMERIC;
 
 BEGIN
    resultado:='0000';
   
	if not exists (select cuenta from esq_ctas_recaudadoras.TBL_CUENTAS where cuenta=in_cuenta)
	 then
	  RAISE EXCEPTION 'Nonexistent Cuenta --> %', in_cuenta;
	end if;
	if not exists (select cuenta from esq_ctas_recaudadoras.TBL_CUENTAS where cliente=in_cliente)
	 then
	  RAISE EXCEPTION 'No existe cliente --> %', in_cliente;
	end if;
	
     
	  if in_monto>0
	  then
	      select monto into v_monto from esq_ctas_recaudadoras.TBL_CUENTAS where cuenta=in_cuenta;
          v_monto:=v_monto+in_monto;
	      UPDATE esq_ctas_recaudadoras.TBL_CUENTAS SET monto = v_monto where cuenta=in_cuenta ;
		  INSERT  INTO esq_ctas_recaudadoras.TBL_MOVIMIENTOS(cuenta,monto,transaccion,fechamov,causalmov,deudor) VALUES(in_cuenta,in_monto,in_transaccion,current_timestamp,in_causalmov,in_deudor); 
		  return resultado || '- Proceso Conforme ';
	  else
	       RAISE EXCEPTION 'Saldo insuficiente para pagar deuda --> %', in_monto;
	  end if;  

  	
	EXCEPTION WHEN others then
    return SQLSTATE || '-' || SQLERRM;
 END;
 $$;


ALTER FUNCTION esq_ctas_recaudadoras.fn_abono_cuenta(in_cuenta character varying, in_monto numeric, in_cliente character varying, in_transaccion character varying, in_causalmov character varying, in_deudor character varying) OWNER TO postgres;

--
-- TOC entry 232 (class 1255 OID 16416)
-- Name: fn_pago(character varying, character varying, character varying, character varying, character varying, character varying, numeric, character varying, character varying); Type: FUNCTION; Schema: esq_pagos; Owner: postgres
--

CREATE FUNCTION esq_pagos.fn_pago(in_deudor character varying, in_cuentacargo character varying, in_nombres character varying, in_beneficiario character varying, in_razonsocial character varying, in_cuentaabono character varying, in_monto numeric, in_transaccion character varying, in_causal_pago character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
 DECLARE resultado VARCHAR(20);
 BEGIN
    resultado:='0000';
	
    INSERT  INTO esq_pagos.TBL_PAGOS(deudor,cuentacargo,nombres,beneficiario,razonsocial,cuentaabono,fechapago,monto,transaccion,causal_pago) VALUES(in_deudor,in_cuentacargo,in_nombres,in_beneficiario,in_razonsocial,in_cuentaabono,current_timestamp,in_monto,in_transaccion,in_causal_pago); 
	return resultado || '- Proceso Conforme ';
 

	EXCEPTION WHEN others then
    return SQLSTATE || '-' || SQLERRM;
 END;
 $$;


ALTER FUNCTION esq_pagos.fn_pago(in_deudor character varying, in_cuentacargo character varying, in_nombres character varying, in_beneficiario character varying, in_razonsocial character varying, in_cuentaabono character varying, in_monto numeric, in_transaccion character varying, in_causal_pago character varying) OWNER TO postgres;

--
-- TOC entry 248 (class 1255 OID 16471)
-- Name: fn_pago(character varying, character varying, character varying, character varying, character varying, character varying, timestamp without time zone, numeric, character varying, character varying); Type: FUNCTION; Schema: esq_pagos; Owner: postgres
--

CREATE FUNCTION esq_pagos.fn_pago(in_deudor character varying, in_cuentacargo character varying, in_nombres character varying, in_beneficiario character varying, in_razonsocial character varying, in_cuentaabono character varying, in_fechapago timestamp without time zone, in_monto numeric, in_transaccion character varying, in_causal_pago character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
 DECLARE resultado VARCHAR(20);
 BEGIN
    resultado:='0000';
	
    INSERT  INTO esq_pagos.TBL_PAGOS(deudor,cuentacargo,nombres,beneficiario,cuentaabono,fechapago,monto,transaccion,causal_pago) VALUES(in_deudor,in_cuentacargo,in_nombres,in_beneficiario,in_cuentaabono,current_timestamp,in_monto,in_transaccion,in_causal_pago); 
	return resultado || '- Proceso Conforme ';
 

	EXCEPTION WHEN others then
    return SQLSTATE || '-' || SQLERRM;
 END;
 $$;


ALTER FUNCTION esq_pagos.fn_pago(in_deudor character varying, in_cuentacargo character varying, in_nombres character varying, in_beneficiario character varying, in_razonsocial character varying, in_cuentaabono character varying, in_fechapago timestamp without time zone, in_monto numeric, in_transaccion character varying, in_causal_pago character varying) OWNER TO postgres;

--
-- TOC entry 249 (class 1255 OID 16472)
-- Name: fn_consulta_deudas(integer, integer); Type: FUNCTION; Schema: esqmicroservicios; Owner: postgres
--

CREATE FUNCTION esqmicroservicios.fn_consulta_deudas(in_persona integer, in_empresa integer) RETURNS refcursor
    LANGUAGE plpgsql
    AS $$
DECLARE mycurs refcursor;
 BEGIN     
     OPEN mycurs FOR 
	      SELECT 
		   c.codigo as cliente, 
		   c.nombres as nombres,
		   p.codigo as producto, 
		   p.descripcion as descripcion,
		   p.precio as precio,
		   cp.codigo as recibo,
		   cp.monto as deuda,
           cp.estado as estado		   
		   FROM esqmicroservicios.TBL_CLIENTE c 
		   INNER JOIN esqmicroservicios.TBL_CLIENTE_PRODUCTO cp on c.codigo = cp.cliente 
		   INNER JOIN esqmicroservicios.TBL_PRODUCTO p on p.codigo = cp.producto
		   and c.codigo = in_persona and c.empresa = in_empresa;
     RETURN mycurs;
 END;
$$;


ALTER FUNCTION esqmicroservicios.fn_consulta_deudas(in_persona integer, in_empresa integer) OWNER TO postgres;

--
-- TOC entry 250 (class 1255 OID 16473)
-- Name: fn_pagar_deuda(integer, integer, integer); Type: FUNCTION; Schema: esqmicroservicios; Owner: postgres
--

CREATE FUNCTION esqmicroservicios.fn_pagar_deuda(in_recibo integer, in_producto integer, in_cliente integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
 DECLARE resultado VARCHAR(20);
 BEGIN
  resultado:='0000';
  	 UPDATE esqmicroservicios.TBL_CLIENTE_PRODUCTO SET estado = '1' WHERE codigo = in_recibo and cliente = in_cliente and producto = in_producto;
	    return resultado;
	EXCEPTION WHEN others then
    return SQLSTATE;
 END;
$$;


ALTER FUNCTION esqmicroservicios.fn_pagar_deuda(in_recibo integer, in_producto integer, in_cliente integer) OWNER TO postgres;

--
-- TOC entry 251 (class 1255 OID 16474)
-- Name: fn_pagar_revertir(integer, integer, integer); Type: FUNCTION; Schema: esqmicroservicios; Owner: postgres
--

CREATE FUNCTION esqmicroservicios.fn_pagar_revertir(in_recibo integer, in_producto integer, in_cliente integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
 DECLARE resultado VARCHAR(20);
 BEGIN
  resultado:='0000';
  	 UPDATE esqmicroservicios.TBL_CLIENTE_PRODUCTO SET estado = '0' WHERE codigo= in_recibo and cliente = in_cliente and producto = in_producto;
	    return resultado;
	EXCEPTION WHEN others then
    return SQLSTATE;
 END;
$$;


ALTER FUNCTION esqmicroservicios.fn_pagar_revertir(in_recibo integer, in_producto integer, in_cliente integer) OWNER TO postgres;

--
-- TOC entry 252 (class 1255 OID 16475)
-- Name: fn_registrar_deuda(integer, integer, integer); Type: FUNCTION; Schema: esqmicroservicios; Owner: postgres
--

CREATE FUNCTION esqmicroservicios.fn_registrar_deuda(in_cliente integer, in_producto integer, in_monto integer) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
 DECLARE resultado VARCHAR(20);
 BEGIN
  resultado:='0000';
  	 insert INTO esqmicroservicios.TBL_CLIENTE_PRODUCTO(cliente,producto,monto,estado) VALUES(in_cliente,in_producto,in_monto,'0');
	 return resultado;
	EXCEPTION WHEN others then
    return SQLSTATE;
 END;
$$;


ALTER FUNCTION esqmicroservicios.fn_registrar_deuda(in_cliente integer, in_producto integer, in_monto integer) OWNER TO postgres;

--
-- TOC entry 3049 (class 0 OID 16480)
-- Dependencies: 216
-- Data for Name: tbl_clientes; Type: TABLE DATA; Schema: esq_ctas_clientes; Owner: postgres
--

INSERT INTO esq_ctas_clientes.tbl_clientes (codigo, nombres) VALUES ('15865658', 'Jose Diaz Sarmiento');


--
-- TOC entry 3050 (class 0 OID 16483)
-- Dependencies: 217
-- Data for Name: tbl_cuentas; Type: TABLE DATA; Schema: esq_ctas_clientes; Owner: postgres
--

INSERT INTO esq_ctas_clientes.tbl_cuentas (cuenta, cliente, monto) VALUES ('11205060709500', '15865658', 626.00);


--
-- TOC entry 3051 (class 0 OID 16490)
-- Dependencies: 218
-- Data for Name: tbl_movimientos; Type: TABLE DATA; Schema: esq_ctas_clientes; Owner: postgres
--

INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10000, '11205060709500', 490.40, '10000', '2020-03-06 21:55:29.595386', 'PGTR-PAGO TELEFONIA', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10001, '11205060709500', 480.40, '10001', '2020-03-06 22:23:07.540121', 'PGTR-DEUDA DE TELEFONO', '15865658');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10002, '11205060709500', 470.40, '10002', '2020-03-07 03:06:24.497594', 'PGTR-PAGO TELEFONIA', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10003, '11205060709500', 460.40, '10003', '2020-03-07 03:13:14.006862', 'PGTR-PAGO TELEFONIA', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10004, '11205060709500', 450.40, '10004', '2020-03-07 03:14:51.726749', 'PGTR-PAGO TELEFONIA', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10005, '11205060709500', 440.40, '10005', '2020-03-07 05:34:44.235579', 'PGTR-PAGO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10006, '11205060709500', 440.40, '10006', '2020-03-07 05:34:44.239515', 'PGTR-PAGO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10007, '11205060709500', 430.40, '10007', '2020-03-07 05:34:53.825414', 'PGTR-PAGO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10008, '11205060709500', 420.40, '10008', '2020-03-07 05:34:54.634812', 'PGTR-PAGO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10009, '11205060709500', 410.40, '10009', '2020-03-07 05:35:20.076045', 'PGTR-PAGO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10010, '11205060709500', 400.40, '10010', '2020-03-07 05:35:21.584581', 'PGTR-PAGO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10011, '11205060709500', 390.40, '10011', '2020-03-07 05:35:27.414354', 'PGTR-PAGO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10012, '11205060709500', 380.40, '10012', '2020-03-07 05:39:03.024212', 'PGTR-PAGO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10013, '11205060709500', 370.40, '10013', '2020-03-07 05:39:54.150328', 'PGTR-PAGO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10014, '11205060709500', 360.40, '10014', '2020-03-07 10:27:39.190561', 'PGTR-PAGO TELEFONIA', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10015, '11205060709500', 350.40, '10015', '2020-03-07 10:28:16.179598', 'PGTR-PAGO TELEFONIA', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10016, '11205060709500', 340.40, '10016', '2020-03-08 11:22:51.44198', 'PGTR-PAGO TELEFONIA', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10017, '11205060709500', 330.40, '10017', '2020-03-08 11:22:55.320974', 'PGTR-PAGO TELEFONIA', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10018, '11205060709500', 320.40, '10018', '2020-03-08 12:04:13.627052', 'PGTR-PAGO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10019, '11205060709500', 310.40, '10019', '2020-03-08 12:04:37.300967', 'PGTR-PAGO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10020, '11205060709500', 190.40, '10020', '2020-05-09 13:02:04.431752', 'PGTR-PAGO-SERV', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10021, '11205060709500', 180.40, '10021', '2020-05-09 13:03:22.902928', 'PGTR-PAGO-SERV', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10022, '11205060709500', 170.40, '10022', '2020-05-09 13:04:00.369708', 'PGTR-PAGO-SERV', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10023, '11205060709500', 160.40, '10023', '2020-05-09 14:12:22.475868', 'PGTR-PAGO-SERV', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10024, '11205060709500', 150.40, '10024', '2020-05-09 14:15:20.623772', 'PGTR-PAGO-SERV', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10025, '11205060709500', 140.40, '10025', '2020-05-09 14:21:29.91318', 'PGTR-PAGO-SERV', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10026, '11205060709500', 130.40, '10027', '2020-05-09 14:23:23.148196', 'PGTR-PAGO-SERV', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10027, '11205060709500', 120.40, '10028', '2020-05-09 14:27:07.627852', 'PGTR-PAGO-SERV', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10028, '11205060709500', 110.40, '10030', '2020-05-09 14:31:55.483844', 'PGTR-PAGO-SERV', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10029, '11205060709500', 100.40, '10005', '2020-06-20 07:56:23.261378', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10030, '11205060709500', 90.40, '10010', '2020-06-20 08:31:22.010358', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10031, '11205060709500', 80.40, '10015', '2020-06-20 08:32:02.462256', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10032, '11205060709500', 70.40, '10020', '2020-06-20 08:35:18.294839', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10033, '11205060709500', 60.40, '10005', '2020-06-20 08:38:47.973722', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10034, '11205060709500', 800, '10005', '2020-06-20 08:39:18.372064', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10035, '11205060709500', 56.40, '10005', '2020-06-20 08:42:56.527943', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10036, '11205060709500', 798.00, '10005', '2020-06-20 08:45:37.652936', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10037, '11205060709500', 788.00, '10025', '2020-06-20 08:47:48.913569', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10038, '11205060709500', 778.00, '10030', '2020-06-20 08:50:03.143235', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10039, '11205060709500', 768.00, '10035', '2020-06-20 08:53:12.999254', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10040, '11205060709500', 758.00, '10040', '2020-06-20 08:53:17.989503', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10041, '11205060709500', 748.00, '10045', '2020-06-20 09:01:13.973459', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10042, '11205060709500', 738.00, '10050', '2020-06-20 09:01:21.465525', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10043, '11205060709500', 736.00, '10005', '2020-06-20 09:04:18.778134', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10044, '11205060709500', 726.00, '10055', '2020-06-20 09:05:09.521023', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10045, '11205060709500', 716.00, '10060', '2020-06-20 09:07:48.704526', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10046, '11205060709500', 706.00, '10065', '2020-06-20 09:07:53.822688', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10047, '11205060709500', 696.00, '10070', '2020-06-20 09:08:20.873215', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10048, '11205060709500', 694.00, '10005', '2020-06-20 09:08:45.880281', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10049, '11205060709500', 692.00, '10005', '2020-06-20 09:08:49.377142', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10050, '11205060709500', 690.00, '10005', '2020-06-20 12:01:32.046632', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10051, '11205060709500', 688.00, '10005', '2020-06-20 12:03:21.712198', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10052, '11205060709500', 686.00, '10005', '2020-06-20 12:05:22.79714', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10053, '11205060709500', 684.00, '10080', '2020-06-20 12:13:54.257633', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10054, '11205060709500', 682.00, '10085', '2020-06-20 12:14:37.210437', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10055, '11205060709500', 680.00, '10090', '2020-06-20 12:14:44.519533', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10056, '11205060709500', 678.00, '10095', '2020-06-20 12:15:31.840607', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10057, '11205060709500', 668.00, '10100', '2020-06-20 12:18:14.32515', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10058, '11205060709500', 666.00, '10105', '2020-06-20 12:56:35.210085', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10059, '11205060709500', 664.00, '10110', '2020-06-20 12:57:24.115471', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10060, '11205060709500', 662.00, '10115', '2020-06-20 12:58:23.175847', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10061, '11205060709500', 660.00, '10120', '2020-06-20 12:58:28.840479', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10062, '11205060709500', 658.00, '10125', '2020-06-20 12:58:41.631999', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10063, '11205060709500', 656.00, '10130', '2020-06-20 13:01:21.141355', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10064, '11205060709500', 654.00, '10135', '2020-06-20 13:01:36.490331', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10065, '11205060709500', 652.00, '10140', '2020-06-20 13:10:22.679332', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10066, '11205060709500', 650.00, '10145', '2020-06-20 13:10:30.096377', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10067, '11205060709500', 648.00, '10150', '2020-06-20 13:12:42.166657', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10068, '11205060709500', 646.00, '10155', '2020-06-20 13:13:47.536321', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10069, '11205060709500', 636.00, '10160', '2020-06-20 13:14:19.562765', 'PAGO TELEFONO', '20602649412');
INSERT INTO esq_ctas_clientes.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, acreedor) VALUES (10070, '11205060709500', 626.00, '10166', '2020-07-18 02:09:36.008638', 'PAGO TELEFONO', '20602649412');


--
-- TOC entry 3043 (class 0 OID 16422)
-- Dependencies: 210
-- Data for Name: tbl_clientes; Type: TABLE DATA; Schema: esq_ctas_recaudadoras; Owner: postgres
--

INSERT INTO esq_ctas_recaudadoras.tbl_clientes (codigo, nombres) VALUES ('20602649412', 'Empresa UBRBAN SAC');


--
-- TOC entry 3044 (class 0 OID 16427)
-- Dependencies: 211
-- Data for Name: tbl_cuentas; Type: TABLE DATA; Schema: esq_ctas_recaudadoras; Owner: postgres
--

INSERT INTO esq_ctas_recaudadoras.tbl_cuentas (cuenta, descripcion, cliente, monto) VALUES ('11206060709890', 'CUENTA RECAUDADORA', '20602649412', 10010.00);


--
-- TOC entry 3045 (class 0 OID 16441)
-- Dependencies: 212
-- Data for Name: tbl_movimientos; Type: TABLE DATA; Schema: esq_ctas_recaudadoras; Owner: postgres
--

INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (1, '11206060709890', 10, '10001', '2020-03-06 22:34:40.805937', 'PGTR-DEUDA DE TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (2, '11206060709890', 10, '10004', '2020-03-07 03:57:51.243177', 'PGTR-PAGO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (3, '11206060709890', 10, '10011', '2020-03-07 05:35:29.373698', 'PGTR-PAGO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (4, '11206060709890', 10, '10011', '2020-03-07 05:35:29.728806', 'PGTR-PAGO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (5, '11206060709890', 10, '10012', '2020-03-07 05:39:04.858303', 'PGTR-PAGO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (6, '11206060709890', 10, '10013', '2020-03-07 05:39:55.620411', 'PGTR-PAGO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (7, '11206060709890', 10, '10004', '2020-03-07 10:27:58.633284', 'PGTR-PAGO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (8, '11206060709890', 10, '10004', '2020-03-07 10:28:32.905796', 'PGTR-PAGO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (9, '11206060709890', 10, '10018', '2020-03-08 12:04:17.40212', 'PGTR-PAGO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (10, '11206060709890', 10, '10019', '2020-03-08 12:04:38.84951', 'PGTR-PAGO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (11, '11206060709890', 120.00, '10020', '2020-05-09 13:29:14.262292', 'PGTR-PAGO-SERV', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (12, '11206060709890', 10.00, '10022', '2020-05-09 13:30:15.151116', 'PGTR-PAGO-SERV', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (13, '11206060709890', 10.00, '10021', '2020-05-09 13:35:50.10408', 'PGTR-PAGO-SERV', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (14, '11206060709890', 10.00, '10024', '2020-05-09 14:15:22.120225', 'PGTR-PAGO-SERV', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (15, '11206060709890', 10.00, '10025', '2020-05-09 14:21:31.192742', 'PGTR-PAGO-SERV', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (16, '11206060709890', 10.00, '10030', '2020-05-09 14:31:56.843072', 'PGTR-PAGO-SERV', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (17, '11206060709890', 10.00, '10005', '2020-06-20 08:15:23.249045', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (18, '11206060709890', 10.00, '10005', '2020-06-20 08:53:05.701519', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (19, '11206060709890', 10.00, '10005', '2020-06-20 09:00:00.000928', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (20, '11206060709890', 10.00, '10005', '2020-06-20 09:00:02.60851', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (21, '11206060709890', 10.00, '10005', '2020-06-20 09:00:04.515465', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (22, '11206060709890', 10.00, '10045', '2020-06-20 09:01:14.934456', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (23, '11206060709890', 10.00, '10050', '2020-06-20 09:01:22.432054', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (24, '11206060709890', 10.00, '10055', '2020-06-20 09:05:10.467742', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (25, '11206060709890', 10.00, '10060', '2020-06-20 09:07:49.794247', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (26, '11206060709890', 10.00, '10065', '2020-06-20 09:07:54.764588', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (27, '11206060709890', 10.00, '10070', '2020-06-20 09:08:21.870333', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (28, '11206060709890', 2.00, '10005', '2020-06-20 12:08:34.106225', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (29, '11206060709890', 2.00, '10005', '2020-06-20 12:09:20.907921', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (30, '11206060709890', 2.00, '10005', '2020-06-20 12:11:09.693767', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (31, '11206060709890', 2.00, '10080', '2020-06-20 12:13:55.798587', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (32, '11206060709890', 2.00, '10090', '2020-06-20 12:14:45.615005', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (33, '11206060709890', 2.00, '10095', '2020-06-20 12:15:33.484128', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (34, '11206060709890', 10.00, '10100', '2020-06-20 12:18:15.711177', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (35, '11206060709890', 2.00, '10105', '2020-06-20 12:56:36.449253', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (36, '11206060709890', 2.00, '10110', '2020-06-20 12:57:25.257491', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (37, '11206060709890', 2.00, '10115', '2020-06-20 12:58:24.254428', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (38, '11206060709890', 2.00, '10120', '2020-06-20 12:58:30.116766', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (39, '11206060709890', 2.00, '10125', '2020-06-20 12:58:43.749094', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (40, '11206060709890', 2.00, '10130', '2020-06-20 13:01:22.289163', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (41, '11206060709890', 2.00, '10135', '2020-06-20 13:01:37.650616', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (42, '11206060709890', 2.00, '10140', '2020-06-20 13:10:24.811715', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (43, '11206060709890', 2.00, '10145', '2020-06-20 13:10:31.414367', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (44, '11206060709890', 2.00, '10150', '2020-06-20 13:12:43.29859', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (45, '11206060709890', 2.00, '10155', '2020-06-20 13:13:48.486886', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (46, '11206060709890', 10.00, '10160', '2020-06-20 13:14:20.677689', 'PAGO TELEFONO', '15865658');
INSERT INTO esq_ctas_recaudadoras.tbl_movimientos (codigo, cuenta, monto, transaccion, fechamov, causalmov, deudor) VALUES (47, '11206060709890', 10.00, '10166', '2020-07-18 02:09:36.331042', 'PAGO TELEFONO', '15865658');


--
-- TOC entry 3046 (class 0 OID 16459)
-- Dependencies: 213
-- Data for Name: tbl_deudas; Type: TABLE DATA; Schema: esq_deudas; Owner: postgres
--

INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (3, '15865658', 'Jose Diaz Sarmiento', 'PGTR03', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (4, '15865658', 'Jose Diaz Sarmiento', 'PGTR04', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (5, '15865658', 'Jose Diaz Sarmiento', 'PGTR05', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (6, '15865658', 'Jose Diaz Sarmiento', 'PGTR06', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (7, '15865658', 'Jose Diaz Sarmiento', 'PGTR07', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (8, '15865658', 'Jose Diaz Sarmiento', 'PGTR08', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (9, '15865658', 'Jose Diaz Sarmiento', 'PGTR09', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (10, '15865658', 'Jose Diaz Sarmiento', 'PGTR10', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (11, '15865658', 'Jose Diaz Sarmiento', 'PGTR11', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (12, '15865658', 'Jose Diaz Sarmiento', 'PGTR12', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (13, '15865658', 'Jose Diaz Sarmiento', 'PGTR13', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (14, '15865658', 'Jose Diaz Sarmiento', 'PGTR14', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (15, '15865658', 'Jose Diaz Sarmiento', 'PGTR15', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (16, '15865658', 'Jose Diaz Sarmiento', 'PGTR16', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (17, '15865658', 'Jose Diaz Sarmiento', 'PGTR17', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (18, '15865658', 'Jose Diaz Sarmiento', 'PGTR18', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (19, '15865658', 'Jose Diaz Sarmiento', 'PGTR19', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (20, '15865658', 'Jose Diaz Sarmiento', 'PGTR20', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (21, '15865658', 'Jose Diaz Sarmiento', 'PGTR21', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (22, '15865658', 'Jose Diaz Sarmiento', 'PGTR22', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (23, '15865658', 'Jose Diaz Sarmiento', 'PGTR23', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (24, '15865658', 'Jose Diaz Sarmiento', 'PGTR24', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (25, '15865658', 'Jose Diaz Sarmiento', 'PGTR25', 120.00, NULL, '0');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (1, '15865658', 'Jose Diaz Sarmiento', 'PGTR01', 120.00, '88899', '1');
INSERT INTO esq_deudas.tbl_deudas (codigo, identificador, nombres, servicio, monto, transaccion, estado) VALUES (2, '15865658', 'Jose Diaz Sarmiento', 'PGTR02', 120.00, '77778', '1');


--
-- TOC entry 3041 (class 0 OID 16405)
-- Dependencies: 208
-- Data for Name: tbl_pagos; Type: TABLE DATA; Schema: esq_pagos; Owner: postgres
--

INSERT INTO esq_pagos.tbl_pagos (codigo, deudor, cuentacargo, nombres, beneficiario, razonsocial, cuentaabono, fechapago, monto, transaccion, causal_pago) VALUES (1, '15865658', '11205060709500', 'Jose Diaz Sarmiento', '20602649412', 'Empresa UBRBAN SAC', '11206060709890', '2020-07-18 05:31:58.669275', 100, '12345', 'PGTR-PAGO TELEFONIA');


--
-- TOC entry 3058 (class 0 OID 16510)
-- Dependencies: 225
-- Data for Name: tbl_cliente; Type: TABLE DATA; Schema: esqmicroservicios; Owner: postgres
--

INSERT INTO esqmicroservicios.tbl_cliente (codigo, empresa, nombres) VALUES (1, 1, 'Jose Diaz');
INSERT INTO esqmicroservicios.tbl_cliente (codigo, empresa, nombres) VALUES (2, 1, 'Miguel Cardenas');
INSERT INTO esqmicroservicios.tbl_cliente (codigo, empresa, nombres) VALUES (3, 1, 'Andres Bellido');
INSERT INTO esqmicroservicios.tbl_cliente (codigo, empresa, nombres) VALUES (4, 1, 'Willy Espinoza');
INSERT INTO esqmicroservicios.tbl_cliente (codigo, empresa, nombres) VALUES (5, 1, 'Pedro Gallese');


--
-- TOC entry 3059 (class 0 OID 16514)
-- Dependencies: 226
-- Data for Name: tbl_cliente_producto; Type: TABLE DATA; Schema: esqmicroservicios; Owner: postgres
--

INSERT INTO esqmicroservicios.tbl_cliente_producto (codigo, cliente, producto, monto, estado) VALUES (2, 1, 1, 200, '0');
INSERT INTO esqmicroservicios.tbl_cliente_producto (codigo, cliente, producto, monto, estado) VALUES (7, 1, 1, 400, '0');
INSERT INTO esqmicroservicios.tbl_cliente_producto (codigo, cliente, producto, monto, estado) VALUES (10, 1, 1, 500, '1');
INSERT INTO esqmicroservicios.tbl_cliente_producto (codigo, cliente, producto, monto, estado) VALUES (9, 1, 1, 400, '1');
INSERT INTO esqmicroservicios.tbl_cliente_producto (codigo, cliente, producto, monto, estado) VALUES (11, 1, 1, 200, '1');
INSERT INTO esqmicroservicios.tbl_cliente_producto (codigo, cliente, producto, monto, estado) VALUES (6, 1, 1, 400, '1');
INSERT INTO esqmicroservicios.tbl_cliente_producto (codigo, cliente, producto, monto, estado) VALUES (8, 1, 1, 400, '1');
INSERT INTO esqmicroservicios.tbl_cliente_producto (codigo, cliente, producto, monto, estado) VALUES (13, 1, 1, 100, '1');
INSERT INTO esqmicroservicios.tbl_cliente_producto (codigo, cliente, producto, monto, estado) VALUES (15, 1, 1, 150, '1');
INSERT INTO esqmicroservicios.tbl_cliente_producto (codigo, cliente, producto, monto, estado) VALUES (12, 1, 1, 200, '1');
INSERT INTO esqmicroservicios.tbl_cliente_producto (codigo, cliente, producto, monto, estado) VALUES (14, 1, 1, 2333, '1');
INSERT INTO esqmicroservicios.tbl_cliente_producto (codigo, cliente, producto, monto, estado) VALUES (3, 1, 1, 200, '1');
INSERT INTO esqmicroservicios.tbl_cliente_producto (codigo, cliente, producto, monto, estado) VALUES (4, 1, 1, 300, '1');
INSERT INTO esqmicroservicios.tbl_cliente_producto (codigo, cliente, producto, monto, estado) VALUES (5, 1, 1, 300, '1');
INSERT INTO esqmicroservicios.tbl_cliente_producto (codigo, cliente, producto, monto, estado) VALUES (1, 1, 1, 100, '1');
INSERT INTO esqmicroservicios.tbl_cliente_producto (codigo, cliente, producto, monto, estado) VALUES (16, 1, 1, 23, '0');


--
-- TOC entry 3060 (class 0 OID 16518)
-- Dependencies: 227
-- Data for Name: tbl_empresa; Type: TABLE DATA; Schema: esqmicroservicios; Owner: postgres
--

INSERT INTO esqmicroservicios.tbl_empresa (codigo, razonsocial) VALUES (1, 'TELEFONIA');
INSERT INTO esqmicroservicios.tbl_empresa (codigo, razonsocial) VALUES (2, 'SERVICIOS DE AGUA');
INSERT INTO esqmicroservicios.tbl_empresa (codigo, razonsocial) VALUES (3, 'SERVICIOS DE LUZ');


--
-- TOC entry 3061 (class 0 OID 16522)
-- Dependencies: 228
-- Data for Name: tbl_producto; Type: TABLE DATA; Schema: esqmicroservicios; Owner: postgres
--

INSERT INTO esqmicroservicios.tbl_producto (codigo, descripcion, precio) VALUES (1, 'AGUA', 100);
INSERT INTO esqmicroservicios.tbl_producto (codigo, descripcion, precio) VALUES (2, 'TELEFONO', 200);
INSERT INTO esqmicroservicios.tbl_producto (codigo, descripcion, precio) VALUES (3, 'LUZ', 300);
INSERT INTO esqmicroservicios.tbl_producto (codigo, descripcion, precio) VALUES (4, 'EDUCACION', 300);


--
-- TOC entry 3062 (class 0 OID 16526)
-- Dependencies: 229
-- Data for Name: tbl_usuario; Type: TABLE DATA; Schema: esqmicroservicios; Owner: postgres
--

INSERT INTO esqmicroservicios.tbl_usuario (id, username, password) VALUES (1, 'admin', '123456');


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 214
-- Name: SEQ_TBL_CUENTAS_TRANSACCION; Type: SEQUENCE SET; Schema: esq_ctas_clientes; Owner: postgres
--

SELECT pg_catalog.setval('esq_ctas_clientes."SEQ_TBL_CUENTAS_TRANSACCION"', 10030, true);


--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 215
-- Name: SEQ_TBL_MOVIMIENTOS; Type: SEQUENCE SET; Schema: esq_ctas_clientes; Owner: postgres
--

SELECT pg_catalog.setval('esq_ctas_clientes."SEQ_TBL_MOVIMIENTOS"', 10070, true);


--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 209
-- Name: SEQ_TBL_MOVIMIENTOS; Type: SEQUENCE SET; Schema: esq_ctas_recaudadoras; Owner: postgres
--

SELECT pg_catalog.setval('esq_ctas_recaudadoras."SEQ_TBL_MOVIMIENTOS"', 47, true);


--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 219
-- Name: SEQ_PAGO_ID; Type: SEQUENCE SET; Schema: esq_pagos; Owner: postgres
--

SELECT pg_catalog.setval('esq_pagos."SEQ_PAGO_ID"', 10161, false);


--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 207
-- Name: SEQ_TBL_PAGOS; Type: SEQUENCE SET; Schema: esq_pagos; Owner: postgres
--

SELECT pg_catalog.setval('esq_pagos."SEQ_TBL_PAGOS"', 2, true);


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 220
-- Name: SEQ_TBL_CLIENTE; Type: SEQUENCE SET; Schema: esqmicroservicios; Owner: postgres
--

SELECT pg_catalog.setval('esqmicroservicios."SEQ_TBL_CLIENTE"', 6, true);


--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 221
-- Name: SEQ_TBL_CLIENTE_PRODUCTO; Type: SEQUENCE SET; Schema: esqmicroservicios; Owner: postgres
--

SELECT pg_catalog.setval('esqmicroservicios."SEQ_TBL_CLIENTE_PRODUCTO"', 16, true);


--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 222
-- Name: SEQ_TBL_EMPRESA; Type: SEQUENCE SET; Schema: esqmicroservicios; Owner: postgres
--

SELECT pg_catalog.setval('esqmicroservicios."SEQ_TBL_EMPRESA"', 3, true);


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 223
-- Name: SEQ_TBL_PRODUCTO; Type: SEQUENCE SET; Schema: esqmicroservicios; Owner: postgres
--

SELECT pg_catalog.setval('esqmicroservicios."SEQ_TBL_PRODUCTO"', 4, true);


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 224
-- Name: SEQ_TBL_USUARIO; Type: SEQUENCE SET; Schema: esqmicroservicios; Owner: postgres
--

SELECT pg_catalog.setval('esqmicroservicios."SEQ_TBL_USUARIO"', 1, true);


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 230
-- Name: seq_pago_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_pago_id', 10170, true);


--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 231
-- Name: serial; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.serial', 101, true);


--
-- TOC entry 2892 (class 2606 OID 16535)
-- Name: tbl_clientes xpktbl_clientes; Type: CONSTRAINT; Schema: esq_ctas_clientes; Owner: postgres
--

ALTER TABLE ONLY esq_ctas_clientes.tbl_clientes
    ADD CONSTRAINT xpktbl_clientes PRIMARY KEY (codigo);


--
-- TOC entry 2894 (class 2606 OID 16537)
-- Name: tbl_cuentas xpktbl_cuentas; Type: CONSTRAINT; Schema: esq_ctas_clientes; Owner: postgres
--

ALTER TABLE ONLY esq_ctas_clientes.tbl_cuentas
    ADD CONSTRAINT xpktbl_cuentas PRIMARY KEY (cuenta);


--
-- TOC entry 2896 (class 2606 OID 16539)
-- Name: tbl_movimientos xpktbl_movimientos; Type: CONSTRAINT; Schema: esq_ctas_clientes; Owner: postgres
--

ALTER TABLE ONLY esq_ctas_clientes.tbl_movimientos
    ADD CONSTRAINT xpktbl_movimientos PRIMARY KEY (codigo);


--
-- TOC entry 2884 (class 2606 OID 16426)
-- Name: tbl_clientes xpktbl_clientes; Type: CONSTRAINT; Schema: esq_ctas_recaudadoras; Owner: postgres
--

ALTER TABLE ONLY esq_ctas_recaudadoras.tbl_clientes
    ADD CONSTRAINT xpktbl_clientes PRIMARY KEY (codigo);


--
-- TOC entry 2886 (class 2606 OID 16435)
-- Name: tbl_cuentas xpktbl_cuentas; Type: CONSTRAINT; Schema: esq_ctas_recaudadoras; Owner: postgres
--

ALTER TABLE ONLY esq_ctas_recaudadoras.tbl_cuentas
    ADD CONSTRAINT xpktbl_cuentas PRIMARY KEY (cuenta);


--
-- TOC entry 2888 (class 2606 OID 16449)
-- Name: tbl_movimientos xpktbl_movimientos; Type: CONSTRAINT; Schema: esq_ctas_recaudadoras; Owner: postgres
--

ALTER TABLE ONLY esq_ctas_recaudadoras.tbl_movimientos
    ADD CONSTRAINT xpktbl_movimientos PRIMARY KEY (codigo);


--
-- TOC entry 2890 (class 2606 OID 16466)
-- Name: tbl_deudas xpktbl_deudas; Type: CONSTRAINT; Schema: esq_deudas; Owner: postgres
--

ALTER TABLE ONLY esq_deudas.tbl_deudas
    ADD CONSTRAINT xpktbl_deudas PRIMARY KEY (codigo);


--
-- TOC entry 2880 (class 2606 OID 16412)
-- Name: tbl_pagos tbl_pagos_transaccion_key; Type: CONSTRAINT; Schema: esq_pagos; Owner: postgres
--

ALTER TABLE ONLY esq_pagos.tbl_pagos
    ADD CONSTRAINT tbl_pagos_transaccion_key UNIQUE (transaccion);


--
-- TOC entry 2882 (class 2606 OID 16414)
-- Name: tbl_pagos xpktbl_pagos; Type: CONSTRAINT; Schema: esq_pagos; Owner: postgres
--

ALTER TABLE ONLY esq_pagos.tbl_pagos
    ADD CONSTRAINT xpktbl_pagos PRIMARY KEY (codigo);


--
-- TOC entry 2898 (class 2606 OID 16541)
-- Name: tbl_cliente xpktbl_cliente; Type: CONSTRAINT; Schema: esqmicroservicios; Owner: postgres
--

ALTER TABLE ONLY esqmicroservicios.tbl_cliente
    ADD CONSTRAINT xpktbl_cliente PRIMARY KEY (codigo);


--
-- TOC entry 2900 (class 2606 OID 16543)
-- Name: tbl_cliente_producto xpktbl_cliente_producto; Type: CONSTRAINT; Schema: esqmicroservicios; Owner: postgres
--

ALTER TABLE ONLY esqmicroservicios.tbl_cliente_producto
    ADD CONSTRAINT xpktbl_cliente_producto PRIMARY KEY (codigo, cliente, producto);


--
-- TOC entry 2902 (class 2606 OID 16545)
-- Name: tbl_empresa xpktbl_empresa; Type: CONSTRAINT; Schema: esqmicroservicios; Owner: postgres
--

ALTER TABLE ONLY esqmicroservicios.tbl_empresa
    ADD CONSTRAINT xpktbl_empresa PRIMARY KEY (codigo);


--
-- TOC entry 2904 (class 2606 OID 16547)
-- Name: tbl_producto xpktbl_producto; Type: CONSTRAINT; Schema: esqmicroservicios; Owner: postgres
--

ALTER TABLE ONLY esqmicroservicios.tbl_producto
    ADD CONSTRAINT xpktbl_producto PRIMARY KEY (codigo);


--
-- TOC entry 2906 (class 2606 OID 16549)
-- Name: tbl_usuario xpktbl_usuario; Type: CONSTRAINT; Schema: esqmicroservicios; Owner: postgres
--

ALTER TABLE ONLY esqmicroservicios.tbl_usuario
    ADD CONSTRAINT xpktbl_usuario PRIMARY KEY (id);


--
-- TOC entry 2909 (class 2606 OID 16550)
-- Name: tbl_cuentas r1; Type: FK CONSTRAINT; Schema: esq_ctas_clientes; Owner: postgres
--

ALTER TABLE ONLY esq_ctas_clientes.tbl_cuentas
    ADD CONSTRAINT r1 FOREIGN KEY (cliente) REFERENCES esq_ctas_clientes.tbl_clientes(codigo);


--
-- TOC entry 2910 (class 2606 OID 16555)
-- Name: tbl_movimientos r2; Type: FK CONSTRAINT; Schema: esq_ctas_clientes; Owner: postgres
--

ALTER TABLE ONLY esq_ctas_clientes.tbl_movimientos
    ADD CONSTRAINT r2 FOREIGN KEY (cuenta) REFERENCES esq_ctas_clientes.tbl_cuentas(cuenta);


--
-- TOC entry 2907 (class 2606 OID 16436)
-- Name: tbl_cuentas r1; Type: FK CONSTRAINT; Schema: esq_ctas_recaudadoras; Owner: postgres
--

ALTER TABLE ONLY esq_ctas_recaudadoras.tbl_cuentas
    ADD CONSTRAINT r1 FOREIGN KEY (cliente) REFERENCES esq_ctas_recaudadoras.tbl_clientes(codigo);


--
-- TOC entry 2908 (class 2606 OID 16451)
-- Name: tbl_movimientos r2; Type: FK CONSTRAINT; Schema: esq_ctas_recaudadoras; Owner: postgres
--

ALTER TABLE ONLY esq_ctas_recaudadoras.tbl_movimientos
    ADD CONSTRAINT r2 FOREIGN KEY (cuenta) REFERENCES esq_ctas_recaudadoras.tbl_cuentas(cuenta);


--
-- TOC entry 2911 (class 2606 OID 16560)
-- Name: tbl_cliente r1; Type: FK CONSTRAINT; Schema: esqmicroservicios; Owner: postgres
--

ALTER TABLE ONLY esqmicroservicios.tbl_cliente
    ADD CONSTRAINT r1 FOREIGN KEY (empresa) REFERENCES esqmicroservicios.tbl_empresa(codigo);


--
-- TOC entry 2912 (class 2606 OID 16565)
-- Name: tbl_cliente_producto r2; Type: FK CONSTRAINT; Schema: esqmicroservicios; Owner: postgres
--

ALTER TABLE ONLY esqmicroservicios.tbl_cliente_producto
    ADD CONSTRAINT r2 FOREIGN KEY (cliente) REFERENCES esqmicroservicios.tbl_cliente(codigo);


--
-- TOC entry 2913 (class 2606 OID 16570)
-- Name: tbl_cliente_producto r3; Type: FK CONSTRAINT; Schema: esqmicroservicios; Owner: postgres
--

ALTER TABLE ONLY esqmicroservicios.tbl_cliente_producto
    ADD CONSTRAINT r3 FOREIGN KEY (producto) REFERENCES esqmicroservicios.tbl_producto(codigo);


-- Completed on 2020-07-18 02:21:21 -05

--
-- PostgreSQL database dump complete
--

