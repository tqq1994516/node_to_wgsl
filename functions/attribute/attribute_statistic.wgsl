import * as types from "../types.wgsl";

struct OuputAttributeStatistic {
    is_float: bool;

    f_mean: f32;
    f_median: f32;
    f_sum: f32;
    f_min: f32;
    f_max: f32;
    f_range: f32;
    f_standard_deviation: f32;
    f_variance: f32;

    v_mean: vec3<f32>;
    v_median: vec3<f32>;
    v_sum: vec3<f32>;
    v_min: vec3<f32>;
    v_max: vec3<f32>;
    v_range: vec3<f32>;
    v_standard_deviation: vec3<f32>;
    v_variance: vec3<f32>;
}

// TODO：完善逻辑
fn attribute_statistic_float(geometry: types.Geometry, selection: bool, attribute: f32, input_attribute_domain: types.Domain) -> OuputAttributeStatistic {
    var statistic: OuputAttributeStatistic;
    statistic.is_float = true;
    if input_attribute_domain.is_point {
    }
    return statistic
}

// TODO：完善逻辑
fn attribute_statistic_vector(geometry: types.Geometry, selection: bool, attribute: vec3<f32>, input_attribute_domain: types.Domain) -> OuputAttributeStatistic {
    var statistic: OuputAttributeStatistic;
    if input_attribute_domain.is_point {
    }
    return statistic
}