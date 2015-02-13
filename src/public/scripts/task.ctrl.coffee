TaskCtrl = ($routeParams, $scope, Tasks) ->
  $scope.error = false
  Tasks.get id: $routeParams.id,
    (task) -> $scope.task = task
    (error) -> $scope.error = true

angular.module('track')
  .controller('TaskCtrl', ['$routeParams', '$scope', 'Tasks', TaskCtrl])
