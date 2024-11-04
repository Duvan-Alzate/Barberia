const express = require('express');
const mysql = require('mysql');
const bcrypt = require('bcrypt');
const app = express();
const PORT = 3000;
const bodyParser = require('body-parser');
app.use(bodyParser.json());
const jwt = require('jsonwebtoken');

// Configuración de la conexión a MySQL
const db = mysql.createConnection({
    host: "localhost",
    user: 'root',
    password: '',
    database: 'test'
});

// Conectar a MySQL
db.connect(err => {
    if (err) {
        console.error('Error al conectar a MySQL: ' + err.message);
    } else {
        console.log('Conexión exitosa a MySQL');
    }
});

// Ruta para obtener datos de la base de datos
app.get('/users', (req, res) => {
    const query = 'SELECT * FROM users';

    db.query(query, (err, result) => {
        if (err) {
            console.error('Error en la consulta: ' + err.message);
            res.status(500).send('Error interno del servidor');
        } else {
            res.json(result);
        }
    });
});

app.get('/citas', (req, res) => {
    const query = 'SELECT * FROM citas';

    db.query(query, (err, result) => {
        if (err) {
            console.error('Error en la consulta: ' + err.message);
            res.status(500).send('Error interno del servidor');
        } else {
            res.json(result);
        }
    });
});

app.post('/addCita', (req, res) => {
    const { fecha, estado, nombre, cedula, celular, barbero } = req.body;

    const query = 'INSERT INTO citas (fecha, estado, nombre, cedula, celular, barber_id) VALUES (?, ?, ?, ?, ?, ?)';
    const values = [fecha, estado, nombre, cedula, celular, barbero];
    console.log(values.barbero);
    console.log(barbero);
    db.query(query, values, (err, result) => {
        if (err) {
            console.error('Error en la consulta de inserción: ' + err.message);
            res.status(500).send('Error interno del servidor');
        } else {
            console.log('Cita agregada correctamente');
            res.json({ success: true });
        }
    });
});

app.post('/login', async (req, res) => {
    const { email, password } = req.body;

    try {
        console.log(email);
        const user = await getUserByEmail(email);

        if (user) {
            /*  const match = await bcrypt.compare(password, user.password); */
            const match = password == user.password;
            if (match) {
                console.log("validado");
                // Contraseña válida, el usuario está autenticado
                const token = jwt.sign({ userId: user.id, email: user.email }, 'secreto_secreto', { expiresIn: '1h' });
                res.json({ message: 'Inicio de sesión exitoso', token });
            } else {
                console.log("malo");
                res.status(401).json({ message: 'Credenciales incorrectas' });
            }
        } else {
            res.status(404).json({ message: 'Usuario no encontrado' });
        }
    } catch (error) {
        console.error('Error en el inicio de sesión:', error);
        res.status(500).json({ message: 'Error en el servidor' });
    }
});

// Función para obtener un usuario por correo electrónico
const getUserByEmail = (email) => {
    return new Promise((resolve, reject) => {
        const query = 'SELECT * FROM users WHERE email = ?';

        db.query(query, [email], (error, results) => {
            if (error) {
                reject(error);
            } else {
                resolve(results[0]);
            }
        });
    });
};

app.get('/getUserDetails', async (req, res) => {
    const token = req.headers.authorization && req.headers.authorization.split(' ')[1];

    if (!token) {
        return res.status(401).json({ message: 'Token de autenticación no proporcionado' });
    }

    try {
        const decoded = jwt.verify(token, 'secreto_secreto');

        if (!decoded.userId) {
            return res.status(401).json({ message: 'Token de autenticación no válido' });
        }

        const userDetails = await getUserById(decoded.userId);

        if (!userDetails) {
            return res.status(404).json({ message: 'Usuario no encontrado' });
        }

        return res.json(userDetails);
    } catch (error) {
        console.error('Error al verificar el token:', error);
        return res.status(500).json({ message: 'Error en el servidor' });
    }
});

const getUserById = (userId) => {
    return new Promise((resolve, reject) => {
        const query = 'SELECT * FROM users WHERE id = ?';

        db.query(query, [userId], (error, results) => {
            if (error) {
                reject(error);
            } else {
                resolve(results[0]);
            }
        });
    });
};

app.get('/cortes', (req, res) => {
    const query = 'SELECT * FROM cortes';

    db.query(query, (err, result) => {
        if (err) {
            console.error('Error en la consulta: ' + err.message);
            res.status(500).send('Error interno del servidor');
        } else {
            res.json(result);
        }
    });
});

app.get('/barberos', (req, res) => {
    const query = "SELECT * FROM users WHERE role = 'barbero'";

    db.query(query, (err, result) => {
        if (err) {
            console.error('Error en la consulta: ' + err.message);
            res.status(500).send('Error interno del servidor');
        } else {
            res.json(result);
        }
    });
});

app.get('/citasUser/:userid', (req, res) => {
    const userid = req.params.userid;
    const query = 'SELECT * FROM citas WHERE barber_id = ?';

    db.query(query, [userid], (error, results) => {
        if (error) {
            res.status(500).json({ error: 'Error al obtener las citas' });
        } else {
            res.json(results);
        }
    });
});

// Iniciar el servidor
app.listen(PORT, () => {
    console.log(`Servidor Express en ejecución en http://localhost:${PORT}`);
});
