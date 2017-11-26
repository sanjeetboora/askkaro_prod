(function() {
  var AvatarCrop, height, rx, ry, width;

  $(function() {});

  new AvatarCrop();

  AvatarCrop = (function() {
    function AvatarCrop() {}

    return AvatarCrop;

  })();

  ({
    constructor: function() {}
  });

  width = parseInt($('#cropbox').width());

  height = parseInt($('#cropbox').height());

  $('#cropbox').Jcrop()(function() {});

  ({
    aspectRatio: 1,
    setSelect: [0, 0, width, height],
    onSelect: this.update,
    onChange: this.update,
    update: (function(_this) {
      return function(coords) {};
    })(this)
  });

  $('#user_crop_x').val(coords.x);

  $('#user_crop_y').val(coords.y);

  $('#user_crop_w').val(coords.w);

  $('#user_crop_h').val(coords.h);

  this.updatePreview(coords);

  ({
    updatePreview: (function(_this) {
      return function(coords) {};
    })(this)
  });

  rx = 100 / coords.w;

  ry = 100 / coords.h;

  $('#preview').css;

  ({
    width: Math.round(rx * $('#cropbox').width()) + 'px',
    height: Math.round(ry * $('#cropbox').height()) + 'px',
    marginLeft: '-' + Math.round(rx * coords.x) + 'px',
    marginTop: '-' + Math.round(ry * coords.y) + 'px'
  });

}).call(this);
