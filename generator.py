import json
mobs={'villager':'K','zombie':1,'creeper':1,'pig':1,'rabbit':2,'pufferfish':2,'iron_golem':2,'frog':2,'skeleton':3,'blaze':3,'phantom':3,'enderman':4,
      'slime':4,'shulker':4,'parrot':5,'cat':5,'sniffer':5,'wither':6}
def loot_table_gen(mobs:dict[str,int]):
    for mob in mobs:
        with open(rf'results/{mob}.json','x') as file:
            json.dump({"type":"minecraft:entity","pools":[{"rolls":{"type":"minecraft:constant","value":1},"bonus_rolls":0,"entries":[{"type":"minecraft:item","name":f"{mob}_spawn_egg","weight":1}]}],"functions": [{"function": "set_lore","lore":[{"text":f"Cost:{mobs[mob]}","color":"blue","bold":True}]}]},file)
    #iron golem,shulker box manually
    
def spawning_gen(mobs:dict[str,int]):
    for mob in mobs:
        try:
            with open(f'results/{mob}.mcfunction','x') as file:
                file.write(f"""function chegg:get_dir
execute if entity @p[advancements={'{chegg:'+mob+'=true}'},team=blue] run team join blue @e[type={mob},limit=1,sort=nearest]
execute if entity @p[advancements={'{chegg:'+mob+'=true}'},team=red] run team join red @e[type={mob},limit=1,sort=nearest]

execute if score #math blue_x >= #math red_x if score #math diff_x > #math diff_z run data merge entity @e[limit=1,type={mob},team=blue,sort=nearest,tag=!init] {'{Rotation:[90f,0f]'+',Tags:["init","king"]}'}
execute if score #math blue_x <= #math red_x if score #math diff_x > #math diff_z run data merge entity @e[limit=1,type={mob},team=blue,sort=nearest,tag=!init] {'{Rotation:[-90f,0f]'+',Tags:["init","king"]}'}
execute if score #math blue_x >= #math red_x if score #math diff_x > #math diff_z run data merge entity @e[limit=1,type={mob},team=red,sort=nearest,tag=!init] {'{Rotation:[-90f,0f]'+',Tags:["init","king"]}'}
execute if score #math blue_x <= #math red_x if score #math diff_x > #math diff_z run data merge entity @e[limit=1,type={mob},team=red,sort=nearest,tag=!init] {'{Rotation:[90f,0f]'+',Tags:["init","king"]}'}

execute if score #math blue_z >= #math red_z if score #math diff_z > #math diff_x run data merge entity @e[limit=1,type={mob},team=blue,sort=nearest,tag=!init] {'{Rotation:[180f,0f]'+',Tags:["init","king"]}'}
execute if score #math blue_z <= #math red_z if score #math diff_z > #math diff_x run data merge entity @e[limit=1,type={mob},team=blue,sort=nearest,tag=!init] {'{Rotation:[0f,0f]'+',Tags:["init","king"]}'}
execute if score #math blue_z >= #math red_z if score #math diff_z > #math diff_x run data merge entity @e[limit=1,type={mob},team=red,sort=nearest,tag=!init] {'{Rotation:[0f,0f]'+',Tags:["init","king"]}'}
execute if score #math blue_z <= #math red_z if score #math diff_z > #math diff_x run data merge entity @e[limit=1,type={mob},team=red,sort=nearest,tag=!init] {'{Rotation:[-180f,0f]'+',Tags:["init","king"]}'}
advancement revoke @p[advancements={'{chegg:'+mob+'=true}'},limit=1] only chegg:{mob}""")
        except FileExistsError:
            pass
def advancement_gen(mobs:dict[str,int]):
    for mob in mobs:
        with open(rf'results/{mob}.json','x') as file:
            json.dump(
    {
    "criteria": {
        "requirement":{
            "trigger": "minecraft:item_used_on_block",
            "conditions": {
                "location": [
                    {
                        "condition": "match_tool",
                        "predicate": {
                            "items":[f"minecraft:{mob}_spawn_egg"]
                        }
                    }
                ]
            }
        }
    },
    "rewards": {
        "function": f"spawning:{mob}"
    }
},file)

spawning_gen(mobs)