angular.module 'app.services', [], ($provide) ->
  $provide.factory 'Post', ($resource) ->
    $resource '/posts/:id', {id: '@id'}, {update: {method: 'PUT'}}
