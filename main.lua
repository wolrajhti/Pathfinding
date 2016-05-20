class = require'middleclass'
-- local cpml = require'cpml'
-- local Delaunay = require'delaunay'
-- local HC = require'HC'
-- local Polygon = require'HC.polygon'
Vector = require'Geometry.modules.vector'
-- local Surface = require'Geometry.modules.surface_backup'
local Surface = require'Geometry.modules.surface'

love.graphics.setLineStyle('smooth')

pts = {}
-- triangles = {}
debug = io.open('debug.txt', 'w+')
function love.load()
end

function love.update(dt)
end

function love.draw()
	if surf then
		surf:draw()
		local M = surf:locate(Vector(love.mouse.getPosition()))
		if M then
			love.graphics.setColor(255, 200, 200, 100)
			love.graphics.polygon('fill', M[1].x, M[1].y, M[2].x, M[2].y, M[3].x, M[3].y)
		end
	end
	if #pts ~= 0 then
		for i = 1, #pts - 1 do
			love.graphics.line(pts[i].x, pts[i].y, pts[i + 1].x, pts[i + 1].y)
		end
		love.graphics.line(pts[#pts].x, pts[#pts].y, pts[1].x, pts[1].y)
	end
	-- for i, t in ipairs(triangles) do
		-- love.graphics.polygon('line', t)
	-- end
	-- Vector(400, 300):draw()
	if A and B then
		love.graphics.line(A.x, A.y, B.x, B.y)
	end
	if TUNNEL then
		for i, t in ipairs(TUNNEL) do
			-- love.graphics.setColor(surf.colors[i])
			-- love.graphics.polygon('fill', t[1].x, t[1].y, t[2].x, t[2].y, t[3].x, t[3].y)
			surf:removeTriangle(t)
		end
		TUNNEL = nil
		if P then
			love.graphics.setColor(200, 255, 200, 100)
			P:draw(10)
			debug:write(P.class.name..'\n')
		end
		if Q then
			love.graphics.setColor(200, 200, 255, 100)
			Q:draw(10)
			debug:write(Q.class.name..'\n')
		end
	end
end

function love.mousepressed(x, y, button)
	if #pts == 0 or pts[#pts]:dist2(x, y) > 25 then
		table.insert(pts, Vector(x, y))
	-- if #pts == 0 or pts[#pts]:dist2(cpml.vec2(x, y)) > 25 then
		-- table.insert(pts, cpml.vec2(x, y))
	end
end

function love.keypressed(key)
	if key == 'space' then setTriangles() end
	if key == 'left' then A = Vector(love.mouse.getPosition()) end
	if key == 'right' then B = Vector(love.mouse.getPosition()) end
	if key == 't' and A and B then TUNNEL, P, Q = surf:tunnel(A, B) end
end

function setTriangles()
	if #pts > 2 then
		local coords = {}
		for i, pt in ipairs(pts) do table.insert(coords, pt.x) table.insert(coords, pt.y) end
		
		-- triangles = {}
		-- for i, p in ipairs(Polygon(unpack(coords)):splitConvex()) do
			-- for j, t in ipairs(p:triangulate()) do
				-- local tri = {}
				-- for k, v in ipairs({t:unpack()}) do table.insert(tri, v) end
				-- table.insert(triangles, tri)
			-- end
		-- end
		surf = Surface(unpack(coords))
	end
end