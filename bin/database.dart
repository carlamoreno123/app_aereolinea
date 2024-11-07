import 'package:mysql1/mysql1.dart';

class Database {
  // Propiedades
  final String _host = 'localhost';
  final int _port = 3306;
  final String _user = 'root';

  // Métodos
  instalacion() async {
    var settings = ConnectionSettings(
      host: _host,
      port: _port,
      user: _user,
    );
    var conn = await MySqlConnection.connect(settings);
    try {
      await _crearDB(conn);
      await _crearTablaVentaBillete(conn);
      await _crearTablaPasajeros(conn);
      await _crearTablaAsientos(conn);
      await _crearTablaVuelo(conn);
      await _crearTablaInformes(conn);
      await conn.close();
      return true;
    } catch (e) {
      print(e);
      await conn.close();
    }
  }

  Future<MySqlConnection> conexion() async {
    var settings = ConnectionSettings(
        host: _host, port: _port, user: _user, db: 'aereolineadb');

    return await MySqlConnection.connect(settings);
  }

  _crearDB(conn) async {
    await conn.query('CREATE DATABASE IF NOT EXISTS aereolineadbdb');
    await conn.query('USE aereolineadbdb');
    print('Conectado a aereolineadbdb');
  }

  _crearTablaVuelo(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS Vuelos(
        idvuelo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        idasiento INT NOT NULL,
        numerovuelo INT NOT NULL UNIQUE,
        origen VARCHAR(50) NOT NULL,
        destino VARCHAR(50) NOT NULL,
        fecha DATE  NOT NULL,
        horasalida DATETIME  NOT NULL,
        horallegada DATETIME NOT NULL,
        modeloavion VARCHAR(20) NOT NULL,
        FOREIGN KEY (idasiento) REFERENCES Asignacion_asientos (idasiento)
       
      )''');
    print('Tabla vuelo creada');
  }

  _crearTablaPasajeros(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS Pasajeros(
        idpasajero INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        idbillete INT NOT NULL,
        nombre VARCHAR(50) NOT NULL,
        apellido VARCHAR(50) NOT NULL,
        DNI VARCHAR(200) NOT NULL,
        direccion VARCHAR(50) NOT NULL,
        telefono INT NOT NULL,
        
        FOREIGN KEY (idbillete) REFERENCES Venta_billetes (idbillete)
       
        )''');
    print('Tabla Pasajeros creada');
  }

  _crearTablaVentaBillete(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS Venta_billetes(
        idbillete INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        idpasajero INT NOT NULL,
        fechacompra DATE NOT NULL,
        claseservicio VARCHAR(50) NOT NULL,
        precio DECIMAL NOT NULL,
        formapago VARCHAR(50) NOT NULL,
        FOREIGN KEY (idpasajero) REFERENCES Pasajeros(idpasajero)
       
      )''');
    print('Tabla Venta_Billetes creada');
  }

  _crearTablaAsientos(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS Asignacion_asientos(
        idasiento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        idpasajero INT NOT NULL,
        idbillete INT NOT NULL,
        numeroasiento INT NOT NULL,
        ocupado BOOLEAN,
        FOREIGN KEY (idpasajero) REFERENCES Pasajeros(idpasajero),
        FOREIGN KEY (idbillete) REFERENCES Venta_billetes(idbillete)

      )''');
    print('Tabla Asignacion_asientos creada');
  }

  _crearTablaInformes(conn) async {
    await conn.query('''CREATE TABLE IF NOT EXISTS Informes(
        idventa INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        idvuelo INT NOT NULL,
        idpasajero INT NOT NULL,
        pasajerosfrecuentes VARCHAR(50) NOT NULL UNIQUE,
        ocupacionvuelo VARCHAR(50) NOT NULL,
        FOREIGN KEY (idvuelo) REFERENCES Vuelos(idvuelo),
        FOREIGN KEY (idpasajero) REFERENCES Pasajeros(idpasajero)

      )''');
    print('Tabla Informes creada');
  }
}