const express = require('express'),
    router = express.Router()
const service = require('../services/users.services')

//http://localhost:3000/api/users/
router.get('/', async(req,res)=>{
const users = await service.getAllUsers()
res.send(users)
})

router.get('/:email', async(req,res)=>{
    const user = await service.getUserByEmail(req.params.email)
    if(user == undefined)
        res.status(404).json('no record with that email please check your spelling')
    else
    res.send(user)
    })

    router.delete('/:email', async(req,res)=>{

        const affectedRows = await service.deleteUser(req.params.email)
        if(affectedRows == 0)
            res.status(404).json('no record with that email please check your spelling')
        else
        res.send('deleted succesfully')
    })

    router.post('/', async(req,res)=>{

    await service.addOrEditUsers(req.body)
    res.status(201).send('created successfully')
    })

    router.put('/:id', async (req,res) => {
        const affectedRows = await service.addOrEditUsers(req.body, req.params.email)
        if(affectedRows == 0)
            res.status(404).json('no record with given email : ' + req.params.email)
        else
            res.send('updated successfully.')
    })
    


module.exports = router;
