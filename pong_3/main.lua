local push = require "push"
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

-- velocidade do travessão
PADDLE_SPEED = 200

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    smallFont = love.graphics.newFont('font.ttf', 8)

    -- fonte do placar
    scoreFont = love.graphics.newFont('font.ttf', 32)
    love.graphics.setFont(smallFont)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    -- placar
    player1Score = 0
    player2Score = 0

    -- posição do travessão no eixo vertical
    player1Y = 30
    player2Y = VIRTUAL_HEIGHT - 50
end

-- movimento dos travessões
function love.update(dt)
-- jogador 1
if love.keyboard.isDown('w') then
    player1Y = player1Y + -PADDLE_SPEED * dt
elseif love.keyboard.isDown('s') then
    player1Y = player1Y + PADDLE_SPEED * dt
    
end


-- jogador 2
if love.keyboard.isDown('up') then
    player2Y = player2Y + -PADDLE_SPEED * dt
elseif love.keyboard.isDown('down') then
    player2Y = player2Y + PADDLE_SPEED * dt
    
end
end

function love.keyPressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    
    
end

function love.draw()
    push:apply('start')

    love.graphics.clear(40/255, 45/255, 52/255, 255/255)

    love.graphics.printf( 'Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')

    -- renderizar placar
    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 3)
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)
-- retangulo esquerdo
    love.graphics.rectangle('fill', 10, player1Y, 5, 20)
-- retangulo direito
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, player2Y, 5, 20)
 -- bola
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)


              
          
    push:apply('end')
end