Tasks = ($resource) -> $resource('tasks/:id')

angular.module('track').factory('Tasks', ['$resource', Tasks])
