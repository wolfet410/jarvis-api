const express = require('express'),
  router = express.Router();

router.get('/list', function(req, res) {
  let sql = `SELECT * FROM viewpagebuttons`;
  db.query(sql, function(err, data, fields) {
    if (err) throw err;
    res.json({
      status: 200,
      data,
      message: "/viewpagebuttons/list successful"
    })
  })
});

module.exports = router;
