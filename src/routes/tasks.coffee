router = require('express').Router()
mongoose = require 'mongoose'
Task = mongoose.model('Task')

router.get '/', (req, res, next) ->
  Task.find {}, (error, tasks) ->
    if (error) then next(error)
    else res.json(tasks)

router.get '/:id', (req, res, next) ->
  Task.findById req.params.id, (error, task) ->
    if (error) then next(error)
    else res.json(task)

router.post '/', (req, res, next) ->
  Task.create text: req.body.text, (error, task) ->
    if (error) then next(error)
    else res.sendStatus(201);

module.exports = router
