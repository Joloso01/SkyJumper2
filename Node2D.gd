extends Node2D

var targets_in_range = []

func _fixed_process(delta):
    if(Input.is_action_just_pressed("ui_accept")):
        for enemy in targets_in_range:
            enemy.deal_damage(100)

func on_exit_strike_range(target):
    for n in range(targets_in_range.size()):
        if(targets_in_range[n] == target):
            targets_in_range.remove(n)
            return

func on_enter_strike_range(target):
    targets_in_range.push_back(target)
