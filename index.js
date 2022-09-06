const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const mysql = require('mysql');
const n_datetime = require('node-datetime');
const { v4: uuidv4 } = require('uuid');

//datetime
const dt = n_datetime.create();
const datetime_now = dt.format('Y-m-d H:M:S');

//body json send
app.use(bodyParser.json());

const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'DB_CUSTOMER'
});

con.connect((err) => {
    if (err) throw err;
    console.log('Mysql Connected');
});

app.listen(3000, () => {
    console.log('Server started on port 3000...');
});

// LOG REQUEST API
function logApiCall (res){
    //RESPONSE API CALL

    let endpoint = res.req.url;
    let parameter = JSON.stringify({...res.req.query, ...res.req.body});
    let response_code = res.statusCode;
    let response_message = res.statusCode == 200 ? 'Success' : 'Error';
    let log_id = uuidv4();

    let sql_response = "INSERT INTO t_log_apiresponse SET ?";
    let data_response = {
        ENDPOINT:endpoint,	
        PARAMETER_IN:parameter,	
        LOG_ID:log_id,
        RESPONSE_CODE:response_code,
        RESPONSE_MESSAGE:response_message,	
        RESPONSE_DATE:datetime_now,	
        DTM_CRT:datetime_now,
        USR_CRT:"admin"
    }
    con.query(sql_response, data_response);

    // REQUEST API CALL
    let sql_request = "INSERT INTO t_log_apirequest SET ?";
        let data_request = {
            ENDPOINT:endpoint,	
            PARAMETER_IN:parameter,	
            LOG_ID:log_id,
            REQUEST_DATE:datetime_now,	
            DTM_CRT:datetime_now,
            USR_CRT:"admin"
        }
    con.query(sql_request, data_request);
}

// GET M_BRANCH
app.get('/GetMasterBranch', (req, res) => {
    let sql = "SELECT * FROM m_branch";
    con.query(sql, (err, results) => {
        if (err) throw err;
        res.send(JSON.stringify({ "status": "Success", "statusCode": res.statusCode, "data": results }));
    });
    logApiCall(res);
});

// GET M_PRODUCT
app.get('/GetMasterProduct', (req, res) => {
    let sql = "SELECT * FROM m_product";
    con.query(sql, (err, results) => {
        if (err) throw err;
        res.send(JSON.stringify({  "status": "Success", "statusCode": res.statusCode,"data": results }));
    });
    logApiCall(res);
});

// GET CUSTOMER
app.get('/GetAllDataCust', (req, res) => {
    let sql = "SELECT * FROM t_data_customer AS a INNER JOIN m_branch AS b ON a.BRANCH_ID = b.BRANCH_ID INNER JOIN m_product AS c ON a.PRODUCT_ID = c.PRODUCT_ID";
    con.query(sql, (err, results) => {
        if (err) throw err;
        res.send(JSON.stringify({ "status": "Success", "statusCode": res.statusCode, "data": results }));
    });
    logApiCall(res);
});

// GET CUSTOMER BY ID
app.get('/GetDataCustomer', (req, res) => {
    let sql = "SELECT * FROM t_data_customer AS a INNER JOIN m_branch AS b ON a.BRANCH_ID = b.BRANCH_ID INNER JOIN m_product AS c ON a.PRODUCT_ID = c.PRODUCT_ID WHERE a.CUST_ID = " + req.query.id;
    con.query(sql, (err, results) => {
        if (err) throw err;
        res.send(JSON.stringify({ "status": "Success", "statusCode": res.statusCode, "data": results[0] }));
    });
    logApiCall(res);
});

// POST CUSTOMER
app.post('/SaveDataCust', (req, res) => {
    let data = {
        FIRST_NAME: req.body.firstname,
        LAST_NAME: req.body.lastName, 
        PHONE_NO: req.body.phoneNumber, 
        BRANCH_ID: req.body.branch, 
        PRODUCT_ID: req.body.product, 
        TENOR_ID: req.body.tenor, 
        AVATAR: req.body.avatar ,
        DTM_CRT:datetime_now,
        USR_CRT:"admin"
    }
    let sql = "INSERT INTO t_data_customer SET ?";
    con.query(sql, data, (err, results) => {
        if (err) throw err;
        res.send(JSON.stringify({ "status": "Success", "statusCode": res.statusCode }));
    });
    logApiCall(res);
});

// PUT CUSTOMER
app.put('/UpdateDataCust', (req, res) => {
    let sql = "UPDATE t_data_customer SET " ;
        sql += "FIRST_NAME='"+req.body.firstname+"', ";
        sql += "LAST_NAME='"+req.body.lastName+"', ";
        sql += "PHONE_NO='"+req.body.phoneNumber+"', ";
        sql += "BRANCH_ID='"+req.body.branch+"', ";
        sql += "PRODUCT_ID='"+req.body.product+"', ";
        sql += "TENOR_ID='"+req.body.tenor+"', "; 
        sql += "AVATAR='"+req.body.avatar+"',"; 
        sql += "DTM_UPD='"+datetime_now+"',"; 
        sql += "USR_UPD='admin' "; 
        sql += "WHERE CUST_ID = "+req.body.id; 
    con.query(sql, (err, results) => {
        if (err) throw err;
        res.send(JSON.stringify({ "status": "Success", "statusCode": res.statusCode }));
    });
    logApiCall(res);
});

// DELETE CUSTOMER
app.delete('/DeleteDataCust', (req, res) => {
    let sql = "DELETE FROM t_data_customer WHERE CUST_ID = " + req.query.id;
    con.query(sql, (err, results) => {
        if (err) throw err;
        res.send(JSON.stringify({ "status": "Success", "statusCode": res.statusCode}));
    });
    logApiCall(res);
});