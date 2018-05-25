#!/usr/bin/env python3

from sufficient_distance_away import sufficient_distance_away

def pos_string_to_dict(s):
    latitude, longitude = [float(x) for x in s.split(',')]
    return (latitude,longitude)

position = pos_string_to_dict('-33.88260,151.20653')

assert(sufficient_distance_away(pos_string_to_dict('-33.88212,151.20699'),
    position, 300) == False)
assert(sufficient_distance_away(pos_string_to_dict('-33.88363,151.20829'),
    position, 300) == False)
assert(sufficient_distance_away(pos_string_to_dict('-33.882091,151.2095195'),
    position, 300) == False)


assert(sufficient_distance_away(pos_string_to_dict('-33.88444,151.19534'),
    position, 300) == True)
assert(sufficient_distance_away(pos_string_to_dict('63,51'),position, 300)
    == True)

print("All tests passed.")