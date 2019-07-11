const express = require('express');
const router = express.Router();
const mysqlConnect = require('../database');

router.get('/',(req,res)=>{
    mysqlConnect.query('SELECT * FROM empleados WHERE 1',(err, rows,fields)=>{
        if(!err){
            res.json(rows);
        }else{
            console.log(err);
        }
    });
})

router.get('/:id',(req,res)=>{
    const {id } = req.params;
    mysqlConnect.query("SELECT * FROM empleados WHERE id = ?",[id],(err,rows,fields)=>{
        if(!err){
            res.json(rows);
        }else{
            console.log(err);
        }
    })
})

router.post('/', (req,res) => {
    const {id,nombre,salario} = req.body;
    const query = 'CALL empleado_Editar_Agregar(?,?,?);';
    mysqlConnect.query(query,[id,nombre,salario],(err,rows,fields)=>{
        if(!err){
            res.json({'status':'empleado agregado'});
        }else{
            console.log(err);
        }
    })
})

router.put('/:id',(req,res)=>{
    const {nombre,salario} = req.body;
    const {id} = req.params;
    const query = 'CALL empleado_Editar_Agregar(?,?,?);';
    mysqlConnect.query(query,[id,nombre,salario],(err,rows,fields)=>{
        if(!err){
            res.json({'status':'empleado actualizado'});
        }else{
            console.log(err);
        }
    })
})

router.delete('/:id',(req,res)=>{
    const {id} = req.params;
    mysqlConnect.query("DELETE FROM empleados WHERE id = ?",[id],(err,rows,fields)=>{
        if(!err){
            res.json({status:"Empleado Eliminado"});
        }else{
            console.log(err);
        }
    })
})
module.exports = router;