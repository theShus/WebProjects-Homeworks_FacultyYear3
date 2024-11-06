const express = require('express');
const { sequelize, Book } = require('./models');
const path = require('path');
const { raw } = require('express');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const http = require('http');
const { Server } = require("socket.io");
const history = require('connect-history-api-fallback');
require('dotenv').config();
const Joi = require('joi');


const app = express();
const server = http.createServer(app);

const io = new Server(server, {
    cors: {
        origin: '*',
        methods: ['GET', 'POST', 'PUT'],
        credentials: true
    },
    allowEIO3: true
});

function getCookies(req) {
    if (req.headers.cookie == null) return {};

    const rawCookies = req.headers.cookie.split('; ');//podaci u cookie su razdvojeni sa ;
    const parsedCookies = {};
    // console.log('raw',rawCookies);

    rawCookies.forEach( rawCookie => {
        const parsedCookie = rawCookie.split('=');//dobijamo ime i vr ednost svakog cookia 
        parsedCookies[parsedCookie[0]] = parsedCookie[1];
    });

    return parsedCookies;
}; 

function authToken(req, res, next) {//ovo je middleware koji proverava da li je user ulogovan ili ne
    const cookies = getCookies(req); //next je pokazivac na sledecu funkciju
    console.log('cookie',cookies);
    const token = cookies['token'];//iz cookia dohavatamo token, ['element nekog objekta']
  
    if (token == null) return res.redirect(301, '/login');
  
    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
    
        if (err) return res.redirect(301, '/login');
    
        req.user = user;
    
        next(); 
    });
}


function authSocket(msg, next) {
    if (msg[1].token == null) {
        next(new Error("Not authenticated"));
    } else {
        jwt.verify(msg[1].token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
            if (err) {
                next(new Error(err));
            } else {
                msg[1].user = user;
                next();
            }
        });
    }
}

io.on('connection', socket => {
    socket.use(authSocket);
 
    socket.on('updateBook', msg => {
        const schema = Joi.object().keys({
            id: Joi.string(),
            createdAt: Joi.string(),
            updatedAt: Joi.string(),
            name: Joi.string().trim().min(4).max(15).required(),
            writer: Joi.string().trim().min(4).max(15).required(),
            genre: Joi.string().trim().min(4).max(15).required(),
            desciption: Joi.string().trim().required(),
            relesedate: Joi.string().trim().required(),
            publisher: Joi.string().trim().min(4).max(15).required(),
            libraryId: Joi.string().trim().required(),
            userId: Joi.string().trim().required()
         });

         console.log(schema.validate(msg.body));
         const Validation = schema.validate(msg.body);
         console.log(Validation);
    
        if(Validation.error){
            res.status(500).json({ msg: Validation.error.message })
        }
        else{
            Book.findOne({ where: { id: msg.body.id } })
            .then( book => {
                book.name = msg.body.name,
                book.writer = msg.body.writer,
                book.genre = msg.body.genre,
                book.desciption = msg.body.desciption,
                book.relesedate = msg.body.relesedate,
                book.publisher = msg.body.publisher

                book.save()
                    // .then( rows => console.log(rows) )
                    // .catch( err => console.log(err) );
                    .then( rows => {
                        Book.findOne({ where: { id: rows.id }})
                            .then(msg => io.emit('updateBook', JSON.stringify(msg)) ) 
                    }).catch( err => res.status(500).json(err) );
            })
            .catch( err => res.status(500).json(err) );
        }
    });

    socket.on('error', err => socket.emit('error', err.message) );
});

const staticMdl = express.static(path.join(__dirname, 'dist'));
app.use(staticMdl);
app.use(history({ index: '/index.html' }));
app.use(staticMdl);

server.listen({ port: 8000 }, async () => {
    await sequelize.authenticate();
    console.log("startovan app");
});