GDPC                �                                                                         X   res://.godot/exported/133200997/export-24bb3549c7585f1580a721730030c641-seconditem.scn  L            oӪE�v��$Yy�:=(    T   res://.godot/exported/133200997/export-76f3aac762695eef21cffbf4154c7bd2-thisitem.scn0R            +�_�FQdga�s# _    X   res://.godot/exported/133200997/export-af5c6299bbb9ad1ccf1ba6e2b2e0a2fd-camera_2d.scn   �      �      b�y ө�
�����9    T   res://.godot/exported/133200997/export-bfb3ddd665018bb104e563202816d627-player.scn  �B      �      ����#���_0���    P   res://.godot/exported/133200997/export-eb17da0fd862ef336248750fc9767491-main.scn0      F"      ��vj_�����	�t    ,   res://.godot/global_script_class_cache.cfg  0h             ��Р�8���8~$}P�    H   res://.godot/imported/11png.png-006fc0b85e1090c814bf1015b9f3ce03.ctex           ^       ��@ԫ4��5��    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctexPX      �      �Yz=������������       res://.godot/uid_cache.bin  l      7      ����Ib:�=�D��       res://icon.svg  Ph      �      C��=U���^Qu��U3       res://icon.svg.import   0e      �       �7+�mzEHyq���1�        res://images/11png.png.import   `       �       st� e�>k-n�       res://project.binaryPm      ]      ���2������5�        res://scenes and scripts/Room.gdpG      �      ����>��%�{�W���        res://scenes and scripts/cam.gd 0      �      ��d;jO�6�|�A�@    0   res://scenes and scripts/camera_2d.tscn.remap    f      f       @����b��{^�    $   res://scenes and scripts/dialogue.gd�      �      �ھ�M���|Hj?l�JL        res://scenes and scripts/glob.gd�      T      a�u3O�|:Þ�Ey�"        res://scenes and scripts/item.gd�      9      ��5�nО�w��A, 4    (   res://scenes and scripts/main.tscn.remappf      a       W6`Ms��}�+��        res://scenes and scripts/npc.gd �:      >      ('d�?A���V-:�    $   res://scenes and scripts/player.gd  �>      �      ઁ����$��5#�    ,   res://scenes and scripts/player.tscn.remap  �f      c       ^V��'O01g�R��    0   res://scenes and scripts/seconditem.tscn.remap  Pg      g       ���qH�  ��\h�H    ,   res://scenes and scripts/thisitem.tscn.remap�g      e       ���G0C�=Š� �L        GST2            ����                        &   RIFF   WEBPVP8L   /    ���������    [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://bap0silmqd3fd"
path="res://.godot/imported/11png.png-006fc0b85e1090c814bf1015b9f3ce03.ctex"
metadata={
"vram_texture": false
}
               extends Camera2D

var width = ProjectSettings.get_setting('display/window/size/width')
var height = ProjectSettings.get_setting('display/window/size/height')



func _on_resized():
	var current_width = self.rect_size.x
	var current_height = self.rect_size.y
	var delta_width = max(0, current_width - width)
	var delta_height = max(0, current_height - height)
	offset = Vector2(-delta_width / 2, -delta_height / 2)
  RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script     res://scenes and scripts/cam.gd ��������      local://PackedScene_7a1u8          PackedScene          	         names "      	   Camera2D 	   position    scale    script    metadata/_edit_lock_    	   variants       
     pD  D
      @   @                      node_count             nodes        ��������        ����                                      conn_count              conns               node_paths              editable_instances              version             RSRC      extends Control


const npcName = "Astronaut"
const plrName = "You"


var pos = 0

var nametag
var textbox
var plr

#dialogue database
var data = [
	
	#starting convo 0
	{dialogue =
		[
			{tag = npcName,
			line = "Hello there! this is a test because I don't know what to write"},
			
			{tag = plrName,
			line = "Hi, "+ npcName +". I don't quite know what to say either"},
			
			{tag = npcName,
			line = "WELL it looks like YOU need to DO SOMETHING!!! So go find me THIS SPECIFIC ITEM!!!!"},
			
			{tag = npcName,
			line = "You can find THIS SPECIFIC ITEM in the quarters!"},
			
			{tag = plrName,
			line = "Uh. Alright, I guess..."},
		],
	function = "nothing"}
,



#convo 1 - first item is found!
{dialogue =
		[
			{tag = npcName,
			line = "Hey! You found it! Nice job."},
			
			{tag = npcName,
			line = "You're pretty good at this, huh?"},
			
			{tag = npcName,
			line = "Howzabout you help me find some of my tools?"},
			
			{tag = plrName,
			line = "What's in it for me?"},
			
			{tag = npcName,
			line = "I mean. Without them, I can't fix our dud engine. And without the engine, you're never going home"},
			
			{tag = plrName,
			line = "THE ENGINE IS BROKEN??? How come I didn't know??"},
			
			{tag = npcName,
			line = "Comms are down too :)"},
			
			{tag = npcName,
			line = "Find me ANOTHER ITEM!!!! Good luck!"},
		],
	function = "clearnspawn",
	param = 1},
	
	{dialogue =
		[
			{tag = npcName,
			line = "Thanks, man. That's all for now!"},
			
			{tag = plrName,
			line = "Alright!"},
			
			{tag = npcName,
			line = "We'll add more items and things in the future :)"},
			
			{tag = npcName,
			line = "Bye!!!"},
			
		],
	function = "clear"}
]


# Called when the node enters the scene tree for the first time.
func _ready():
	plr = $"/root/main/player"
	glob.connect("dialogue",dial)
	nametag = $nametag/MarginContainer/tag
	textbox = $textpanel/MarginContainer/text
	pass # Replace with function body.
	
func clearnspawn(id):
	print("weeee")
	clear()
	spawn(id)
	
	
func spawn(id):
	glob.emit_signal("spawnitem",id)
	
func clear():
	if plr.get_node("item"):
		print("aaaa")
		plr.get_node("item").queue_free()
	#glob.emit_signal("clear",plr.get_node("item").get_meta("id"))
	closeBox()

func openBox():
	visible = true
	pass
	
func closeBox():
	visible = false
	print("closed dialogue box")
	
func nothing():
	#the dialogue ends with nothing, rather than something. Wow.
	closeBox()
	pass

func readLine():
	
	textbox.text = data[glob.act].dialogue[pos].line
	nametag.text = data[glob.act].dialogue[pos].tag
	
	
	pass


func dial():
	print("called!")
	if visible == true:
		pass
	else:
		openBox()
		pos = 0
		readLine()
	pass
	
	
func roll():
	#reads next line
	if data[glob.act].dialogue.size() > pos+1:
		pos += 1
		readLine()
		pass
	else:
		print("end of act")
		
		var call = Callable(self, data[glob.act].function)
		if data[glob.act].has("param"):
			call.callv([data[glob.act].param])
			print("works")
		else:
			print("no param")
			call.call()
			
		
	pass



func _on_gui_input(event):
	#print("something happened to this one instead")
	if event is InputEventMouseButton:
		if event.pressed == true and event.button_index == 1:
			#its a left click
			print("moving on to next dialogue")
			roll()
	pass # Replace with function body.
   extends Node

var act = 0 #this changes between dialogue sessions!




signal dialogue()
signal collected(itemName)
signal clearItem
signal toRight
signal toLeft
signal spawnitem(id)

var currentItemID = -1

#for events and global variables!

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("collected",collect)
	pass # Replace with function body.

func collect(id):
	currentItemID = id
	act +=1
	pass
	
func checkForItem(id):
	if currentItemID == id:
		return true
	else:
		return false

func clear(id):
	currentItemID = -1
	emit_signal("clearItem", id)
            extends CharacterBody2D

var collected = false
var plr

const weight = 1

func _ready():
	plr = $"/root/main/player"
	glob.connect("spawnitem",enable)
	

func _physics_process(delta):
	
	if collected == true:
		var target = plr.global_position + Vector2(150,0)
		global_position = lerp(global_position,target,weight*delta)
		

func enable(id):
	if id == get_meta("id"):
		set_meta("enabled", true)
	pass

func _on_area_2d_body_entered(body):
	if body.collision_layer == 1 and get_node("..").visible == true and get_meta("enabled") == true:
		if collected == false:
			print("GOTTEM")
			collected = true
			reparent(plr)
			#global_position = plr.global_position + Vector2(150,0)
			glob.emit_signal("collected",get_meta("id"))
		
	pass # Replace with function body.

func clear(id):
	if get_meta("id") == id:
		queue_free()
       RSRC                    PackedScene            ��������                                            '      resource_local_to_scene    resource_name    custom_solver_bias    normal 	   distance    script    size    content_margin_left    content_margin_top    content_margin_right    content_margin_bottom 	   bg_color    draw_center    skew    border_width_left    border_width_top    border_width_right    border_width_bottom    border_color    border_blend    corner_radius_top_left    corner_radius_top_right    corner_radius_bottom_right    corner_radius_bottom_left    corner_detail    expand_margin_left    expand_margin_top    expand_margin_right    expand_margin_bottom    shadow_color    shadow_size    shadow_offset    anti_aliasing    anti_aliasing_size    default_base_scale    default_font    default_font_size    Panel/styles/panel 	   _bundled       Script !   res://scenes and scripts/Room.gd ��������
   Texture2D    res://images/11png.png �D;WAʑ!   Script     res://scenes and scripts/npc.gd ��������   PackedScene '   res://scenes and scripts/thisitem.tscn 8�ܴ� k!   PackedScene %   res://scenes and scripts/player.tscn ��?mAA   PackedScene (   res://scenes and scripts/camera_2d.tscn �6b,5h   Script %   res://scenes and scripts/dialogue.gd ��������   #   local://WorldBoundaryShape2D_chlnv �      #   local://WorldBoundaryShape2D_01762 �      #   local://WorldBoundaryShape2D_xop5c �         local://RectangleShape2D_wdqhc       #   local://WorldBoundaryShape2D_sgl6i 3         local://StyleBoxFlat_5j4sx h         local://Theme_qqv23 �         local://PackedScene_8lbvk �         WorldBoundaryShape2D             WorldBoundaryShape2D       
     �?�{,         WorldBoundaryShape2D             RectangleShape2D       
     �C  �A         WorldBoundaryShape2D       
     ���{,         StyleBoxFlat          ���=r�>��X>��M?                                             Theme    %                     PackedScene    &      	         names "   M      main    Node2D 	   roomnode    script 
   main room    StaticBody2D    collision_layer    CollisionShape2D 	   position    shape    StaticBody2D2    Control    layout_mode    anchors_preset    offset_right    offset_bottom    background 	   modulate    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    texture    TextureRect    floor    offset_top    npc    collision_mask    CharacterBody2D    z_index    offset_left    anchor_left    anchor_top    mouse_filter 	   chatIcon    visible    mouseInput 	   quarters 	   platform 
   platform2 
   platform3    item    metadata/enabled    metadata/id    lab 
   rightwall    player 	   Camera2D    gui 	   dialogue 
   textpanel    theme    Panel    MarginContainer %   theme_override_constants/margin_left $   theme_override_constants/margin_top &   theme_override_constants/margin_right '   theme_override_constants/margin_bottom    text    custom_minimum_size    size_flags_vertical $   theme_override_font_sizes/font_size    autowrap_mode    Label    nametag    tag    layout_direction    clickprompt    note    horizontal_alignment    _on_mouse_input_gui_input 
   gui_input    _on_mouse_input_mouse_entered    mouse_entered    _on_mouse_input_mouse_exited    mouse_exited    _on_gui_input    	   variants    N                   
     pD  uD          
   �{,  uD                           �D     �D   ��P>���>���>  �?                 �?                  ��$>��L>s��>  �?     uD
     �D  \D              �?��Y?      �?   	        ��     ��     �B     �B            ?      �     \�      B     �                      
     C�  ,�
    ��D �TD            ��$?	��>	��>  �?     H�      �     HC      A
     |C  ��
     7� ���   ���>���>���>  �?            ���>���>���>  �?
    �D  �C      
     ��  ��
     z� ���     �?��?  �?  �?
    `�D ��C   ���>���>���>  �?
     �D  uD                  
     pD  \D                        C     �D     �C               
     �?  �?   .         character dialogue here!      �B     >D     ,C      character name     ��D     �C    ��D     	D      (click anywhere to continue)       node_count    ;         nodes     	  ��������       ����                      ����                           ����                     ����                          ����         	                    
   ����                          ����         	                       ����                        	                    ����      
                                                              ����	                                                                          ����                               
             ����                                                 
             ����                                                                            !                    "   ����	   #                                                           
          $   ����            !                                                                !                    %   ����   #                        ����                                ����         	   "                 &   ����      #                                ����      $   	   %                    ����      &                              '      (      )      *                                   '   ����      +                                ����      $   	   %                    ����      &                              '      (      )      *                                   (   ����      ,                                ����      $   	   %                    ����      &                              '      (      )      *                                      ����                        	                    ����      -                                                              ����	                                                                    ���)   .         /      0   *   1   +                    ,   ����   #                        ����                                 ����         	   "                 '   ����      2                   "             ����      $   	   %       #             ����      &                              '      (      )      *                                   (   ����      3                   %             ����      $   	   %       &             ����      &                              '      (      )      *                                ���)   .         4      5   *       +                       ����                        	       )             ����      6                                                 )             ����	                                                                       -   ����                   ,             ����      7   	   8               ���.   9         :                     ���/   ;                      0   ����                        	   !          0          1   ����	   #                                           !         <       1       4   2   ����            =      =      >      ?   !      3   @       2       5   5   ����                                       !      6   A   7   A   8   A   9   A       3       ?   :   ����   ;   B         <      =   C   :   D   >          1       4   @   ����            =      E      F      G   !      3   @       5       5   5   ����                                       !      6   A   7   A   8   A   9   A       6       ?   A   ����   B            <      =   C   :   H       1       4   C   ����            I      J      K      L   !      3   @       8       5   5   ����                                       !      6   A   7   A   8   A   9   A       9       ?   D   ����   B            <      =   C   :   M   E                conn_count             conns           
   G   F                 
   I   H                 
   K   J              1   1   G   L                    node_paths              editable_instances              version             RSRC          extends CharacterBody2D


const SPEED = 500.0
const acceleration = 2000.0
const JUMP_VELOCITY = -400.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


var chatIcon

func _ready():
	chatIcon = $Control/chatIcon


func _physics_process(delta):
	pass
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()


func showChatIcon():
	#print("aaa")
	chatIcon.visible = true
	
func hideChatIcon():
	#print("bye")
	chatIcon.visible = false



func _on_mouse_input_mouse_entered():
	showChatIcon()
	pass # Replace with function body.


func _on_mouse_input_mouse_exited():
	hideChatIcon()
	pass # Replace with function body.


func _on_mouse_input_gui_input(event):
	#print("event happening? on npc??")
	if event is InputEventMouseButton:
		#mouse button action
		if event.pressed == true and event.button_index == 1:
			glob.emit_signal("dialogue")
			#its a left click
			#print("you clicked me lol")
			
	
	pass 
  extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -800.0
const acceleration = 2000.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	#if InputEventAction("")
	
		
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x += direction * acceleration * delta
		velocity.x = clamp(velocity.x, -SPEED, SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, acceleration*delta)

	move_and_slide()
	if position.x > 1995:
		glob.emit_signal("toRight")
	else: if position.x < -75:
		glob.emit_signal("toLeft")
		
   RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script #   res://scenes and scripts/player.gd ��������
   Texture2D    res://images/11png.png �D;WAʑ!      local://RectangleShape2D_audv6 �         local://PackedScene_7acyx �         RectangleShape2D       
     C  HC         PackedScene          	         names "         player    script    CharacterBody2D    CollisionShape2D    shape    TextureRect    z_index    offset_left    offset_top    offset_right    offset_bottom    texture    _on_mouse_entered    mouse_entered    	   variants                              
        ��     ��     �B     �B               node_count             nodes     %   ��������       ����                            ����                           ����                     	      
                      conn_count             conns                                       node_paths              editable_instances              version             RSRC               extends Node2D


var currentRoom = 0

var rooms = []
var plr

# Called when the node enters the scene tree for the first time.
func _ready():
	glob.connect("toLeft",left)
	glob.connect("toRight",right)
	plr = $"/root/main/player"
	
	for kid in get_children():
		rooms.append(kid)
	pass # Replace with function body.

func clearRoom(id):
	rooms[id].visible = false
	var children = rooms[id].get_children()
	for kid in children:
		if kid is StaticBody2D:
			kid.set_collision_layer_value(3, false)
		else: if kid.name == "npc":
			kid.get_node("mouseInput").visible == false
	
func loadRoom(id):
	print("loading room "+ str(id))
	rooms[id].visible = true
	#print(rooms[id].name)
	var children = rooms[id].get_children()
	for kid in children:
		if kid is StaticBody2D:
			kid.set_collision_layer_value(3, true)
			pass
		else: if kid.name == "npc":
			kid.get_node("mouseInput").visible == true
		
			
	pass
	#print(rooms[id].visible)


func left():
	clearRoom(currentRoom)
	currentRoom -= 1
	plr.global_position.x = 1990
	
	loadRoom(currentRoom)
	pass
	
func right():
	clearRoom(currentRoom)
	currentRoom += 1
	plr.global_position.x = -70
	

	loadRoom(currentRoom)
	
	pass
	
           RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script !   res://scenes and scripts/item.gd ��������
   Texture2D    res://images/11png.png �D;WAʑ!      local://RectangleShape2D_fh0wl �         local://PackedScene_lcukx �         RectangleShape2D       
     �B  �B         PackedScene          	         names "         item    z_index    collision_layer    collision_mask    motion_mode    script    CharacterBody2D    texture 	   modulate    anchors_preset    anchor_right    anchor_bottom    offset_left    offset_top    offset_right    offset_bottom    grow_horizontal    grow_vertical    metadata/id    TextureRect    Area2D    CollisionShape2D    shape    _on_area_2d_body_entered    body_entered    	   variants                                       �y?��,>��,>  �?   	        �?     H�     HB                                     node_count             nodes     D   ��������       ����                                                    ����               	       
                                       	      	      
                           ����                          ����                   conn_count             conns                                      node_paths              editable_instances              version             RSRC  RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script !   res://scenes and scripts/item.gd ��������
   Texture2D    res://images/11png.png �D;WAʑ!      local://RectangleShape2D_fh0wl �         local://PackedScene_iqc3b �         RectangleShape2D       
     �B  �B         PackedScene          	         names "         item    z_index 	   position    collision_layer    collision_mask    motion_mode    script    CharacterBody2D    texture    anchors_preset    anchor_right    anchor_bottom    offset_left    offset_top    offset_right    offset_bottom    grow_horizontal    grow_vertical    metadata/id    TextureRect    Area2D    CollisionShape2D    shape    _on_area_2d_body_entered    body_entered    	   variants             
    �;D  �C                          	        �?     H�     HB                                     node_count             nodes     D   ��������       ����                                                          ����         	       
                                       	      	      
                           ����                          ����                   conn_count             conns                                      node_paths              editable_instances              version             RSRC          GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح����mow�*��f�&��Cp�ȑD_��ٮ}�)� C+���UE��tlp�V/<p��ҕ�ig���E�W�����Sթ�� ӗ�A~@2�E�G"���~ ��5tQ#�+�@.ݡ�i۳�3�5�l��^c��=�x�Н&rA��a�lN��TgK㼧�)݉J�N���I�9��R���$`��[���=i�QgK�4c��%�*�D#I-�<�)&a��J�� ���d+�-Ֆ
��Ζ���Ut��(Q�h:�K��xZ�-��b��ٞ%+�]�p�yFV�F'����kd�^���:[Z��/��ʡy�����EJo�񷰼s�ɿ�A���N�O��Y��D��8�c)���TZ6�7m�A��\oE�hZ�{YJ�)u\a{W��>�?�]���+T�<o�{dU�`��5�Hf1�ۗ�j�b�2�,%85�G.�A�J�"���i��e)!	�Z؊U�u�X��j�c�_�r�`֩A�O��X5��F+YNL��A��ƩƗp��ױب���>J�[a|	�J��;�ʴb���F�^�PT�s�)+Xe)qL^wS�`�)%��9�x��bZ��y
Y4�F����$G�$�Rz����[���lu�ie)qN��K�<)�:�,�=�ۼ�R����x��5�'+X�OV�<���F[�g=w[-�A�����v����$+��Ҳ�i����*���	�e͙�Y���:5FM{6�����d)锵Z�*ʹ�v�U+�9�\���������P�e-��Eb)j�y��RwJ�6��Mrd\�pyYJ���t�mMO�'a8�R4��̍ﾒX��R�Vsb|q�id)	�ݛ��GR��$p�����Y��$r�J��^hi�̃�ūu'2+��s�rp�&��U��Pf��+�7�:w��|��EUe�`����$G�C�q�ō&1ŎG�s� Dq�Q�{�p��x���|��S%��<
\�n���9�X�_�y���6]���մ�Ŝt�q�<�RW����A �y��ػ����������p�7�l���?�:������*.ո;i��5�	 Ύ�ș`D*�JZA����V^���%�~������1�#�a'a*�;Qa�y�b��[��'[�"a���H�$��4� ���	j�ô7�xS�@�W�@ ��DF"���X����4g��'4��F�@ ����ܿ� ���e�~�U�T#�x��)vr#�Q��?���2��]i�{8>9^[�� �4�2{�F'&����|���|�.�?��Ȩ"�� 3Tp��93/Dp>ϙ�@�B�\���E��#��YA 7 `�2"���%�c�YM: ��S���"�+ P�9=+D�%�i �3� �G�vs�D ?&"� !�3nEФ��?Q��@D �Z4�]�~D �������6�	q�\.[[7����!��P�=��J��H�*]_��q�s��s��V�=w�� ��9wr��(Z����)'�IH����t�'0��y�luG�9@��UDV�W ��0ݙe)i e��.�� ����<����	�}m֛�������L ,6�  �x����~Tg����&c�U��` ���iڛu����<���?" �-��s[�!}����W�_�J���f����+^*����n�;�SSyp��c��6��e�G���;3Z�A�3�t��i�9b�Pg�����^����t����x��)O��Q�My95�G���;w9�n��$�z[������<w�#�)+��"������" U~}����O��[��|��]q;�lzt�;��Ȱ:��7�������E��*��oh�z���N<_�>���>>��|O�׷_L��/������զ9̳���{���z~����Ŀ?� �.݌��?�N����|��ZgO�o�����9��!�
Ƽ�}S߫˓���:����q�;i��i�]�t� G��Q0�_î!�w��?-��0_�|��nk�S�0l�>=]�e9�G��v��J[=Y9b�3�mE�X�X�-A��fV�2K�jS0"��2!��7��؀�3���3�\�+2�Z`��T	�hI-��N�2���A��M�@�jl����	���5�a�Y�6-o���������x}�}t��Zgs>1)���mQ?����vbZR����m���C��C�{�3o��=}b"/�|���o��?_^�_�+��,���5�U��� 4��]>	@Cl5���w��_$�c��V��sr*5 5��I��9��
�hJV�!�jk�A�=ٞ7���9<T�gť�o�٣����������l��Y�:���}�G�R}Ο����������r!Nϊ�C�;m7�dg����Ez���S%��8��)2Kͪ�6̰�5�/Ӥ�ag�1���,9Pu�]o�Q��{��;�J?<�Yo^_��~��.�>�����]����>߿Y�_�,�U_��o�~��[?n�=��Wg����>���������}y��N�m	n���Kro�䨯rJ���.u�e���-K��䐖��Y�['��N��p������r�Εܪ�x]���j1=^�wʩ4�,���!�&;ج��j�e��EcL���b�_��E�ϕ�u�$�Y��Lj��*���٢Z�y�F��m�p�
�Rw�����,Y�/q��h�M!���,V� �g��Y�J��
.��e�h#�m�d���Y�h�������k�c�q��ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[          [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dkk61swn36n7g"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                [remap]

path="res://.godot/exported/133200997/export-af5c6299bbb9ad1ccf1ba6e2b2e0a2fd-camera_2d.scn"
          [remap]

path="res://.godot/exported/133200997/export-eb17da0fd862ef336248750fc9767491-main.scn"
               [remap]

path="res://.godot/exported/133200997/export-bfb3ddd665018bb104e563202816d627-player.scn"
             [remap]

path="res://.godot/exported/133200997/export-24bb3549c7585f1580a721730030c641-seconditem.scn"
         [remap]

path="res://.godot/exported/133200997/export-76f3aac762695eef21cffbf4154c7bd2-thisitem.scn"
           list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             �D;WAʑ!   res://images/11png.png�6b,5h'   res://scenes and scripts/camera_2d.tscnK�grI�b"   res://scenes and scripts/main.tscn��?mAA$   res://scenes and scripts/player.tscn�^����D(   res://scenes and scripts/seconditem.tscn8�ܴ� k!&   res://scenes and scripts/thisitem.tscnR����hm   res://icon.svg         ECFG      application/config/name      	   spacegame      application/run/main_scene,      "   res://scenes and scripts/main.tscn     application/config/features(   "         4.2    GL Compatibility       application/config/icon         res://icon.svg     autoload/glob,      !   *res://scenes and scripts/glob.gd   "   display/window/size/viewport_width      �  #   display/window/size/viewport_height      8     display/window/stretch/mode         canvas_items   display/window/stretch/aspect         expand     editor_plugins/enabled8   "      *   res://addons/coi_serviceworker/plugin.cfg   
   input/jump�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode       	   key_label             unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   W   	   key_label             unicode    w      echo          script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script      
   input/left0              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   A   	   key_label             unicode    a      echo          script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script         input/right0              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   D   	   key_label             unicode    d      echo          script      
   input/down0              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   S   	   key_label             unicode    s      echo          script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script         layer_names/2d_physics/layer_1         player     layer_names/2d_physics/layer_2         npc    layer_names/2d_physics/layer_3      	   obstacles      layer_names/2d_physics/layer_4         items   #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility   