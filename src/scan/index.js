const express = require('express');
const { initializeApp } = require('firebase-admin/app');
const { getFirestore } = require('firebase-admin/firestore');

initializeApp();
const db = getFirestore();

const app = express();
app.use('/:id', async (req, res) => {
    const id = req.params.id;
    const doc = await db.collection('destination_adresses').doc(id).get();
    if (typeof doc.data() === 'undefined'){
        res.status(404).send("Wrong id")        
    }
    const destination_address = doc.data()["destination"]
    res.redirect(destination_address);
});

exports.qrcode = app;