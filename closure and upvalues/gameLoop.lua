-- Since you're working on Tetris in Neovim, try implementing a simple game loop using a closure.

-- 📝 Exercise: Movement with Velocity
-- Write a function createMover(speed) that returns a function to move a piece based on speed.

local function createMover(default)
	local speed = default

	return function(piece)
		piece.move(speed)
	end
end

local movePiece = createMover(10)

local function makePiece()
	local piece = {}

	function piece:move(x)
		self.x = self.x + x
	end

	return piece
end

local p = makePiece()

movePiece(p)
