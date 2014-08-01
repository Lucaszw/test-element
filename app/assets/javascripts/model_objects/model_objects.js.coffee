# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require model_objects/fancybox
#= require model_objects/easing
#= require model_objects/mousewheel
#= require model_objects/three
#= require model_objects/STLloader
#= require model_objects/TrackBallControls
#= require model_objects/threejsfunctions


window.anim = undefined

window.animate = ->
  window.anim = requestAnimationFrame animate
  controls.update()

window.render = ->
  window.renderer.render scene, camera

window.scene = new THREE.Scene()
window.camera = new THREE.PerspectiveCamera(45, $(window).width()/$(window).height(), 0.001, 100000)

window.renderer = new THREE.CanvasRenderer()

context = webgl_detect(1)
if context
  window.renderer = new THREE.WebGLRenderer()
else
  window.renderer = new THREE.CanvasRenderer()

window.setupControls = ->
  window.controls = new THREE.TrackballControls(camera)
  window.controls.rotateSpeed = 3
  window.controls.zoomSpeed = 1.2
  window.controls.panSpeed = 0.35
  window.controls.noZoom = false
  window.controls.noPan = false
  window.controls.dynamicDampingFactor = 0.2
  window.controls.keys = [65, 83, 68]
  window.controls.addEventListener "change", render
  window.controls.enabled = false
  window.controls.rightClick( false )
  window.loader = new THREE.STLLoader()
  window.geometry = undefined
  window.mesh = undefined
  window.shading = THREE.FlatShading
  window.material = new THREE.MeshNormalMaterial(shading)

window.setupControls()

window.loader.addEventListener "load", (event) ->
  window.geometry = event.content
  window.mesh = new THREE.Mesh(geometry, material)
  window.mesh.scale.set 1, 1, 1
  window.scene.add mesh
  window.camera.position.z = 100
  render()