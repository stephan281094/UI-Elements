var t = new Trianglify({
    x_gradient: ["yellowgreen","#a1d99b","#31a354"],
    noiseIntensity: 0
});
var pattern = t.generate(
    document.body.clientWidth,
    document.body.clientHeight
);
document.getElementById('cover').setAttribute('style', 'background-image: '+pattern.dataUrl);
