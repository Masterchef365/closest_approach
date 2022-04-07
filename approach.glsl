// Assumes ray is a unit vector
float dist_ray_line_seg(vec3 ray, vec3 seg_a, vec3 seg_b) {
    vec3 diff = seg_b - seg_a; 
    float dist = length(diff);
    vec3 d = normalize(diff);
    vec3 j = seg_a;
    vec3 r = ray;

    float k = (dot(d, j) - (dot(r, d) * dot(r, j)))
        / (1. - dot(r, d) * dot(r, d));

    k = clamp(k, 0., dist); // Restrict k to the line segment

    float t = k * dot(r, d) - dot(r, j);

    vec3 a = ray * t;
    vec3 b = j + d * k;
    return distance(a, b);
}

