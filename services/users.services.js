const db = require('../db')

module.exports.getAllUsers = async () =>{

    const [records] =  await db.query("SELECT * FROM users")
    return records;
}


module.exports.getUserByEmail = async (email) =>{

    const [record] = await db.query("SELECT * FROM users WHERE email = ?", [email])
    .catch(err => console.log(err))
    return record;

}

module.exports.deleteUser = async (email) =>{
    const [{affectedRows}] = await db.query("DELETE FROM users WHERE email = ?", [email])

    return affectedRows;

}

module.exports.addOrEditUsers = async (obj, id=0) => {

    const [[[{ affectedRows }]]] = await db.query("CALL addEdit(?,?,?,?,?,?,?,?)",
        [ id,obj.name, obj.email,  obj.password, obj.contacts, obj.Age, obj.isActive, obj.createdAt])
    return affectedRows;
}

