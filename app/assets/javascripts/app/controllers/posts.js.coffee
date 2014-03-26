angular.module('app.controllers', [])
  .controller 'Posts', ['$scope', '$location', 'Post', ($scope, $location, Post) ->
    $scope.posts = Post.query()

    $scope.delete = (id) ->
      success = ->
        $location.path('#/')
      failure = ->
        alert 'some error occurred. check your logs'

      new Post().$delete({id: id}, success, failure)
  ]
  .controller 'NewPost', ['$scope', '$location', 'Post', ($scope, $location, Post) ->
    $scope.post =
      title: ''
      body: ''

    $scope.submit = ->
      $scope.errors = null

      success = ->
        $scope.post = {}

        $location.path('#/')

      failure = (resp) ->
        $scope.errors = resp.data.errors

      new Post({post: $scope.post}).$save({}, success, failure)
  ]
  .controller 'EditPost', ['$scope', '$location', '$routeParams', 'Post', ($scope, $location, $routeParams, Post) ->
    $scope.post = Post.get({id: $routeParams.id})

    $scope.submit = ->
      $scope.errors = null

      success = ->
        $scope.post = {}

        $location.path('#/')

      failure = (resp) ->
        $scope.errors = resp.data.errors

      new Post({post: $scope.post}).$update({id: $routeParams.id}, success, failure)
  ]