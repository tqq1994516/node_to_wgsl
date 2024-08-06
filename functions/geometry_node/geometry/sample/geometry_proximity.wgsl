struct InputDataType {
    is_faces: bool,
    is_edges: bool,
    is_points: bool,
}

struct OuputGeometryProximity {
    position: vec3<f32>,
    distance: f32,
    is_valid: bool,
}

fn geometry_proximity(geometry: types.Geometry, group: u32, sample_position: vec3<f32>, sample_group_id: u32, data_type: InputDataType) -> OuputGeometryProximity {
    var geometry_proximity: OuputGeometryProximity;
    return geometry_proximity;
}