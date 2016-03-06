class Coordinate
  @@rank_distance = {
      5 => { lat: 0.002085, long: 0.003125 }
  }

  def self.square_polygon(southwest_lat, southwest_long, rank)
    d = @@rank_distance[rank]
    # south
    lat_down  = southwest_lat
    long_down = southwest_long
    lat_up    = southwest_lat  + d[:lat]
    long_up   = southwest_long + d[:long]
    end_point = [lat_down, long_down]
    # Polygon で返す
    return [
        end_point,
        [lat_up, long_down],
        [lat_up, long_up],
        [lat_down, long_up],
        end_point
    ]
  end
end