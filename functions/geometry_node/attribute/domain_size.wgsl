import * as types from "../types.wgsl";

struct DomainSize {
    point_count: u32;
    edge_count: u32;
    face_count: u32;
    face_corner_count: u32;
}

fn domain_size(geometry: types.Geometry) -> DomainSize {
    var domain_size: DomainSize;
    domain_size.point_count = array_length(geometry.vertices);
    domain_size.edge_count = array_length(geometry.sides);
    domain_size.face_count = array_length(geometry.faces);
    domain_size.face_corner_count = array_length(geometry.face_corners);
    return domain_size;
}
