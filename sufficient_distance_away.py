from geopy import distance

def sufficient_distance_away(point, position, min_distance):
    return distance.distance(point, position).meters >= min_distance
