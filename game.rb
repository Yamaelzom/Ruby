# -*- coding: utf-8 -*-
require 'dxruby'

Window.width = 400
Window.height = 600

font = Font.new(32)

chara_x = 200
chara_y = 450

image_chara = Image.load_tiles("../chr.png", 3, 2)
chara = Sprite.new(chara_x, chara_y, image_chara[0])

shot_flag = 0
shot_x = chara_x
shot_y = 450

image_shot = Image.load_tiles("../shot.png",5,3)
#shot = Sprite.new(shot_x,shot_y,image_shot[0])
#bomb =   Sprite.new(shot_x,shot_y,image_shot[7]) 

switch = 0   

image = Image.load_tiles("../image/colorbox.png", 6, 1)

block_x = 0
block_y = 0
count = 0
block = []

loop do
  block[count] = Sprite.new(block_x, block_y, image[5])
  if 420 < block_x
    break
  end
  block_x = block_x + 20
  count = count + 1
end
loop do
  block[count] = Sprite.new(block_x,block_y,image[5])
  if 560 < block_y
      break
  end
  block_y =block_y + 20
  count = count + 1
 end
loop do
  block[count] = Sprite.new(block_x, block_y, image[5])
  if -20 > block_x
    break
  end
  block_x = block_x - 20
  count = count + 1
 end
loop do
  block[count] = Sprite.new(block_x,block_y,image[5])
  if 40 > block_y
      break
  end
  block_y =block_y - 20
  count = count + 1
 end

x = nil

item_x = 5
item_y = 30
item = Sprite.new(item_x, item_y, image[0])

item2_x =5
item2_y =30
item2 =Sprite.new(item2_x,item2_y,image[2])


co =0

Window.loop do
    score = co
    score.to_s
    
    if item === block
Window.draw_font(0,0,"GameOver",font)
Window.draw_font(0,32,"score#{score}",font)
Window.draw_font(0,64,"please push E key",font)
    if  Input.keyDown?(K_E)
        break
        end
    else
    if item2 === block  
        item2 = nil
        end
 
Window.draw_font(0, 20, "#{score}", font)
        
    if Input.keyDown?(K_LEFTARROW)
        chara.x -= 5
         shot_x -= 5
    elsif Input.keyDown?(K_RIGHTARROW) 
        chara.x += 5   
        shot_x += 5
    end

    if  Input.keyDown?(K_Z)
        shot_flag = 1
        end
    
    if shot_flag == 1 
        shot = Sprite.new(shot_x,shot_y,image_shot[0])
        Sprite.draw(shot)
            shot_y -= 10
             if shot === block 
                shot_flag = 0
                 shot_y = 450
             end
    end

    
    if  Input.keyDown?(K_X)
        bomb_flag = 1
        end
    
    if bomb_flag == 1 
        bomb = Sprite.new(shot_x,420,image_shot[7])
        Sprite.draw(bomb)
             if bomb === block 
                bomb_flag = 0
             end
    end
    
        

    if shot === item
        item = nil
        co += 10
    end

    if bomb === item
        item = nil
        co += 30
    end
        
    if shot === item2
        item2 = nil
        co += 20
    end

    if bomb === item2
        item2 = nil
        co += 60
    end    

    
    if item.nil? == false
         item.y += 3
         else
        x = rand(340)
        item_x = x
        item = Sprite.new(item_x, item_y, image[3])
        item.y += 30
    end
        
    if item2.nil? == false
         item2.y += 6
         else
        x = rand(340)
        item2_x = x
        item2 = Sprite.new(item2_x, item2_y, image[5])
        item2.y += 50
    end    
###Window.draw_font(50,40,"x座標:#{chara_x.to_s}",font)
###Window.draw_font(50,80,"y座標:#{chara_y.to_s}",font) 
###Window.draw_font(50,120,"itemx座標:#{item_x.to_s}",font) 
###Window.draw_font(50,160,"itemy座標:#{item_x.to_s}",font) 
    p shot_flag
Sprite.draw(chara)
Sprite.draw(block)
Sprite.draw(item)
Sprite.draw(item2)        
        end
end