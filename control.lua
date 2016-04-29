require "defines"

-- ==================================================================================================
-- Code from Toxic Jungle Mod. (https://forums.factorio.com/viewtopic.php?f=91&t=22348)
-- ==================================================================================================
-- list of tree entities
local trees = {
  --"dead-dry-hairy-tree",
  --"dead-grey-trunk",
  --"dead-tree",
  --"dry-hairy-tree",
  --"dry-tree",
  --"green-coral",
  "tree-01",
  "tree-02",
  "tree-02-red",
  "tree-03",
  "tree-04",
  "tree-05",
  "tree-06",
  "tree-06-brown",
  "tree-07",
  "tree-08",
  "tree-08-brown",
  "tree-08-red",
  "tree-09",
  "tree-09-brown",
  "tree-09-red"
}

-- chance of a tree being spawned on a tile (density)
local tree_chance = 0.6

function generate_trees(event)
  
  local entity = event.created_entity
  local surface = entity.surface
  
  -- bottom left of the chunk
  local minx = entity.position.x - 10.5
  local miny = entity.position.y - 10.5
  
  -- bottom right of the chunk
  local maxx = entity.position.x + 10.5
  local maxy = entity.position.y + 10.5
  
  surface.create_entity({name = "gackit-magicpuff", position = entity.position, force = game.forces.enemy})

  -- iterate left to right
  for x = minx, maxx do
  
    -- iterate up to down
    for y = miny, maxy do
      
      if math.random() < tree_chance then
        -- chose random tree type
        local tree_type = trees[math.random(#trees)]
      
        -- spawn tree
        if surface.can_place_entity{name = tree_type, position = {x, y}} then
          surface.create_entity{name = tree_type, position = {x, y}}
        end
      end
    end
  end
  entity.destroy()
end
-- ==================================================================================================

script.on_event(defines.events.on_built_entity, function(event)
	if event.created_entity.name == "gackit-seed" then
		generate_trees(event)
	end
end)


script.on_event(defines.events.on_robot_built_entity, function(event)
	if event.created_entity.name == "gackit-seed" then
		generate_trees(event)
	end
end)
