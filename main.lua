class = require'middleclass'
Vector = require'Geometry.modules.vector'
local Surface = require'Geometry.modules.surface'

love.graphics.setLineStyle('smooth')

debug = io.open('debug.txt', 'w+')

-- DEBUG = true

surf = Surface(unpack({190, 482, 165, 237, 279, 126, 421, 71, 384, 94, 314, 186, 264, 232, 247, 284, 310, 344, 358, 362, 
372, 291, 386, 223, 439, 152, 477, 107, 512, 73, 573, 94, 550, 108, 524, 132, 487, 156, 454, 206, 477, 239, 527, 228, 613, 
217, 654, 190, 619, 128, 628, 104, 676, 81, 700, 128, 705, 198, 662, 251, 600, 266, 555, 269, 614, 321, 669, 383, 728, 534, 
687, 565, 607, 524, 596, 425, 552, 362, 502, 315, 446, 284, 442, 321, 448, 365, 484, 410, 534, 529, 513, 577, 474, 557, 436, 
495, 427, 423, 395, 397, 378, 418, 355, 452, 342, 516, 352, 544, 376, 535, 403, 522, 419, 540, 410, 561, 398, 572, 371, 567, 
351, 566, 329, 574, 292, 573, 268, 575, 227, 574, 201, 566, 226, 550, 268, 551, 293, 554, 303, 526, 283, 504, 266, 517, 232, 
522, 195, 533, 157, 542, 109, 546, 60, 442, 64, 381, 65, 267, 82, 264, 101, 326, 104, 407, 119, 466, 141, 495, 173, 514, 212, 
508, 251, 481, 290, 470, 300, 455, 267, 435, 281, 406, 319, 409, 341, 390, 308, 380, 265, 369, 245, 388, 240, 411, 243, 451, 
229, 474, 214, 491}))

function love.load()
end

function love.update(dt)
end

function love.draw()
	if surf then
		surf:draw()
		-- local M = surf:locate(Vector(love.mouse.getPosition()))
		-- if M then
			-- love.graphics.setColor(255, 0, 0)
			-- Vector(surf.vertices[M[1]].x, surf.vertices[M[1]].y):draw()
			-- love.graphics.setColor(0, 255, 0)
			-- Vector(surf.vertices[M[2]].x, surf.vertices[M[2]].y):draw()
			-- love.graphics.setColor(0, 0, 255)
			-- Vector(surf.vertices[M[3]].x, surf.vertices[M[3]].y):draw()

			-- for i = 4, 6 do
				-- if i == 4 then love.graphics.setColor(255, 0, 0) end
				-- if i == 5 then love.graphics.setColor(0, 255, 0) end
				-- if i == 6 then love.graphics.setColor(0, 0, 255) end
				-- if M[i] then
				-- love.graphics.polygon('fill',
				-- surf.vertices[surf.triangles[M[i]][1]].x, surf.vertices[surf.triangles[M[i]][1]].y,
				-- surf.vertices[surf.triangles[M[i]][2]].x, surf.vertices[surf.triangles[M[i]][2]].y,
				-- surf.vertices[surf.triangles[M[i]][3]].x, surf.vertices[surf.triangles[M[i]][3]].y
				-- ) --21/05/16
				-- end
			-- end
		-- end
	end
	if A then
		love.graphics.setColor(255, 255, 255)
		love.graphics.line(A.x, A.y, love.mouse.getX(), love.mouse.getY())
	end
end

function love.mousepressed(x, y, button)
	A = Vector(x, y)
end

function love.mousereleased(x, y, button)
	surf:addConstraintEdge(A, Vector(x, y))
	A = nil
end

function love.keypressed(key)
end