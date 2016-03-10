namespace :mesh_insert do
  desc '千住付近 5次メッシュ (250m) 災害データ'
  task :senju250 => :environment do
    meshcode_3rds = [
        53395612, 53395613, 53395614, 53395615,
        53395602, 53395603, 53395604, 53395605,
        53394692, 53394693, 53394694, 53394695,
        53394682, 53394683, 53394684, 53394685
    ]
    host = 'www.j-shis.bosai.go.jp'
    hazard_url_prefix = '/map/api/pshm/Y2014/AVR/TTL_MTTL/meshinfo.geojson?meshcode='

    label = 'hazard_6p_30y'
    name = '30年以内に震度6強がくる確率'

    mesh_type = MeshType.find_or_create_by(label: label, name: name)

    meshcode_3rds.each do |meshcode_3rd|
      puts "#{meshcode_3rd} comp"
      (1..4).map do |i|
        (1..4).map do |j|
          meshcode_5th = "#{meshcode_3rd}#{i}#{j}"
          meshcode = MeshCode.find_or_create_by(value: meshcode_5th, rank: 5)

          # 登録済みは skip
          if mesh_type.mesh_codes.exists?(id: meshcode.id)
            next
          end

          res = Net::HTTP.start(host) do |http|
            path = hazard_url_prefix + meshcode_5th
            http.get path
          end

          # 無かったら meshcode に緯度経度情報を補足
          if meshcode.southwest_lat.nil?
            # 登録に必要なのは南西の緯度経度
            geoms = RGeo::GeoJSON.decode(res.body, json_parser: :json)
            geom = geoms.first
            se_point = geom.geometry.exterior_ring.point_n(0)
            meshcode.southwest_long = se_point.x
            meshcode.southwest_lat = se_point.y
            meshcode.save
          end

          target_key = 'T30_I60_PS'
          mesh_type.meshs.create(
              mesh_code_id: meshcode.id,
              value: geom.property(target_key),
          )
        end
      end
    end
  end

  desc '千住付近 5次メッシュ (250m) ランダムデータ'
  task :senju_randoms => :environment do
    meshcode_3rds = [
        53395612, 53395613, 53395614, 53395615,
        53395602, 53395603, 53395604, 53395605,
        53394692, 53394693, 53394694, 53394695,
        53394682, 53394683, 53394684, 53394685
    ]

    mesh_types = [
        MeshType.find_or_create_by(label: 'random_light', name: 'ランダム(過疎)'),
        MeshType.find_or_create_by(label: 'random_normal', name: 'ランダム(普通)'),
        MeshType.find_or_create_by(label: 'random_congestion', name: 'ランダム(過密)')
    ]

    r = Random.new

    meshcode_3rds.each do |meshcode_3rd|
      (1..4).map do |i|
        (1..4).map do |j|
          meshcode_5th = "#{meshcode_3rd}#{i}#{j}"
          meshcode = MeshCode.find_or_create_by(value: meshcode_5th, rank: 5)
          mesh_types.each_with_index do |mesh_type, t|
            # 登録済みは skip
            if mesh_type.mesh_codes.exists?(id: meshcode.id)
              next
            end
            if t >= r.rand(3)
              mesh_type.meshs.create(
                  mesh_code_id: meshcode.id,
                  value: r.rand(1),
              )
            end
          end
        end
      end
    end
  end
end
