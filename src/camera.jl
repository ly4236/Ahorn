mutable struct Camera
    x::Number
    y::Number
    scale::Number
    locked::Bool

    Camera(x::Number, y::Number, scale::Number) = new(x, y, scale, false)
end

function setCamera!(camera::Camera, x::Integer, y::Integer)
    if !camera.locked
        camera.x = x * camera.scale
        camera.y = y * camera.scale
    end
end

function reset!(camera::Camera, force::Bool=false)
    if !camera.locked || force
        camera.x = 0
        camera.y = 0
        camera.scale = defaultZoom
    end
end

function lock!(camera::Camera)
    camera.locked = true
end

function unlock!(camera::Camera)
    camera.locked = false
end

minimumZoom = 2.0^-1
maximumZoom = 2.0^3
defaultZoom = 4