mongoose = require 'mongoose'
Schema = mongoose.Schema

TaskSchema = new Schema(text: String)

mongoose.model('Task', TaskSchema)
