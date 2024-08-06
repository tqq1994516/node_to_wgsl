struct Vertex {
    position: vec3<f32>, // 顶点位置
    normal: vec3<f32>, // 顶点法线
    tex_coord: vec3<f32>, // 纹理坐标
}

struct Side {
    vertices: array<Vertex>, // 边包含顶点
    normal: vec3<f32>, // 边法线
}

struct FaceCorner {
    vertex: Vertex, // 角顶点
    sides: array<Side, 2>, // 脚包含边
    normal: vec3<f32>, // 角法线
}

struct Face {
    vertices: array<Vertex>, // 面包含顶点
    sides: array<Side>, // 面包含边
    face_corners: array<FaceCorner>, // 面包含角
    normal: vec3<f32>, // 面法线
}

struct Geometry {
    vertices: array<Vertex>, // 几何体包含顶点
    sides: array<Side>, // 几何体包含边
    face_corners: array<FaceCorner>, // 集合体包含角
    faces: array<Face>, // 几何体包含面
}

struct Data {
    b_value: bool,
    i_value: i32,
    i8_value: i32,
    f_value: f32,
    v_value: vec3<f32>,
    v2_value: vec2<f32>,
    c_value: vec3<f32>,
    cb_value: vec3<u32>,
    q_value: vec4<f32>,
}

struct Domain {
    is_point: bool,
    is_edge: bool,
    is_face: bool,
    is_face_corner: bool,
    is_spline: bool,
    is_instace: bool,
}
