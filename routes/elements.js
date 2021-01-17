const express = require('express'),
  router = express.Router();

router.get('/list', function(req, res) {
  let sql = `SELECT * FROM elements`;
  db.query(sql, function(err, data, fields) {
    if (err) throw err;
    res.json({
      status: 200,
      data,
      message: "/elements/list successful"
    })
  })
});

module.exports = router;
