import * as types from "../types.wgsl";

fn blur_attribute(data_type: types.Data, iterations: u32, weight: f32) -> types.Data {
    if data_type.b_value {
        data_type.b_value = true;
    } else if data_type.i_value {
        for (var i: u32 = 0; i < iterations; i = i + 1) {
            data_type.i_value += weight as i32;
        }
    } else if data_type.i8_value {
        for (var i: u32 = 0; i < iterations; i = i + 1) {
            data_type.i8_value += weight as i32;
        }
    } else if data_type.f_value {
        for (var i: u32 = 0; i < iterations; i = i + 1) {
            data_type.f_value += weight;
        }
    } else if data_type.v_value {
        for (var i: u32 = 0; i < iterations; i = i + 1) {
            data_type.v_value += vec3<f32>(weight, weight, weight);
        }
    } else if data_type.v2_value {
        for (var i: u32 = 0; i < iterations; i = i + 1) {
            data_type.v2_value += vec2<f32>(weight, weight);
        }
    } else if data_type.c_value {
        for (var i: u32 = 0; i < iterations; i = i + 1) {
            data_type.c_value += vec3<f32>(weight, weight, weight);
        }
    } else if data_type.cb_value {
        for (var i: u32 = 0; i < iterations; i = i + 1) {
            data_type.cb_value += vec3<u32>(weight as u32, weight as u32, weight as u32);
        }
    } else if data_type.q_value {
        for (var i: u32 = 0; i < iterations; i = i + 1) {
            data_type.q_value += vec4<f32>(weight, weight, weight, 0);
        }
    }
    return data_type;
