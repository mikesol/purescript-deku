// output/Control.Apply/foreign.js
var arrayApply = function(fs) {
  return function(xs) {
    var l = fs.length;
    var k = xs.length;
    var result = new Array(l * k);
    var n = 0;
    for (var i2 = 0; i2 < l; i2++) {
      var f = fs[i2];
      for (var j = 0; j < k; j++) {
        result[n++] = f(xs[j]);
      }
    }
    return result;
  };
};

// output/Control.Semigroupoid/index.js
var semigroupoidFn = {
  compose: function(f) {
    return function(g2) {
      return function(x) {
        return f(g2(x));
      };
    };
  }
};
var compose = function(dict) {
  return dict.compose;
};
var composeFlipped = function(dictSemigroupoid) {
  var compose1 = compose(dictSemigroupoid);
  return function(f) {
    return function(g2) {
      return compose1(g2)(f);
    };
  };
};

// output/Control.Category/index.js
var identity = function(dict) {
  return dict.identity;
};
var categoryFn = {
  identity: function(x) {
    return x;
  },
  Semigroupoid0: function() {
    return semigroupoidFn;
  }
};

// output/Data.Boolean/index.js
var otherwise = true;

// output/Data.Function/index.js
var on = function(f) {
  return function(g2) {
    return function(x) {
      return function(y) {
        return f(g2(x))(g2(y));
      };
    };
  };
};
var flip = function(f) {
  return function(b2) {
    return function(a2) {
      return f(a2)(b2);
    };
  };
};
var $$const = function(a2) {
  return function(v) {
    return a2;
  };
};
var applyFlipped = function(x) {
  return function(f) {
    return f(x);
  };
};

// output/Data.Functor/foreign.js
var arrayMap = function(f) {
  return function(arr) {
    var l = arr.length;
    var result = new Array(l);
    for (var i2 = 0; i2 < l; i2++) {
      result[i2] = f(arr[i2]);
    }
    return result;
  };
};

// output/Data.Unit/foreign.js
var unit = void 0;

// output/Type.Proxy/index.js
var $$Proxy = /* @__PURE__ */ function() {
  function $$Proxy2() {
  }
  ;
  $$Proxy2.value = new $$Proxy2();
  return $$Proxy2;
}();

// output/Data.Functor/index.js
var map = function(dict) {
  return dict.map;
};
var mapFlipped = function(dictFunctor) {
  var map112 = map(dictFunctor);
  return function(fa) {
    return function(f) {
      return map112(f)(fa);
    };
  };
};
var $$void = function(dictFunctor) {
  return map(dictFunctor)($$const(unit));
};
var voidLeft = function(dictFunctor) {
  var map112 = map(dictFunctor);
  return function(f) {
    return function(x) {
      return map112($$const(x))(f);
    };
  };
};
var functorFn = {
  map: /* @__PURE__ */ compose(semigroupoidFn)
};
var functorArray = {
  map: arrayMap
};

// output/Control.Apply/index.js
var identity2 = /* @__PURE__ */ identity(categoryFn);
var applyArray = {
  apply: arrayApply,
  Functor0: function() {
    return functorArray;
  }
};
var apply = function(dict) {
  return dict.apply;
};
var applySecond = function(dictApply) {
  var apply1 = apply(dictApply);
  var map31 = map(dictApply.Functor0());
  return function(a2) {
    return function(b2) {
      return apply1(map31($$const(identity2))(a2))(b2);
    };
  };
};
var lift2 = function(dictApply) {
  var apply1 = apply(dictApply);
  var map31 = map(dictApply.Functor0());
  return function(f) {
    return function(a2) {
      return function(b2) {
        return apply1(map31(f)(a2))(b2);
      };
    };
  };
};

// output/Control.Applicative/index.js
var pure = function(dict) {
  return dict.pure;
};
var when = function(dictApplicative) {
  var pure114 = pure(dictApplicative);
  return function(v) {
    return function(v1) {
      if (v) {
        return v1;
      }
      ;
      if (!v) {
        return pure114(unit);
      }
      ;
      throw new Error("Failed pattern match at Control.Applicative (line 63, column 1 - line 63, column 63): " + [v.constructor.name, v1.constructor.name]);
    };
  };
};
var liftA1 = function(dictApplicative) {
  var apply7 = apply(dictApplicative.Apply0());
  var pure114 = pure(dictApplicative);
  return function(f) {
    return function(a2) {
      return apply7(pure114(f))(a2);
    };
  };
};
var applicativeArray = {
  pure: function(x) {
    return [x];
  },
  Apply0: function() {
    return applyArray;
  }
};

// output/Control.Bind/foreign.js
var arrayBind = function(arr) {
  return function(f) {
    var result = [];
    for (var i2 = 0, l = arr.length; i2 < l; i2++) {
      Array.prototype.push.apply(result, f(arr[i2]));
    }
    return result;
  };
};

// output/Control.Bind/index.js
var identity3 = /* @__PURE__ */ identity(categoryFn);
var discard = function(dict) {
  return dict.discard;
};
var bindArray = {
  bind: arrayBind,
  Apply0: function() {
    return applyArray;
  }
};
var bind = function(dict) {
  return dict.bind;
};
var bindFlipped = function(dictBind) {
  return flip(bind(dictBind));
};
var composeKleisliFlipped = function(dictBind) {
  var bindFlipped1 = bindFlipped(dictBind);
  return function(f) {
    return function(g2) {
      return function(a2) {
        return bindFlipped1(f)(g2(a2));
      };
    };
  };
};
var composeKleisli = function(dictBind) {
  var bind1 = bind(dictBind);
  return function(f) {
    return function(g2) {
      return function(a2) {
        return bind1(f(a2))(g2);
      };
    };
  };
};
var discardUnit = {
  discard: function(dictBind) {
    return bind(dictBind);
  }
};
var join = function(dictBind) {
  var bind1 = bind(dictBind);
  return function(m) {
    return bind1(m)(identity3);
  };
};

// output/Unsafe.Coerce/foreign.js
var unsafeCoerce = function(x) {
  return x;
};

// output/Control.Monad.ST.Global/index.js
var toEffect = unsafeCoerce;

// output/Control.Monad.ST.Internal/foreign.js
var map_ = function(f) {
  return function(a2) {
    return function() {
      return f(a2());
    };
  };
};
var pure_ = function(a2) {
  return function() {
    return a2;
  };
};
var bind_ = function(a2) {
  return function(f) {
    return function() {
      return f(a2())();
    };
  };
};
var foreach = function(as) {
  return function(f) {
    return function() {
      for (var i2 = 0, l = as.length; i2 < l; i2++) {
        f(as[i2])();
      }
    };
  };
};
function newSTRef(val) {
  return function() {
    return { value: val };
  };
}
var read = function(ref) {
  return function() {
    return ref.value;
  };
};
var modifyImpl = function(f) {
  return function(ref) {
    return function() {
      var t = f(ref.value);
      ref.value = t.state;
      return t.value;
    };
  };
};
var write = function(a2) {
  return function(ref) {
    return function() {
      return ref.value = a2;
    };
  };
};

// output/Control.Monad/index.js
var ap = function(dictMonad) {
  var bind11 = bind(dictMonad.Bind1());
  var pure35 = pure(dictMonad.Applicative0());
  return function(f) {
    return function(a2) {
      return bind11(f)(function(f$prime) {
        return bind11(a2)(function(a$prime) {
          return pure35(f$prime(a$prime));
        });
      });
    };
  };
};

// output/Data.Semigroup/foreign.js
var concatString = function(s1) {
  return function(s2) {
    return s1 + s2;
  };
};
var concatArray = function(xs) {
  return function(ys) {
    if (xs.length === 0)
      return ys;
    if (ys.length === 0)
      return xs;
    return xs.concat(ys);
  };
};

// output/Data.Symbol/index.js
var reflectSymbol = function(dict) {
  return dict.reflectSymbol;
};

// output/Record.Unsafe/foreign.js
var unsafeGet = function(label5) {
  return function(rec) {
    return rec[label5];
  };
};
var unsafeSet = function(label5) {
  return function(value13) {
    return function(rec) {
      var copy3 = {};
      for (var key2 in rec) {
        if ({}.hasOwnProperty.call(rec, key2)) {
          copy3[key2] = rec[key2];
        }
      }
      copy3[label5] = value13;
      return copy3;
    };
  };
};

// output/Data.Semigroup/index.js
var semigroupUnit = {
  append: function(v) {
    return function(v1) {
      return unit;
    };
  }
};
var semigroupString = {
  append: concatString
};
var semigroupArray = {
  append: concatArray
};
var append = function(dict) {
  return dict.append;
};

// output/Control.Alt/index.js
var alt = function(dict) {
  return dict.alt;
};

// output/Data.Bounded/foreign.js
var topInt = 2147483647;
var bottomInt = -2147483648;
var topChar = String.fromCharCode(65535);
var bottomChar = String.fromCharCode(0);
var topNumber = Number.POSITIVE_INFINITY;
var bottomNumber = Number.NEGATIVE_INFINITY;

// output/Data.Ord/foreign.js
var unsafeCompareImpl = function(lt) {
  return function(eq7) {
    return function(gt) {
      return function(x) {
        return function(y) {
          return x < y ? lt : x === y ? eq7 : gt;
        };
      };
    };
  };
};
var ordIntImpl = unsafeCompareImpl;
var ordStringImpl = unsafeCompareImpl;

// output/Data.Eq/foreign.js
var refEq = function(r1) {
  return function(r2) {
    return r1 === r2;
  };
};
var eqIntImpl = refEq;
var eqStringImpl = refEq;

// output/Data.Eq/index.js
var eqString = {
  eq: eqStringImpl
};
var eqInt = {
  eq: eqIntImpl
};
var eq = function(dict) {
  return dict.eq;
};

// output/Data.Ordering/index.js
var LT = /* @__PURE__ */ function() {
  function LT2() {
  }
  ;
  LT2.value = new LT2();
  return LT2;
}();
var GT = /* @__PURE__ */ function() {
  function GT2() {
  }
  ;
  GT2.value = new GT2();
  return GT2;
}();
var EQ = /* @__PURE__ */ function() {
  function EQ2() {
  }
  ;
  EQ2.value = new EQ2();
  return EQ2;
}();

// output/Data.Ring/foreign.js
var intSub = function(x) {
  return function(y) {
    return x - y | 0;
  };
};

// output/Data.Semiring/foreign.js
var intAdd = function(x) {
  return function(y) {
    return x + y | 0;
  };
};
var intMul = function(x) {
  return function(y) {
    return x * y | 0;
  };
};
var numAdd = function(n1) {
  return function(n2) {
    return n1 + n2;
  };
};
var numMul = function(n1) {
  return function(n2) {
    return n1 * n2;
  };
};

// output/Data.Semiring/index.js
var semiringNumber = {
  add: numAdd,
  zero: 0,
  mul: numMul,
  one: 1
};
var semiringInt = {
  add: intAdd,
  zero: 0,
  mul: intMul,
  one: 1
};
var mul = function(dict) {
  return dict.mul;
};
var add = function(dict) {
  return dict.add;
};

// output/Data.Ring/index.js
var ringInt = {
  sub: intSub,
  Semiring0: function() {
    return semiringInt;
  }
};

// output/Data.Ord/index.js
var ordString = /* @__PURE__ */ function() {
  return {
    compare: ordStringImpl(LT.value)(EQ.value)(GT.value),
    Eq0: function() {
      return eqString;
    }
  };
}();
var ordInt = /* @__PURE__ */ function() {
  return {
    compare: ordIntImpl(LT.value)(EQ.value)(GT.value),
    Eq0: function() {
      return eqInt;
    }
  };
}();
var compare = function(dict) {
  return dict.compare;
};

// output/Data.Bounded/index.js
var top = function(dict) {
  return dict.top;
};
var boundedInt = {
  top: topInt,
  bottom: bottomInt,
  Ord0: function() {
    return ordInt;
  }
};
var bottom = function(dict) {
  return dict.bottom;
};

// output/Data.Show/foreign.js
var showIntImpl = function(n) {
  return n.toString();
};
var showNumberImpl = function(n) {
  var str = n.toString();
  return isNaN(str + ".0") ? str : str + ".0";
};
var showStringImpl = function(s2) {
  var l = s2.length;
  return '"' + s2.replace(
    /[\0-\x1F\x7F"\\]/g,
    function(c, i2) {
      switch (c) {
        case '"':
        case "\\":
          return "\\" + c;
        case "\x07":
          return "\\a";
        case "\b":
          return "\\b";
        case "\f":
          return "\\f";
        case "\n":
          return "\\n";
        case "\r":
          return "\\r";
        case "	":
          return "\\t";
        case "\v":
          return "\\v";
      }
      var k = i2 + 1;
      var empty11 = k < l && s2[k] >= "0" && s2[k] <= "9" ? "\\&" : "";
      return "\\" + c.charCodeAt(0).toString(10) + empty11;
    }
  ) + '"';
};

// output/Data.Show/index.js
var showString = {
  show: showStringImpl
};
var showNumber = {
  show: showNumberImpl
};
var showInt = {
  show: showIntImpl
};
var show = function(dict) {
  return dict.show;
};

// output/Data.Maybe/index.js
var identity4 = /* @__PURE__ */ identity(categoryFn);
var Nothing = /* @__PURE__ */ function() {
  function Nothing2() {
  }
  ;
  Nothing2.value = new Nothing2();
  return Nothing2;
}();
var Just = /* @__PURE__ */ function() {
  function Just2(value0) {
    this.value0 = value0;
  }
  ;
  Just2.create = function(value0) {
    return new Just2(value0);
  };
  return Just2;
}();
var maybe = function(v) {
  return function(v1) {
    return function(v2) {
      if (v2 instanceof Nothing) {
        return v;
      }
      ;
      if (v2 instanceof Just) {
        return v1(v2.value0);
      }
      ;
      throw new Error("Failed pattern match at Data.Maybe (line 237, column 1 - line 237, column 51): " + [v.constructor.name, v1.constructor.name, v2.constructor.name]);
    };
  };
};
var isJust = /* @__PURE__ */ maybe(false)(/* @__PURE__ */ $$const(true));
var functorMaybe = {
  map: function(v) {
    return function(v1) {
      if (v1 instanceof Just) {
        return new Just(v(v1.value0));
      }
      ;
      return Nothing.value;
    };
  }
};
var map2 = /* @__PURE__ */ map(functorMaybe);
var fromMaybe = function(a2) {
  return maybe(a2)(identity4);
};
var fromJust = function() {
  return function(v) {
    if (v instanceof Just) {
      return v.value0;
    }
    ;
    throw new Error("Failed pattern match at Data.Maybe (line 288, column 1 - line 288, column 46): " + [v.constructor.name]);
  };
};
var eqMaybe = function(dictEq) {
  var eq7 = eq(dictEq);
  return {
    eq: function(x) {
      return function(y) {
        if (x instanceof Nothing && y instanceof Nothing) {
          return true;
        }
        ;
        if (x instanceof Just && y instanceof Just) {
          return eq7(x.value0)(y.value0);
        }
        ;
        return false;
      };
    }
  };
};
var ordMaybe = function(dictOrd) {
  var compare3 = compare(dictOrd);
  var eqMaybe1 = eqMaybe(dictOrd.Eq0());
  return {
    compare: function(x) {
      return function(y) {
        if (x instanceof Nothing && y instanceof Nothing) {
          return EQ.value;
        }
        ;
        if (x instanceof Nothing) {
          return LT.value;
        }
        ;
        if (y instanceof Nothing) {
          return GT.value;
        }
        ;
        if (x instanceof Just && y instanceof Just) {
          return compare3(x.value0)(y.value0);
        }
        ;
        throw new Error("Failed pattern match at Data.Maybe (line 0, column 0 - line 0, column 0): " + [x.constructor.name, y.constructor.name]);
      };
    },
    Eq0: function() {
      return eqMaybe1;
    }
  };
};
var applyMaybe = {
  apply: function(v) {
    return function(v1) {
      if (v instanceof Just) {
        return map2(v.value0)(v1);
      }
      ;
      if (v instanceof Nothing) {
        return Nothing.value;
      }
      ;
      throw new Error("Failed pattern match at Data.Maybe (line 67, column 1 - line 69, column 30): " + [v.constructor.name, v1.constructor.name]);
    };
  },
  Functor0: function() {
    return functorMaybe;
  }
};
var bindMaybe = {
  bind: function(v) {
    return function(v1) {
      if (v instanceof Just) {
        return v1(v.value0);
      }
      ;
      if (v instanceof Nothing) {
        return Nothing.value;
      }
      ;
      throw new Error("Failed pattern match at Data.Maybe (line 125, column 1 - line 127, column 28): " + [v.constructor.name, v1.constructor.name]);
    };
  },
  Apply0: function() {
    return applyMaybe;
  }
};
var applicativeMaybe = /* @__PURE__ */ function() {
  return {
    pure: Just.create,
    Apply0: function() {
      return applyMaybe;
    }
  };
}();
var altMaybe = {
  alt: function(v) {
    return function(v1) {
      if (v instanceof Nothing) {
        return v1;
      }
      ;
      return v;
    };
  },
  Functor0: function() {
    return functorMaybe;
  }
};
var plusMaybe = /* @__PURE__ */ function() {
  return {
    empty: Nothing.value,
    Alt0: function() {
      return altMaybe;
    }
  };
}();

// output/Data.Either/index.js
var Left = /* @__PURE__ */ function() {
  function Left2(value0) {
    this.value0 = value0;
  }
  ;
  Left2.create = function(value0) {
    return new Left2(value0);
  };
  return Left2;
}();
var Right = /* @__PURE__ */ function() {
  function Right2(value0) {
    this.value0 = value0;
  }
  ;
  Right2.create = function(value0) {
    return new Right2(value0);
  };
  return Right2;
}();
var note = function(a2) {
  return maybe(new Left(a2))(Right.create);
};
var functorEither = {
  map: function(f) {
    return function(m) {
      if (m instanceof Left) {
        return new Left(m.value0);
      }
      ;
      if (m instanceof Right) {
        return new Right(f(m.value0));
      }
      ;
      throw new Error("Failed pattern match at Data.Either (line 0, column 0 - line 0, column 0): " + [m.constructor.name]);
    };
  }
};
var map3 = /* @__PURE__ */ map(functorEither);
var either = function(v) {
  return function(v1) {
    return function(v2) {
      if (v2 instanceof Left) {
        return v(v2.value0);
      }
      ;
      if (v2 instanceof Right) {
        return v1(v2.value0);
      }
      ;
      throw new Error("Failed pattern match at Data.Either (line 208, column 1 - line 208, column 64): " + [v.constructor.name, v1.constructor.name, v2.constructor.name]);
    };
  };
};
var hush = /* @__PURE__ */ function() {
  return either($$const(Nothing.value))(Just.create);
}();
var applyEither = {
  apply: function(v) {
    return function(v1) {
      if (v instanceof Left) {
        return new Left(v.value0);
      }
      ;
      if (v instanceof Right) {
        return map3(v.value0)(v1);
      }
      ;
      throw new Error("Failed pattern match at Data.Either (line 70, column 1 - line 72, column 30): " + [v.constructor.name, v1.constructor.name]);
    };
  },
  Functor0: function() {
    return functorEither;
  }
};
var bindEither = {
  bind: /* @__PURE__ */ either(function(e) {
    return function(v) {
      return new Left(e);
    };
  })(function(a2) {
    return function(f) {
      return f(a2);
    };
  }),
  Apply0: function() {
    return applyEither;
  }
};
var applicativeEither = /* @__PURE__ */ function() {
  return {
    pure: Right.create,
    Apply0: function() {
      return applyEither;
    }
  };
}();

// output/Data.Identity/index.js
var Identity = function(x) {
  return x;
};
var functorIdentity = {
  map: function(f) {
    return function(m) {
      return f(m);
    };
  }
};
var applyIdentity = {
  apply: function(v) {
    return function(v1) {
      return v(v1);
    };
  },
  Functor0: function() {
    return functorIdentity;
  }
};
var bindIdentity = {
  bind: function(v) {
    return function(f) {
      return f(v);
    };
  },
  Apply0: function() {
    return applyIdentity;
  }
};
var applicativeIdentity = {
  pure: Identity,
  Apply0: function() {
    return applyIdentity;
  }
};
var monadIdentity = {
  Applicative0: function() {
    return applicativeIdentity;
  },
  Bind1: function() {
    return bindIdentity;
  }
};

// output/Data.EuclideanRing/foreign.js
var intDegree = function(x) {
  return Math.min(Math.abs(x), 2147483647);
};
var intDiv = function(x) {
  return function(y) {
    if (y === 0)
      return 0;
    return y > 0 ? Math.floor(x / y) : -Math.floor(x / -y);
  };
};
var intMod = function(x) {
  return function(y) {
    if (y === 0)
      return 0;
    var yy = Math.abs(y);
    return (x % yy + yy) % yy;
  };
};

// output/Data.CommutativeRing/index.js
var commutativeRingInt = {
  Ring0: function() {
    return ringInt;
  }
};

// output/Data.EuclideanRing/index.js
var mod = function(dict) {
  return dict.mod;
};
var euclideanRingInt = {
  degree: intDegree,
  div: intDiv,
  mod: intMod,
  CommutativeRing0: function() {
    return commutativeRingInt;
  }
};

// output/Data.Monoid/index.js
var monoidUnit = {
  mempty: unit,
  Semigroup0: function() {
    return semigroupUnit;
  }
};
var monoidString = {
  mempty: "",
  Semigroup0: function() {
    return semigroupString;
  }
};
var mempty = function(dict) {
  return dict.mempty;
};

// output/Effect/foreign.js
var pureE = function(a2) {
  return function() {
    return a2;
  };
};
var bindE = function(a2) {
  return function(f) {
    return function() {
      return f(a2())();
    };
  };
};

// output/Effect/index.js
var $runtime_lazy = function(name16, moduleName, init3) {
  var state4 = 0;
  var val;
  return function(lineNumber) {
    if (state4 === 2)
      return val;
    if (state4 === 1)
      throw new ReferenceError(name16 + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state4 = 1;
    val = init3();
    state4 = 2;
    return val;
  };
};
var monadEffect = {
  Applicative0: function() {
    return applicativeEffect;
  },
  Bind1: function() {
    return bindEffect;
  }
};
var bindEffect = {
  bind: bindE,
  Apply0: function() {
    return $lazy_applyEffect(0);
  }
};
var applicativeEffect = {
  pure: pureE,
  Apply0: function() {
    return $lazy_applyEffect(0);
  }
};
var $lazy_functorEffect = /* @__PURE__ */ $runtime_lazy("functorEffect", "Effect", function() {
  return {
    map: liftA1(applicativeEffect)
  };
});
var $lazy_applyEffect = /* @__PURE__ */ $runtime_lazy("applyEffect", "Effect", function() {
  return {
    apply: ap(monadEffect),
    Functor0: function() {
      return $lazy_functorEffect(0);
    }
  };
});
var functorEffect = /* @__PURE__ */ $lazy_functorEffect(20);
var applyEffect = /* @__PURE__ */ $lazy_applyEffect(23);
var lift22 = /* @__PURE__ */ lift2(applyEffect);
var semigroupEffect = function(dictSemigroup) {
  return {
    append: lift22(append(dictSemigroup))
  };
};
var monoidEffect = function(dictMonoid) {
  var semigroupEffect1 = semigroupEffect(dictMonoid.Semigroup0());
  return {
    mempty: pureE(mempty(dictMonoid)),
    Semigroup0: function() {
      return semigroupEffect1;
    }
  };
};

// output/Effect.Ref/foreign.js
var _new = function(val) {
  return function() {
    return { value: val };
  };
};
var read2 = function(ref) {
  return function() {
    return ref.value;
  };
};
var modifyImpl2 = function(f) {
  return function(ref) {
    return function() {
      var t = f(ref.value);
      ref.value = t.state;
      return t.value;
    };
  };
};
var write2 = function(val) {
  return function(ref) {
    return function() {
      ref.value = val;
    };
  };
};

// output/Effect.Ref/index.js
var $$void2 = /* @__PURE__ */ $$void(functorEffect);
var $$new = _new;
var modify$prime = modifyImpl2;
var modify = function(f) {
  return modify$prime(function(s2) {
    var s$prime = f(s2);
    return {
      state: s$prime,
      value: s$prime
    };
  });
};
var modify_ = function(f) {
  return function(s2) {
    return $$void2(modify(f)(s2));
  };
};

// output/Control.Monad.ST.Internal/index.js
var $runtime_lazy2 = function(name16, moduleName, init3) {
  var state4 = 0;
  var val;
  return function(lineNumber) {
    if (state4 === 2)
      return val;
    if (state4 === 1)
      throw new ReferenceError(name16 + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state4 = 1;
    val = init3();
    state4 = 2;
    return val;
  };
};
var modify$prime2 = modifyImpl;
var modify2 = function(f) {
  return modify$prime2(function(s2) {
    var s$prime = f(s2);
    return {
      state: s$prime,
      value: s$prime
    };
  });
};
var functorST = {
  map: map_
};
var monadST = {
  Applicative0: function() {
    return applicativeST;
  },
  Bind1: function() {
    return bindST;
  }
};
var bindST = {
  bind: bind_,
  Apply0: function() {
    return $lazy_applyST(0);
  }
};
var applicativeST = {
  pure: pure_,
  Apply0: function() {
    return $lazy_applyST(0);
  }
};
var $lazy_applyST = /* @__PURE__ */ $runtime_lazy2("applyST", "Control.Monad.ST.Internal", function() {
  return {
    apply: ap(monadST),
    Functor0: function() {
      return functorST;
    }
  };
});
var applyST = /* @__PURE__ */ $lazy_applyST(47);
var lift23 = /* @__PURE__ */ lift2(applyST);
var semigroupST = function(dictSemigroup) {
  return {
    append: lift23(append(dictSemigroup))
  };
};

// output/Data.Argonaut.Parser/foreign.js
function _jsonParser(fail3, succ2, s2) {
  try {
    return succ2(JSON.parse(s2));
  } catch (e) {
    return fail3(e.message);
  }
}

// output/Data.Argonaut.Parser/index.js
var jsonParser = function(j) {
  return _jsonParser(Left.create, Right.create, j);
};

// output/Data.Array/foreign.js
var replicateFill = function(count2) {
  return function(value13) {
    if (count2 < 1) {
      return [];
    }
    var result = new Array(count2);
    return result.fill(value13);
  };
};
var replicatePolyfill = function(count2) {
  return function(value13) {
    var result = [];
    var n = 0;
    for (var i2 = 0; i2 < count2; i2++) {
      result[n++] = value13;
    }
    return result;
  };
};
var replicate = typeof Array.prototype.fill === "function" ? replicateFill : replicatePolyfill;
var fromFoldableImpl = function() {
  function Cons3(head6, tail2) {
    this.head = head6;
    this.tail = tail2;
  }
  var emptyList = {};
  function curryCons(head6) {
    return function(tail2) {
      return new Cons3(head6, tail2);
    };
  }
  function listToArray(list) {
    var result = [];
    var count2 = 0;
    var xs = list;
    while (xs !== emptyList) {
      result[count2++] = xs.head;
      xs = xs.tail;
    }
    return result;
  }
  return function(foldr5) {
    return function(xs) {
      return listToArray(foldr5(curryCons)(emptyList)(xs));
    };
  };
}();
var length = function(xs) {
  return xs.length;
};
var unconsImpl = function(empty11) {
  return function(next2) {
    return function(xs) {
      return xs.length === 0 ? empty11({}) : next2(xs[0])(xs.slice(1));
    };
  };
};
var indexImpl = function(just) {
  return function(nothing) {
    return function(xs) {
      return function(i2) {
        return i2 < 0 || i2 >= xs.length ? nothing : just(xs[i2]);
      };
    };
  };
};
var findMapImpl = function(nothing) {
  return function(isJust2) {
    return function(f) {
      return function(xs) {
        for (var i2 = 0; i2 < xs.length; i2++) {
          var result = f(xs[i2]);
          if (isJust2(result))
            return result;
        }
        return nothing;
      };
    };
  };
};
var findIndexImpl = function(just) {
  return function(nothing) {
    return function(f) {
      return function(xs) {
        for (var i2 = 0, l = xs.length; i2 < l; i2++) {
          if (f(xs[i2]))
            return just(i2);
        }
        return nothing;
      };
    };
  };
};
var _deleteAt = function(just) {
  return function(nothing) {
    return function(i2) {
      return function(l) {
        if (i2 < 0 || i2 >= l.length)
          return nothing;
        var l1 = l.slice();
        l1.splice(i2, 1);
        return just(l1);
      };
    };
  };
};
var filter = function(f) {
  return function(xs) {
    return xs.filter(f);
  };
};
var partition = function(f) {
  return function(xs) {
    var yes = [];
    var no = [];
    for (var i2 = 0; i2 < xs.length; i2++) {
      var x = xs[i2];
      if (f(x))
        yes.push(x);
      else
        no.push(x);
    }
    return { yes, no };
  };
};
var sortByImpl = function() {
  function mergeFromTo(compare3, fromOrdering, xs1, xs2, from3, to2) {
    var mid;
    var i2;
    var j;
    var k;
    var x;
    var y;
    var c;
    mid = from3 + (to2 - from3 >> 1);
    if (mid - from3 > 1)
      mergeFromTo(compare3, fromOrdering, xs2, xs1, from3, mid);
    if (to2 - mid > 1)
      mergeFromTo(compare3, fromOrdering, xs2, xs1, mid, to2);
    i2 = from3;
    j = mid;
    k = from3;
    while (i2 < mid && j < to2) {
      x = xs2[i2];
      y = xs2[j];
      c = fromOrdering(compare3(x)(y));
      if (c > 0) {
        xs1[k++] = y;
        ++j;
      } else {
        xs1[k++] = x;
        ++i2;
      }
    }
    while (i2 < mid) {
      xs1[k++] = xs2[i2++];
    }
    while (j < to2) {
      xs1[k++] = xs2[j++];
    }
  }
  return function(compare3) {
    return function(fromOrdering) {
      return function(xs) {
        var out;
        if (xs.length < 2)
          return xs;
        out = xs.slice(0);
        mergeFromTo(compare3, fromOrdering, out, xs.slice(0), 0, xs.length);
        return out;
      };
    };
  };
}();
var unsafeIndexImpl = function(xs) {
  return function(n) {
    return xs[n];
  };
};

// output/Control.Lazy/index.js
var $runtime_lazy3 = function(name16, moduleName, init3) {
  var state4 = 0;
  var val;
  return function(lineNumber) {
    if (state4 === 2)
      return val;
    if (state4 === 1)
      throw new ReferenceError(name16 + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state4 = 1;
    val = init3();
    state4 = 2;
    return val;
  };
};
var lazyFn = {
  defer: function(f) {
    return function(x) {
      return f(unit)(x);
    };
  }
};
var defer = function(dict) {
  return dict.defer;
};
var fix = function(dictLazy) {
  var defer1 = defer(dictLazy);
  return function(f) {
    var $lazy_go = $runtime_lazy3("go", "Control.Lazy", function() {
      return defer1(function(v) {
        return f($lazy_go(25));
      });
    });
    var go2 = $lazy_go(25);
    return go2;
  };
};

// output/Data.Array.ST/foreign.js
function newSTArray() {
  return [];
}
var pushAll = function(as) {
  return function(xs) {
    return function() {
      return xs.push.apply(xs, as);
    };
  };
};
var splice = function(i2) {
  return function(howMany) {
    return function(bs) {
      return function(xs) {
        return function() {
          return xs.splice.apply(xs, [i2, howMany].concat(bs));
        };
      };
    };
  };
};
var unsafeFreeze = function(xs) {
  return function() {
    return xs;
  };
};
function copyImpl(xs) {
  return function() {
    return xs.slice();
  };
}
var freeze = copyImpl;
var thaw = copyImpl;
var sortByImpl2 = function() {
  function mergeFromTo(compare3, fromOrdering, xs1, xs2, from3, to2) {
    var mid;
    var i2;
    var j;
    var k;
    var x;
    var y;
    var c;
    mid = from3 + (to2 - from3 >> 1);
    if (mid - from3 > 1)
      mergeFromTo(compare3, fromOrdering, xs2, xs1, from3, mid);
    if (to2 - mid > 1)
      mergeFromTo(compare3, fromOrdering, xs2, xs1, mid, to2);
    i2 = from3;
    j = mid;
    k = from3;
    while (i2 < mid && j < to2) {
      x = xs2[i2];
      y = xs2[j];
      c = fromOrdering(compare3(x)(y));
      if (c > 0) {
        xs1[k++] = y;
        ++j;
      } else {
        xs1[k++] = x;
        ++i2;
      }
    }
    while (i2 < mid) {
      xs1[k++] = xs2[i2++];
    }
    while (j < to2) {
      xs1[k++] = xs2[j++];
    }
  }
  return function(compare3) {
    return function(fromOrdering) {
      return function(xs) {
        return function() {
          if (xs.length < 2)
            return xs;
          mergeFromTo(compare3, fromOrdering, xs, xs.slice(0), 0, xs.length);
          return xs;
        };
      };
    };
  };
}();

// output/Data.Array.ST/index.js
var withArray = function(f) {
  return function(xs) {
    return function __do3() {
      var result = thaw(xs)();
      f(result)();
      return unsafeFreeze(result)();
    };
  };
};
var push = function(a2) {
  return pushAll([a2]);
};

// output/Data.HeytingAlgebra/foreign.js
var boolConj = function(b1) {
  return function(b2) {
    return b1 && b2;
  };
};
var boolDisj = function(b1) {
  return function(b2) {
    return b1 || b2;
  };
};
var boolNot = function(b2) {
  return !b2;
};

// output/Data.HeytingAlgebra/index.js
var not = function(dict) {
  return dict.not;
};
var ff = function(dict) {
  return dict.ff;
};
var disj = function(dict) {
  return dict.disj;
};
var heytingAlgebraBoolean = {
  ff: false,
  tt: true,
  implies: function(a2) {
    return function(b2) {
      return disj(heytingAlgebraBoolean)(not(heytingAlgebraBoolean)(a2))(b2);
    };
  },
  conj: boolConj,
  disj: boolDisj,
  not: boolNot
};

// output/Data.Array.ST.Iterator/index.js
var map4 = /* @__PURE__ */ map(functorST);
var not2 = /* @__PURE__ */ not(heytingAlgebraBoolean);
var $$void3 = /* @__PURE__ */ $$void(functorST);
var Iterator = /* @__PURE__ */ function() {
  function Iterator2(value0, value1) {
    this.value0 = value0;
    this.value1 = value1;
  }
  ;
  Iterator2.create = function(value0) {
    return function(value1) {
      return new Iterator2(value0, value1);
    };
  };
  return Iterator2;
}();
var next = function(v) {
  return function __do3() {
    var i2 = read(v.value1)();
    modify2(function(v1) {
      return v1 + 1 | 0;
    })(v.value1)();
    return v.value0(i2);
  };
};
var iterator = function(f) {
  return map4(Iterator.create(f))(newSTRef(0));
};
var iterate = function(iter) {
  return function(f) {
    return function __do3() {
      var $$break = newSTRef(false)();
      while (map4(not2)(read($$break))()) {
        (function __do4() {
          var mx = next(iter)();
          if (mx instanceof Just) {
            return f(mx.value0)();
          }
          ;
          if (mx instanceof Nothing) {
            return $$void3(write(true)($$break))();
          }
          ;
          throw new Error("Failed pattern match at Data.Array.ST.Iterator (line 42, column 5 - line 44, column 47): " + [mx.constructor.name]);
        })();
      }
      ;
      return {};
    };
  };
};

// output/Data.Foldable/foreign.js
var foldrArray = function(f) {
  return function(init3) {
    return function(xs) {
      var acc = init3;
      var len = xs.length;
      for (var i2 = len - 1; i2 >= 0; i2--) {
        acc = f(xs[i2])(acc);
      }
      return acc;
    };
  };
};
var foldlArray = function(f) {
  return function(init3) {
    return function(xs) {
      var acc = init3;
      var len = xs.length;
      for (var i2 = 0; i2 < len; i2++) {
        acc = f(acc)(xs[i2]);
      }
      return acc;
    };
  };
};

// output/Control.Plus/index.js
var empty = function(dict) {
  return dict.empty;
};

// output/Data.Tuple/index.js
var Tuple = /* @__PURE__ */ function() {
  function Tuple2(value0, value1) {
    this.value0 = value0;
    this.value1 = value1;
  }
  ;
  Tuple2.create = function(value0) {
    return function(value1) {
      return new Tuple2(value0, value1);
    };
  };
  return Tuple2;
}();
var snd = function(v) {
  return v.value1;
};
var functorTuple = {
  map: function(f) {
    return function(m) {
      return new Tuple(m.value0, f(m.value1));
    };
  }
};
var fst = function(v) {
  return v.value0;
};
var curry = function(f) {
  return function(a2) {
    return function(b2) {
      return f(new Tuple(a2, b2));
    };
  };
};
var applyTuple = function(dictSemigroup) {
  var append16 = append(dictSemigroup);
  return {
    apply: function(v) {
      return function(v1) {
        return new Tuple(append16(v.value0)(v1.value0), v.value1(v1.value1));
      };
    },
    Functor0: function() {
      return functorTuple;
    }
  };
};
var applicativeTuple = function(dictMonoid) {
  var applyTuple1 = applyTuple(dictMonoid.Semigroup0());
  return {
    pure: Tuple.create(mempty(dictMonoid)),
    Apply0: function() {
      return applyTuple1;
    }
  };
};

// output/Data.Bifunctor/index.js
var identity5 = /* @__PURE__ */ identity(categoryFn);
var bimap = function(dict) {
  return dict.bimap;
};
var lmap = function(dictBifunctor) {
  var bimap1 = bimap(dictBifunctor);
  return function(f) {
    return bimap1(f)(identity5);
  };
};
var bifunctorEither = {
  bimap: function(v) {
    return function(v1) {
      return function(v2) {
        if (v2 instanceof Left) {
          return new Left(v(v2.value0));
        }
        ;
        if (v2 instanceof Right) {
          return new Right(v1(v2.value0));
        }
        ;
        throw new Error("Failed pattern match at Data.Bifunctor (line 32, column 1 - line 34, column 36): " + [v.constructor.name, v1.constructor.name, v2.constructor.name]);
      };
    };
  }
};

// output/Data.Monoid.Disj/index.js
var Disj = function(x) {
  return x;
};
var semigroupDisj = function(dictHeytingAlgebra) {
  var disj2 = disj(dictHeytingAlgebra);
  return {
    append: function(v) {
      return function(v1) {
        return disj2(v)(v1);
      };
    }
  };
};
var monoidDisj = function(dictHeytingAlgebra) {
  var semigroupDisj1 = semigroupDisj(dictHeytingAlgebra);
  return {
    mempty: ff(dictHeytingAlgebra),
    Semigroup0: function() {
      return semigroupDisj1;
    }
  };
};

// output/Data.Monoid.Endo/index.js
var Endo = function(x) {
  return x;
};
var semigroupEndo = function(dictSemigroupoid) {
  var compose2 = compose(dictSemigroupoid);
  return {
    append: function(v) {
      return function(v1) {
        return compose2(v)(v1);
      };
    }
  };
};
var monoidEndo = function(dictCategory) {
  var semigroupEndo1 = semigroupEndo(dictCategory.Semigroupoid0());
  return {
    mempty: identity(dictCategory),
    Semigroup0: function() {
      return semigroupEndo1;
    }
  };
};

// output/Safe.Coerce/index.js
var coerce = function() {
  return unsafeCoerce;
};

// output/Data.Newtype/index.js
var coerce2 = /* @__PURE__ */ coerce();
var wrap = function() {
  return coerce2;
};
var unwrap = function() {
  return coerce2;
};
var alaF = function() {
  return function() {
    return function() {
      return function() {
        return function(v) {
          return coerce2;
        };
      };
    };
  };
};

// output/Data.Foldable/index.js
var unwrap2 = /* @__PURE__ */ unwrap();
var monoidEndo2 = /* @__PURE__ */ monoidEndo(categoryFn);
var alaF2 = /* @__PURE__ */ alaF()()()();
var foldr = function(dict) {
  return dict.foldr;
};
var oneOf = function(dictFoldable) {
  var foldr22 = foldr(dictFoldable);
  return function(dictPlus) {
    return foldr22(alt(dictPlus.Alt0()))(empty(dictPlus));
  };
};
var oneOfMap = function(dictFoldable) {
  var foldr22 = foldr(dictFoldable);
  return function(dictPlus) {
    var alt17 = alt(dictPlus.Alt0());
    var empty11 = empty(dictPlus);
    return function(f) {
      return foldr22(function($453) {
        return alt17(f($453));
      })(empty11);
    };
  };
};
var traverse_ = function(dictApplicative) {
  var applySecond13 = applySecond(dictApplicative.Apply0());
  var pure35 = pure(dictApplicative);
  return function(dictFoldable) {
    var foldr22 = foldr(dictFoldable);
    return function(f) {
      return foldr22(function($454) {
        return applySecond13(f($454));
      })(pure35(unit));
    };
  };
};
var for_ = function(dictApplicative) {
  var traverse_1 = traverse_(dictApplicative);
  return function(dictFoldable) {
    return flip(traverse_1(dictFoldable));
  };
};
var foldl = function(dict) {
  return dict.foldl;
};
var intercalate = function(dictFoldable) {
  var foldl22 = foldl(dictFoldable);
  return function(dictMonoid) {
    var append11 = append(dictMonoid.Semigroup0());
    var mempty3 = mempty(dictMonoid);
    return function(sep) {
      return function(xs) {
        var go2 = function(v) {
          return function(v1) {
            if (v.init) {
              return {
                init: false,
                acc: v1
              };
            }
            ;
            return {
              init: false,
              acc: append11(v.acc)(append11(sep)(v1))
            };
          };
        };
        return foldl22(go2)({
          init: true,
          acc: mempty3
        })(xs).acc;
      };
    };
  };
};
var foldableMaybe = {
  foldr: function(v) {
    return function(v1) {
      return function(v2) {
        if (v2 instanceof Nothing) {
          return v1;
        }
        ;
        if (v2 instanceof Just) {
          return v(v2.value0)(v1);
        }
        ;
        throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): " + [v.constructor.name, v1.constructor.name, v2.constructor.name]);
      };
    };
  },
  foldl: function(v) {
    return function(v1) {
      return function(v2) {
        if (v2 instanceof Nothing) {
          return v1;
        }
        ;
        if (v2 instanceof Just) {
          return v(v1)(v2.value0);
        }
        ;
        throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): " + [v.constructor.name, v1.constructor.name, v2.constructor.name]);
      };
    };
  },
  foldMap: function(dictMonoid) {
    var mempty3 = mempty(dictMonoid);
    return function(v) {
      return function(v1) {
        if (v1 instanceof Nothing) {
          return mempty3;
        }
        ;
        if (v1 instanceof Just) {
          return v(v1.value0);
        }
        ;
        throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): " + [v.constructor.name, v1.constructor.name]);
      };
    };
  }
};
var foldMapDefaultR = function(dictFoldable) {
  var foldr22 = foldr(dictFoldable);
  return function(dictMonoid) {
    var append11 = append(dictMonoid.Semigroup0());
    var mempty3 = mempty(dictMonoid);
    return function(f) {
      return foldr22(function(x) {
        return function(acc) {
          return append11(f(x))(acc);
        };
      })(mempty3);
    };
  };
};
var foldableArray = {
  foldr: foldrArray,
  foldl: foldlArray,
  foldMap: function(dictMonoid) {
    return foldMapDefaultR(foldableArray)(dictMonoid);
  }
};
var foldMapDefaultL = function(dictFoldable) {
  var foldl22 = foldl(dictFoldable);
  return function(dictMonoid) {
    var append11 = append(dictMonoid.Semigroup0());
    var mempty3 = mempty(dictMonoid);
    return function(f) {
      return foldl22(function(acc) {
        return function(x) {
          return append11(acc)(f(x));
        };
      })(mempty3);
    };
  };
};
var foldMap = function(dict) {
  return dict.foldMap;
};
var foldrDefault = function(dictFoldable) {
  var foldMap22 = foldMap(dictFoldable)(monoidEndo2);
  return function(c) {
    return function(u2) {
      return function(xs) {
        return unwrap2(foldMap22(function($459) {
          return Endo(c($459));
        })(xs))(u2);
      };
    };
  };
};
var any = function(dictFoldable) {
  var foldMap22 = foldMap(dictFoldable);
  return function(dictHeytingAlgebra) {
    return alaF2(Disj)(foldMap22(monoidDisj(dictHeytingAlgebra)));
  };
};

// output/Data.FunctorWithIndex/foreign.js
var mapWithIndexArray = function(f) {
  return function(xs) {
    var l = xs.length;
    var result = Array(l);
    for (var i2 = 0; i2 < l; i2++) {
      result[i2] = f(i2)(xs[i2]);
    }
    return result;
  };
};

// output/Data.FunctorWithIndex/index.js
var mapWithIndex = function(dict) {
  return dict.mapWithIndex;
};
var functorWithIndexArray = {
  mapWithIndex: mapWithIndexArray,
  Functor0: function() {
    return functorArray;
  }
};

// output/Data.Traversable/foreign.js
var traverseArrayImpl = function() {
  function array1(a2) {
    return [a2];
  }
  function array2(a2) {
    return function(b2) {
      return [a2, b2];
    };
  }
  function array3(a2) {
    return function(b2) {
      return function(c) {
        return [a2, b2, c];
      };
    };
  }
  function concat22(xs) {
    return function(ys) {
      return xs.concat(ys);
    };
  }
  return function(apply7) {
    return function(map31) {
      return function(pure35) {
        return function(f) {
          return function(array) {
            function go2(bot, top3) {
              switch (top3 - bot) {
                case 0:
                  return pure35([]);
                case 1:
                  return map31(array1)(f(array[bot]));
                case 2:
                  return apply7(map31(array2)(f(array[bot])))(f(array[bot + 1]));
                case 3:
                  return apply7(apply7(map31(array3)(f(array[bot])))(f(array[bot + 1])))(f(array[bot + 2]));
                default:
                  var pivot = bot + Math.floor((top3 - bot) / 4) * 2;
                  return apply7(map31(concat22)(go2(bot, pivot)))(go2(pivot, top3));
              }
            }
            return go2(0, array.length);
          };
        };
      };
    };
  };
}();

// output/Data.Traversable/index.js
var identity6 = /* @__PURE__ */ identity(categoryFn);
var traverse = function(dict) {
  return dict.traverse;
};
var sequenceDefault = function(dictTraversable) {
  var traverse22 = traverse(dictTraversable);
  return function(dictApplicative) {
    return traverse22(dictApplicative)(identity6);
  };
};
var traversableArray = {
  traverse: function(dictApplicative) {
    var Apply0 = dictApplicative.Apply0();
    return traverseArrayImpl(apply(Apply0))(map(Apply0.Functor0()))(pure(dictApplicative));
  },
  sequence: function(dictApplicative) {
    return sequenceDefault(traversableArray)(dictApplicative);
  },
  Functor0: function() {
    return functorArray;
  },
  Foldable1: function() {
    return foldableArray;
  }
};

// output/Data.Array/index.js
var map1 = /* @__PURE__ */ map(functorMaybe);
var fromJust2 = /* @__PURE__ */ fromJust();
var append2 = /* @__PURE__ */ append(semigroupArray);
var unsafeIndex = function() {
  return unsafeIndexImpl;
};
var unsafeIndex1 = /* @__PURE__ */ unsafeIndex();
var uncons = /* @__PURE__ */ function() {
  return unconsImpl($$const(Nothing.value))(function(x) {
    return function(xs) {
      return new Just({
        head: x,
        tail: xs
      });
    };
  });
}();
var sortBy = function(comp) {
  return sortByImpl(comp)(function(v) {
    if (v instanceof GT) {
      return 1;
    }
    ;
    if (v instanceof EQ) {
      return 0;
    }
    ;
    if (v instanceof LT) {
      return -1 | 0;
    }
    ;
    throw new Error("Failed pattern match at Data.Array (line 870, column 31 - line 873, column 11): " + [v.constructor.name]);
  });
};
var snoc = function(xs) {
  return function(x) {
    return withArray(push(x))(xs)();
  };
};
var singleton2 = function(a2) {
  return [a2];
};
var mapWithIndex2 = /* @__PURE__ */ mapWithIndex(functorWithIndexArray);
var index = /* @__PURE__ */ function() {
  return indexImpl(Just.create)(Nothing.value);
}();
var last = function(xs) {
  return index(xs)(length(xs) - 1 | 0);
};
var head = function(xs) {
  return index(xs)(0);
};
var fromFoldable = function(dictFoldable) {
  return fromFoldableImpl(foldr(dictFoldable));
};
var findMap = /* @__PURE__ */ function() {
  return findMapImpl(Nothing.value)(isJust);
}();
var findIndex = /* @__PURE__ */ function() {
  return findIndexImpl(Just.create)(Nothing.value);
}();
var find2 = function(f) {
  return function(xs) {
    return map1(unsafeIndex1(xs))(findIndex(f)(xs));
  };
};
var deleteAt = /* @__PURE__ */ function() {
  return _deleteAt(Just.create)(Nothing.value);
}();
var deleteBy = function(v) {
  return function(v1) {
    return function(v2) {
      if (v2.length === 0) {
        return [];
      }
      ;
      return maybe(v2)(function(i2) {
        return fromJust2(deleteAt(i2)(v2));
      })(findIndex(v(v1))(v2));
    };
  };
};
var cons = function(x) {
  return function(xs) {
    return append2([x])(xs);
  };
};
var concatMap = /* @__PURE__ */ flip(/* @__PURE__ */ bind(bindArray));
var mapMaybe = function(f) {
  return concatMap(function() {
    var $191 = maybe([])(singleton2);
    return function($192) {
      return $191(f($192));
    };
  }());
};

// output/Data.Codec/index.js
var Codec = /* @__PURE__ */ function() {
  function Codec2(value0, value1) {
    this.value0 = value0;
    this.value1 = value1;
  }
  ;
  Codec2.create = function(value0) {
    return function(value1) {
      return new Codec2(value0, value1);
    };
  };
  return Codec2;
}();
var encode = function(v) {
  return function($87) {
    return fst(v.value1($87));
  };
};
var decode = function(v) {
  return v.value0;
};
var codec$prime = function(f) {
  return function(g2) {
    return new Codec(f, function(b2) {
      return new Tuple(g2(b2), b2);
    });
  };
};
var codec = function(f) {
  return function(g2) {
    return new Codec(f, function(b2) {
      return new Tuple(g2(b2), b2);
    });
  };
};

// output/Data.Argonaut.Core/foreign.js
function id(x) {
  return x;
}
function stringify(j) {
  return JSON.stringify(j);
}
function stringifyWithIndent(i2) {
  return function(j) {
    return JSON.stringify(j, null, i2);
  };
}
function _caseJson(isNull2, isBool, isNum, isStr, isArr, isObj, j) {
  if (j == null)
    return isNull2();
  else if (typeof j === "boolean")
    return isBool(j);
  else if (typeof j === "number")
    return isNum(j);
  else if (typeof j === "string")
    return isStr(j);
  else if (Object.prototype.toString.call(j) === "[object Array]")
    return isArr(j);
  else
    return isObj(j);
}

// output/Foreign.Object/foreign.js
function _copyST(m) {
  return function() {
    var r = {};
    for (var k in m) {
      if (hasOwnProperty.call(m, k)) {
        r[k] = m[k];
      }
    }
    return r;
  };
}
var empty2 = {};
function runST(f) {
  return f();
}
function _foldM(bind11) {
  return function(f) {
    return function(mz) {
      return function(m) {
        var acc = mz;
        function g2(k2) {
          return function(z) {
            return f(z)(k2)(m[k2]);
          };
        }
        for (var k in m) {
          if (hasOwnProperty.call(m, k)) {
            acc = bind11(acc)(g2(k));
          }
        }
        return acc;
      };
    };
  };
}
function _lookup(no, yes, k, m) {
  return k in m ? yes(m[k]) : no;
}
function toArrayWithKey(f) {
  return function(m) {
    var r = [];
    for (var k in m) {
      if (hasOwnProperty.call(m, k)) {
        r.push(f(k)(m[k]));
      }
    }
    return r;
  };
}
var keys = Object.keys || toArrayWithKey(function(k) {
  return function() {
    return k;
  };
});

// output/Data.FoldableWithIndex/index.js
var foldrWithIndex = function(dict) {
  return dict.foldrWithIndex;
};
var foldlWithIndex = function(dict) {
  return dict.foldlWithIndex;
};
var foldMapWithIndex = function(dict) {
  return dict.foldMapWithIndex;
};

// output/Data.Function.Uncurried/foreign.js
var runFn3 = function(fn) {
  return function(a2) {
    return function(b2) {
      return function(c) {
        return fn(a2, b2, c);
      };
    };
  };
};
var runFn4 = function(fn) {
  return function(a2) {
    return function(b2) {
      return function(c) {
        return function(d) {
          return fn(a2, b2, c, d);
        };
      };
    };
  };
};

// output/Foreign.Object.ST/foreign.js
var newImpl = function() {
  return {};
};
function poke2(k) {
  return function(v) {
    return function(m) {
      return function() {
        m[k] = v;
        return m;
      };
    };
  };
}
var deleteImpl = function(k) {
  return function(m) {
    return function() {
      delete m[k];
      return m;
    };
  };
};

// output/Foreign.Object/index.js
var $$void4 = /* @__PURE__ */ $$void(functorST);
var foldr2 = /* @__PURE__ */ foldr(foldableArray);
var values = /* @__PURE__ */ toArrayWithKey(function(v) {
  return function(v1) {
    return v1;
  };
});
var thawST = _copyST;
var mutate = function(f) {
  return function(m) {
    return runST(function __do3() {
      var s2 = thawST(m)();
      f(s2)();
      return s2;
    });
  };
};
var lookup = /* @__PURE__ */ function() {
  return runFn4(_lookup)(Nothing.value)(Just.create);
}();
var insert = function(k) {
  return function(v) {
    return mutate(poke2(k)(v));
  };
};
var fromFoldable2 = function(dictFoldable) {
  var fromFoldable1 = fromFoldable(dictFoldable);
  return function(l) {
    return runST(function __do3() {
      var s2 = newImpl();
      foreach(fromFoldable1(l))(function(v) {
        return $$void4(poke2(v.value0)(v.value1)(s2));
      })();
      return s2;
    });
  };
};
var fold2 = /* @__PURE__ */ _foldM(applyFlipped);
var foldMap2 = function(dictMonoid) {
  var append16 = append(dictMonoid.Semigroup0());
  var mempty3 = mempty(dictMonoid);
  return function(f) {
    return fold2(function(acc) {
      return function(k) {
        return function(v) {
          return append16(acc)(f(k)(v));
        };
      };
    })(mempty3);
  };
};
var foldableObject = {
  foldl: function(f) {
    return fold2(function(z) {
      return function(v) {
        return f(z);
      };
    });
  },
  foldr: function(f) {
    return function(z) {
      return function(m) {
        return foldr2(f)(z)(values(m));
      };
    };
  },
  foldMap: function(dictMonoid) {
    var foldMap12 = foldMap2(dictMonoid);
    return function(f) {
      return foldMap12($$const(f));
    };
  }
};
var $$delete = function(k) {
  return mutate(deleteImpl(k));
};

// output/Data.Argonaut.Core/index.js
var verbJsonType = function(def) {
  return function(f) {
    return function(g2) {
      return g2(def)(f);
    };
  };
};
var toJsonType = /* @__PURE__ */ function() {
  return verbJsonType(Nothing.value)(Just.create);
}();
var jsonEmptyObject = /* @__PURE__ */ id(empty2);
var caseJsonString = function(d) {
  return function(f) {
    return function(j) {
      return _caseJson($$const(d), $$const(d), $$const(d), f, $$const(d), $$const(d), j);
    };
  };
};
var toString = /* @__PURE__ */ toJsonType(caseJsonString);
var caseJsonObject = function(d) {
  return function(f) {
    return function(j) {
      return _caseJson($$const(d), $$const(d), $$const(d), $$const(d), $$const(d), f, j);
    };
  };
};
var toObject = /* @__PURE__ */ toJsonType(caseJsonObject);
var caseJsonBoolean = function(d) {
  return function(f) {
    return function(j) {
      return _caseJson($$const(d), f, $$const(d), $$const(d), $$const(d), $$const(d), j);
    };
  };
};
var toBoolean = /* @__PURE__ */ toJsonType(caseJsonBoolean);

// output/Data.Int/foreign.js
var fromNumberImpl = function(just) {
  return function(nothing) {
    return function(n) {
      return (n | 0) === n ? just(n) : nothing;
    };
  };
};
var toNumber = function(n) {
  return n;
};

// output/Data.Number/foreign.js
var isFiniteImpl = isFinite;
var floor = Math.floor;
var remainder = function(n) {
  return function(m) {
    return n % m;
  };
};

// output/Data.Int/index.js
var top2 = /* @__PURE__ */ top(boundedInt);
var bottom2 = /* @__PURE__ */ bottom(boundedInt);
var fromNumber = /* @__PURE__ */ function() {
  return fromNumberImpl(Just.create)(Nothing.value);
}();
var unsafeClamp = function(x) {
  if (!isFiniteImpl(x)) {
    return 0;
  }
  ;
  if (x >= toNumber(top2)) {
    return top2;
  }
  ;
  if (x <= toNumber(bottom2)) {
    return bottom2;
  }
  ;
  if (otherwise) {
    return fromMaybe(0)(fromNumber(x));
  }
  ;
  throw new Error("Failed pattern match at Data.Int (line 72, column 1 - line 72, column 29): " + [x.constructor.name]);
};
var floor2 = function($39) {
  return unsafeClamp(floor($39));
};

// output/Data.NonEmpty/index.js
var NonEmpty = /* @__PURE__ */ function() {
  function NonEmpty2(value0, value1) {
    this.value0 = value0;
    this.value1 = value1;
  }
  ;
  NonEmpty2.create = function(value0) {
    return function(value1) {
      return new NonEmpty2(value0, value1);
    };
  };
  return NonEmpty2;
}();
var singleton4 = function(dictPlus) {
  var empty11 = empty(dictPlus);
  return function(a2) {
    return new NonEmpty(a2, empty11);
  };
};

// output/Data.List.Types/index.js
var Nil = /* @__PURE__ */ function() {
  function Nil3() {
  }
  ;
  Nil3.value = new Nil3();
  return Nil3;
}();
var Cons = /* @__PURE__ */ function() {
  function Cons3(value0, value1) {
    this.value0 = value0;
    this.value1 = value1;
  }
  ;
  Cons3.create = function(value0) {
    return function(value1) {
      return new Cons3(value0, value1);
    };
  };
  return Cons3;
}();
var NonEmptyList = function(x) {
  return x;
};
var toList = function(v) {
  return new Cons(v.value0, v.value1);
};
var listMap = function(f) {
  var chunkedRevMap = function($copy_v) {
    return function($copy_v1) {
      var $tco_var_v = $copy_v;
      var $tco_done = false;
      var $tco_result;
      function $tco_loop(v, v1) {
        if (v1 instanceof Cons && (v1.value1 instanceof Cons && v1.value1.value1 instanceof Cons)) {
          $tco_var_v = new Cons(v1, v);
          $copy_v1 = v1.value1.value1.value1;
          return;
        }
        ;
        var unrolledMap = function(v2) {
          if (v2 instanceof Cons && (v2.value1 instanceof Cons && v2.value1.value1 instanceof Nil)) {
            return new Cons(f(v2.value0), new Cons(f(v2.value1.value0), Nil.value));
          }
          ;
          if (v2 instanceof Cons && v2.value1 instanceof Nil) {
            return new Cons(f(v2.value0), Nil.value);
          }
          ;
          return Nil.value;
        };
        var reverseUnrolledMap = function($copy_v2) {
          return function($copy_v3) {
            var $tco_var_v2 = $copy_v2;
            var $tco_done1 = false;
            var $tco_result2;
            function $tco_loop2(v2, v3) {
              if (v2 instanceof Cons && (v2.value0 instanceof Cons && (v2.value0.value1 instanceof Cons && v2.value0.value1.value1 instanceof Cons))) {
                $tco_var_v2 = v2.value1;
                $copy_v3 = new Cons(f(v2.value0.value0), new Cons(f(v2.value0.value1.value0), new Cons(f(v2.value0.value1.value1.value0), v3)));
                return;
              }
              ;
              $tco_done1 = true;
              return v3;
            }
            ;
            while (!$tco_done1) {
              $tco_result2 = $tco_loop2($tco_var_v2, $copy_v3);
            }
            ;
            return $tco_result2;
          };
        };
        $tco_done = true;
        return reverseUnrolledMap(v)(unrolledMap(v1));
      }
      ;
      while (!$tco_done) {
        $tco_result = $tco_loop($tco_var_v, $copy_v1);
      }
      ;
      return $tco_result;
    };
  };
  return chunkedRevMap(Nil.value);
};
var functorList = {
  map: listMap
};
var foldableList = {
  foldr: function(f) {
    return function(b2) {
      var rev3 = function() {
        var go2 = function($copy_v) {
          return function($copy_v1) {
            var $tco_var_v = $copy_v;
            var $tco_done = false;
            var $tco_result;
            function $tco_loop(v, v1) {
              if (v1 instanceof Nil) {
                $tco_done = true;
                return v;
              }
              ;
              if (v1 instanceof Cons) {
                $tco_var_v = new Cons(v1.value0, v);
                $copy_v1 = v1.value1;
                return;
              }
              ;
              throw new Error("Failed pattern match at Data.List.Types (line 107, column 7 - line 107, column 23): " + [v.constructor.name, v1.constructor.name]);
            }
            ;
            while (!$tco_done) {
              $tco_result = $tco_loop($tco_var_v, $copy_v1);
            }
            ;
            return $tco_result;
          };
        };
        return go2(Nil.value);
      }();
      var $284 = foldl(foldableList)(flip(f))(b2);
      return function($285) {
        return $284(rev3($285));
      };
    };
  },
  foldl: function(f) {
    var go2 = function($copy_b) {
      return function($copy_v) {
        var $tco_var_b = $copy_b;
        var $tco_done1 = false;
        var $tco_result;
        function $tco_loop(b2, v) {
          if (v instanceof Nil) {
            $tco_done1 = true;
            return b2;
          }
          ;
          if (v instanceof Cons) {
            $tco_var_b = f(b2)(v.value0);
            $copy_v = v.value1;
            return;
          }
          ;
          throw new Error("Failed pattern match at Data.List.Types (line 111, column 12 - line 113, column 30): " + [v.constructor.name]);
        }
        ;
        while (!$tco_done1) {
          $tco_result = $tco_loop($tco_var_b, $copy_v);
        }
        ;
        return $tco_result;
      };
    };
    return go2;
  },
  foldMap: function(dictMonoid) {
    var append22 = append(dictMonoid.Semigroup0());
    var mempty3 = mempty(dictMonoid);
    return function(f) {
      return foldl(foldableList)(function(acc) {
        var $286 = append22(acc);
        return function($287) {
          return $286(f($287));
        };
      })(mempty3);
    };
  }
};
var foldr3 = /* @__PURE__ */ foldr(foldableList);
var semigroupList = {
  append: function(xs) {
    return function(ys) {
      return foldr3(Cons.create)(ys)(xs);
    };
  }
};
var append1 = /* @__PURE__ */ append(semigroupList);
var monoidList = /* @__PURE__ */ function() {
  return {
    mempty: Nil.value,
    Semigroup0: function() {
      return semigroupList;
    }
  };
}();
var semigroupNonEmptyList = {
  append: function(v) {
    return function(as$prime) {
      return new NonEmpty(v.value0, append1(v.value1)(toList(as$prime)));
    };
  }
};
var altList = {
  alt: append1,
  Functor0: function() {
    return functorList;
  }
};
var plusList = /* @__PURE__ */ function() {
  return {
    empty: Nil.value,
    Alt0: function() {
      return altList;
    }
  };
}();

// output/Data.String.CodePoints/foreign.js
var hasArrayFrom = typeof Array.from === "function";
var hasStringIterator = typeof Symbol !== "undefined" && Symbol != null && typeof Symbol.iterator !== "undefined" && typeof String.prototype[Symbol.iterator] === "function";
var hasFromCodePoint = typeof String.prototype.fromCodePoint === "function";
var hasCodePointAt = typeof String.prototype.codePointAt === "function";

// output/Data.String.Common/foreign.js
var replace = function(s1) {
  return function(s2) {
    return function(s3) {
      return s3.replace(s1, s2);
    };
  };
};
var joinWith = function(s2) {
  return function(xs) {
    return xs.join(s2);
  };
};

// output/Data.Codec.Argonaut/index.js
var show2 = /* @__PURE__ */ show(showString);
var show1 = /* @__PURE__ */ show(showInt);
var bind2 = /* @__PURE__ */ bind(bindEither);
var lmap2 = /* @__PURE__ */ lmap(bifunctorEither);
var pure2 = /* @__PURE__ */ pure(applicativeEither);
var bindFlipped2 = /* @__PURE__ */ bindFlipped(bindEither);
var fromFoldable3 = /* @__PURE__ */ fromFoldable2(foldableList);
var TypeMismatch = /* @__PURE__ */ function() {
  function TypeMismatch3(value0) {
    this.value0 = value0;
  }
  ;
  TypeMismatch3.create = function(value0) {
    return new TypeMismatch3(value0);
  };
  return TypeMismatch3;
}();
var UnexpectedValue = /* @__PURE__ */ function() {
  function UnexpectedValue2(value0) {
    this.value0 = value0;
  }
  ;
  UnexpectedValue2.create = function(value0) {
    return new UnexpectedValue2(value0);
  };
  return UnexpectedValue2;
}();
var AtIndex = /* @__PURE__ */ function() {
  function AtIndex2(value0, value1) {
    this.value0 = value0;
    this.value1 = value1;
  }
  ;
  AtIndex2.create = function(value0) {
    return function(value1) {
      return new AtIndex2(value0, value1);
    };
  };
  return AtIndex2;
}();
var AtKey = /* @__PURE__ */ function() {
  function AtKey2(value0, value1) {
    this.value0 = value0;
    this.value1 = value1;
  }
  ;
  AtKey2.create = function(value0) {
    return function(value1) {
      return new AtKey2(value0, value1);
    };
  };
  return AtKey2;
}();
var Named = /* @__PURE__ */ function() {
  function Named2(value0, value1) {
    this.value0 = value0;
    this.value1 = value1;
  }
  ;
  Named2.create = function(value0) {
    return function(value1) {
      return new Named2(value0, value1);
    };
  };
  return Named2;
}();
var MissingValue = /* @__PURE__ */ function() {
  function MissingValue2() {
  }
  ;
  MissingValue2.value = new MissingValue2();
  return MissingValue2;
}();
var showJsonDecodeError = {
  show: function(v) {
    if (v instanceof TypeMismatch) {
      return "(TypeMismatch " + (show2(v.value0) + ")");
    }
    ;
    if (v instanceof UnexpectedValue) {
      return "(UnexpectedValue " + (stringify(v.value0) + ")");
    }
    ;
    if (v instanceof AtIndex) {
      return "(AtIndex " + (show1(v.value0) + (" " + (show(showJsonDecodeError)(v.value1) + ")")));
    }
    ;
    if (v instanceof AtKey) {
      return "(AtKey " + (show2(v.value0) + (" " + (show(showJsonDecodeError)(v.value1) + ")")));
    }
    ;
    if (v instanceof Named) {
      return "(Named " + (show2(v.value0) + (" " + (show(showJsonDecodeError)(v.value1) + ")")));
    }
    ;
    if (v instanceof MissingValue) {
      return "MissingValue";
    }
    ;
    throw new Error("Failed pattern match at Data.Codec.Argonaut (line 77, column 10 - line 83, column 34): " + [v.constructor.name]);
  }
};
var recordProp = function(dictIsSymbol) {
  var reflectSymbol2 = reflectSymbol(dictIsSymbol);
  return function() {
    return function(p2) {
      return function(codecA) {
        return function(codecR) {
          var enc$prime = function(key3) {
            return function(val) {
              return new Cons(new Tuple(key3, encode(codecA)(unsafeGet(key3)(val))), encode(codecR)(val));
            };
          };
          var dec$prime = function(key3) {
            return function(obj) {
              return bind2(decode(codecR)(obj))(function(r) {
                return bind2(lmap2(AtKey.create(key3))(function() {
                  var v = lookup(key3)(obj);
                  if (v instanceof Just) {
                    return decode(codecA)(v.value0);
                  }
                  ;
                  if (v instanceof Nothing) {
                    return new Left(MissingValue.value);
                  }
                  ;
                  throw new Error("Failed pattern match at Data.Codec.Argonaut (line 264, column 29 - line 266, column 34): " + [v.constructor.name]);
                }()))(function(a2) {
                  return pure2(unsafeSet(key3)(a2)(r));
                });
              });
            };
          };
          var key2 = reflectSymbol2(p2);
          return codec(dec$prime(key2))(enc$prime(key2));
        };
      };
    };
  };
};
var record = /* @__PURE__ */ function() {
  return new Codec($$const(pure2({})), pure(applicativeTuple(monoidList)));
}();
var jsonPrimCodec = function(ty) {
  return function(f) {
    return codec$prime(function() {
      var $210 = maybe(new Left(new TypeMismatch(ty)))(pure2);
      return function($211) {
        return $210(f($211));
      };
    }());
  };
};
var string = /* @__PURE__ */ jsonPrimCodec("String")(toString)(id);
var jobject = /* @__PURE__ */ jsonPrimCodec("Object")(toObject)(id);
var object = function(name16) {
  return function(codec2) {
    return codec$prime(function(j) {
      return lmap2(Named.create(name16))(bindFlipped2(decode(codec2))(decode(jobject)(j)));
    })(function(a2) {
      return encode(jobject)(fromFoldable3(encode(codec2)(a2)));
    });
  };
};
var $$boolean = /* @__PURE__ */ jsonPrimCodec("Boolean")(toBoolean)(id);

// output/Record/index.js
var insert2 = function(dictIsSymbol) {
  var reflectSymbol2 = reflectSymbol(dictIsSymbol);
  return function() {
    return function() {
      return function(l) {
        return function(a2) {
          return function(r) {
            return unsafeSet(reflectSymbol2(l))(a2)(r);
          };
        };
      };
    };
  };
};
var get = function(dictIsSymbol) {
  var reflectSymbol2 = reflectSymbol(dictIsSymbol);
  return function() {
    return function(l) {
      return function(r) {
        return unsafeGet(reflectSymbol2(l))(r);
      };
    };
  };
};

// output/Data.Codec.Argonaut.Record/index.js
var rowListCodecNil = {
  rowListCodec: function(v) {
    return function(v1) {
      return record;
    };
  }
};
var rowListCodec = function(dict) {
  return dict.rowListCodec;
};
var rowListCodecCons = function(dictRowListCodec) {
  var rowListCodec1 = rowListCodec(dictRowListCodec);
  return function() {
    return function() {
      return function(dictIsSymbol) {
        var get4 = get(dictIsSymbol)();
        var recordProp2 = recordProp(dictIsSymbol)();
        return {
          rowListCodec: function(v) {
            return function(codecs) {
              var tail2 = rowListCodec1($$Proxy.value)(codecs);
              var codec2 = get4($$Proxy.value)(codecs);
              return recordProp2($$Proxy.value)(codec2)(tail2);
            };
          }
        };
      };
    };
  };
};
var record2 = function() {
  return function(dictRowListCodec) {
    return rowListCodec(dictRowListCodec)($$Proxy.value);
  };
};

// output/Data.Profunctor/index.js
var identity8 = /* @__PURE__ */ identity(categoryFn);
var profunctorFn = {
  dimap: function(a2b) {
    return function(c2d) {
      return function(b2c) {
        return function($18) {
          return c2d(b2c(a2b($18)));
        };
      };
    };
  }
};
var dimap = function(dict) {
  return dict.dimap;
};
var lcmap = function(dictProfunctor) {
  var dimap1 = dimap(dictProfunctor);
  return function(a2b) {
    return dimap1(a2b)(identity8);
  };
};

// output/FRP.Event/foreign.js
var fastForeachThunk = (as) => {
  for (var i2 = 0, l = as.length; i2 < l; i2++) {
    as[i2]();
  }
};
var fastForeachE = (as, f) => {
  for (var i2 = 0, l = as.length; i2 < l; i2++) {
    f(as[i2]);
  }
};
var fastForeachOhE = (o, f) => {
  for (const a2 in o) {
    f(o[a2]);
  }
};
var objHack = () => ({});
var insertObjHack = (k, v, o) => {
  o[k] = v;
};
var deleteObjHack = (k, o) => {
  delete o[k];
};

// output/Control.Monad.ST.Class/index.js
var monadSTEffect = {
  liftST: toEffect,
  Monad0: function() {
    return monadEffect;
  }
};
var liftST = function(dict) {
  return dict.liftST;
};

// output/Data.List/index.js
var reverse2 = /* @__PURE__ */ function() {
  var go2 = function($copy_v) {
    return function($copy_v1) {
      var $tco_var_v = $copy_v;
      var $tco_done = false;
      var $tco_result;
      function $tco_loop(v, v1) {
        if (v1 instanceof Nil) {
          $tco_done = true;
          return v;
        }
        ;
        if (v1 instanceof Cons) {
          $tco_var_v = new Cons(v1.value0, v);
          $copy_v1 = v1.value1;
          return;
        }
        ;
        throw new Error("Failed pattern match at Data.List (line 368, column 3 - line 368, column 19): " + [v.constructor.name, v1.constructor.name]);
      }
      ;
      while (!$tco_done) {
        $tco_result = $tco_loop($tco_var_v, $copy_v1);
      }
      ;
      return $tco_result;
    };
  };
  return go2(Nil.value);
}();

// output/Partial.Unsafe/foreign.js
var _unsafePartial = function(f) {
  return f();
};

// output/Partial/foreign.js
var _crashWith = function(msg) {
  throw new Error(msg);
};

// output/Partial/index.js
var crashWith = function() {
  return _crashWith;
};

// output/Partial.Unsafe/index.js
var crashWith2 = /* @__PURE__ */ crashWith();
var unsafePartial = _unsafePartial;
var unsafeCrashWith = function(msg) {
  return unsafePartial(function() {
    return crashWith2(msg);
  });
};

// output/Data.Map.Internal/index.js
var Leaf = /* @__PURE__ */ function() {
  function Leaf2() {
  }
  ;
  Leaf2.value = new Leaf2();
  return Leaf2;
}();
var Two = /* @__PURE__ */ function() {
  function Two2(value0, value1, value22, value32) {
    this.value0 = value0;
    this.value1 = value1;
    this.value2 = value22;
    this.value3 = value32;
  }
  ;
  Two2.create = function(value0) {
    return function(value1) {
      return function(value22) {
        return function(value32) {
          return new Two2(value0, value1, value22, value32);
        };
      };
    };
  };
  return Two2;
}();
var Three = /* @__PURE__ */ function() {
  function Three2(value0, value1, value22, value32, value42, value52, value62) {
    this.value0 = value0;
    this.value1 = value1;
    this.value2 = value22;
    this.value3 = value32;
    this.value4 = value42;
    this.value5 = value52;
    this.value6 = value62;
  }
  ;
  Three2.create = function(value0) {
    return function(value1) {
      return function(value22) {
        return function(value32) {
          return function(value42) {
            return function(value52) {
              return function(value62) {
                return new Three2(value0, value1, value22, value32, value42, value52, value62);
              };
            };
          };
        };
      };
    };
  };
  return Three2;
}();
var TwoLeft = /* @__PURE__ */ function() {
  function TwoLeft2(value0, value1, value22) {
    this.value0 = value0;
    this.value1 = value1;
    this.value2 = value22;
  }
  ;
  TwoLeft2.create = function(value0) {
    return function(value1) {
      return function(value22) {
        return new TwoLeft2(value0, value1, value22);
      };
    };
  };
  return TwoLeft2;
}();
var TwoRight = /* @__PURE__ */ function() {
  function TwoRight2(value0, value1, value22) {
    this.value0 = value0;
    this.value1 = value1;
    this.value2 = value22;
  }
  ;
  TwoRight2.create = function(value0) {
    return function(value1) {
      return function(value22) {
        return new TwoRight2(value0, value1, value22);
      };
    };
  };
  return TwoRight2;
}();
var ThreeLeft = /* @__PURE__ */ function() {
  function ThreeLeft2(value0, value1, value22, value32, value42, value52) {
    this.value0 = value0;
    this.value1 = value1;
    this.value2 = value22;
    this.value3 = value32;
    this.value4 = value42;
    this.value5 = value52;
  }
  ;
  ThreeLeft2.create = function(value0) {
    return function(value1) {
      return function(value22) {
        return function(value32) {
          return function(value42) {
            return function(value52) {
              return new ThreeLeft2(value0, value1, value22, value32, value42, value52);
            };
          };
        };
      };
    };
  };
  return ThreeLeft2;
}();
var ThreeMiddle = /* @__PURE__ */ function() {
  function ThreeMiddle2(value0, value1, value22, value32, value42, value52) {
    this.value0 = value0;
    this.value1 = value1;
    this.value2 = value22;
    this.value3 = value32;
    this.value4 = value42;
    this.value5 = value52;
  }
  ;
  ThreeMiddle2.create = function(value0) {
    return function(value1) {
      return function(value22) {
        return function(value32) {
          return function(value42) {
            return function(value52) {
              return new ThreeMiddle2(value0, value1, value22, value32, value42, value52);
            };
          };
        };
      };
    };
  };
  return ThreeMiddle2;
}();
var ThreeRight = /* @__PURE__ */ function() {
  function ThreeRight2(value0, value1, value22, value32, value42, value52) {
    this.value0 = value0;
    this.value1 = value1;
    this.value2 = value22;
    this.value3 = value32;
    this.value4 = value42;
    this.value5 = value52;
  }
  ;
  ThreeRight2.create = function(value0) {
    return function(value1) {
      return function(value22) {
        return function(value32) {
          return function(value42) {
            return function(value52) {
              return new ThreeRight2(value0, value1, value22, value32, value42, value52);
            };
          };
        };
      };
    };
  };
  return ThreeRight2;
}();
var KickUp = /* @__PURE__ */ function() {
  function KickUp2(value0, value1, value22, value32) {
    this.value0 = value0;
    this.value1 = value1;
    this.value2 = value22;
    this.value3 = value32;
  }
  ;
  KickUp2.create = function(value0) {
    return function(value1) {
      return function(value22) {
        return function(value32) {
          return new KickUp2(value0, value1, value22, value32);
        };
      };
    };
  };
  return KickUp2;
}();
var singleton7 = function(k) {
  return function(v) {
    return new Two(Leaf.value, k, v, Leaf.value);
  };
};
var lookup2 = function(dictOrd) {
  var compare3 = compare(dictOrd);
  return function(k) {
    var go2 = function($copy_v) {
      var $tco_done = false;
      var $tco_result;
      function $tco_loop(v) {
        if (v instanceof Leaf) {
          $tco_done = true;
          return Nothing.value;
        }
        ;
        if (v instanceof Two) {
          var v2 = compare3(k)(v.value1);
          if (v2 instanceof EQ) {
            $tco_done = true;
            return new Just(v.value2);
          }
          ;
          if (v2 instanceof LT) {
            $copy_v = v.value0;
            return;
          }
          ;
          $copy_v = v.value3;
          return;
        }
        ;
        if (v instanceof Three) {
          var v3 = compare3(k)(v.value1);
          if (v3 instanceof EQ) {
            $tco_done = true;
            return new Just(v.value2);
          }
          ;
          var v4 = compare3(k)(v.value4);
          if (v4 instanceof EQ) {
            $tco_done = true;
            return new Just(v.value5);
          }
          ;
          if (v3 instanceof LT) {
            $copy_v = v.value0;
            return;
          }
          ;
          if (v4 instanceof GT) {
            $copy_v = v.value6;
            return;
          }
          ;
          $copy_v = v.value3;
          return;
        }
        ;
        throw new Error("Failed pattern match at Data.Map.Internal (line 241, column 5 - line 241, column 22): " + [v.constructor.name]);
      }
      ;
      while (!$tco_done) {
        $tco_result = $tco_loop($copy_v);
      }
      ;
      return $tco_result;
    };
    return go2;
  };
};
var functorMap = {
  map: function(v) {
    return function(v1) {
      if (v1 instanceof Leaf) {
        return Leaf.value;
      }
      ;
      if (v1 instanceof Two) {
        return new Two(map(functorMap)(v)(v1.value0), v1.value1, v(v1.value2), map(functorMap)(v)(v1.value3));
      }
      ;
      if (v1 instanceof Three) {
        return new Three(map(functorMap)(v)(v1.value0), v1.value1, v(v1.value2), map(functorMap)(v)(v1.value3), v1.value4, v(v1.value5), map(functorMap)(v)(v1.value6));
      }
      ;
      throw new Error("Failed pattern match at Data.Map.Internal (line 116, column 1 - line 119, column 110): " + [v.constructor.name, v1.constructor.name]);
    };
  }
};
var fromZipper = function($copy_dictOrd) {
  return function($copy_v) {
    return function($copy_v1) {
      var $tco_var_dictOrd = $copy_dictOrd;
      var $tco_var_v = $copy_v;
      var $tco_done = false;
      var $tco_result;
      function $tco_loop(dictOrd, v, v1) {
        if (v instanceof Nil) {
          $tco_done = true;
          return v1;
        }
        ;
        if (v instanceof Cons) {
          if (v.value0 instanceof TwoLeft) {
            $tco_var_dictOrd = dictOrd;
            $tco_var_v = v.value1;
            $copy_v1 = new Two(v1, v.value0.value0, v.value0.value1, v.value0.value2);
            return;
          }
          ;
          if (v.value0 instanceof TwoRight) {
            $tco_var_dictOrd = dictOrd;
            $tco_var_v = v.value1;
            $copy_v1 = new Two(v.value0.value0, v.value0.value1, v.value0.value2, v1);
            return;
          }
          ;
          if (v.value0 instanceof ThreeLeft) {
            $tco_var_dictOrd = dictOrd;
            $tco_var_v = v.value1;
            $copy_v1 = new Three(v1, v.value0.value0, v.value0.value1, v.value0.value2, v.value0.value3, v.value0.value4, v.value0.value5);
            return;
          }
          ;
          if (v.value0 instanceof ThreeMiddle) {
            $tco_var_dictOrd = dictOrd;
            $tco_var_v = v.value1;
            $copy_v1 = new Three(v.value0.value0, v.value0.value1, v.value0.value2, v1, v.value0.value3, v.value0.value4, v.value0.value5);
            return;
          }
          ;
          if (v.value0 instanceof ThreeRight) {
            $tco_var_dictOrd = dictOrd;
            $tco_var_v = v.value1;
            $copy_v1 = new Three(v.value0.value0, v.value0.value1, v.value0.value2, v.value0.value3, v.value0.value4, v.value0.value5, v1);
            return;
          }
          ;
          throw new Error("Failed pattern match at Data.Map.Internal (line 462, column 3 - line 467, column 88): " + [v.value0.constructor.name]);
        }
        ;
        throw new Error("Failed pattern match at Data.Map.Internal (line 459, column 1 - line 459, column 80): " + [v.constructor.name, v1.constructor.name]);
      }
      ;
      while (!$tco_done) {
        $tco_result = $tco_loop($tco_var_dictOrd, $tco_var_v, $copy_v1);
      }
      ;
      return $tco_result;
    };
  };
};
var insert3 = function(dictOrd) {
  var fromZipper1 = fromZipper(dictOrd);
  var compare3 = compare(dictOrd);
  return function(k) {
    return function(v) {
      var up = function($copy_v1) {
        return function($copy_v2) {
          var $tco_var_v1 = $copy_v1;
          var $tco_done = false;
          var $tco_result;
          function $tco_loop(v1, v2) {
            if (v1 instanceof Nil) {
              $tco_done = true;
              return new Two(v2.value0, v2.value1, v2.value2, v2.value3);
            }
            ;
            if (v1 instanceof Cons) {
              if (v1.value0 instanceof TwoLeft) {
                $tco_done = true;
                return fromZipper1(v1.value1)(new Three(v2.value0, v2.value1, v2.value2, v2.value3, v1.value0.value0, v1.value0.value1, v1.value0.value2));
              }
              ;
              if (v1.value0 instanceof TwoRight) {
                $tco_done = true;
                return fromZipper1(v1.value1)(new Three(v1.value0.value0, v1.value0.value1, v1.value0.value2, v2.value0, v2.value1, v2.value2, v2.value3));
              }
              ;
              if (v1.value0 instanceof ThreeLeft) {
                $tco_var_v1 = v1.value1;
                $copy_v2 = new KickUp(new Two(v2.value0, v2.value1, v2.value2, v2.value3), v1.value0.value0, v1.value0.value1, new Two(v1.value0.value2, v1.value0.value3, v1.value0.value4, v1.value0.value5));
                return;
              }
              ;
              if (v1.value0 instanceof ThreeMiddle) {
                $tco_var_v1 = v1.value1;
                $copy_v2 = new KickUp(new Two(v1.value0.value0, v1.value0.value1, v1.value0.value2, v2.value0), v2.value1, v2.value2, new Two(v2.value3, v1.value0.value3, v1.value0.value4, v1.value0.value5));
                return;
              }
              ;
              if (v1.value0 instanceof ThreeRight) {
                $tco_var_v1 = v1.value1;
                $copy_v2 = new KickUp(new Two(v1.value0.value0, v1.value0.value1, v1.value0.value2, v1.value0.value3), v1.value0.value4, v1.value0.value5, new Two(v2.value0, v2.value1, v2.value2, v2.value3));
                return;
              }
              ;
              throw new Error("Failed pattern match at Data.Map.Internal (line 498, column 5 - line 503, column 108): " + [v1.value0.constructor.name, v2.constructor.name]);
            }
            ;
            throw new Error("Failed pattern match at Data.Map.Internal (line 495, column 3 - line 495, column 56): " + [v1.constructor.name, v2.constructor.name]);
          }
          ;
          while (!$tco_done) {
            $tco_result = $tco_loop($tco_var_v1, $copy_v2);
          }
          ;
          return $tco_result;
        };
      };
      var down = function($copy_v1) {
        return function($copy_v2) {
          var $tco_var_v1 = $copy_v1;
          var $tco_done1 = false;
          var $tco_result;
          function $tco_loop(v1, v2) {
            if (v2 instanceof Leaf) {
              $tco_done1 = true;
              return up(v1)(new KickUp(Leaf.value, k, v, Leaf.value));
            }
            ;
            if (v2 instanceof Two) {
              var v3 = compare3(k)(v2.value1);
              if (v3 instanceof EQ) {
                $tco_done1 = true;
                return fromZipper1(v1)(new Two(v2.value0, k, v, v2.value3));
              }
              ;
              if (v3 instanceof LT) {
                $tco_var_v1 = new Cons(new TwoLeft(v2.value1, v2.value2, v2.value3), v1);
                $copy_v2 = v2.value0;
                return;
              }
              ;
              $tco_var_v1 = new Cons(new TwoRight(v2.value0, v2.value1, v2.value2), v1);
              $copy_v2 = v2.value3;
              return;
            }
            ;
            if (v2 instanceof Three) {
              var v3 = compare3(k)(v2.value1);
              if (v3 instanceof EQ) {
                $tco_done1 = true;
                return fromZipper1(v1)(new Three(v2.value0, k, v, v2.value3, v2.value4, v2.value5, v2.value6));
              }
              ;
              var v4 = compare3(k)(v2.value4);
              if (v4 instanceof EQ) {
                $tco_done1 = true;
                return fromZipper1(v1)(new Three(v2.value0, v2.value1, v2.value2, v2.value3, k, v, v2.value6));
              }
              ;
              if (v3 instanceof LT) {
                $tco_var_v1 = new Cons(new ThreeLeft(v2.value1, v2.value2, v2.value3, v2.value4, v2.value5, v2.value6), v1);
                $copy_v2 = v2.value0;
                return;
              }
              ;
              if (v3 instanceof GT && v4 instanceof LT) {
                $tco_var_v1 = new Cons(new ThreeMiddle(v2.value0, v2.value1, v2.value2, v2.value4, v2.value5, v2.value6), v1);
                $copy_v2 = v2.value3;
                return;
              }
              ;
              $tco_var_v1 = new Cons(new ThreeRight(v2.value0, v2.value1, v2.value2, v2.value3, v2.value4, v2.value5), v1);
              $copy_v2 = v2.value6;
              return;
            }
            ;
            throw new Error("Failed pattern match at Data.Map.Internal (line 478, column 3 - line 478, column 55): " + [v1.constructor.name, v2.constructor.name]);
          }
          ;
          while (!$tco_done1) {
            $tco_result = $tco_loop($tco_var_v1, $copy_v2);
          }
          ;
          return $tco_result;
        };
      };
      return down(Nil.value);
    };
  };
};
var pop = function(dictOrd) {
  var fromZipper1 = fromZipper(dictOrd);
  var compare3 = compare(dictOrd);
  return function(k) {
    var up = function($copy_ctxs) {
      return function($copy_tree) {
        var $tco_var_ctxs = $copy_ctxs;
        var $tco_done = false;
        var $tco_result;
        function $tco_loop(ctxs, tree) {
          if (ctxs instanceof Nil) {
            $tco_done = true;
            return tree;
          }
          ;
          if (ctxs instanceof Cons) {
            if (ctxs.value0 instanceof TwoLeft && (ctxs.value0.value2 instanceof Leaf && tree instanceof Leaf)) {
              $tco_done = true;
              return fromZipper1(ctxs.value1)(new Two(Leaf.value, ctxs.value0.value0, ctxs.value0.value1, Leaf.value));
            }
            ;
            if (ctxs.value0 instanceof TwoRight && (ctxs.value0.value0 instanceof Leaf && tree instanceof Leaf)) {
              $tco_done = true;
              return fromZipper1(ctxs.value1)(new Two(Leaf.value, ctxs.value0.value1, ctxs.value0.value2, Leaf.value));
            }
            ;
            if (ctxs.value0 instanceof TwoLeft && ctxs.value0.value2 instanceof Two) {
              $tco_var_ctxs = ctxs.value1;
              $copy_tree = new Three(tree, ctxs.value0.value0, ctxs.value0.value1, ctxs.value0.value2.value0, ctxs.value0.value2.value1, ctxs.value0.value2.value2, ctxs.value0.value2.value3);
              return;
            }
            ;
            if (ctxs.value0 instanceof TwoRight && ctxs.value0.value0 instanceof Two) {
              $tco_var_ctxs = ctxs.value1;
              $copy_tree = new Three(ctxs.value0.value0.value0, ctxs.value0.value0.value1, ctxs.value0.value0.value2, ctxs.value0.value0.value3, ctxs.value0.value1, ctxs.value0.value2, tree);
              return;
            }
            ;
            if (ctxs.value0 instanceof TwoLeft && ctxs.value0.value2 instanceof Three) {
              $tco_done = true;
              return fromZipper1(ctxs.value1)(new Two(new Two(tree, ctxs.value0.value0, ctxs.value0.value1, ctxs.value0.value2.value0), ctxs.value0.value2.value1, ctxs.value0.value2.value2, new Two(ctxs.value0.value2.value3, ctxs.value0.value2.value4, ctxs.value0.value2.value5, ctxs.value0.value2.value6)));
            }
            ;
            if (ctxs.value0 instanceof TwoRight && ctxs.value0.value0 instanceof Three) {
              $tco_done = true;
              return fromZipper1(ctxs.value1)(new Two(new Two(ctxs.value0.value0.value0, ctxs.value0.value0.value1, ctxs.value0.value0.value2, ctxs.value0.value0.value3), ctxs.value0.value0.value4, ctxs.value0.value0.value5, new Two(ctxs.value0.value0.value6, ctxs.value0.value1, ctxs.value0.value2, tree)));
            }
            ;
            if (ctxs.value0 instanceof ThreeLeft && (ctxs.value0.value2 instanceof Leaf && (ctxs.value0.value5 instanceof Leaf && tree instanceof Leaf))) {
              $tco_done = true;
              return fromZipper1(ctxs.value1)(new Three(Leaf.value, ctxs.value0.value0, ctxs.value0.value1, Leaf.value, ctxs.value0.value3, ctxs.value0.value4, Leaf.value));
            }
            ;
            if (ctxs.value0 instanceof ThreeMiddle && (ctxs.value0.value0 instanceof Leaf && (ctxs.value0.value5 instanceof Leaf && tree instanceof Leaf))) {
              $tco_done = true;
              return fromZipper1(ctxs.value1)(new Three(Leaf.value, ctxs.value0.value1, ctxs.value0.value2, Leaf.value, ctxs.value0.value3, ctxs.value0.value4, Leaf.value));
            }
            ;
            if (ctxs.value0 instanceof ThreeRight && (ctxs.value0.value0 instanceof Leaf && (ctxs.value0.value3 instanceof Leaf && tree instanceof Leaf))) {
              $tco_done = true;
              return fromZipper1(ctxs.value1)(new Three(Leaf.value, ctxs.value0.value1, ctxs.value0.value2, Leaf.value, ctxs.value0.value4, ctxs.value0.value5, Leaf.value));
            }
            ;
            if (ctxs.value0 instanceof ThreeLeft && ctxs.value0.value2 instanceof Two) {
              $tco_done = true;
              return fromZipper1(ctxs.value1)(new Two(new Three(tree, ctxs.value0.value0, ctxs.value0.value1, ctxs.value0.value2.value0, ctxs.value0.value2.value1, ctxs.value0.value2.value2, ctxs.value0.value2.value3), ctxs.value0.value3, ctxs.value0.value4, ctxs.value0.value5));
            }
            ;
            if (ctxs.value0 instanceof ThreeMiddle && ctxs.value0.value0 instanceof Two) {
              $tco_done = true;
              return fromZipper1(ctxs.value1)(new Two(new Three(ctxs.value0.value0.value0, ctxs.value0.value0.value1, ctxs.value0.value0.value2, ctxs.value0.value0.value3, ctxs.value0.value1, ctxs.value0.value2, tree), ctxs.value0.value3, ctxs.value0.value4, ctxs.value0.value5));
            }
            ;
            if (ctxs.value0 instanceof ThreeMiddle && ctxs.value0.value5 instanceof Two) {
              $tco_done = true;
              return fromZipper1(ctxs.value1)(new Two(ctxs.value0.value0, ctxs.value0.value1, ctxs.value0.value2, new Three(tree, ctxs.value0.value3, ctxs.value0.value4, ctxs.value0.value5.value0, ctxs.value0.value5.value1, ctxs.value0.value5.value2, ctxs.value0.value5.value3)));
            }
            ;
            if (ctxs.value0 instanceof ThreeRight && ctxs.value0.value3 instanceof Two) {
              $tco_done = true;
              return fromZipper1(ctxs.value1)(new Two(ctxs.value0.value0, ctxs.value0.value1, ctxs.value0.value2, new Three(ctxs.value0.value3.value0, ctxs.value0.value3.value1, ctxs.value0.value3.value2, ctxs.value0.value3.value3, ctxs.value0.value4, ctxs.value0.value5, tree)));
            }
            ;
            if (ctxs.value0 instanceof ThreeLeft && ctxs.value0.value2 instanceof Three) {
              $tco_done = true;
              return fromZipper1(ctxs.value1)(new Three(new Two(tree, ctxs.value0.value0, ctxs.value0.value1, ctxs.value0.value2.value0), ctxs.value0.value2.value1, ctxs.value0.value2.value2, new Two(ctxs.value0.value2.value3, ctxs.value0.value2.value4, ctxs.value0.value2.value5, ctxs.value0.value2.value6), ctxs.value0.value3, ctxs.value0.value4, ctxs.value0.value5));
            }
            ;
            if (ctxs.value0 instanceof ThreeMiddle && ctxs.value0.value0 instanceof Three) {
              $tco_done = true;
              return fromZipper1(ctxs.value1)(new Three(new Two(ctxs.value0.value0.value0, ctxs.value0.value0.value1, ctxs.value0.value0.value2, ctxs.value0.value0.value3), ctxs.value0.value0.value4, ctxs.value0.value0.value5, new Two(ctxs.value0.value0.value6, ctxs.value0.value1, ctxs.value0.value2, tree), ctxs.value0.value3, ctxs.value0.value4, ctxs.value0.value5));
            }
            ;
            if (ctxs.value0 instanceof ThreeMiddle && ctxs.value0.value5 instanceof Three) {
              $tco_done = true;
              return fromZipper1(ctxs.value1)(new Three(ctxs.value0.value0, ctxs.value0.value1, ctxs.value0.value2, new Two(tree, ctxs.value0.value3, ctxs.value0.value4, ctxs.value0.value5.value0), ctxs.value0.value5.value1, ctxs.value0.value5.value2, new Two(ctxs.value0.value5.value3, ctxs.value0.value5.value4, ctxs.value0.value5.value5, ctxs.value0.value5.value6)));
            }
            ;
            if (ctxs.value0 instanceof ThreeRight && ctxs.value0.value3 instanceof Three) {
              $tco_done = true;
              return fromZipper1(ctxs.value1)(new Three(ctxs.value0.value0, ctxs.value0.value1, ctxs.value0.value2, new Two(ctxs.value0.value3.value0, ctxs.value0.value3.value1, ctxs.value0.value3.value2, ctxs.value0.value3.value3), ctxs.value0.value3.value4, ctxs.value0.value3.value5, new Two(ctxs.value0.value3.value6, ctxs.value0.value4, ctxs.value0.value5, tree)));
            }
            ;
            $tco_done = true;
            return unsafeCrashWith("The impossible happened in partial function `up`.");
          }
          ;
          throw new Error("Failed pattern match at Data.Map.Internal (line 552, column 5 - line 573, column 86): " + [ctxs.constructor.name]);
        }
        ;
        while (!$tco_done) {
          $tco_result = $tco_loop($tco_var_ctxs, $copy_tree);
        }
        ;
        return $tco_result;
      };
    };
    var removeMaxNode = function($copy_ctx) {
      return function($copy_m) {
        var $tco_var_ctx = $copy_ctx;
        var $tco_done1 = false;
        var $tco_result;
        function $tco_loop(ctx, m) {
          if (m instanceof Two && (m.value0 instanceof Leaf && m.value3 instanceof Leaf)) {
            $tco_done1 = true;
            return up(ctx)(Leaf.value);
          }
          ;
          if (m instanceof Two) {
            $tco_var_ctx = new Cons(new TwoRight(m.value0, m.value1, m.value2), ctx);
            $copy_m = m.value3;
            return;
          }
          ;
          if (m instanceof Three && (m.value0 instanceof Leaf && (m.value3 instanceof Leaf && m.value6 instanceof Leaf))) {
            $tco_done1 = true;
            return up(new Cons(new TwoRight(Leaf.value, m.value1, m.value2), ctx))(Leaf.value);
          }
          ;
          if (m instanceof Three) {
            $tco_var_ctx = new Cons(new ThreeRight(m.value0, m.value1, m.value2, m.value3, m.value4, m.value5), ctx);
            $copy_m = m.value6;
            return;
          }
          ;
          $tco_done1 = true;
          return unsafeCrashWith("The impossible happened in partial function `removeMaxNode`.");
        }
        ;
        while (!$tco_done1) {
          $tco_result = $tco_loop($tco_var_ctx, $copy_m);
        }
        ;
        return $tco_result;
      };
    };
    var maxNode = function($copy_m) {
      var $tco_done2 = false;
      var $tco_result;
      function $tco_loop(m) {
        if (m instanceof Two && m.value3 instanceof Leaf) {
          $tco_done2 = true;
          return {
            key: m.value1,
            value: m.value2
          };
        }
        ;
        if (m instanceof Two) {
          $copy_m = m.value3;
          return;
        }
        ;
        if (m instanceof Three && m.value6 instanceof Leaf) {
          $tco_done2 = true;
          return {
            key: m.value4,
            value: m.value5
          };
        }
        ;
        if (m instanceof Three) {
          $copy_m = m.value6;
          return;
        }
        ;
        $tco_done2 = true;
        return unsafeCrashWith("The impossible happened in partial function `maxNode`.");
      }
      ;
      while (!$tco_done2) {
        $tco_result = $tco_loop($copy_m);
      }
      ;
      return $tco_result;
    };
    var down = function($copy_ctx) {
      return function($copy_m) {
        var $tco_var_ctx = $copy_ctx;
        var $tco_done3 = false;
        var $tco_result;
        function $tco_loop(ctx, m) {
          if (m instanceof Leaf) {
            $tco_done3 = true;
            return Nothing.value;
          }
          ;
          if (m instanceof Two) {
            var v = compare3(k)(m.value1);
            if (m.value3 instanceof Leaf && v instanceof EQ) {
              $tco_done3 = true;
              return new Just(new Tuple(m.value2, up(ctx)(Leaf.value)));
            }
            ;
            if (v instanceof EQ) {
              var max6 = maxNode(m.value0);
              $tco_done3 = true;
              return new Just(new Tuple(m.value2, removeMaxNode(new Cons(new TwoLeft(max6.key, max6.value, m.value3), ctx))(m.value0)));
            }
            ;
            if (v instanceof LT) {
              $tco_var_ctx = new Cons(new TwoLeft(m.value1, m.value2, m.value3), ctx);
              $copy_m = m.value0;
              return;
            }
            ;
            $tco_var_ctx = new Cons(new TwoRight(m.value0, m.value1, m.value2), ctx);
            $copy_m = m.value3;
            return;
          }
          ;
          if (m instanceof Three) {
            var leaves = function() {
              if (m.value0 instanceof Leaf && (m.value3 instanceof Leaf && m.value6 instanceof Leaf)) {
                return true;
              }
              ;
              return false;
            }();
            var v = compare3(k)(m.value4);
            var v3 = compare3(k)(m.value1);
            if (leaves && v3 instanceof EQ) {
              $tco_done3 = true;
              return new Just(new Tuple(m.value2, fromZipper1(ctx)(new Two(Leaf.value, m.value4, m.value5, Leaf.value))));
            }
            ;
            if (leaves && v instanceof EQ) {
              $tco_done3 = true;
              return new Just(new Tuple(m.value5, fromZipper1(ctx)(new Two(Leaf.value, m.value1, m.value2, Leaf.value))));
            }
            ;
            if (v3 instanceof EQ) {
              var max6 = maxNode(m.value0);
              $tco_done3 = true;
              return new Just(new Tuple(m.value2, removeMaxNode(new Cons(new ThreeLeft(max6.key, max6.value, m.value3, m.value4, m.value5, m.value6), ctx))(m.value0)));
            }
            ;
            if (v instanceof EQ) {
              var max6 = maxNode(m.value3);
              $tco_done3 = true;
              return new Just(new Tuple(m.value5, removeMaxNode(new Cons(new ThreeMiddle(m.value0, m.value1, m.value2, max6.key, max6.value, m.value6), ctx))(m.value3)));
            }
            ;
            if (v3 instanceof LT) {
              $tco_var_ctx = new Cons(new ThreeLeft(m.value1, m.value2, m.value3, m.value4, m.value5, m.value6), ctx);
              $copy_m = m.value0;
              return;
            }
            ;
            if (v3 instanceof GT && v instanceof LT) {
              $tco_var_ctx = new Cons(new ThreeMiddle(m.value0, m.value1, m.value2, m.value4, m.value5, m.value6), ctx);
              $copy_m = m.value3;
              return;
            }
            ;
            $tco_var_ctx = new Cons(new ThreeRight(m.value0, m.value1, m.value2, m.value3, m.value4, m.value5), ctx);
            $copy_m = m.value6;
            return;
          }
          ;
          throw new Error("Failed pattern match at Data.Map.Internal (line 525, column 16 - line 548, column 80): " + [m.constructor.name]);
        }
        ;
        while (!$tco_done3) {
          $tco_result = $tco_loop($tco_var_ctx, $copy_m);
        }
        ;
        return $tco_result;
      };
    };
    return down(Nil.value);
  };
};
var foldableMap = {
  foldr: function(f) {
    return function(z) {
      return function(m) {
        if (m instanceof Leaf) {
          return z;
        }
        ;
        if (m instanceof Two) {
          return foldr(foldableMap)(f)(f(m.value2)(foldr(foldableMap)(f)(z)(m.value3)))(m.value0);
        }
        ;
        if (m instanceof Three) {
          return foldr(foldableMap)(f)(f(m.value2)(foldr(foldableMap)(f)(f(m.value5)(foldr(foldableMap)(f)(z)(m.value6)))(m.value3)))(m.value0);
        }
        ;
        throw new Error("Failed pattern match at Data.Map.Internal (line 133, column 17 - line 136, column 85): " + [m.constructor.name]);
      };
    };
  },
  foldl: function(f) {
    return function(z) {
      return function(m) {
        if (m instanceof Leaf) {
          return z;
        }
        ;
        if (m instanceof Two) {
          return foldl(foldableMap)(f)(f(foldl(foldableMap)(f)(z)(m.value0))(m.value2))(m.value3);
        }
        ;
        if (m instanceof Three) {
          return foldl(foldableMap)(f)(f(foldl(foldableMap)(f)(f(foldl(foldableMap)(f)(z)(m.value0))(m.value2))(m.value3))(m.value5))(m.value6);
        }
        ;
        throw new Error("Failed pattern match at Data.Map.Internal (line 137, column 17 - line 140, column 85): " + [m.constructor.name]);
      };
    };
  },
  foldMap: function(dictMonoid) {
    var mempty3 = mempty(dictMonoid);
    var append22 = append(dictMonoid.Semigroup0());
    return function(f) {
      return function(m) {
        if (m instanceof Leaf) {
          return mempty3;
        }
        ;
        if (m instanceof Two) {
          return append22(foldMap(foldableMap)(dictMonoid)(f)(m.value0))(append22(f(m.value2))(foldMap(foldableMap)(dictMonoid)(f)(m.value3)));
        }
        ;
        if (m instanceof Three) {
          return append22(foldMap(foldableMap)(dictMonoid)(f)(m.value0))(append22(f(m.value2))(append22(foldMap(foldableMap)(dictMonoid)(f)(m.value3))(append22(f(m.value5))(foldMap(foldableMap)(dictMonoid)(f)(m.value6)))));
        }
        ;
        throw new Error("Failed pattern match at Data.Map.Internal (line 141, column 17 - line 144, column 93): " + [m.constructor.name]);
      };
    };
  }
};
var foldableWithIndexMap = {
  foldrWithIndex: function(f) {
    return function(z) {
      return function(m) {
        if (m instanceof Leaf) {
          return z;
        }
        ;
        if (m instanceof Two) {
          return foldrWithIndex(foldableWithIndexMap)(f)(f(m.value1)(m.value2)(foldrWithIndex(foldableWithIndexMap)(f)(z)(m.value3)))(m.value0);
        }
        ;
        if (m instanceof Three) {
          return foldrWithIndex(foldableWithIndexMap)(f)(f(m.value1)(m.value2)(foldrWithIndex(foldableWithIndexMap)(f)(f(m.value4)(m.value5)(foldrWithIndex(foldableWithIndexMap)(f)(z)(m.value6)))(m.value3)))(m.value0);
        }
        ;
        throw new Error("Failed pattern match at Data.Map.Internal (line 147, column 26 - line 150, column 120): " + [m.constructor.name]);
      };
    };
  },
  foldlWithIndex: function(f) {
    return function(z) {
      return function(m) {
        if (m instanceof Leaf) {
          return z;
        }
        ;
        if (m instanceof Two) {
          return foldlWithIndex(foldableWithIndexMap)(f)(f(m.value1)(foldlWithIndex(foldableWithIndexMap)(f)(z)(m.value0))(m.value2))(m.value3);
        }
        ;
        if (m instanceof Three) {
          return foldlWithIndex(foldableWithIndexMap)(f)(f(m.value4)(foldlWithIndex(foldableWithIndexMap)(f)(f(m.value1)(foldlWithIndex(foldableWithIndexMap)(f)(z)(m.value0))(m.value2))(m.value3))(m.value5))(m.value6);
        }
        ;
        throw new Error("Failed pattern match at Data.Map.Internal (line 151, column 26 - line 154, column 120): " + [m.constructor.name]);
      };
    };
  },
  foldMapWithIndex: function(dictMonoid) {
    var mempty3 = mempty(dictMonoid);
    var append22 = append(dictMonoid.Semigroup0());
    return function(f) {
      return function(m) {
        if (m instanceof Leaf) {
          return mempty3;
        }
        ;
        if (m instanceof Two) {
          return append22(foldMapWithIndex(foldableWithIndexMap)(dictMonoid)(f)(m.value0))(append22(f(m.value1)(m.value2))(foldMapWithIndex(foldableWithIndexMap)(dictMonoid)(f)(m.value3)));
        }
        ;
        if (m instanceof Three) {
          return append22(foldMapWithIndex(foldableWithIndexMap)(dictMonoid)(f)(m.value0))(append22(f(m.value1)(m.value2))(append22(foldMapWithIndex(foldableWithIndexMap)(dictMonoid)(f)(m.value3))(append22(f(m.value4)(m.value5))(foldMapWithIndex(foldableWithIndexMap)(dictMonoid)(f)(m.value6)))));
        }
        ;
        throw new Error("Failed pattern match at Data.Map.Internal (line 155, column 26 - line 158, column 128): " + [m.constructor.name]);
      };
    };
  },
  Foldable0: function() {
    return foldableMap;
  }
};
var foldrWithIndex2 = /* @__PURE__ */ foldrWithIndex(foldableWithIndexMap);
var foldlWithIndex2 = /* @__PURE__ */ foldlWithIndex(foldableWithIndexMap);
var keys2 = /* @__PURE__ */ function() {
  return foldrWithIndex2(function(k) {
    return function(v) {
      return function(acc) {
        return new Cons(k, acc);
      };
    };
  })(Nil.value);
}();
var empty3 = /* @__PURE__ */ function() {
  return Leaf.value;
}();
var $$delete2 = function(dictOrd) {
  var pop1 = pop(dictOrd);
  return function(k) {
    return function(m) {
      return maybe(m)(snd)(pop1(k)(m));
    };
  };
};
var alter = function(dictOrd) {
  var lookup1 = lookup2(dictOrd);
  var delete1 = $$delete2(dictOrd);
  var insert1 = insert3(dictOrd);
  return function(f) {
    return function(k) {
      return function(m) {
        var v = f(lookup1(k)(m));
        if (v instanceof Nothing) {
          return delete1(k)(m);
        }
        ;
        if (v instanceof Just) {
          return insert1(k)(v.value0)(m);
        }
        ;
        throw new Error("Failed pattern match at Data.Map.Internal (line 596, column 15 - line 598, column 25): " + [v.constructor.name]);
      };
    };
  };
};
var unionWith = function(dictOrd) {
  var alter1 = alter(dictOrd);
  return function(f) {
    return function(m1) {
      return function(m2) {
        var go2 = function(k) {
          return function(m) {
            return function(v) {
              return alter1(function() {
                var $936 = maybe(v)(f(v));
                return function($937) {
                  return Just.create($936($937));
                };
              }())(k)(m);
            };
          };
        };
        return foldlWithIndex2(go2)(m2)(m1);
      };
    };
  };
};
var union = function(dictOrd) {
  return unionWith(dictOrd)($$const);
};

// output/Data.Compactable/index.js
var $$void5 = /* @__PURE__ */ $$void(functorST);
var pure1 = /* @__PURE__ */ pure(applicativeST);
var apply2 = /* @__PURE__ */ apply(applyST);
var map5 = /* @__PURE__ */ map(functorST);
var compactableArray = {
  compact: function(xs) {
    return function __do3() {
      var result = newSTArray();
      var iter = iterator(function(v) {
        return index(xs)(v);
      })();
      iterate(iter)(function($108) {
        return $$void5(function(v) {
          if (v instanceof Nothing) {
            return pure1(0);
          }
          ;
          if (v instanceof Just) {
            return push(v.value0)(result);
          }
          ;
          throw new Error("Failed pattern match at Data.Compactable (line 111, column 34 - line 113, column 35): " + [v.constructor.name]);
        }($108));
      })();
      return unsafeFreeze(result)();
    }();
  },
  separate: function(xs) {
    return function __do3() {
      var ls = newSTArray();
      var rs = newSTArray();
      var iter = iterator(function(v) {
        return index(xs)(v);
      })();
      iterate(iter)(function($109) {
        return $$void5(function(v) {
          if (v instanceof Left) {
            return push(v.value0)(ls);
          }
          ;
          if (v instanceof Right) {
            return push(v.value0)(rs);
          }
          ;
          throw new Error("Failed pattern match at Data.Compactable (line 122, column 34 - line 124, column 31): " + [v.constructor.name]);
        }($109));
      })();
      return apply2(map5(function(v) {
        return function(v1) {
          return {
            left: v,
            right: v1
          };
        };
      })(unsafeFreeze(ls)))(unsafeFreeze(rs))();
    }();
  }
};
var compact = function(dict) {
  return dict.compact;
};

// output/Data.Filterable/index.js
var append3 = /* @__PURE__ */ append(semigroupArray);
var foldl2 = /* @__PURE__ */ foldl(foldableArray);
var filterableArray = {
  partitionMap: function(p2) {
    var go2 = function(acc) {
      return function(x) {
        var v = p2(x);
        if (v instanceof Left) {
          return {
            left: append3(acc.left)([v.value0]),
            right: acc.right
          };
        }
        ;
        if (v instanceof Right) {
          return {
            right: append3(acc.right)([v.value0]),
            left: acc.left
          };
        }
        ;
        throw new Error("Failed pattern match at Data.Filterable (line 149, column 16 - line 151, column 50): " + [v.constructor.name]);
      };
    };
    return foldl2(go2)({
      left: [],
      right: []
    });
  },
  partition,
  filterMap: mapMaybe,
  filter,
  Compactable0: function() {
    return compactableArray;
  },
  Functor1: function() {
    return functorArray;
  }
};
var filterMap = function(dict) {
  return dict.filterMap;
};
var filter4 = function(dict) {
  return dict.filter;
};

// output/Data.Set/index.js
var foldMap3 = /* @__PURE__ */ foldMap(foldableList);
var foldl3 = /* @__PURE__ */ foldl(foldableList);
var foldr4 = /* @__PURE__ */ foldr(foldableList);
var union2 = function(dictOrd) {
  var union1 = union(dictOrd);
  return function(v) {
    return function(v1) {
      return union1(v)(v1);
    };
  };
};
var toList2 = function(v) {
  return keys2(v);
};
var singleton8 = function(a2) {
  return singleton7(a2)(unit);
};
var semigroupSet = function(dictOrd) {
  return {
    append: union2(dictOrd)
  };
};
var foldableSet = {
  foldMap: function(dictMonoid) {
    var foldMap12 = foldMap3(dictMonoid);
    return function(f) {
      var $129 = foldMap12(f);
      return function($130) {
        return $129(toList2($130));
      };
    };
  },
  foldl: function(f) {
    return function(x) {
      var $131 = foldl3(f)(x);
      return function($132) {
        return $131(toList2($132));
      };
    };
  },
  foldr: function(f) {
    return function(x) {
      var $133 = foldr4(f)(x);
      return function($134) {
        return $133(toList2($134));
      };
    };
  }
};
var empty4 = empty3;
var monoidSet = function(dictOrd) {
  var semigroupSet1 = semigroupSet(dictOrd);
  return {
    mempty: empty4,
    Semigroup0: function() {
      return semigroupSet1;
    }
  };
};
var $$delete3 = function(dictOrd) {
  var delete1 = $$delete2(dictOrd);
  return function(a2) {
    return function(v) {
      return delete1(a2)(v);
    };
  };
};

// output/Effect.Timer/foreign.js
function setTimeoutImpl(ms) {
  return function(fn) {
    return function() {
      return setTimeout(fn, ms);
    };
  };
}
function clearTimeoutImpl(id2) {
  return function() {
    clearTimeout(id2);
  };
}

// output/Effect.Timer/index.js
var compare2 = /* @__PURE__ */ compare(ordInt);
var setTimeout2 = setTimeoutImpl;
var eqTimeoutId = {
  eq: function(x) {
    return function(y) {
      return x === y;
    };
  }
};
var ordTimeoutId = {
  compare: function(x) {
    return function(y) {
      return compare2(x)(y);
    };
  },
  Eq0: function() {
    return eqTimeoutId;
  }
};
var clearTimeout2 = clearTimeoutImpl;

// output/Effect.Uncurried/foreign.js
var mkEffectFn1 = function mkEffectFn12(fn) {
  return function(x) {
    return fn(x)();
  };
};
var runEffectFn1 = function runEffectFn12(fn) {
  return function(a2) {
    return function() {
      return fn(a2);
    };
  };
};

// output/Effect.Uncurried/index.js
var semigroupEffectFn1 = function(dictSemigroup) {
  var append11 = append(semigroupEffect(dictSemigroup));
  return {
    append: function(f1) {
      return function(f2) {
        return mkEffectFn1(function(a2) {
          return append11(runEffectFn1(f1)(a2))(runEffectFn1(f2)(a2));
        });
      };
    }
  };
};
var monoidEffectFn1 = function(dictMonoid) {
  var mempty3 = mempty(monoidEffect(dictMonoid));
  var semigroupEffectFn11 = semigroupEffectFn1(dictMonoid.Semigroup0());
  return {
    mempty: mkEffectFn1(function(v) {
      return mempty3;
    }),
    Semigroup0: function() {
      return semigroupEffectFn11;
    }
  };
};

// output/FRP.Event.Class/index.js
var map6 = /* @__PURE__ */ map(functorTuple);
var pure3 = /* @__PURE__ */ pure(applicativeMaybe);
var sampleOnRight = function(dict) {
  return dict.sampleOnRight;
};
var keepLatest = function(dict) {
  return dict.keepLatest;
};
var fix2 = function(dict) {
  return dict.fix;
};
var fold3 = function(dictIsEvent) {
  var fix1 = fix2(dictIsEvent);
  var sampleOnRight1 = sampleOnRight(dictIsEvent);
  var Alternative0 = dictIsEvent.Alternative0();
  var alt17 = alt(Alternative0.Plus1().Alt0());
  var pure114 = pure(Alternative0.Applicative0());
  var map112 = map(dictIsEvent.Filterable1().Functor1());
  return function(f) {
    return function(b2) {
      return function(e) {
        return fix1(function(i2) {
          return sampleOnRight1(alt17(i2)(pure114(b2)))(map112(flip(f))(e));
        });
      };
    };
  };
};
var mapAccum = function(dictIsEvent) {
  var filterMap5 = filterMap(dictIsEvent.Filterable1());
  var fold12 = fold3(dictIsEvent);
  return function(f) {
    return function(acc) {
      return function(xs) {
        return filterMap5(snd)(fold12(function(v) {
          return function(b2) {
            return map6(pure3)(f(v.value0)(b2));
          };
        })(new Tuple(acc, Nothing.value))(xs));
      };
    };
  };
};

// output/Unsafe.Reference/foreign.js
function reallyUnsafeRefEq(a2) {
  return function(b2) {
    return a2 === b2;
  };
}

// output/Unsafe.Reference/index.js
var unsafeRefEq = reallyUnsafeRefEq;

// output/FRP.Event/index.js
var $runtime_lazy4 = function(name16, moduleName, init3) {
  var state4 = 0;
  var val;
  return function(lineNumber) {
    if (state4 === 2)
      return val;
    if (state4 === 1)
      throw new ReferenceError(name16 + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state4 = 1;
    val = init3();
    state4 = 2;
    return val;
  };
};
var for_2 = /* @__PURE__ */ for_(applicativeEffect);
var for_1 = /* @__PURE__ */ for_2(foldableMaybe);
var pure4 = /* @__PURE__ */ pure(applicativeEffect);
var liftST2 = /* @__PURE__ */ liftST(monadSTEffect);
var monoidEffect2 = /* @__PURE__ */ monoidEffect(monoidUnit);
var $$void6 = /* @__PURE__ */ $$void(functorEffect);
var append4 = /* @__PURE__ */ append(semigroupArray);
var mempty2 = /* @__PURE__ */ mempty(/* @__PURE__ */ monoidEffectFn1(monoidUnit));
var mempty1 = /* @__PURE__ */ mempty(/* @__PURE__ */ monoidSet(ordTimeoutId));
var $$delete4 = /* @__PURE__ */ $$delete3(ordTimeoutId);
var append12 = /* @__PURE__ */ append(/* @__PURE__ */ semigroupSet(ordTimeoutId));
var for_22 = /* @__PURE__ */ for_2(foldableSet);
var apply3 = /* @__PURE__ */ apply(applyEffect);
var map7 = /* @__PURE__ */ map(functorEffect);
var sampleOnRight2 = function(v) {
  return function(v1) {
    return function(b2, k) {
      var latest = $$new(Nothing.value)();
      var c1 = v(b2, function(a2) {
        return write2(new Just(a2))(latest)();
      });
      var c2 = v1(b2, function(f) {
        var o = read2(latest)();
        return for_1(o)(function(a2) {
          return function() {
            return k(f(a2));
          };
        })();
      });
      return function __do3() {
        c1();
        return c2();
      };
    };
  };
};
var sampleOnLeft = function(v) {
  return function(v1) {
    return function(b2, k) {
      var latest = $$new(Nothing.value)();
      var c1 = v(b2, function(a2) {
        var o = read2(latest)();
        return for_1(o)(function(f) {
          return function() {
            return k(f(a2));
          };
        })();
      });
      var c2 = v1(b2, function(f) {
        return write2(new Just(f))(latest)();
      });
      return function __do3() {
        c1();
        return c2();
      };
    };
  };
};
var merge = function(dictFoldable) {
  var foldMap5 = foldMap(dictFoldable)(monoidEffect2);
  return function(f) {
    return function(tf, k) {
      var a2 = liftST2(newSTArray)();
      foldMap5(function(v) {
        return function __do3() {
          var u2 = v(tf, k);
          return $$void6(liftST2(push(u2)(a2)))();
        };
      })(f)();
      return function __do3() {
        var o = liftST2(freeze(a2))();
        return fastForeachThunk(o);
      };
    };
  };
};
var mailbox$prime = function(dictOrd) {
  var alter3 = alter(dictOrd);
  var lookup4 = lookup2(dictOrd);
  return function __do3() {
    var r = $$new(empty3)();
    return {
      event: function(a2) {
        return function(v, k2) {
          $$void6(modify(alter3(function(v1) {
            if (v1 instanceof Nothing) {
              return new Just([k2]);
            }
            ;
            if (v1 instanceof Just) {
              return new Just(append4(v1.value0)([k2]));
            }
            ;
            throw new Error("Failed pattern match at FRP.Event (line 568, column 17 - line 570, column 51): " + [v1.constructor.name]);
          })(a2))(r))();
          return $$void6(modify(alter3(function(v1) {
            if (v1 instanceof Nothing) {
              return Nothing.value;
            }
            ;
            if (v1 instanceof Just) {
              return new Just(deleteBy(unsafeRefEq)(k2)(v1.value0));
            }
            ;
            throw new Error("Failed pattern match at FRP.Event (line 577, column 17 - line 579, column 65): " + [v1.constructor.name]);
          })(a2))(r));
        };
      },
      push: function(v) {
        var o = read2(r)();
        var v1 = lookup4(v.address)(o);
        if (v1 instanceof Nothing) {
          return unit;
        }
        ;
        if (v1 instanceof Just) {
          return fastForeachE(v1.value0, function(i2) {
            return i2(v.payload);
          });
        }
        ;
        throw new Error("Failed pattern match at FRP.Event (line 586, column 9 - line 588, column 95): " + [v1.constructor.name]);
      }
    };
  };
};
var keepLatest2 = function(v) {
  return function(tf, k) {
    var cancelInner = $$new(pure4(unit))();
    var cancelOuter = v(tf, function(v1) {
      var ci = read2(cancelInner)();
      ci();
      var c = v1(tf, k);
      return write2(c)(cancelInner)();
    });
    return function __do3() {
      var ci = read2(cancelInner)();
      ci();
      return cancelOuter();
    };
  };
};
var functorEvent = {
  map: function(f) {
    return function(v) {
      return function(b2, k) {
        return v(b2, function(a2) {
          return k(f(a2));
        });
      };
    };
  }
};
var map12 = /* @__PURE__ */ map(functorEvent);
var filter5 = function(p2) {
  return function(v) {
    return function(tf, k) {
      return v(tf, function(a2) {
        var v1 = p2(a2);
        if (v1 instanceof Just) {
          return k(v1.value0);
        }
        ;
        if (v1 instanceof Nothing) {
          return unit;
        }
        ;
        throw new Error("Failed pattern match at FRP.Event (line 225, column 31 - line 227, column 35): " + [v1.constructor.name]);
      });
    };
  };
};
var filter$prime = function(f) {
  return filter5(function(a2) {
    var v = f(a2);
    if (v) {
      return new Just(a2);
    }
    ;
    if (!v) {
      return Nothing.value;
    }
    ;
    throw new Error("Failed pattern match at FRP.Event (line 141, column 13 - line 143, column 25): " + [v.constructor.name]);
  });
};
var create$prime = function __do() {
  var subscribers = objHack();
  var idx = $$new(0)();
  return {
    event: function(v, k) {
      var rk = $$new(k)();
      var ix = read2(idx)();
      insertObjHack(ix, rk, subscribers);
      modify_(function(v1) {
        return v1 + 1 | 0;
      })(idx)();
      return function __do3() {
        write2(mempty2)(rk)();
        deleteObjHack(ix, subscribers);
        return unit;
      };
    },
    push: function(a2) {
      return fastForeachOhE(subscribers, function(rk) {
        var k = read2(rk)();
        return k(a2);
      });
    }
  };
};
var fix3 = function(f) {
  return function(tf, k) {
    var v = create$prime();
    var v1 = f(v.event);
    var c2 = v.event(tf, k);
    var c1 = v1(tf, v.push);
    return function __do3() {
      c1();
      return c2();
    };
  };
};
var compactableEvent = {
  compact: /* @__PURE__ */ filter5(/* @__PURE__ */ identity(categoryFn)),
  separate: function(xs) {
    return {
      left: filter5(function(v) {
        if (v instanceof Left) {
          return new Just(v.value0);
        }
        ;
        if (v instanceof Right) {
          return Nothing.value;
        }
        ;
        throw new Error("Failed pattern match at FRP.Event (line 124, column 13 - line 126, column 33): " + [v.constructor.name]);
      })(xs),
      right: filter5(function(v) {
        if (v instanceof Right) {
          return new Just(v.value0);
        }
        ;
        if (v instanceof Left) {
          return Nothing.value;
        }
        ;
        throw new Error("Failed pattern match at FRP.Event (line 131, column 13 - line 133, column 32): " + [v.constructor.name]);
      })(xs)
    };
  }
};
var filterableEvent = {
  filter: filter$prime,
  filterMap: filter5,
  partition: function(p2) {
    return function(xs) {
      return {
        yes: filter$prime(p2)(xs),
        no: filter$prime(function($232) {
          return !p2($232);
        })(xs)
      };
    };
  },
  partitionMap: function(f) {
    return function(xs) {
      return {
        left: filterMap(filterableEvent)(function() {
          var $233 = either(Just.create)($$const(Nothing.value));
          return function($234) {
            return $233(f($234));
          };
        }())(xs),
        right: filterMap(filterableEvent)(function($235) {
          return hush(f($235));
        })(xs)
      };
    };
  },
  Compactable0: function() {
    return compactableEvent;
  },
  Functor1: function() {
    return functorEvent;
  }
};
var biSampleOn = function(v) {
  return function(v1) {
    return function(tf, k) {
      var latest1 = $$new(Nothing.value)();
      var replay1 = liftST2(newSTArray)();
      var latest2 = $$new(Nothing.value)();
      var replay2 = liftST2(newSTArray)();
      var capturing = $$new(true)();
      var c1 = v(tf, function(a2) {
        var o = read2(capturing)();
        if (o) {
          return $$void6(liftST2(push(a2)(replay1)))();
        }
        ;
        write2(new Just(a2))(latest1)();
        var res = read2(latest2)();
        return for_1(res)(function(f) {
          return function() {
            return k(f(a2));
          };
        })();
      });
      var c2 = v1(tf, function(f) {
        var o = read2(capturing)();
        if (o) {
          return $$void6(liftST2(push(f)(replay2)))();
        }
        ;
        write2(new Just(f))(latest2)();
        var res = read2(latest1)();
        return for_1(res)(function(a2) {
          return function() {
            return k(f(a2));
          };
        })();
      });
      write2(false)(capturing)();
      var samples1 = liftST2(freeze(replay1))();
      var samples2 = liftST2(freeze(replay2))();
      (function() {
        if (samples1.length === 0) {
          return write2(last(samples2))(latest2)();
        }
        ;
        return fastForeachE(samples1, function(a2) {
          write2(new Just(a2))(latest1)();
          return fastForeachE(samples2, function(f) {
            write2(new Just(f))(latest2)();
            return k(f(a2));
          });
        });
      })();
      liftST2(splice(0)(length(samples1))([])(replay1))();
      liftST2(splice(0)(length(samples2))([])(replay2))();
      return function __do3() {
        c1();
        return c2();
      };
    };
  };
};
var subscribe = function(i2) {
  return function(v) {
    return v;
  }($lazy_backdoor(345).subscribe)(i2);
};
var $lazy_backdoor = /* @__PURE__ */ $runtime_lazy4("backdoor", "FRP.Event", function() {
  var create_ = function __do3() {
    var subscribers = objHack();
    var idx = $$new(0)();
    return {
      event: function(v, k) {
        var rk = $$new(k)();
        var ix = read2(idx)();
        insertObjHack(ix, rk, subscribers);
        modify_(function(v1) {
          return v1 + 1 | 0;
        })(idx)();
        return function __do4() {
          write2(mempty2)(rk)();
          deleteObjHack(ix, subscribers);
          return unit;
        };
      },
      push: function(a2) {
        return function() {
          return fastForeachOhE(subscribers, function(rk) {
            var k = read2(rk)();
            return k(a2);
          });
        };
      }
    };
  };
  return {
    createO: create$prime,
    makeEvent: function() {
      var makeEvent_ = function(e) {
        return function(tf, k) {
          if (tf) {
            return pure4(unit);
          }
          ;
          return e(function(a2) {
            return function() {
              return k(a2);
            };
          })();
        };
      };
      return makeEvent_;
    }(),
    makeEventO: function() {
      var makeEventO_ = function(e) {
        return function(tf, k) {
          if (tf) {
            return pure4(unit);
          }
          ;
          return e(k);
        };
      };
      return makeEventO_;
    }(),
    makePureEvent: function() {
      var makePureEvent_ = function(e) {
        return function(v, k) {
          return e(function(a2) {
            return function() {
              return k(a2);
            };
          })();
        };
      };
      return makePureEvent_;
    }(),
    makeLemmingEvent: function() {
      var makeLemmingEvent_ = function(e) {
        return function(tf, k) {
          var o = function(v) {
            return function(kx) {
              return function() {
                return v(tf, mkEffectFn1(kx));
              };
            };
          };
          return e(o)(function(a2) {
            return function() {
              return k(a2);
            };
          })();
        };
      };
      return makeLemmingEvent_;
    }(),
    makeLemmingEventO: function() {
      var makeLemmingEventO_ = function(e) {
        return function(tf, k) {
          var o = function(v, kx) {
            return v(tf, kx);
          };
          return e(o, k);
        };
      };
      return makeLemmingEventO_;
    }(),
    create: create_,
    createPure: create_,
    createPureO: create$prime,
    subscribe: function() {
      var subscribe_ = function(v) {
        return function(k) {
          return function() {
            return v(false, mkEffectFn1(k));
          };
        };
      };
      return subscribe_;
    }(),
    subscribeO: function() {
      var subscribeO_ = function(v, k) {
        return v(false, k);
      };
      return subscribeO_;
    }(),
    subscribePureO: function() {
      var subscribePureO_ = function(v, k) {
        return v(true, k);
      };
      return subscribePureO_;
    }(),
    subscribePure: function() {
      var subscribePure_ = function() {
        var o = function(v) {
          return function(k) {
            return function() {
              return v(true, mkEffectFn1(k));
            };
          };
        };
        return o;
      }();
      return subscribePure_;
    }(),
    bus: function() {
      var bus_ = function(f) {
        return function(v, k) {
          var v1 = $lazy_create(819)();
          k(f(v1.push)(v1.event));
          return pure4(unit);
        };
      };
      return bus_;
    }(),
    memoize: function() {
      var memoize_ = function(v) {
        return function(f) {
          return function(b2, k) {
            var v1 = create$prime();
            k(f(v1.event));
            return v(b2, v1.push);
          };
        };
      };
      return memoize_;
    }(),
    hot: function() {
      var hot_ = function(e) {
        return function __do3() {
          var v = $lazy_create(837)();
          var unsubscribe = subscribe(e)(v.push)();
          return {
            event: v.event,
            unsubscribe
          };
        };
      };
      return hot_;
    }(),
    mailbox: function() {
      var mailbox_ = function(dictOrd) {
        return function __do3() {
          var v = mailbox$prime(dictOrd)();
          return {
            event: v.event,
            push: function(k) {
              return function() {
                return v.push(k);
              };
            }
          };
        };
      };
      return mailbox_;
    }(),
    mailboxed: function() {
      var mailboxed_ = function(dictOrd) {
        var mailbox$prime1 = mailbox$prime(dictOrd);
        return function(v) {
          return function(f) {
            return function(b2, k) {
              var v1 = mailbox$prime1();
              k(f(v1.event));
              return v(b2, v1.push);
            };
          };
        };
      };
      return mailboxed_;
    }(),
    delay: function() {
      var delay_ = function(n) {
        return function(v) {
          return function(tf, k) {
            var tid = $$new(mempty1)();
            var canceler = v(tf, function(a2) {
              var localId = $$new(Nothing.value)();
              var id2 = setTimeout2(n)(function __do3() {
                k(a2);
                var lid = read2(localId)();
                return maybe(pure4(unit))(function(id3) {
                  return modify_($$delete4(id3))(tid);
                })(lid)();
              })();
              write2(new Just(id2))(localId)();
              return modify_(append12(singleton8(id2)))(tid)();
            });
            return function __do3() {
              var ids = read2(tid)();
              for_22(ids)(clearTimeout2)();
              return canceler();
            };
          };
        };
      };
      return delay_;
    }()
  };
});
var $lazy_create = /* @__PURE__ */ $runtime_lazy4("create", "FRP.Event", function() {
  return function __do3() {
    unit;
    return function(v) {
      return v;
    }($lazy_backdoor(461).create)();
  };
});
var backdoor = /* @__PURE__ */ $lazy_backdoor(678);
var create = /* @__PURE__ */ $lazy_create(458);
var bus = function(i2) {
  return function(v) {
    return v;
  }(backdoor.bus)(i2);
};
var makeLemmingEvent = function(i2) {
  return function(v) {
    return v;
  }(backdoor.makeLemmingEvent)(i2);
};
var makeLemmingEventO = function(i2) {
  return function(v) {
    return v;
  }(backdoor.makeLemmingEventO)(i2);
};
var makePureEvent = function(i2) {
  return function(v) {
    return v;
  }(backdoor.makePureEvent)(i2);
};
var memoize = function(i2) {
  return function(v) {
    return v;
  }(backdoor.memoize)(i2);
};
var subscribePure = function(i2) {
  return function(v) {
    return v;
  }(backdoor.subscribePure)(i2);
};
var applyEvent = {
  apply: function(a2) {
    return function(b2) {
      return biSampleOn(a2)(map12(applyFlipped)(b2));
    };
  },
  Functor0: function() {
    return functorEvent;
  }
};
var applicativeEvent = {
  pure: function(a2) {
    return function(v, k) {
      k(a2);
      return pure4(unit);
    };
  },
  Apply0: function() {
    return applyEvent;
  }
};
var altEvent = {
  alt: function(v) {
    return function(v1) {
      return function(tf, k) {
        return apply3(map7(function(v2) {
          return function(v3) {
            return function __do3() {
              v2();
              return v3();
            };
          };
        })(function() {
          return v(tf, k);
        }))(function() {
          return v1(tf, k);
        })();
      };
    };
  },
  Functor0: function() {
    return functorEvent;
  }
};
var plusEvent = {
  empty: function(v, v1) {
    return pure4(unit);
  },
  Alt0: function() {
    return altEvent;
  }
};
var alternativeEvent = {
  Applicative0: function() {
    return applicativeEvent;
  },
  Plus1: function() {
    return plusEvent;
  }
};
var eventIsEvent = {
  keepLatest: keepLatest2,
  sampleOnRight: sampleOnRight2,
  sampleOnLeft,
  fix: fix3,
  Alternative0: function() {
    return alternativeEvent;
  },
  Filterable1: function() {
    return filterableEvent;
  }
};

// output/Deku.Attribute/index.js
var pure5 = /* @__PURE__ */ pure(applicativeEvent);
var Cb = function(x) {
  return x;
};
var Prop$prime = /* @__PURE__ */ function() {
  function Prop$prime2(value0) {
    this.value0 = value0;
  }
  ;
  Prop$prime2.create = function(value0) {
    return new Prop$prime2(value0);
  };
  return Prop$prime2;
}();
var Cb$prime = /* @__PURE__ */ function() {
  function Cb$prime2(value0) {
    this.value0 = value0;
  }
  ;
  Cb$prime2.create = function(value0) {
    return new Cb$prime2(value0);
  };
  return Cb$prime2;
}();
var Unset$prime = /* @__PURE__ */ function() {
  function Unset$prime2() {
  }
  ;
  Unset$prime2.value = new Unset$prime2();
  return Unset$prime2;
}();
var Attribute = function(x) {
  return x;
};
var unsafeUnAttribute = /* @__PURE__ */ coerce();
var unsafeAttribute = Attribute;
var prop$prime = /* @__PURE__ */ function() {
  return Prop$prime.create;
}();
var cb$prime = /* @__PURE__ */ function() {
  return Cb$prime.create;
}();
var cb = /* @__PURE__ */ function() {
  var $27 = map(functorFn)(map(functorEffect)($$const(true)));
  return function($28) {
    return Cb($27($28));
  };
}();
var attr = function(dict) {
  return dict.attr;
};
var pureAttr = function(dictAttr) {
  var attr112 = attr(dictAttr);
  return function(a2) {
    return function(b2) {
      return pure5(attr112(a2)(b2));
    };
  };
};

// output/Bolson.Control/foreign.js
function mutAr(a2) {
  return () => {
    return a2.slice();
  };
}
function unsafeUpdateMutAr(i2) {
  return (v) => (a2) => () => {
    a2[i2] = v;
  };
}
function readAr(a2) {
  return () => {
    return a2.slice();
  };
}

// output/FRP.Event.VBus/index.js
var pure6 = /* @__PURE__ */ pure(applicativeST);
var vbusNil = {
  vb: function(v) {
    return pure6(new Tuple({}, {}));
  }
};
var vb = function(dict) {
  return dict.vb;
};
var vbackdoor = {
  vbus: /* @__PURE__ */ function() {
    var vbus__ = function() {
      return function(dictVBus) {
        var vb1 = vb(dictVBus);
        return function(v) {
          return function(f) {
            return makeLemmingEvent(function(v1) {
              return function(k) {
                return function __do3() {
                  var v2 = vb1($$Proxy.value)();
                  k(f(v2.value0)(v2.value1))();
                  return pure6(unit);
                };
              };
            });
          };
        };
      };
    };
    var vbus__1 = vbus__();
    var vbus_ = function() {
      return function(dictVBus) {
        return vbus__1(dictVBus);
      };
    };
    return vbus_;
  }()
};
var vbus = function() {
  return function(dictVBus) {
    return function(i2) {
      return function(v) {
        return v()(dictVBus);
      }(vbackdoor.vbus)(i2);
    };
  };
};
var vbusCons2 = function(dictIsSymbol) {
  var insert8 = insert2(dictIsSymbol)()();
  return function() {
    return function() {
      return function(dictVBus) {
        var vb1 = vb(dictVBus);
        return function() {
          return function() {
            return {
              vb: function(v) {
                return function __do3() {
                  var v1 = vb1($$Proxy.value)();
                  var v2 = create();
                  return new Tuple(insert8($$Proxy.value)(v2.push)(v1.value0), insert8($$Proxy.value)(v2.event)(v1.value1));
                };
              }
            };
          };
        };
      };
    };
  };
};

// output/Bolson.Core/index.js
var Local = /* @__PURE__ */ function() {
  function Local2(value0) {
    this.value0 = value0;
  }
  ;
  Local2.create = function(value0) {
    return new Local2(value0);
  };
  return Local2;
}();
var Global = /* @__PURE__ */ function() {
  function Global2() {
  }
  ;
  Global2.value = new Global2();
  return Global2;
}();
var Insert = /* @__PURE__ */ function() {
  function Insert2(value0) {
    this.value0 = value0;
  }
  ;
  Insert2.create = function(value0) {
    return new Insert2(value0);
  };
  return Insert2;
}();
var Remove = /* @__PURE__ */ function() {
  function Remove2() {
  }
  ;
  Remove2.value = new Remove2();
  return Remove2;
}();
var Logic = /* @__PURE__ */ function() {
  function Logic2(value0) {
    this.value0 = value0;
  }
  ;
  Logic2.create = function(value0) {
    return new Logic2(value0);
  };
  return Logic2;
}();
var DynamicChildren$prime = /* @__PURE__ */ function() {
  function DynamicChildren$prime2(value0) {
    this.value0 = value0;
  }
  ;
  DynamicChildren$prime2.create = function(value0) {
    return new DynamicChildren$prime2(value0);
  };
  return DynamicChildren$prime2;
}();
var FixedChildren$prime = /* @__PURE__ */ function() {
  function FixedChildren$prime2(value0) {
    this.value0 = value0;
  }
  ;
  FixedChildren$prime2.create = function(value0) {
    return new FixedChildren$prime2(value0);
  };
  return FixedChildren$prime2;
}();
var EventfulElement$prime = /* @__PURE__ */ function() {
  function EventfulElement$prime2(value0) {
    this.value0 = value0;
  }
  ;
  EventfulElement$prime2.create = function(value0) {
    return new EventfulElement$prime2(value0);
  };
  return EventfulElement$prime2;
}();
var Element$prime = /* @__PURE__ */ function() {
  function Element$prime2(value0) {
    this.value0 = value0;
  }
  ;
  Element$prime2.create = function(value0) {
    return new Element$prime2(value0);
  };
  return Element$prime2;
}();
var eqScope = {
  eq: function(x) {
    return function(y) {
      if (x instanceof Local && y instanceof Local) {
        return x.value0 === y.value0;
      }
      ;
      if (x instanceof Global && y instanceof Global) {
        return true;
      }
      ;
      return false;
    };
  }
};
var fixed = function(a2) {
  return new FixedChildren$prime(a2);
};
var dyn = function(a2) {
  return new DynamicChildren$prime(a2);
};

// output/Data.FastVect.FastVect/foreign.js
var indexImpl2 = (i2) => (v) => v[i2];

// output/Data.Array.NonEmpty.Internal/foreign.js
var traverse1Impl = function() {
  function Cont(fn) {
    this.fn = fn;
  }
  var emptyList = {};
  var ConsCell = function(head6, tail2) {
    this.head = head6;
    this.tail = tail2;
  };
  function finalCell(head6) {
    return new ConsCell(head6, emptyList);
  }
  function consList(x) {
    return function(xs) {
      return new ConsCell(x, xs);
    };
  }
  function listToArray(list) {
    var arr = [];
    var xs = list;
    while (xs !== emptyList) {
      arr.push(xs.head);
      xs = xs.tail;
    }
    return arr;
  }
  return function(apply7) {
    return function(map31) {
      return function(f) {
        var buildFrom = function(x, ys) {
          return apply7(map31(consList)(f(x)))(ys);
        };
        var go2 = function(acc, currentLen, xs) {
          if (currentLen === 0) {
            return acc;
          } else {
            var last3 = xs[currentLen - 1];
            return new Cont(function() {
              var built = go2(buildFrom(last3, acc), currentLen - 1, xs);
              return built;
            });
          }
        };
        return function(array) {
          var acc = map31(finalCell)(f(array[array.length - 1]));
          var result = go2(acc, array.length - 1, array);
          while (result instanceof Cont) {
            result = result.fn();
          }
          return map31(listToArray)(result);
        };
      };
    };
  };
}();

// output/Data.Reflectable/index.js
var reflectType = function(dict) {
  return dict.reflectType;
};

// output/Data.FastVect.Common/index.js
var toInt = function(dictReflectable) {
  return reflectType(dictReflectable);
};

// output/Data.FastVect.FastVect/index.js
var functorVect = functorArray;
var toArray3 = function() {
  return function(v) {
    return v;
  };
};
var index2 = function(dictReflectable) {
  var toInt2 = toInt(dictReflectable);
  return function() {
    return function() {
      return function() {
        return function($211) {
          return indexImpl2(toInt2($211));
        };
      };
    };
  };
};
var empty5 = [];
var cons3 = function() {
  return function() {
    return function(elem3) {
      return function(v) {
        return cons(elem3)(v);
      };
    };
  };
};

// output/Record.Builder/foreign.js
function copyRecord(rec) {
  var copy3 = {};
  for (var key2 in rec) {
    if ({}.hasOwnProperty.call(rec, key2)) {
      copy3[key2] = rec[key2];
    }
  }
  return copy3;
}
function unsafeInsert(l) {
  return function(a2) {
    return function(rec) {
      rec[l] = a2;
      return rec;
    };
  };
}
function unsafeModify(l) {
  return function(f) {
    return function(rec) {
      rec[l] = f(rec[l]);
      return rec;
    };
  };
}
function unsafeDelete2(l) {
  return function(rec) {
    delete rec[l];
    return rec;
  };
}

// output/Record.Builder/index.js
var semigroupoidBuilder = semigroupoidFn;
var modify4 = function() {
  return function() {
    return function(dictIsSymbol) {
      var reflectSymbol2 = reflectSymbol(dictIsSymbol);
      return function(l) {
        return function(f) {
          return function(r1) {
            return unsafeModify(reflectSymbol2(l))(f)(r1);
          };
        };
      };
    };
  };
};
var insert5 = function() {
  return function() {
    return function(dictIsSymbol) {
      var reflectSymbol2 = reflectSymbol(dictIsSymbol);
      return function(l) {
        return function(a2) {
          return function(r1) {
            return unsafeInsert(reflectSymbol2(l))(a2)(r1);
          };
        };
      };
    };
  };
};
var $$delete6 = function(dictIsSymbol) {
  var reflectSymbol2 = reflectSymbol(dictIsSymbol);
  return function() {
    return function() {
      return function(l) {
        return function(r2) {
          return unsafeDelete2(reflectSymbol2(l))(r2);
        };
      };
    };
  };
};
var build = function(v) {
  return function(r1) {
    return v(copyRecord(r1));
  };
};

// output/Bolson.Control/index.js
var keepLatest3 = /* @__PURE__ */ keepLatest(eventIsEvent);
var map8 = /* @__PURE__ */ map(functorEvent);
var oneOf2 = /* @__PURE__ */ oneOf(foldableArray)(plusEvent);
var bind3 = /* @__PURE__ */ bind(bindST);
var map13 = /* @__PURE__ */ map(functorArray);
var toArray4 = /* @__PURE__ */ toArray3();
var mapWithIndex3 = /* @__PURE__ */ mapWithIndex(functorWithIndexArray);
var fix4 = /* @__PURE__ */ fix(lazyFn);
var pure12 = /* @__PURE__ */ pure(applicativeST);
var map22 = /* @__PURE__ */ map(functorST);
var map32 = /* @__PURE__ */ map(functorVect);
var for_3 = /* @__PURE__ */ for_(applicativeST);
var for_12 = /* @__PURE__ */ for_3(foldableMaybe);
var composeFlipped2 = /* @__PURE__ */ composeFlipped(semigroupoidBuilder);
var insert6 = /* @__PURE__ */ insert5()()({
  reflectSymbol: function() {
    return "id";
  }
});
var modify5 = /* @__PURE__ */ modify4()()({
  reflectSymbol: function() {
    return "parent";
  }
});
var $$delete7 = /* @__PURE__ */ $$delete6({
  reflectSymbol: function() {
    return "raiseId";
  }
})()();
var $$void7 = /* @__PURE__ */ $$void(functorST);
var when2 = /* @__PURE__ */ when(applicativeST);
var for_23 = /* @__PURE__ */ for_3(foldableArray);
var identity9 = /* @__PURE__ */ identity(categoryFn);
var oneOfMap2 = /* @__PURE__ */ oneOfMap(foldableArray)(plusEvent);
var traverse_2 = /* @__PURE__ */ traverse_(applicativeST)(foldableArray);
var append5 = /* @__PURE__ */ append(semigroupArray);
var foldl4 = /* @__PURE__ */ foldl(foldableObject);
var applySecond2 = /* @__PURE__ */ applySecond(applyST);
var Begin = /* @__PURE__ */ function() {
  function Begin3() {
  }
  ;
  Begin3.value = new Begin3();
  return Begin3;
}();
var Middle = /* @__PURE__ */ function() {
  function Middle2() {
  }
  ;
  Middle2.value = new Middle2();
  return Middle2;
}();
var End = /* @__PURE__ */ function() {
  function End3() {
  }
  ;
  End3.value = new End3();
  return End3;
}();
var flatten = function(v) {
  return function(psr) {
    return function(interpreter) {
      var element = function(v1) {
        return v1(psr)(interpreter);
      };
      return function(v1) {
        if (v1 instanceof FixedChildren$prime) {
          return oneOfMap2(flatten(v)(psr)(interpreter))(v1.value0);
        }
        ;
        if (v1 instanceof EventfulElement$prime) {
          return keepLatest3(map8(flatten(v)(psr)(interpreter))(v1.value0));
        }
        ;
        if (v1 instanceof Element$prime) {
          return element(v.toElt(v1.value0));
        }
        ;
        if (v1 instanceof DynamicChildren$prime) {
          return makeLemmingEventO(function(v2, v3) {
            var cancelInner = newSTRef(empty2)();
            var cancelOuter = v2(v1.value0, function(inner) {
              var myUnsubId = v.ids(interpreter)();
              var myUnsub = newSTRef(pure12(unit))();
              var eltsUnsubId = v.ids(interpreter)();
              var eltsUnsub = newSTRef(pure12(unit))();
              var myIds = newSTRef([])();
              var myImmediateCancellation = newSTRef(pure12(unit))();
              var myScope = map22(Local.create)(v.ids(interpreter))();
              var stageRef = newSTRef(Begin.value)();
              var c0 = v2(inner, function(kid$prime) {
                var stage = read(stageRef)();
                if (kid$prime instanceof Logic && stage instanceof Middle) {
                  var curId = read(myIds)();
                  return traverse_2(function(i2) {
                    return function() {
                      return v3(v.doLogic(kid$prime.value0)(interpreter)(i2));
                    };
                  })(curId)();
                }
                ;
                if (kid$prime instanceof Remove && stage instanceof Middle) {
                  $$void7(write(End.value)(stageRef))();
                  var mic = function __do3() {
                    var idRef = read(myIds)();
                    for_23(idRef)(function(old) {
                      return for_12(psr.parent)(function(pnt) {
                        return function() {
                          return v3(v.disconnectElement(interpreter)({
                            id: old,
                            parent: pnt,
                            scope: myScope
                          }));
                        };
                      });
                    })();
                    var myu = read(myUnsub)();
                    myu();
                    var eltu = read(eltsUnsub)();
                    eltu();
                    $$void7(modify2($$delete(myUnsubId))(cancelInner))();
                    return $$void7(modify2($$delete(eltsUnsubId))(cancelInner))();
                  };
                  $$void7(write(mic)(myImmediateCancellation))();
                  return mic();
                }
                ;
                if (kid$prime instanceof Insert && stage instanceof Begin) {
                  $$void7(write(Middle.value)(stageRef))();
                  var c1 = v2(flatten(v)(function() {
                    var $125 = {};
                    for (var $126 in psr) {
                      if ({}.hasOwnProperty.call(psr, $126)) {
                        $125[$126] = psr[$126];
                      }
                      ;
                    }
                    ;
                    $125.scope = myScope;
                    $125.raiseId = function(id2) {
                      return $$void7(modify2(append5([id2]))(myIds));
                    };
                    return $125;
                  }())(interpreter)(kid$prime.value0), v3);
                  $$void7(modify2(insert(eltsUnsubId)(c1))(cancelInner))();
                  return $$void7(write(c1)(eltsUnsub))();
                }
                ;
                return unit;
              });
              $$void7(write(c0)(myUnsub))();
              $$void7(modify2(insert(myUnsubId)(c0))(cancelInner))();
              var mican = read(myImmediateCancellation)();
              return mican();
            });
            return function __do3() {
              bind3(read(cancelInner))(foldl4(applySecond2)(pure12(unit)))();
              return cancelOuter();
            };
          });
        }
        ;
        throw new Error("Failed pattern match at Bolson.Control (line 544, column 17 - line 630, column 20): " + [v1.constructor.name]);
      };
    };
  };
};
var internalPortalComplexComplex = function() {
  return function() {
    return function() {
      return function(isGlobal) {
        return function(scopeF) {
          return function(flatArgs) {
            return function(v) {
              return function(toBeam) {
                return function(closure) {
                  var go2 = function(psr) {
                    return function(interpreter) {
                      return makeLemmingEventO(function(v1, k) {
                        var av = mutAr(map13($$const(""))(toArray4(toBeam)))();
                        var actualized = oneOf2(mapWithIndex3(function(ix) {
                          return fix4(function(f) {
                            return function(i2) {
                              if (i2 instanceof Element$prime) {
                                return function(v2) {
                                  return v2(function() {
                                    var $143 = {};
                                    for (var $144 in psr) {
                                      if ({}.hasOwnProperty.call(psr, $144)) {
                                        $143[$144] = psr[$144];
                                      }
                                      ;
                                    }
                                    ;
                                    $143.parent = Nothing.value;
                                    $143.scope = scopeF(psr.scope);
                                    $143.raiseId = function(id2) {
                                      return unsafeUpdateMutAr(ix)(id2)(av);
                                    };
                                    return $143;
                                  }())(interpreter);
                                }(v.toElt(i2.value0));
                              }
                              ;
                              return f(v.wrapElt(i2));
                            };
                          });
                        })(toArray4(toBeam)));
                        var u0 = v1(actualized, k);
                        var av2 = newSTRef(pure12(unit))();
                        var idz = map22(unsafeCoerce)(readAr(av))();
                        var injectable = map32(function(id2) {
                          return function(specialization) {
                            return new Element$prime(v.fromEltO1(function(psr2) {
                              return function(itp) {
                                return makeLemmingEventO(function(v2, k2) {
                                  psr2.raiseId(id2)();
                                  for_12(psr2.parent)(function(pt) {
                                    return function() {
                                      return k2(v.giveNewParent(itp)(build(composeFlipped2(insert6($$Proxy.value)(id2))(composeFlipped2(modify5($$Proxy.value)($$const(pt)))($$delete7($$Proxy.value))))(psr2))(specialization));
                                    };
                                  })();
                                  return pure12(unit);
                                });
                              };
                            }));
                          };
                        })(idz);
                        var realized = flatten(flatArgs)(psr)(interpreter)(closure(injectable)(unsafeCoerce));
                        var u2 = v1(realized, k);
                        $$void7(write(u2)(av2))();
                        return function __do3() {
                          u0();
                          when2(!isGlobal)(for_23(toArray4(idz))(function(id2) {
                            return function() {
                              return k(v.deleteFromCache(interpreter)({
                                id: id2
                              }));
                            };
                          }))();
                          var av2c = read(av2)();
                          return av2c();
                        };
                      });
                    };
                  };
                  return new Element$prime(v.fromEltO2(go2));
                };
              };
            };
          };
        };
      };
    };
  };
};
var internalPortalComplexComplex1 = /* @__PURE__ */ internalPortalComplexComplex()()();
var portalComplexComplex = function() {
  return function() {
    return function() {
      return function(flatArgs) {
        return function(portalArgs) {
          return function(toBeam) {
            return function(closure) {
              return internalPortalComplexComplex1(false)(identity9)(flatArgs)(portalArgs)(toBeam)(closure);
            };
          };
        };
      };
    };
  };
};

// output/Control.Monad.State.Class/index.js
var state = function(dict) {
  return dict.state;
};
var modify6 = function(dictMonadState) {
  var state1 = state(dictMonadState);
  return function(f) {
    return state1(function(s2) {
      var s$prime = f(s2);
      return new Tuple(s$prime, s$prime);
    });
  };
};

// output/Deku.Core/index.js
var coerce3 = /* @__PURE__ */ coerce();
var vbus2 = /* @__PURE__ */ vbus();
var lcmap2 = /* @__PURE__ */ lcmap(profunctorFn);
var map9 = /* @__PURE__ */ map(functorEvent);
var unwrap3 = /* @__PURE__ */ unwrap();
var eq2 = /* @__PURE__ */ eq(eqScope);
var pure7 = /* @__PURE__ */ pure(applicativeST);
var pure13 = /* @__PURE__ */ pure(applicativeEvent);
var empty6 = /* @__PURE__ */ empty(plusEvent);
var merge2 = /* @__PURE__ */ merge(foldableArray);
var vbussed = function() {
  return function(dictVBus) {
    var vbus1 = vbus2(dictVBus);
    return function(px11) {
      return function(f) {
        return new EventfulElement$prime(coerce3(vbus1(px11)(f)));
      };
    };
  };
};
var unsafeSetPos$prime = function(i2) {
  return function(v) {
    var f = function(v1) {
      if (v1 instanceof Element$prime) {
        return new Element$prime(lcmap2(function(v2) {
          return {
            pos: i2,
            dynFamily: v2.dynFamily,
            ez: v2.ez,
            parent: v2.parent,
            raiseId: v2.raiseId,
            scope: v2.scope
          };
        })(v1.value0));
      }
      ;
      if (v1 instanceof EventfulElement$prime) {
        return new EventfulElement$prime(map9(f)(v1.value0));
      }
      ;
      return v;
    };
    return f(v);
  };
};
var unsafeSetPos = function($76) {
  return unsafeSetPos$prime(Just.create($76));
};
var sendToPos = /* @__PURE__ */ function() {
  return Logic.create;
}();
var remove = /* @__PURE__ */ function() {
  return Remove.value;
}();
var portalFlatten = function() {
  return {
    doLogic: function(pos) {
      return function(v) {
        return function(id2) {
          return v.sendToPos({
            id: id2,
            pos
          });
        };
      };
    },
    ids: function($77) {
      return function(v) {
        return v.ids;
      }(unwrap3($77));
    },
    disconnectElement: function(v) {
      return function(v1) {
        return v.disconnectElement({
          id: v1.id,
          scope: v1.scope,
          parent: v1.parent,
          scopeEq: eq2
        });
      };
    },
    toElt: function(v) {
      return v;
    }
  };
};
var portalFlatten1 = /* @__PURE__ */ portalFlatten();
var insert_ = function(d) {
  return new Insert(unwrap3(unsafeSetPos$prime(Nothing.value)(d)));
};
var insert7 = function(i2) {
  return function(e) {
    return new Insert(unwrap3(unsafeSetPos(i2)(e)));
  };
};
var bus2 = function(f) {
  return bus(f);
};
var bussed = function(f) {
  return new EventfulElement$prime(coerce3(bus2(f)));
};
var __internalDekuFlatten = function(a2) {
  return function(b2) {
    return function(v) {
      return flatten(portalFlatten1)(a2)(b2)(v);
    };
  };
};
var dynify = function(f) {
  return function(es) {
    var go2 = function(v) {
      return function(v1) {
        return makeLemmingEventO(function(v2, k) {
          var me = v1.ids();
          v.raiseId(me)();
          var v3 = function() {
            if (v.parent instanceof Nothing) {
              var dummyParent = v1.ids();
              return new Tuple(pure13(v1.makeElement({
                id: dummyParent,
                parent: Nothing.value,
                scope: v.scope,
                tag: "div",
                pos: Nothing.value,
                dynFamily: Nothing.value
              })), dummyParent);
            }
            ;
            if (v.parent instanceof Just) {
              return new Tuple(empty6, v.parent.value0);
            }
            ;
            throw new Error("Failed pattern match at Deku.Core (line 407, column 34 - line 421, column 36): " + [v.parent.constructor.name]);
          }();
          var unsub = v2(merge2([v3.value0, pure13(v1.makeDynBeacon({
            id: me,
            parent: new Just(v3.value1),
            scope: v.scope,
            dynFamily: v.dynFamily,
            pos: v.pos
          })), pure13(v1.attributeParent({
            id: me,
            parent: v3.value1,
            pos: v.pos,
            dynFamily: v.dynFamily,
            ez: v.ez
          })), __internalDekuFlatten({
            parent: new Just(v3.value1),
            scope: v.scope,
            ez: false,
            raiseId: function(v4) {
              return pure7(unit);
            },
            pos: Nothing.value,
            dynFamily: new Just(me)
          })(v1)(f(es))]), k);
          return function __do3() {
            k(v1.removeDynBeacon({
              id: me
            }));
            return unsub();
          };
        });
      };
    };
    return new Element$prime(go2);
  };
};
var dyn2 = /* @__PURE__ */ dynify(/* @__PURE__ */ coerce3(dyn));

// output/Deku.Control/index.js
var map10 = /* @__PURE__ */ map(functorEvent);
var merge3 = /* @__PURE__ */ merge(foldableArray);
var pure8 = /* @__PURE__ */ pure(applicativeEvent);
var empty7 = /* @__PURE__ */ empty(plusEvent);
var pure14 = /* @__PURE__ */ pure(applicativeST);
var mapAccum2 = /* @__PURE__ */ mapAccum(eventIsEvent);
var keepLatest4 = /* @__PURE__ */ keepLatest(eventIsEvent);
var filter6 = /* @__PURE__ */ filter4(filterableEvent);
var eq3 = /* @__PURE__ */ eq(eqInt);
var coerce4 = /* @__PURE__ */ coerce();
var unwrap4 = /* @__PURE__ */ unwrap();
var eq12 = /* @__PURE__ */ eq(eqScope);
var alt2 = /* @__PURE__ */ alt(altEvent);
var append6 = /* @__PURE__ */ append(semigroupArray);
var map14 = /* @__PURE__ */ map(functorVect);
var wrap2 = /* @__PURE__ */ wrap();
var lcmap3 = /* @__PURE__ */ lcmap(profunctorFn);
var portalComplexComplex2 = /* @__PURE__ */ portalComplexComplex()()();
var unsafeSetText = function(v) {
  return function(id2) {
    return function(txt) {
      return map10(function($130) {
        return v.setText(function(v1) {
          return {
            id: id2,
            text: v1
          };
        }($130));
      })(txt);
    };
  };
};
var unsafeSetAttribute = function(v) {
  return function(id2) {
    return function(atts) {
      return map10(function($131) {
        return function(v1) {
          if (v1.value instanceof Prop$prime) {
            return v.setProp({
              id: id2,
              key: v1.key,
              value: v1.value.value0
            });
          }
          ;
          if (v1.value instanceof Cb$prime) {
            return v.setCb({
              id: id2,
              key: v1.key,
              value: v1.value.value0
            });
          }
          ;
          if (v1.value instanceof Unset$prime) {
            return v.unsetAttribute({
              id: id2,
              key: v1.key
            });
          }
          ;
          throw new Error("Failed pattern match at Deku.Control (line 71, column 28 - line 74, column 47): " + [v1.value.constructor.name]);
        }(unsafeUnAttribute($131));
      })(atts);
    };
  };
};
var text = function(txt) {
  var go2 = function(v) {
    return function(v1) {
      return makeLemmingEventO(function(v2, k) {
        var me = v1.ids();
        v.raiseId(me)();
        var unsub = v2(merge3([pure8(v1.makeText({
          id: me,
          parent: v.parent,
          pos: v.pos,
          scope: v.scope,
          dynFamily: v.dynFamily
        })), unsafeSetText(v1)(me)(txt), maybe(empty7)(function(p2) {
          return pure8(v1.attributeParent({
            id: me,
            parent: p2,
            pos: v.pos,
            dynFamily: v.dynFamily,
            ez: v.ez
          }));
        })(v.parent)]), k);
        return function __do3() {
          k(v1.deleteFromCache({
            id: me
          }));
          return unsub();
        };
      });
    };
  };
  return new Element$prime(go2);
};
var text_ = function(txt) {
  return text(pure8(txt));
};
var switcher = function(f) {
  return function(event) {
    var counter = function() {
      var fn = function(a2) {
        return function(b2) {
          return new Tuple(a2 + 1 | 0, new Tuple(b2, a2));
        };
      };
      return mapAccum2(fn)(0);
    }();
    return dyn2(keepLatest4(memoize(counter(event))(function(cenv) {
      return map10(function(v) {
        return merge3([map10($$const(Remove.value))(filter6(function() {
          var $132 = eq3(v.value1 + 1 | 0);
          return function($133) {
            return $132(snd($133));
          };
        }())(cenv)), pure8(insert_(coerce4(f(v.value0))))]);
      })(cenv);
    })));
  };
};
var portalFlatten2 = function() {
  return {
    doLogic: function(pos) {
      return function(v) {
        return function(id2) {
          return v.sendToPos({
            id: id2,
            pos
          });
        };
      };
    },
    ids: function($134) {
      return function(v) {
        return v.ids;
      }(unwrap4($134));
    },
    disconnectElement: function(v) {
      return function(v1) {
        return v.disconnectElement({
          id: v1.id,
          scope: v1.scope,
          parent: v1.parent,
          scopeEq: eq12
        });
      };
    },
    toElt: function(v) {
      return v;
    }
  };
};
var portalFlatten12 = /* @__PURE__ */ portalFlatten2();
var __internalDekuFlatten2 = function(a2) {
  return function(b2) {
    return function(v) {
      return flatten(portalFlatten12)(a2)(b2)(v);
    };
  };
};
var elementify = function(tag) {
  return function(atts) {
    return function(children) {
      var go2 = function(v) {
        return function(v1) {
          return makeLemmingEventO(function(v2, k) {
            var me = v1.ids();
            v.raiseId(me)();
            var unsub = v2(alt2(merge3(append6([pure8(v1.makeElement({
              id: me,
              parent: v.parent,
              scope: v.scope,
              tag,
              pos: v.pos,
              dynFamily: v.dynFamily
            })), unsafeSetAttribute(v1)(me)(atts)])(maybe([])(function(p2) {
              return [pure8(v1.attributeParent({
                id: me,
                parent: p2,
                pos: v.pos,
                dynFamily: v.dynFamily,
                ez: v.ez
              }))];
            })(v.parent))))(__internalDekuFlatten2({
              parent: new Just(me),
              scope: v.scope,
              ez: true,
              raiseId: function(v3) {
                return pure14(unit);
              },
              pos: Nothing.value,
              dynFamily: Nothing.value
            })(v1)(children)), k);
            return function __do3() {
              k(v1.deleteFromCache({
                id: me
              }));
              return unsub();
            };
          });
        };
      };
      return go2;
    };
  };
};
var portal = function() {
  return function(a2) {
    return function(b2) {
      return portalComplexComplex2(portalFlatten12)({
        fromEltO1: coerce4,
        fromEltO2: coerce4,
        toElt: coerce4,
        wrapElt: function(i2) {
          return new Element$prime(elementify("div")(empty7)(wrap2(i2)));
        },
        giveNewParent: function(q2) {
          return function(r) {
            return function(v) {
              return unwrap4(q2).giveNewParent(r);
            };
          };
        },
        deleteFromCache: function($137) {
          return function(v) {
            return v.deleteFromCache;
          }(unwrap4($137));
        }
      })(map14(unwrap4)(a2))(lcmap3(map14(function(v) {
        return v(unit);
      }))(coerce4(curry(b2))));
    };
  };
};

// output/Deku.DOM.Attr.Href/index.js
var Href = /* @__PURE__ */ function() {
  function Href2() {
  }
  ;
  Href2.value = new Href2();
  return Href2;
}();
var attrA_HrefString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "href",
        value: prop$prime(value13)
      });
    };
  }
};

// output/Deku.DOM.Attr.OnClick/index.js
var voidLeft2 = /* @__PURE__ */ voidLeft(functorEffect);
var OnClick = /* @__PURE__ */ function() {
  function OnClick2() {
  }
  ;
  OnClick2.value = new OnClick2();
  return OnClick2;
}();
var attrOnClickEffectUnit = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "click",
        value: cb$prime($$const(voidLeft2(value13)(true)))
      });
    };
  }
};
var attrOnClickCb = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "click",
        value: cb$prime(value13)
      });
    };
  }
};

// output/Deku.DOM.Attr.Style/index.js
var Style = /* @__PURE__ */ function() {
  function Style2() {
  }
  ;
  Style2.value = new Style2();
  return Style2;
}();
var attrSpan_StyleString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "style",
        value: prop$prime(value13)
      });
    };
  }
};
var attrLi_StyleString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "style",
        value: prop$prime(value13)
      });
    };
  }
};
var attrInput_StyleString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "style",
        value: prop$prime(value13)
      });
    };
  }
};
var attrDiv_StyleString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "style",
        value: prop$prime(value13)
      });
    };
  }
};
var attrButton_StyleString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "style",
        value: prop$prime(value13)
      });
    };
  }
};
var attrA_StyleString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "style",
        value: prop$prime(value13)
      });
    };
  }
};

// output/Deku.DOM.Elt.A/index.js
var coerce5 = /* @__PURE__ */ coerce();
var a = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("a")(attributes)(coerce5(fixed(coerce5(mapWithIndex2(unsafeSetPos)(kids))))));
  };
};

// output/Deku.DOM.Elt.Div/index.js
var coerce6 = /* @__PURE__ */ coerce();
var div2 = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("div")(attributes)(coerce6(fixed(coerce6(mapWithIndex2(unsafeSetPos)(kids))))));
  };
};
var div_ = /* @__PURE__ */ div2(/* @__PURE__ */ empty(plusEvent));

// output/Deku.DOM.Elt.Span/index.js
var coerce7 = /* @__PURE__ */ coerce();
var span2 = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("span")(attributes)(coerce7(fixed(coerce7(mapWithIndex2(unsafeSetPos)(kids))))));
  };
};
var span_ = /* @__PURE__ */ span2(/* @__PURE__ */ empty(plusEvent));

// output/Deku.DOM.Attr.Cx/index.js
var Cx = /* @__PURE__ */ function() {
  function Cx2() {
  }
  ;
  Cx2.value = new Cx2();
  return Cx2;
}();
var attrCircle_CxString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "cx",
        value: prop$prime(value13)
      });
    };
  }
};

// output/Deku.DOM.Attr.Cy/index.js
var Cy = /* @__PURE__ */ function() {
  function Cy2() {
  }
  ;
  Cy2.value = new Cy2();
  return Cy2;
}();
var attrCircle_CyString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "cy",
        value: prop$prime(value13)
      });
    };
  }
};

// output/Deku.DOM.Attr.Fill/index.js
var Fill = /* @__PURE__ */ function() {
  function Fill2() {
  }
  ;
  Fill2.value = new Fill2();
  return Fill2;
}();
var attrCircle_FillString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "fill",
        value: prop$prime(value13)
      });
    };
  }
};

// output/Deku.DOM.Attr.Height/index.js
var Height = /* @__PURE__ */ function() {
  function Height2() {
  }
  ;
  Height2.value = new Height2();
  return Height2;
}();
var attrSvg_HeightString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "height",
        value: prop$prime(value13)
      });
    };
  }
};

// output/Deku.DOM.Attr.R/index.js
var R = /* @__PURE__ */ function() {
  function R2() {
  }
  ;
  R2.value = new R2();
  return R2;
}();
var attrCircle_RString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "r",
        value: prop$prime(value13)
      });
    };
  }
};

// output/Deku.DOM.Attr.Stroke/index.js
var Stroke = /* @__PURE__ */ function() {
  function Stroke2() {
  }
  ;
  Stroke2.value = new Stroke2();
  return Stroke2;
}();
var attrCircle_StrokeString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "stroke",
        value: prop$prime(value13)
      });
    };
  }
};

// output/Deku.DOM.Attr.StrokeWidth/index.js
var StrokeWidth = /* @__PURE__ */ function() {
  function StrokeWidth2() {
  }
  ;
  StrokeWidth2.value = new StrokeWidth2();
  return StrokeWidth2;
}();
var attrCircle_StrokeWidthStr = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "stroke-width",
        value: prop$prime(value13)
      });
    };
  }
};

// output/Deku.DOM.Attr.Width/index.js
var Width = /* @__PURE__ */ function() {
  function Width2() {
  }
  ;
  Width2.value = new Width2();
  return Width2;
}();
var attrVideo_WidthString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "width",
        value: prop$prime(value13)
      });
    };
  }
};
var attrSvg_WidthString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "width",
        value: prop$prime(value13)
      });
    };
  }
};

// output/Deku.DOM.Elt.Button/index.js
var coerce8 = /* @__PURE__ */ coerce();
var button = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("button")(attributes)(coerce8(fixed(coerce8(mapWithIndex2(unsafeSetPos)(kids))))));
  };
};
var button_ = /* @__PURE__ */ button(/* @__PURE__ */ empty(plusEvent));

// output/Deku.DOM.Elt.Circle/index.js
var coerce9 = /* @__PURE__ */ coerce();
var circle = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("circle")(attributes)(coerce9(fixed(coerce9(mapWithIndex2(unsafeSetPos)(kids))))));
  };
};

// output/Deku.DOM.Elt.Code/index.js
var coerce10 = /* @__PURE__ */ coerce();
var code = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("code")(attributes)(coerce10(fixed(coerce10(mapWithIndex2(unsafeSetPos)(kids))))));
  };
};
var code_ = /* @__PURE__ */ code(/* @__PURE__ */ empty(plusEvent));

// output/Deku.DOM.Elt.I/index.js
var coerce11 = /* @__PURE__ */ coerce();
var i = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("i")(attributes)(coerce11(fixed(coerce11(mapWithIndex2(unsafeSetPos)(kids))))));
  };
};
var i_ = /* @__PURE__ */ i(/* @__PURE__ */ empty(plusEvent));

// output/Deku.DOM.Elt.Li/index.js
var coerce12 = /* @__PURE__ */ coerce();
var li = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("li")(attributes)(coerce12(fixed(coerce12(mapWithIndex2(unsafeSetPos)(kids))))));
  };
};
var li_ = /* @__PURE__ */ li(/* @__PURE__ */ empty(plusEvent));

// output/Deku.DOM.Elt.Pre/index.js
var coerce13 = /* @__PURE__ */ coerce();
var pre = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("pre")(attributes)(coerce13(fixed(coerce13(mapWithIndex2(unsafeSetPos)(kids))))));
  };
};
var pre_ = /* @__PURE__ */ pre(/* @__PURE__ */ empty(plusEvent));

// output/Deku.DOM.Elt.Svg/index.js
var coerce14 = /* @__PURE__ */ coerce();
var svg = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("svg")(attributes)(coerce14(fixed(coerce14(mapWithIndex2(unsafeSetPos)(kids))))));
  };
};

// output/Deku.DOM.Elt.Ul/index.js
var coerce15 = /* @__PURE__ */ coerce();
var ul = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("ul")(attributes)(coerce15(fixed(coerce15(mapWithIndex2(unsafeSetPos)(kids))))));
  };
};
var ul_ = /* @__PURE__ */ ul(/* @__PURE__ */ empty(plusEvent));

// output/Deku.Example.Docs.Types/index.js
var pure9 = /* @__PURE__ */ pure(applicativeMaybe);
var empty8 = /* @__PURE__ */ empty(plusMaybe);
var Intro = /* @__PURE__ */ function() {
  function Intro2() {
  }
  ;
  Intro2.value = new Intro2();
  return Intro2;
}();
var HelloWorld = /* @__PURE__ */ function() {
  function HelloWorld2() {
  }
  ;
  HelloWorld2.value = new HelloWorld2();
  return HelloWorld2;
}();
var SimpleComponent = /* @__PURE__ */ function() {
  function SimpleComponent2() {
  }
  ;
  SimpleComponent2.value = new SimpleComponent2();
  return SimpleComponent2;
}();
var PURSX1 = /* @__PURE__ */ function() {
  function PURSX12() {
  }
  ;
  PURSX12.value = new PURSX12();
  return PURSX12;
}();
var PURSX2 = /* @__PURE__ */ function() {
  function PURSX22() {
  }
  ;
  PURSX22.value = new PURSX22();
  return PURSX22;
}();
var Events = /* @__PURE__ */ function() {
  function Events3() {
  }
  ;
  Events3.value = new Events3();
  return Events3;
}();
var Effects = /* @__PURE__ */ function() {
  function Effects2() {
  }
  ;
  Effects2.value = new Effects2();
  return Effects2;
}();
var Events2 = /* @__PURE__ */ function() {
  function Events22() {
  }
  ;
  Events22.value = new Events22();
  return Events22;
}();
var Portals = /* @__PURE__ */ function() {
  function Portals2() {
  }
  ;
  Portals2.value = new Portals2();
  return Portals2;
}();
var SSR = /* @__PURE__ */ function() {
  function SSR2() {
  }
  ;
  SSR2.value = new SSR2();
  return SSR2;
}();
var stringToPage = function(v) {
  if (v === "Intro") {
    return pure9(Intro.value);
  }
  ;
  if (v === "HelloWorld") {
    return pure9(HelloWorld.value);
  }
  ;
  if (v === "SimpleComponent") {
    return pure9(SimpleComponent.value);
  }
  ;
  if (v === "PURSX1") {
    return pure9(PURSX1.value);
  }
  ;
  if (v === "PURSX2") {
    return pure9(PURSX2.value);
  }
  ;
  if (v === "Events") {
    return pure9(Events.value);
  }
  ;
  if (v === "Effects") {
    return pure9(Effects.value);
  }
  ;
  if (v === "Events2") {
    return pure9(Events2.value);
  }
  ;
  if (v === "Portals") {
    return pure9(Portals.value);
  }
  ;
  if (v === "SSR") {
    return pure9(SSR.value);
  }
  ;
  return empty8;
};

// output/Deku.Example.Docs.Util/foreign.js
function scrollToTop_() {
  window.scrollTo(0, 0);
}

// output/Deku.Example.Docs.Util/index.js
var scrollToTop = scrollToTop_;

// output/Deku.Pursx/index.js
var empty9 = /* @__PURE__ */ empty(plusEvent);
var alt3 = /* @__PURE__ */ alt(altEvent);
var map11 = /* @__PURE__ */ map(functorEvent);
var lcmap4 = /* @__PURE__ */ lcmap(profunctorFn);
var merge4 = /* @__PURE__ */ merge(foldableArray);
var pure10 = /* @__PURE__ */ pure(applicativeEvent);
var pure15 = /* @__PURE__ */ pure(applicativeST);
var Reflectable$dollarDict = {
  reflectType: function() {
    return "~";
  }
};
var unwrap5 = /* @__PURE__ */ unwrap();
var eq4 = /* @__PURE__ */ eq(eqScope);
var coerce16 = /* @__PURE__ */ coerce();
var pursxToElementNil = {
  pursxToElement: function(v) {
    return function(v1) {
      return function(v2) {
        return {
          cache: empty2,
          element: function(v3) {
            return function(v4) {
              return empty9;
            };
          }
        };
      };
    };
  }
};
var pursxToElement = function(dict) {
  return dict.pursxToElement;
};
var pursxToElementConsAttr = function() {
  return function(dictPursxToElement) {
    var pursxToElement1 = pursxToElement(dictPursxToElement);
    return function(dictReflectable) {
      var reflectType2 = reflectType(dictReflectable);
      return function(dictIsSymbol) {
        var get4 = get(dictIsSymbol)();
        return {
          pursxToElement: function(pxScope) {
            return function(v) {
              return function(r) {
                var v1 = pursxToElement1(pxScope)($$Proxy.value)(r);
                return {
                  cache: insert(reflectType2($$Proxy.value))(true)(v1.cache),
                  element: function(parent2) {
                    return function(v2) {
                      return alt3(map11(lcmap4(unsafeUnAttribute)(function(v3) {
                        if (v3.value instanceof Prop$prime) {
                          return v2.setProp({
                            id: reflectType2($$Proxy.value) + ("@!%" + pxScope),
                            key: v3.key,
                            value: v3.value.value0
                          });
                        }
                        ;
                        if (v3.value instanceof Cb$prime) {
                          return v2.setCb({
                            id: reflectType2($$Proxy.value) + ("@!%" + pxScope),
                            key: v3.key,
                            value: v3.value.value0
                          });
                        }
                        ;
                        if (v3.value instanceof Unset$prime) {
                          return v2.unsetAttribute({
                            id: reflectType2($$Proxy.value) + ("@!%" + pxScope),
                            key: v3.key
                          });
                        }
                        ;
                        throw new Error("Failed pattern match at Deku.Pursx (line 4577, column 40 - line 4591, column 26): " + [v3.value.constructor.name]);
                      }))(get4($$Proxy.value)(r)))(v1.element(parent2)(v2));
                    };
                  }
                };
              };
            };
          }
        };
      };
    };
  };
};
var makePursx$prime = function(dictReflectable) {
  var reflectType2 = reflectType(dictReflectable);
  return function(dictReflectable1) {
    var reflectType1 = reflectType(dictReflectable1);
    return function() {
      return function() {
        return function(dictPursxToElement) {
          var pursxToElement1 = pursxToElement(dictPursxToElement);
          return function(verb) {
            return function(html2) {
              return function(r) {
                var go2 = function(v) {
                  return function(v1) {
                    return makeLemmingEventO(function(v2, k1) {
                      var me = v1.ids();
                      var pxScope = v1.ids();
                      v.raiseId(me)();
                      var v3 = pursxToElement1(pxScope)($$Proxy.value)(r);
                      var unsub = v2(merge4([pure10(v1.makePursx({
                        id: me,
                        parent: v.parent,
                        cache: v3.cache,
                        dynFamily: v.dynFamily,
                        pos: v.pos,
                        pxScope,
                        scope: v.scope,
                        html: reflectType2(html2),
                        verb: reflectType1(verb)
                      })), v3.element(v)(v1), maybe(empty9)(function(p2) {
                        return pure10(v1.attributeParent({
                          id: me,
                          parent: p2,
                          pos: v.pos,
                          dynFamily: v.dynFamily,
                          ez: false
                        }));
                      })(v.parent)]), k1);
                      return function __do3() {
                        k1(v1.deleteFromCache({
                          id: me
                        }));
                        return unsub();
                      };
                    });
                  };
                };
                return new Element$prime(go2);
              };
            };
          };
        };
      };
    };
  };
};
var makePursx = function(dictReflectable) {
  var makePursx$prime1 = makePursx$prime(dictReflectable)(Reflectable$dollarDict)()();
  return function() {
    return function() {
      return function(dictPursxToElement) {
        return makePursx$prime1(dictPursxToElement)($$Proxy.value);
      };
    };
  };
};
var psx = function(dictReflectable) {
  var makePursx1 = makePursx(dictReflectable)()();
  return function() {
    return function(dictPursxToElement) {
      var makePursx22 = makePursx1(dictPursxToElement);
      return function(px11) {
        return makePursx22(px11)({});
      };
    };
  };
};
var __internalDekuFlatten3 = function(a2) {
  return function(b2) {
    return function(c) {
      return flatten({
        doLogic: function(pos) {
          return function(v) {
            return function(id2) {
              return v.sendToPos({
                id: id2,
                pos
              });
            };
          };
        },
        ids: function($526) {
          return function(v) {
            return v.ids;
          }(unwrap5($526));
        },
        disconnectElement: function(v) {
          return function(v1) {
            return v.disconnectElement({
              id: v1.id,
              scope: v1.scope,
              parent: v1.parent,
              scopeEq: eq4
            });
          };
        },
        toElt: function(v) {
          return v;
        }
      })(a2)(b2)(coerce16(c));
    };
  };
};
var pursxToElementConsInsert = function() {
  return function(dictPursxToElement) {
    var pursxToElement1 = pursxToElement(dictPursxToElement);
    return function(dictReflectable) {
      var reflectType2 = reflectType(dictReflectable);
      return function(dictIsSymbol) {
        var get4 = get(dictIsSymbol)();
        return {
          pursxToElement: function(pxScope) {
            return function(v) {
              return function(r) {
                var pxe = get4($$Proxy.value)(r);
                var v1 = pursxToElement1(pxScope)($$Proxy.value)(r);
                return {
                  cache: insert(reflectType2($$Proxy.value))(false)(v1.cache),
                  element: function(info2) {
                    return function(di) {
                      return alt3(__internalDekuFlatten3({
                        parent: new Just(reflectType2($$Proxy.value) + ("@!%" + pxScope)),
                        scope: info2.scope,
                        raiseId: function(v2) {
                          return pure15(unit);
                        },
                        pos: info2.pos,
                        ez: false,
                        dynFamily: Nothing.value
                      })(di)(pxe))(v1.element(info2)(di));
                    };
                  }
                };
              };
            };
          }
        };
      };
    };
  };
};

// output/Examples/foreign.js
var pursx2 = `module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Compactable (compact)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\\))
import Deku.Attribute ((:=))
import Deku.Control (text)
import Deku.DOM as D
import Deku.Hooks (useState')
import Deku.Do as Deku
import Deku.Pursx ((~~))
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Type.Proxy (Proxy(..))

myDom =
  Proxy
    :: Proxy
         """<div>
        <button>I do nothing</button>
        <ul>
          <li>A</li>
          <li ~myli~>B</li>
          <li>C</li>
        </ul>
        <div>
          <a href="https://github.com/mikesol/purescript-deku"></a>
          <i>bar</i>
          ~somethingNew~
          <span style="font-weight:800;">baz</span>
        </div>
        <div><div></div><div><input type="range"/></div></div>
      </div>
"""

main :: Effect Unit
main = runInBody Deku.do
  push /\\ event <- useState'
  myDom ~~
    { myli: pure (D.Style := "background-color:rgb(200,240,210);")
    , somethingNew:
        ( D.button (pure (D.OnClick := push (Just unit)))
            [ text
                $ (compact event $> "Thanks for clicking me!") <|>
                    pure "I was dynamically inserted"
            ]
        )
    }`;
var pursx1 = 'module Main where\n\nimport Prelude\n\nimport Deku.Pursx (psx)\nimport Deku.Toplevel (runInBody)\nimport Effect (Effect)\nimport Type.Proxy (Proxy(..))\n\nmyDom =\n  Proxy\n    :: Proxy\n         """<div>\n    <button>I do nothing</button>\n    <ul>\n        <li>A</li>\n        <li>B</li>\n        <li>C</li>\n    </ul>\n    <div>\n        <a href="https://github.com/mikesol/purescript-deku"></a>\n        <i>bar</i>\n        <span style="font-weight:800;">baz</span>\n    </div>\n    <div><div></div><div><input type="range"/></div></div>\n    </div>\n"""\n\nmain :: Effect Unit\nmain = runInBody (psx myDom)';
var portals1 = 'module Main where\n\nimport Prelude\n\nimport Data.FastVect.FastVect (index, (:))\nimport Data.FastVect.FastVect as V\nimport Data.Foldable (oneOfMap)\nimport Data.Tuple.Nested ((/\\))\nimport Deku.Attribute ((:=))\nimport Deku.Control (portal, switcher, text_)\nimport Deku.Core (Domable)\nimport Deku.DOM as D\nimport Deku.Hooks (useState)\nimport Deku.Do as Deku\nimport Deku.Toplevel (runInBody)\nimport Effect (Effect)\nimport FRP.Event (Event, fold)\nimport Type.Prelude (Proxy(..))\n\nmain :: Effect Unit\nmain = runInBody Deku.do\n  push /\\ event <- useState unit\n  portal\n    ( map\n        ( \\i -> D.video\n            (oneOfMap pure [ D.Controls := "true", D.Width := "250" ])\n            [ D.source\n                (oneOfMap pure [ D.Src := i, D.Xtype := "video/mp4" ])\n                []\n            ]\n        )\n        ( "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"\n            : "https://www.w3schools.com/jsref/movie.mp4"\n            : V.empty\n        )\n    )\n    \\(v /\\ _) -> do\n      let\n        p0 :: Domable _ _\n        p0 = index (Proxy :: _ 0) v\n\n        p1 :: Domable _ _\n        p1 = index (Proxy :: _ 1) v\n\n        ev :: Boolean -> Event Boolean\n        ev b = fold (\\a _ -> not a) b event\n\n        flips :: Boolean -> Domable _ _\n        flips = D.span_ <<< pure <<< switcher (if _ then p0 else p1) <<< ev\n      D.div_\n        [ D.button (pure $ D.OnClick := push unit)\n            [ text_ "Switch videos" ]\n        , D.div_ [ D.span_ [ flips true ], flips false ]\n        ]\n';
var helloWorld = 'module Main where\n\nimport Prelude\n\nimport Deku.Control (text_)\nimport Deku.Toplevel (runInBody)\nimport Effect (Effect)\n\nmain :: Effect Unit\nmain = runInBody (text_ "Hello world")';
var events3 = `module Main where

import Prelude

import Data.Filterable (compact)
import Data.Foldable (oneOf)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\\))
import Deku.Control (text_)
import Deku.Core (Nut, dyn)
import Deku.DOM as D
import Deku.Hooks (useDyn_, useState')
import Deku.Do as Deku
import Deku.Listeners (click, keyUp, textInput)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, mapAccum)
import Web.UIEvent.KeyboardEvent (code)

data MainUIAction
  = AddTodo
  | ChangeText String

main :: Effect Unit
main = runInBody Deku.do
  pushAction /\\ actionEvent <- useState'
  let
    accumulateTextAndEmitOnSubmit :: Event String
    accumulateTextAndEmitOnSubmit = compact
      ( mapAccum
          ( \\a b -> case b of
              AddTodo -> a /\\ Just a
              ChangeText s -> s /\\ Nothing
          )
          ""
          actionEvent
      )

    top :: Nut
    top =
      D.div_
        [ D.input
            ( oneOf
                [ textInput $ pure (pushAction <<< ChangeText)
                , keyUp $ pure \\evt -> do
                    when (code evt == "Enter") $ do
                      pushAction AddTodo
                ]
            )
            []
        , D.button
            (click $ pure $ pushAction AddTodo)
            [ text_ "Add" ]
        ]
  D.div_
    [ top
    , dyn
        $ map
            ( \\txt -> Deku.do
                { remove, sendTo } <- useDyn_
                D.div_
                  [ text_ txt
                  , D.button
                      (click $ pure (sendTo 0))
                      [ text_ "Prioritize" ]
                  , D.button
                      (click $ pure remove)
                      [ text_ "Delete" ]
                  ]
            )
            accumulateTextAndEmitOnSubmit
    ]

`;
var events = 'module Main where\n\nimport Prelude\n\nimport Data.Tuple.Nested ((/\\))\nimport Deku.Control (text, text_)\nimport Deku.DOM as D\nimport Deku.Hooks (useState)\nimport Deku.Do as Deku\nimport Deku.Listeners (click_, slider)\nimport Deku.Toplevel (runInBody)\nimport Effect (Effect)\nimport FRP.Event (Event, fold)\n\nmain :: Effect Unit\nmain = runInBody Deku.do\n  setButtonClicked /\\ buttonClicked <- useState unit\n  setSliderMoved /\\ sliderMoved <- useState 50.0\n  let\n    countUp :: Event Int\n    countUp = fold (\\a _ -> 1 + a) (-1) buttonClicked\n  D.div_\n    [ D.button\n        (click_ (setButtonClicked unit))\n        [ text_ "Click" ]\n    , D.div_\n        [ text\n            (("Val: " <> _) <<< show <$> countUp)\n        ]\n    , D.div_\n        [ D.input\n            (slider (pure setSliderMoved))\n            []\n        , D.div_\n            [ text\n                (("Val: " <> _) <<< show <$> sliderMoved)\n            ]\n        ]\n    ]\n';
var effects = 'module Main where\n\nimport Prelude\n\nimport Affjax.ResponseFormat as ResponseFormat\nimport Affjax.Web as AX\nimport Control.Alt ((<|>))\nimport Data.Argonaut.Core (stringifyWithIndent)\nimport Data.Either (Either(..))\nimport Data.Filterable (compact, separate)\nimport Data.HTTP.Method (Method(..))\nimport Data.Maybe (Maybe(..))\nimport Data.Tuple.Nested ((/\\))\nimport Deku.Attribute (Cb, cb, (:=))\nimport Deku.Control (text)\nimport Deku.DOM as D\nimport Deku.Hooks (useState)\nimport Deku.Do as Deku\nimport Deku.Listeners (click_)\nimport Deku.Toplevel (runInBody)\nimport Effect (Effect)\nimport Effect.Aff (launchAff_)\nimport Effect.Class (liftEffect)\nimport FRP.Event (Event, mapAccum)\n\ndata UIAction = Initial | Loading | Result String\n\nclickCb :: (UIAction -> Effect Unit) -> Cb\nclickCb push = cb\n  ( const do\n      push Loading\n      launchAff_ $ do\n        result <- AX.request\n          ( AX.defaultRequest\n              { url = "https://randomuser.me/api/"\n              , method = Left GET\n              , responseFormat = ResponseFormat.json\n              }\n          )\n        case result of\n          Left err -> liftEffect $ push\n            $ Result\n                ( "GET /api response failed to decode: " <>\n                    AX.printError err\n                )\n          Right response -> liftEffect $ push $ Result $\n            stringifyWithIndent 2 response.body\n  )\n\nclickText = "Click to get some random user data." :: String\n\nmain :: Effect Unit\nmain = runInBody Deku.do\n  setUIAction /\\ uiAction <- useState Initial\n  let\n    split :: { left :: Event Unit, right :: Event String }\n    split = separate $ compact $\n      map\n        ( case _ of\n            Loading -> Just $ Left unit\n            Result s -> Just $ Right s\n            _ -> Nothing\n        )\n        uiAction\n    { left: loading, right: result } = split\n  D.div_\n    [ D.div_\n        [ D.button (click_ (clickCb setUIAction))\n            [ text\n                ( pure clickText\n                    <|> (loading $> "Loading...")\n                    <|> (result $> clickText)\n                )\n            ]\n        ]\n    , D.div\n        ( (pure (D.Style := "display: none;")) <|>\n            ( compact\n                ( mapAccum\n                    ( \\b _ -> (b && false) /\\\n                        if b then Just unit else Nothing\n                    )\n                    true\n                    result\n                ) $> (D.Style := "display: block;")\n            )\n        )\n        [ D.pre_ [ D.code_ [ text (pure "" <|> result) ] ] ]\n    ]\n';
var component = 'module Main where\n\nimport Prelude\n\nimport Data.Foldable (oneOf)\nimport Deku.Attribute ((!:=), (:=))\nimport Deku.Control (text_)\nimport Deku.DOM as D\nimport Deku.Toplevel (runInBody)\nimport Effect (Effect)\n\nmain :: Effect Unit\nmain = runInBody\n  ( D.div_\n      [ D.button_ [ text_ "I do nothing" ]\n      , D.ul_ $ map (D.li_ <<< pure <<< text_) [ "A", "B", "C" ]\n      , D.div_\n          [ D.a (pure $ D.Href := "https://example.com")\n              [ text_ "foo " ]\n          , D.i_ [ text_ " bar " ]\n          , D.span (pure $ D.Style := "font-weight: 800;")\n              [ text_ " baz" ]\n          ]\n      , D.svg (oneOf [ D.Height !:= "100", D.Width !:= "100" ])\n          [ D.circle\n              ( oneOf\n                  [ D.Cx !:= "50"\n                  , D.Cy !:= "50"\n                  , D.R !:= "40"\n                  , D.Stroke !:= "black"\n                  , D.StrokeWidth !:= "3"\n                  , D.Fill !:= "red"\n                  ]\n              )\n              []\n          ]\n\n      ]\n  )';
var app = `module Main where

import Prelude

import Control.Alt ((<|>))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Listeners (click_, slider)
import Deku.Core (Nut, vbussed)
import FRP.Event (fold)
import FRP.Event.VBus (V)
import Type.Proxy (Proxy(..))

type UIEvents = V
  ( buttonClicked :: Unit
  , sliderMoved :: Number
  )

app :: Nut
app = vbussed (Proxy :: _ UIEvents) \\push event -> do
  D.div_
    [ D.p_
        [ text_
            """Here's an example of SSR in deku.
All of the static bits are rendered as HTML,
and all of the dynamic bits are hydrated on page load."""
        ]
    , D.button
        (click_ (push.buttonClicked unit))
        [ text_ "Click" ]
    , D.div_
        [ text
            ( pure "Val: 0" <|>
                ( append "Val: " <<< show
                    <$> fold
                      (\\a _ -> a + 1)
                      (-1)
                      (pure unit <|> event.buttonClicked)
                )
            )
        ]
    , D.div_
        [ D.input
            (slider (pure push.sliderMoved))
            []
        , D.div_
            [ text
                ( pure "Val: 50" <|>
                    ( map
                        (append "Val: " <<< show)
                        event.sliderMoved
                    )
                )
            ]
        ]
    ]
`;
var build2 = 'module Deku.Example.Docs.Examples.SSR.Build where\n\nimport Prelude\n\nimport Control.Monad.ST.Global (toEffect)\nimport Deku.Examples.Docs.Examples.SSR.App (app)\nimport Deku.Toplevel (runSSR)\nimport Effect (Effect)\nimport Effect.Console (log)\n\nmain :: Effect Unit\nmain =\n  toEffect\n    ( pure\n        """<!DOCTYPE html>\n<html>\n  <head>\n    <title>My static page</title>\n		<script src="bundle.js" defer><\/script>\n  </head>""" <> runSSR app <> pure "</html>"\n    ) >>= log';
var live = "module Deku.Example.Docs.Examples.SSR.Live where\n\nimport Prelude\n\nimport Deku.Examples.Docs.Examples.SSR.App (app)\nimport Deku.Toplevel (hydrate)\nimport Effect (Effect)\n\nmain :: Effect Unit\nmain = hydrate app";

// output/Web.Event.Event/foreign.js
function _target(e) {
  return e.target;
}
function preventDefault(e) {
  return function() {
    return e.preventDefault();
  };
}

// output/Data.Nullable/foreign.js
var nullImpl = null;
function nullable(a2, r, f) {
  return a2 == null ? r : f(a2);
}
function notNull(x) {
  return x;
}

// output/Data.Nullable/index.js
var toNullable = /* @__PURE__ */ maybe(nullImpl)(notNull);
var toMaybe = function(n) {
  return nullable(n, Nothing.value, Just.create);
};

// output/Web.Event.Event/index.js
var target = function($3) {
  return toMaybe(_target($3));
};

// output/Deku.Example.Docs.Component/index.js
var pursxToElementConsInsert2 = /* @__PURE__ */ pursxToElementConsInsert();
var makePursx2 = /* @__PURE__ */ makePursx({
  reflectType: function() {
    return `<div>
  <h1>A Simple Component</h1>

  <h3>Slightly more bells and whistles</h3>
  <p>
    Let's look at an example with several different DOM tags.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h1>Creating an element</h1>
  <p>To create an element, like for example a <code>span</code> element, the pattern goes like this:</p>

  <pre><code>mySpanWithAttrs = D.span attrs children
mySpanWithNoAttrs = D.span_ children
myDivWithNoChildren = D.div attrs blank
</code></pre>

  <p><code>attrs</code> contains attributes of type <code>Event (Attribute element)</code>, where <code>element</code> is the current element you're assigning attributes to. You never have to specify this type: it is inferred automatically by the attribute creation operator, aka <code>:=</code>. If you use an attribute that's unsupported by an element, the compiler will complain.</p>

  <p>For now, children is an array of children, not unlike Halogen or React sans JSX. We'll see some other types of children later in this guide.</p>

  <h1>Attributes</h1>
  <p>Attributes like an element's style or id are specified as the first argument to an element. Attributes are just <a href="https://github.com/mikesol/purescript-event/blob/master/src/FRP/Event.purs"><code>Event</code>-s</a>, so you can <code>pure</code> them to make them happen <i>now</i>, combine two event streams with <code>alt</code> to compose events, etc.</p>

  <p>As an example, we made the input a range slider using <code>pure (Xtype := "range")</code>. Unlike Halogen, there are no checks to make sure you give a valid string. So if you want your range slider to have the value of true, you can. One day, I may build some validators, but passing strings works decently well here.</p>

  <h2>Next steps</h2>
  <p>In this section, we built a simple component. In the next section, we'll recreate the exact same element using a different input syntax called <a ~next~ style="cursor:pointer;">Pursx</a>.</p>
</div>`;
  }
})()()(/* @__PURE__ */ pursxToElementConsInsert2(/* @__PURE__ */ pursxToElementConsAttr()(/* @__PURE__ */ pursxToElementConsInsert2(pursxToElementNil)({
  reflectType: function() {
    return "result";
  }
})({
  reflectSymbol: function() {
    return "result";
  }
}))({
  reflectType: function() {
    return "next";
  }
})({
  reflectSymbol: function() {
    return "next";
  }
}))({
  reflectType: function() {
    return "code";
  }
})({
  reflectSymbol: function() {
    return "code";
  }
}));
var map15 = /* @__PURE__ */ map(functorArray);
var pure11 = /* @__PURE__ */ pure(applicativeArray);
var pure16 = /* @__PURE__ */ pure(applicativeEvent);
var attr2 = /* @__PURE__ */ attr(attrA_HrefString);
var attr1 = /* @__PURE__ */ attr(attrSpan_StyleString);
var oneOf3 = /* @__PURE__ */ oneOf(foldableArray)(plusEvent);
var pureAttr2 = /* @__PURE__ */ pureAttr(attrSvg_HeightString);
var pureAttr1 = /* @__PURE__ */ pureAttr(attrSvg_WidthString);
var pureAttr22 = /* @__PURE__ */ pureAttr(attrCircle_CxString);
var pureAttr3 = /* @__PURE__ */ pureAttr(attrCircle_CyString);
var pureAttr4 = /* @__PURE__ */ pureAttr(attrCircle_RString);
var pureAttr5 = /* @__PURE__ */ pureAttr(attrCircle_StrokeString);
var pureAttr6 = /* @__PURE__ */ pureAttr(attrCircle_StrokeWidthStr);
var pureAttr7 = /* @__PURE__ */ pureAttr(attrCircle_FillString);
var oneOfMap3 = /* @__PURE__ */ oneOfMap(foldableArray)(plusEvent);
var attr22 = /* @__PURE__ */ attr(attrOnClickCb);
var applySecond3 = /* @__PURE__ */ applySecond(applyEffect);
var px = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var components = function(options2) {
  return makePursx2(px)({
    code: pre_([code_([text_(component)])]),
    result: div_([button_([text_("I do nothing")]), ul_(map15(function($43) {
      return li_(pure11(text_($43)));
    })(["A", "B", "C"])), div_([a(pure16(attr2(Href.value)("https://example.com")))([text_("foo ")]), i_([text_(" bar ")]), span2(pure16(attr1(Style.value)("font-weight: 800;")))([text_(" baz")])]), svg(oneOf3([pureAttr2(Height.value)("100"), pureAttr1(Width.value)("100")]))([circle(oneOf3([pureAttr22(Cx.value)("50"), pureAttr3(Cy.value)("50"), pureAttr4(R.value)("40"), pureAttr5(Stroke.value)("black"), pureAttr6(StrokeWidth.value)("3"), pureAttr7(Fill.value)("red")]))([])])]),
    next: oneOfMap3(pure16)([attr22(OnClick.value)(cb(function(e) {
      return applySecond3(applySecond3(preventDefault(e))(options2.dpage(PURSX1.value)))(scrollToTop);
    })), attr2(Href.value)(options2.slug + "pursx1/")])
  });
};

// output/Affjax/foreign.js
function _ajax(platformSpecificDriver, timeoutErrorMessageIdent, requestFailedMessageIdent, mkHeader, options2) {
  return function(errback, callback) {
    var xhr = platformSpecificDriver.newXHR();
    var fixedUrl = platformSpecificDriver.fixupUrl(options2.url, xhr);
    xhr.open(options2.method || "GET", fixedUrl, true, options2.username, options2.password);
    if (options2.headers) {
      try {
        for (var i2 = 0, header2; (header2 = options2.headers[i2]) != null; i2++) {
          xhr.setRequestHeader(header2.field, header2.value);
        }
      } catch (e) {
        errback(e);
      }
    }
    var onerror = function(msgIdent) {
      return function() {
        errback(new Error(msgIdent));
      };
    };
    xhr.onerror = onerror(requestFailedMessageIdent);
    xhr.ontimeout = onerror(timeoutErrorMessageIdent);
    xhr.onload = function() {
      callback({
        status: xhr.status,
        statusText: xhr.statusText,
        headers: xhr.getAllResponseHeaders().split("\r\n").filter(function(header3) {
          return header3.length > 0;
        }).map(function(header3) {
          var i3 = header3.indexOf(":");
          return mkHeader(header3.substring(0, i3))(header3.substring(i3 + 2));
        }),
        body: xhr.response
      });
    };
    xhr.responseType = options2.responseType;
    xhr.withCredentials = options2.withCredentials;
    xhr.timeout = options2.timeout;
    xhr.send(options2.content);
    return function(error3, cancelErrback, cancelCallback) {
      try {
        xhr.abort();
      } catch (e) {
        return cancelErrback(e);
      }
      return cancelCallback();
    };
  };
}

// output/Data.MediaType.Common/index.js
var applicationJSON = "application/json";
var applicationFormURLEncoded = "application/x-www-form-urlencoded";

// output/Affjax.RequestBody/index.js
var ArrayView = /* @__PURE__ */ function() {
  function ArrayView2(value0) {
    this.value0 = value0;
  }
  ;
  ArrayView2.create = function(value0) {
    return new ArrayView2(value0);
  };
  return ArrayView2;
}();
var Blob = /* @__PURE__ */ function() {
  function Blob3(value0) {
    this.value0 = value0;
  }
  ;
  Blob3.create = function(value0) {
    return new Blob3(value0);
  };
  return Blob3;
}();
var Document = /* @__PURE__ */ function() {
  function Document3(value0) {
    this.value0 = value0;
  }
  ;
  Document3.create = function(value0) {
    return new Document3(value0);
  };
  return Document3;
}();
var $$String = /* @__PURE__ */ function() {
  function $$String3(value0) {
    this.value0 = value0;
  }
  ;
  $$String3.create = function(value0) {
    return new $$String3(value0);
  };
  return $$String3;
}();
var FormData = /* @__PURE__ */ function() {
  function FormData2(value0) {
    this.value0 = value0;
  }
  ;
  FormData2.create = function(value0) {
    return new FormData2(value0);
  };
  return FormData2;
}();
var FormURLEncoded = /* @__PURE__ */ function() {
  function FormURLEncoded2(value0) {
    this.value0 = value0;
  }
  ;
  FormURLEncoded2.create = function(value0) {
    return new FormURLEncoded2(value0);
  };
  return FormURLEncoded2;
}();
var Json = /* @__PURE__ */ function() {
  function Json3(value0) {
    this.value0 = value0;
  }
  ;
  Json3.create = function(value0) {
    return new Json3(value0);
  };
  return Json3;
}();
var toMediaType = function(v) {
  if (v instanceof FormURLEncoded) {
    return new Just(applicationFormURLEncoded);
  }
  ;
  if (v instanceof Json) {
    return new Just(applicationJSON);
  }
  ;
  return Nothing.value;
};

// output/Affjax.RequestHeader/index.js
var unwrap6 = /* @__PURE__ */ unwrap();
var Accept = /* @__PURE__ */ function() {
  function Accept3(value0) {
    this.value0 = value0;
  }
  ;
  Accept3.create = function(value0) {
    return new Accept3(value0);
  };
  return Accept3;
}();
var ContentType = /* @__PURE__ */ function() {
  function ContentType2(value0) {
    this.value0 = value0;
  }
  ;
  ContentType2.create = function(value0) {
    return new ContentType2(value0);
  };
  return ContentType2;
}();
var RequestHeader = /* @__PURE__ */ function() {
  function RequestHeader2(value0, value1) {
    this.value0 = value0;
    this.value1 = value1;
  }
  ;
  RequestHeader2.create = function(value0) {
    return function(value1) {
      return new RequestHeader2(value0, value1);
    };
  };
  return RequestHeader2;
}();
var value = function(v) {
  if (v instanceof Accept) {
    return unwrap6(v.value0);
  }
  ;
  if (v instanceof ContentType) {
    return unwrap6(v.value0);
  }
  ;
  if (v instanceof RequestHeader) {
    return v.value1;
  }
  ;
  throw new Error("Failed pattern match at Affjax.RequestHeader (line 26, column 1 - line 26, column 33): " + [v.constructor.name]);
};
var name = function(v) {
  if (v instanceof Accept) {
    return "Accept";
  }
  ;
  if (v instanceof ContentType) {
    return "Content-Type";
  }
  ;
  if (v instanceof RequestHeader) {
    return v.value0;
  }
  ;
  throw new Error("Failed pattern match at Affjax.RequestHeader (line 21, column 1 - line 21, column 32): " + [v.constructor.name]);
};

// output/Affjax.ResponseFormat/index.js
var identity10 = /* @__PURE__ */ identity(categoryFn);
var $$ArrayBuffer = /* @__PURE__ */ function() {
  function $$ArrayBuffer2(value0) {
    this.value0 = value0;
  }
  ;
  $$ArrayBuffer2.create = function(value0) {
    return new $$ArrayBuffer2(value0);
  };
  return $$ArrayBuffer2;
}();
var Blob2 = /* @__PURE__ */ function() {
  function Blob3(value0) {
    this.value0 = value0;
  }
  ;
  Blob3.create = function(value0) {
    return new Blob3(value0);
  };
  return Blob3;
}();
var Document2 = /* @__PURE__ */ function() {
  function Document3(value0) {
    this.value0 = value0;
  }
  ;
  Document3.create = function(value0) {
    return new Document3(value0);
  };
  return Document3;
}();
var Json2 = /* @__PURE__ */ function() {
  function Json3(value0) {
    this.value0 = value0;
  }
  ;
  Json3.create = function(value0) {
    return new Json3(value0);
  };
  return Json3;
}();
var $$String2 = /* @__PURE__ */ function() {
  function $$String3(value0) {
    this.value0 = value0;
  }
  ;
  $$String3.create = function(value0) {
    return new $$String3(value0);
  };
  return $$String3;
}();
var Ignore = /* @__PURE__ */ function() {
  function Ignore2(value0) {
    this.value0 = value0;
  }
  ;
  Ignore2.create = function(value0) {
    return new Ignore2(value0);
  };
  return Ignore2;
}();
var toResponseType = function(v) {
  if (v instanceof $$ArrayBuffer) {
    return "arraybuffer";
  }
  ;
  if (v instanceof Blob2) {
    return "blob";
  }
  ;
  if (v instanceof Document2) {
    return "document";
  }
  ;
  if (v instanceof Json2) {
    return "text";
  }
  ;
  if (v instanceof $$String2) {
    return "text";
  }
  ;
  if (v instanceof Ignore) {
    return "";
  }
  ;
  throw new Error("Failed pattern match at Affjax.ResponseFormat (line 44, column 3 - line 50, column 19): " + [v.constructor.name]);
};
var toMediaType2 = function(v) {
  if (v instanceof Json2) {
    return new Just(applicationJSON);
  }
  ;
  return Nothing.value;
};
var json = /* @__PURE__ */ function() {
  return new Json2(identity10);
}();
var ignore = /* @__PURE__ */ function() {
  return new Ignore(identity10);
}();

// output/Affjax.ResponseHeader/index.js
var ResponseHeader = /* @__PURE__ */ function() {
  function ResponseHeader2(value0, value1) {
    this.value0 = value0;
    this.value1 = value1;
  }
  ;
  ResponseHeader2.create = function(value0) {
    return function(value1) {
      return new ResponseHeader2(value0, value1);
    };
  };
  return ResponseHeader2;
}();

// output/Effect.Exception/foreign.js
function error(msg) {
  return new Error(msg);
}
function message(e) {
  return e.message;
}
function throwException(e) {
  return function() {
    throw e;
  };
}

// output/Control.Monad.Error.Class/index.js
var throwError = function(dict) {
  return dict.throwError;
};
var catchError = function(dict) {
  return dict.catchError;
};
var $$try = function(dictMonadError) {
  var catchError1 = catchError(dictMonadError);
  var Monad0 = dictMonadError.MonadThrow0().Monad0();
  var map31 = map(Monad0.Bind1().Apply0().Functor0());
  var pure35 = pure(Monad0.Applicative0());
  return function(a2) {
    return catchError1(map31(Right.create)(a2))(function($52) {
      return pure35(Left.create($52));
    });
  };
};

// output/Effect.Class/index.js
var liftEffect = function(dict) {
  return dict.liftEffect;
};

// output/Control.Monad.Except.Trans/index.js
var map16 = /* @__PURE__ */ map(functorEither);
var ExceptT = function(x) {
  return x;
};
var runExceptT = function(v) {
  return v;
};
var mapExceptT = function(f) {
  return function(v) {
    return f(v);
  };
};
var functorExceptT = function(dictFunctor) {
  var map112 = map(dictFunctor);
  return {
    map: function(f) {
      return mapExceptT(map112(map16(f)));
    }
  };
};
var monadExceptT = function(dictMonad) {
  return {
    Applicative0: function() {
      return applicativeExceptT(dictMonad);
    },
    Bind1: function() {
      return bindExceptT(dictMonad);
    }
  };
};
var bindExceptT = function(dictMonad) {
  var bind11 = bind(dictMonad.Bind1());
  var pure35 = pure(dictMonad.Applicative0());
  return {
    bind: function(v) {
      return function(k) {
        return bind11(v)(either(function($187) {
          return pure35(Left.create($187));
        })(function(a2) {
          var v1 = k(a2);
          return v1;
        }));
      };
    },
    Apply0: function() {
      return applyExceptT(dictMonad);
    }
  };
};
var applyExceptT = function(dictMonad) {
  var functorExceptT1 = functorExceptT(dictMonad.Bind1().Apply0().Functor0());
  return {
    apply: ap(monadExceptT(dictMonad)),
    Functor0: function() {
      return functorExceptT1;
    }
  };
};
var applicativeExceptT = function(dictMonad) {
  return {
    pure: function() {
      var $188 = pure(dictMonad.Applicative0());
      return function($189) {
        return ExceptT($188(Right.create($189)));
      };
    }(),
    Apply0: function() {
      return applyExceptT(dictMonad);
    }
  };
};
var monadThrowExceptT = function(dictMonad) {
  var monadExceptT1 = monadExceptT(dictMonad);
  return {
    throwError: function() {
      var $198 = pure(dictMonad.Applicative0());
      return function($199) {
        return ExceptT($198(Left.create($199)));
      };
    }(),
    Monad0: function() {
      return monadExceptT1;
    }
  };
};
var altExceptT = function(dictSemigroup) {
  var append11 = append(dictSemigroup);
  return function(dictMonad) {
    var Bind1 = dictMonad.Bind1();
    var bind11 = bind(Bind1);
    var pure35 = pure(dictMonad.Applicative0());
    var functorExceptT1 = functorExceptT(Bind1.Apply0().Functor0());
    return {
      alt: function(v) {
        return function(v1) {
          return bind11(v)(function(rm) {
            if (rm instanceof Right) {
              return pure35(new Right(rm.value0));
            }
            ;
            if (rm instanceof Left) {
              return bind11(v1)(function(rn) {
                if (rn instanceof Right) {
                  return pure35(new Right(rn.value0));
                }
                ;
                if (rn instanceof Left) {
                  return pure35(new Left(append11(rm.value0)(rn.value0)));
                }
                ;
                throw new Error("Failed pattern match at Control.Monad.Except.Trans (line 86, column 9 - line 88, column 49): " + [rn.constructor.name]);
              });
            }
            ;
            throw new Error("Failed pattern match at Control.Monad.Except.Trans (line 82, column 5 - line 88, column 49): " + [rm.constructor.name]);
          });
        };
      },
      Functor0: function() {
        return functorExceptT1;
      }
    };
  };
};

// output/Control.Monad.Except/index.js
var unwrap7 = /* @__PURE__ */ unwrap();
var runExcept = function($3) {
  return unwrap7(runExceptT($3));
};

// output/JSURI/foreign.js
function encodeURIComponent_to_RFC3986(input2) {
  return input2.replace(/[!'()*]/g, function(c) {
    return "%" + c.charCodeAt(0).toString(16);
  });
}
function _encodeFormURLComponent(fail3, succeed, input2) {
  try {
    return succeed(encodeURIComponent_to_RFC3986(encodeURIComponent(input2)).replace(/%20/g, "+"));
  } catch (err) {
    return fail3(err);
  }
}

// output/JSURI/index.js
var encodeFormURLComponent = /* @__PURE__ */ function() {
  return runFn3(_encodeFormURLComponent)($$const(Nothing.value))(Just.create);
}();

// output/Data.FormURLEncoded/index.js
var apply5 = /* @__PURE__ */ apply(applyMaybe);
var map17 = /* @__PURE__ */ map(functorMaybe);
var traverse2 = /* @__PURE__ */ traverse(traversableArray)(applicativeMaybe);
var toArray5 = function(v) {
  return v;
};
var encode2 = /* @__PURE__ */ function() {
  var encodePart = function(v) {
    if (v.value1 instanceof Nothing) {
      return encodeFormURLComponent(v.value0);
    }
    ;
    if (v.value1 instanceof Just) {
      return apply5(map17(function(key2) {
        return function(val) {
          return key2 + ("=" + val);
        };
      })(encodeFormURLComponent(v.value0)))(encodeFormURLComponent(v.value1.value0));
    }
    ;
    throw new Error("Failed pattern match at Data.FormURLEncoded (line 37, column 16 - line 39, column 114): " + [v.constructor.name]);
  };
  var $37 = map17(joinWith("&"));
  var $38 = traverse2(encodePart);
  return function($39) {
    return $37($38(toArray5($39)));
  };
}();

// output/Data.HTTP.Method/index.js
var OPTIONS = /* @__PURE__ */ function() {
  function OPTIONS2() {
  }
  ;
  OPTIONS2.value = new OPTIONS2();
  return OPTIONS2;
}();
var GET = /* @__PURE__ */ function() {
  function GET2() {
  }
  ;
  GET2.value = new GET2();
  return GET2;
}();
var HEAD = /* @__PURE__ */ function() {
  function HEAD2() {
  }
  ;
  HEAD2.value = new HEAD2();
  return HEAD2;
}();
var POST = /* @__PURE__ */ function() {
  function POST2() {
  }
  ;
  POST2.value = new POST2();
  return POST2;
}();
var PUT = /* @__PURE__ */ function() {
  function PUT2() {
  }
  ;
  PUT2.value = new PUT2();
  return PUT2;
}();
var DELETE = /* @__PURE__ */ function() {
  function DELETE2() {
  }
  ;
  DELETE2.value = new DELETE2();
  return DELETE2;
}();
var TRACE = /* @__PURE__ */ function() {
  function TRACE2() {
  }
  ;
  TRACE2.value = new TRACE2();
  return TRACE2;
}();
var CONNECT = /* @__PURE__ */ function() {
  function CONNECT2() {
  }
  ;
  CONNECT2.value = new CONNECT2();
  return CONNECT2;
}();
var PROPFIND = /* @__PURE__ */ function() {
  function PROPFIND2() {
  }
  ;
  PROPFIND2.value = new PROPFIND2();
  return PROPFIND2;
}();
var PROPPATCH = /* @__PURE__ */ function() {
  function PROPPATCH2() {
  }
  ;
  PROPPATCH2.value = new PROPPATCH2();
  return PROPPATCH2;
}();
var MKCOL = /* @__PURE__ */ function() {
  function MKCOL2() {
  }
  ;
  MKCOL2.value = new MKCOL2();
  return MKCOL2;
}();
var COPY = /* @__PURE__ */ function() {
  function COPY2() {
  }
  ;
  COPY2.value = new COPY2();
  return COPY2;
}();
var MOVE = /* @__PURE__ */ function() {
  function MOVE2() {
  }
  ;
  MOVE2.value = new MOVE2();
  return MOVE2;
}();
var LOCK = /* @__PURE__ */ function() {
  function LOCK2() {
  }
  ;
  LOCK2.value = new LOCK2();
  return LOCK2;
}();
var UNLOCK = /* @__PURE__ */ function() {
  function UNLOCK2() {
  }
  ;
  UNLOCK2.value = new UNLOCK2();
  return UNLOCK2;
}();
var PATCH = /* @__PURE__ */ function() {
  function PATCH2() {
  }
  ;
  PATCH2.value = new PATCH2();
  return PATCH2;
}();
var unCustomMethod = function(v) {
  return v;
};
var showMethod = {
  show: function(v) {
    if (v instanceof OPTIONS) {
      return "OPTIONS";
    }
    ;
    if (v instanceof GET) {
      return "GET";
    }
    ;
    if (v instanceof HEAD) {
      return "HEAD";
    }
    ;
    if (v instanceof POST) {
      return "POST";
    }
    ;
    if (v instanceof PUT) {
      return "PUT";
    }
    ;
    if (v instanceof DELETE) {
      return "DELETE";
    }
    ;
    if (v instanceof TRACE) {
      return "TRACE";
    }
    ;
    if (v instanceof CONNECT) {
      return "CONNECT";
    }
    ;
    if (v instanceof PROPFIND) {
      return "PROPFIND";
    }
    ;
    if (v instanceof PROPPATCH) {
      return "PROPPATCH";
    }
    ;
    if (v instanceof MKCOL) {
      return "MKCOL";
    }
    ;
    if (v instanceof COPY) {
      return "COPY";
    }
    ;
    if (v instanceof MOVE) {
      return "MOVE";
    }
    ;
    if (v instanceof LOCK) {
      return "LOCK";
    }
    ;
    if (v instanceof UNLOCK) {
      return "UNLOCK";
    }
    ;
    if (v instanceof PATCH) {
      return "PATCH";
    }
    ;
    throw new Error("Failed pattern match at Data.HTTP.Method (line 43, column 1 - line 59, column 23): " + [v.constructor.name]);
  }
};
var print = /* @__PURE__ */ either(/* @__PURE__ */ show(showMethod))(unCustomMethod);

// output/Data.List.NonEmpty/index.js
var singleton10 = /* @__PURE__ */ function() {
  var $200 = singleton4(plusList);
  return function($201) {
    return NonEmptyList($200($201));
  };
}();
var head3 = function(v) {
  return v.value0;
};

// output/Effect.Aff/foreign.js
var Aff = function() {
  var EMPTY = {};
  var PURE = "Pure";
  var THROW = "Throw";
  var CATCH = "Catch";
  var SYNC = "Sync";
  var ASYNC = "Async";
  var BIND = "Bind";
  var BRACKET = "Bracket";
  var FORK = "Fork";
  var SEQ = "Sequential";
  var MAP = "Map";
  var APPLY = "Apply";
  var ALT = "Alt";
  var CONS = "Cons";
  var RESUME = "Resume";
  var RELEASE = "Release";
  var FINALIZER = "Finalizer";
  var FINALIZED = "Finalized";
  var FORKED = "Forked";
  var FIBER = "Fiber";
  var THUNK = "Thunk";
  function Aff2(tag, _12, _2, _3) {
    this.tag = tag;
    this._1 = _12;
    this._2 = _2;
    this._3 = _3;
  }
  function AffCtr(tag) {
    var fn = function(_12, _2, _3) {
      return new Aff2(tag, _12, _2, _3);
    };
    fn.tag = tag;
    return fn;
  }
  function nonCanceler2(error3) {
    return new Aff2(PURE, void 0);
  }
  function runEff(eff) {
    try {
      eff();
    } catch (error3) {
      setTimeout(function() {
        throw error3;
      }, 0);
    }
  }
  function runSync(left2, right2, eff) {
    try {
      return right2(eff());
    } catch (error3) {
      return left2(error3);
    }
  }
  function runAsync(left2, eff, k) {
    try {
      return eff(k)();
    } catch (error3) {
      k(left2(error3))();
      return nonCanceler2;
    }
  }
  var Scheduler = function() {
    var limit = 1024;
    var size8 = 0;
    var ix = 0;
    var queue = new Array(limit);
    var draining = false;
    function drain() {
      var thunk;
      draining = true;
      while (size8 !== 0) {
        size8--;
        thunk = queue[ix];
        queue[ix] = void 0;
        ix = (ix + 1) % limit;
        thunk();
      }
      draining = false;
    }
    return {
      isDraining: function() {
        return draining;
      },
      enqueue: function(cb2) {
        var i2, tmp;
        if (size8 === limit) {
          tmp = draining;
          drain();
          draining = tmp;
        }
        queue[(ix + size8) % limit] = cb2;
        size8++;
        if (!draining) {
          drain();
        }
      }
    };
  }();
  function Supervisor(util) {
    var fibers = {};
    var fiberId = 0;
    var count2 = 0;
    return {
      register: function(fiber) {
        var fid = fiberId++;
        fiber.onComplete({
          rethrow: true,
          handler: function(result) {
            return function() {
              count2--;
              delete fibers[fid];
            };
          }
        })();
        fibers[fid] = fiber;
        count2++;
      },
      isEmpty: function() {
        return count2 === 0;
      },
      killAll: function(killError, cb2) {
        return function() {
          if (count2 === 0) {
            return cb2();
          }
          var killCount = 0;
          var kills = {};
          function kill(fid) {
            kills[fid] = fibers[fid].kill(killError, function(result) {
              return function() {
                delete kills[fid];
                killCount--;
                if (util.isLeft(result) && util.fromLeft(result)) {
                  setTimeout(function() {
                    throw util.fromLeft(result);
                  }, 0);
                }
                if (killCount === 0) {
                  cb2();
                }
              };
            })();
          }
          for (var k in fibers) {
            if (fibers.hasOwnProperty(k)) {
              killCount++;
              kill(k);
            }
          }
          fibers = {};
          fiberId = 0;
          count2 = 0;
          return function(error3) {
            return new Aff2(SYNC, function() {
              for (var k2 in kills) {
                if (kills.hasOwnProperty(k2)) {
                  kills[k2]();
                }
              }
            });
          };
        };
      }
    };
  }
  var SUSPENDED = 0;
  var CONTINUE = 1;
  var STEP_BIND = 2;
  var STEP_RESULT = 3;
  var PENDING = 4;
  var RETURN = 5;
  var COMPLETED = 6;
  function Fiber(util, supervisor, aff) {
    var runTick = 0;
    var status = SUSPENDED;
    var step3 = aff;
    var fail3 = null;
    var interrupt = null;
    var bhead = null;
    var btail = null;
    var attempts = null;
    var bracketCount = 0;
    var joinId = 0;
    var joins = null;
    var rethrow = true;
    function run3(localRunTick) {
      var tmp, result, attempt;
      while (true) {
        tmp = null;
        result = null;
        attempt = null;
        switch (status) {
          case STEP_BIND:
            status = CONTINUE;
            try {
              step3 = bhead(step3);
              if (btail === null) {
                bhead = null;
              } else {
                bhead = btail._1;
                btail = btail._2;
              }
            } catch (e) {
              status = RETURN;
              fail3 = util.left(e);
              step3 = null;
            }
            break;
          case STEP_RESULT:
            if (util.isLeft(step3)) {
              status = RETURN;
              fail3 = step3;
              step3 = null;
            } else if (bhead === null) {
              status = RETURN;
            } else {
              status = STEP_BIND;
              step3 = util.fromRight(step3);
            }
            break;
          case CONTINUE:
            switch (step3.tag) {
              case BIND:
                if (bhead) {
                  btail = new Aff2(CONS, bhead, btail);
                }
                bhead = step3._2;
                status = CONTINUE;
                step3 = step3._1;
                break;
              case PURE:
                if (bhead === null) {
                  status = RETURN;
                  step3 = util.right(step3._1);
                } else {
                  status = STEP_BIND;
                  step3 = step3._1;
                }
                break;
              case SYNC:
                status = STEP_RESULT;
                step3 = runSync(util.left, util.right, step3._1);
                break;
              case ASYNC:
                status = PENDING;
                step3 = runAsync(util.left, step3._1, function(result2) {
                  return function() {
                    if (runTick !== localRunTick) {
                      return;
                    }
                    runTick++;
                    Scheduler.enqueue(function() {
                      if (runTick !== localRunTick + 1) {
                        return;
                      }
                      status = STEP_RESULT;
                      step3 = result2;
                      run3(runTick);
                    });
                  };
                });
                return;
              case THROW:
                status = RETURN;
                fail3 = util.left(step3._1);
                step3 = null;
                break;
              case CATCH:
                if (bhead === null) {
                  attempts = new Aff2(CONS, step3, attempts, interrupt);
                } else {
                  attempts = new Aff2(CONS, step3, new Aff2(CONS, new Aff2(RESUME, bhead, btail), attempts, interrupt), interrupt);
                }
                bhead = null;
                btail = null;
                status = CONTINUE;
                step3 = step3._1;
                break;
              case BRACKET:
                bracketCount++;
                if (bhead === null) {
                  attempts = new Aff2(CONS, step3, attempts, interrupt);
                } else {
                  attempts = new Aff2(CONS, step3, new Aff2(CONS, new Aff2(RESUME, bhead, btail), attempts, interrupt), interrupt);
                }
                bhead = null;
                btail = null;
                status = CONTINUE;
                step3 = step3._1;
                break;
              case FORK:
                status = STEP_RESULT;
                tmp = Fiber(util, supervisor, step3._2);
                if (supervisor) {
                  supervisor.register(tmp);
                }
                if (step3._1) {
                  tmp.run();
                }
                step3 = util.right(tmp);
                break;
              case SEQ:
                status = CONTINUE;
                step3 = sequential2(util, supervisor, step3._1);
                break;
            }
            break;
          case RETURN:
            bhead = null;
            btail = null;
            if (attempts === null) {
              status = COMPLETED;
              step3 = interrupt || fail3 || step3;
            } else {
              tmp = attempts._3;
              attempt = attempts._1;
              attempts = attempts._2;
              switch (attempt.tag) {
                case CATCH:
                  if (interrupt && interrupt !== tmp && bracketCount === 0) {
                    status = RETURN;
                  } else if (fail3) {
                    status = CONTINUE;
                    step3 = attempt._2(util.fromLeft(fail3));
                    fail3 = null;
                  }
                  break;
                case RESUME:
                  if (interrupt && interrupt !== tmp && bracketCount === 0 || fail3) {
                    status = RETURN;
                  } else {
                    bhead = attempt._1;
                    btail = attempt._2;
                    status = STEP_BIND;
                    step3 = util.fromRight(step3);
                  }
                  break;
                case BRACKET:
                  bracketCount--;
                  if (fail3 === null) {
                    result = util.fromRight(step3);
                    attempts = new Aff2(CONS, new Aff2(RELEASE, attempt._2, result), attempts, tmp);
                    if (interrupt === tmp || bracketCount > 0) {
                      status = CONTINUE;
                      step3 = attempt._3(result);
                    }
                  }
                  break;
                case RELEASE:
                  attempts = new Aff2(CONS, new Aff2(FINALIZED, step3, fail3), attempts, interrupt);
                  status = CONTINUE;
                  if (interrupt && interrupt !== tmp && bracketCount === 0) {
                    step3 = attempt._1.killed(util.fromLeft(interrupt))(attempt._2);
                  } else if (fail3) {
                    step3 = attempt._1.failed(util.fromLeft(fail3))(attempt._2);
                  } else {
                    step3 = attempt._1.completed(util.fromRight(step3))(attempt._2);
                  }
                  fail3 = null;
                  bracketCount++;
                  break;
                case FINALIZER:
                  bracketCount++;
                  attempts = new Aff2(CONS, new Aff2(FINALIZED, step3, fail3), attempts, interrupt);
                  status = CONTINUE;
                  step3 = attempt._1;
                  break;
                case FINALIZED:
                  bracketCount--;
                  status = RETURN;
                  step3 = attempt._1;
                  fail3 = attempt._2;
                  break;
              }
            }
            break;
          case COMPLETED:
            for (var k in joins) {
              if (joins.hasOwnProperty(k)) {
                rethrow = rethrow && joins[k].rethrow;
                runEff(joins[k].handler(step3));
              }
            }
            joins = null;
            if (interrupt && fail3) {
              setTimeout(function() {
                throw util.fromLeft(fail3);
              }, 0);
            } else if (util.isLeft(step3) && rethrow) {
              setTimeout(function() {
                if (rethrow) {
                  throw util.fromLeft(step3);
                }
              }, 0);
            }
            return;
          case SUSPENDED:
            status = CONTINUE;
            break;
          case PENDING:
            return;
        }
      }
    }
    function onComplete(join4) {
      return function() {
        if (status === COMPLETED) {
          rethrow = rethrow && join4.rethrow;
          join4.handler(step3)();
          return function() {
          };
        }
        var jid = joinId++;
        joins = joins || {};
        joins[jid] = join4;
        return function() {
          if (joins !== null) {
            delete joins[jid];
          }
        };
      };
    }
    function kill(error3, cb2) {
      return function() {
        if (status === COMPLETED) {
          cb2(util.right(void 0))();
          return function() {
          };
        }
        var canceler = onComplete({
          rethrow: false,
          handler: function() {
            return cb2(util.right(void 0));
          }
        })();
        switch (status) {
          case SUSPENDED:
            interrupt = util.left(error3);
            status = COMPLETED;
            step3 = interrupt;
            run3(runTick);
            break;
          case PENDING:
            if (interrupt === null) {
              interrupt = util.left(error3);
            }
            if (bracketCount === 0) {
              if (status === PENDING) {
                attempts = new Aff2(CONS, new Aff2(FINALIZER, step3(error3)), attempts, interrupt);
              }
              status = RETURN;
              step3 = null;
              fail3 = null;
              run3(++runTick);
            }
            break;
          default:
            if (interrupt === null) {
              interrupt = util.left(error3);
            }
            if (bracketCount === 0) {
              status = RETURN;
              step3 = null;
              fail3 = null;
            }
        }
        return canceler;
      };
    }
    function join3(cb2) {
      return function() {
        var canceler = onComplete({
          rethrow: false,
          handler: cb2
        })();
        if (status === SUSPENDED) {
          run3(runTick);
        }
        return canceler;
      };
    }
    return {
      kill,
      join: join3,
      onComplete,
      isSuspended: function() {
        return status === SUSPENDED;
      },
      run: function() {
        if (status === SUSPENDED) {
          if (!Scheduler.isDraining()) {
            Scheduler.enqueue(function() {
              run3(runTick);
            });
          } else {
            run3(runTick);
          }
        }
      }
    };
  }
  function runPar(util, supervisor, par, cb2) {
    var fiberId = 0;
    var fibers = {};
    var killId = 0;
    var kills = {};
    var early = new Error("[ParAff] Early exit");
    var interrupt = null;
    var root = EMPTY;
    function kill(error3, par2, cb3) {
      var step3 = par2;
      var head6 = null;
      var tail2 = null;
      var count2 = 0;
      var kills2 = {};
      var tmp, kid;
      loop:
        while (true) {
          tmp = null;
          switch (step3.tag) {
            case FORKED:
              if (step3._3 === EMPTY) {
                tmp = fibers[step3._1];
                kills2[count2++] = tmp.kill(error3, function(result) {
                  return function() {
                    count2--;
                    if (count2 === 0) {
                      cb3(result)();
                    }
                  };
                });
              }
              if (head6 === null) {
                break loop;
              }
              step3 = head6._2;
              if (tail2 === null) {
                head6 = null;
              } else {
                head6 = tail2._1;
                tail2 = tail2._2;
              }
              break;
            case MAP:
              step3 = step3._2;
              break;
            case APPLY:
            case ALT:
              if (head6) {
                tail2 = new Aff2(CONS, head6, tail2);
              }
              head6 = step3;
              step3 = step3._1;
              break;
          }
        }
      if (count2 === 0) {
        cb3(util.right(void 0))();
      } else {
        kid = 0;
        tmp = count2;
        for (; kid < tmp; kid++) {
          kills2[kid] = kills2[kid]();
        }
      }
      return kills2;
    }
    function join3(result, head6, tail2) {
      var fail3, step3, lhs, rhs, tmp, kid;
      if (util.isLeft(result)) {
        fail3 = result;
        step3 = null;
      } else {
        step3 = result;
        fail3 = null;
      }
      loop:
        while (true) {
          lhs = null;
          rhs = null;
          tmp = null;
          kid = null;
          if (interrupt !== null) {
            return;
          }
          if (head6 === null) {
            cb2(fail3 || step3)();
            return;
          }
          if (head6._3 !== EMPTY) {
            return;
          }
          switch (head6.tag) {
            case MAP:
              if (fail3 === null) {
                head6._3 = util.right(head6._1(util.fromRight(step3)));
                step3 = head6._3;
              } else {
                head6._3 = fail3;
              }
              break;
            case APPLY:
              lhs = head6._1._3;
              rhs = head6._2._3;
              if (fail3) {
                head6._3 = fail3;
                tmp = true;
                kid = killId++;
                kills[kid] = kill(early, fail3 === lhs ? head6._2 : head6._1, function() {
                  return function() {
                    delete kills[kid];
                    if (tmp) {
                      tmp = false;
                    } else if (tail2 === null) {
                      join3(fail3, null, null);
                    } else {
                      join3(fail3, tail2._1, tail2._2);
                    }
                  };
                });
                if (tmp) {
                  tmp = false;
                  return;
                }
              } else if (lhs === EMPTY || rhs === EMPTY) {
                return;
              } else {
                step3 = util.right(util.fromRight(lhs)(util.fromRight(rhs)));
                head6._3 = step3;
              }
              break;
            case ALT:
              lhs = head6._1._3;
              rhs = head6._2._3;
              if (lhs === EMPTY && util.isLeft(rhs) || rhs === EMPTY && util.isLeft(lhs)) {
                return;
              }
              if (lhs !== EMPTY && util.isLeft(lhs) && rhs !== EMPTY && util.isLeft(rhs)) {
                fail3 = step3 === lhs ? rhs : lhs;
                step3 = null;
                head6._3 = fail3;
              } else {
                head6._3 = step3;
                tmp = true;
                kid = killId++;
                kills[kid] = kill(early, step3 === lhs ? head6._2 : head6._1, function() {
                  return function() {
                    delete kills[kid];
                    if (tmp) {
                      tmp = false;
                    } else if (tail2 === null) {
                      join3(step3, null, null);
                    } else {
                      join3(step3, tail2._1, tail2._2);
                    }
                  };
                });
                if (tmp) {
                  tmp = false;
                  return;
                }
              }
              break;
          }
          if (tail2 === null) {
            head6 = null;
          } else {
            head6 = tail2._1;
            tail2 = tail2._2;
          }
        }
    }
    function resolve(fiber) {
      return function(result) {
        return function() {
          delete fibers[fiber._1];
          fiber._3 = result;
          join3(result, fiber._2._1, fiber._2._2);
        };
      };
    }
    function run3() {
      var status = CONTINUE;
      var step3 = par;
      var head6 = null;
      var tail2 = null;
      var tmp, fid;
      loop:
        while (true) {
          tmp = null;
          fid = null;
          switch (status) {
            case CONTINUE:
              switch (step3.tag) {
                case MAP:
                  if (head6) {
                    tail2 = new Aff2(CONS, head6, tail2);
                  }
                  head6 = new Aff2(MAP, step3._1, EMPTY, EMPTY);
                  step3 = step3._2;
                  break;
                case APPLY:
                  if (head6) {
                    tail2 = new Aff2(CONS, head6, tail2);
                  }
                  head6 = new Aff2(APPLY, EMPTY, step3._2, EMPTY);
                  step3 = step3._1;
                  break;
                case ALT:
                  if (head6) {
                    tail2 = new Aff2(CONS, head6, tail2);
                  }
                  head6 = new Aff2(ALT, EMPTY, step3._2, EMPTY);
                  step3 = step3._1;
                  break;
                default:
                  fid = fiberId++;
                  status = RETURN;
                  tmp = step3;
                  step3 = new Aff2(FORKED, fid, new Aff2(CONS, head6, tail2), EMPTY);
                  tmp = Fiber(util, supervisor, tmp);
                  tmp.onComplete({
                    rethrow: false,
                    handler: resolve(step3)
                  })();
                  fibers[fid] = tmp;
                  if (supervisor) {
                    supervisor.register(tmp);
                  }
              }
              break;
            case RETURN:
              if (head6 === null) {
                break loop;
              }
              if (head6._1 === EMPTY) {
                head6._1 = step3;
                status = CONTINUE;
                step3 = head6._2;
                head6._2 = EMPTY;
              } else {
                head6._2 = step3;
                step3 = head6;
                if (tail2 === null) {
                  head6 = null;
                } else {
                  head6 = tail2._1;
                  tail2 = tail2._2;
                }
              }
          }
        }
      root = step3;
      for (fid = 0; fid < fiberId; fid++) {
        fibers[fid].run();
      }
    }
    function cancel(error3, cb3) {
      interrupt = util.left(error3);
      var innerKills;
      for (var kid in kills) {
        if (kills.hasOwnProperty(kid)) {
          innerKills = kills[kid];
          for (kid in innerKills) {
            if (innerKills.hasOwnProperty(kid)) {
              innerKills[kid]();
            }
          }
        }
      }
      kills = null;
      var newKills = kill(error3, root, cb3);
      return function(killError) {
        return new Aff2(ASYNC, function(killCb) {
          return function() {
            for (var kid2 in newKills) {
              if (newKills.hasOwnProperty(kid2)) {
                newKills[kid2]();
              }
            }
            return nonCanceler2;
          };
        });
      };
    }
    run3();
    return function(killError) {
      return new Aff2(ASYNC, function(killCb) {
        return function() {
          return cancel(killError, killCb);
        };
      });
    };
  }
  function sequential2(util, supervisor, par) {
    return new Aff2(ASYNC, function(cb2) {
      return function() {
        return runPar(util, supervisor, par, cb2);
      };
    });
  }
  Aff2.EMPTY = EMPTY;
  Aff2.Pure = AffCtr(PURE);
  Aff2.Throw = AffCtr(THROW);
  Aff2.Catch = AffCtr(CATCH);
  Aff2.Sync = AffCtr(SYNC);
  Aff2.Async = AffCtr(ASYNC);
  Aff2.Bind = AffCtr(BIND);
  Aff2.Bracket = AffCtr(BRACKET);
  Aff2.Fork = AffCtr(FORK);
  Aff2.Seq = AffCtr(SEQ);
  Aff2.ParMap = AffCtr(MAP);
  Aff2.ParApply = AffCtr(APPLY);
  Aff2.ParAlt = AffCtr(ALT);
  Aff2.Fiber = Fiber;
  Aff2.Supervisor = Supervisor;
  Aff2.Scheduler = Scheduler;
  Aff2.nonCanceler = nonCanceler2;
  return Aff2;
}();
var _pure = Aff.Pure;
var _throwError = Aff.Throw;
function _catchError(aff) {
  return function(k) {
    return Aff.Catch(aff, k);
  };
}
function _map(f) {
  return function(aff) {
    if (aff.tag === Aff.Pure.tag) {
      return Aff.Pure(f(aff._1));
    } else {
      return Aff.Bind(aff, function(value13) {
        return Aff.Pure(f(value13));
      });
    }
  };
}
function _bind(aff) {
  return function(k) {
    return Aff.Bind(aff, k);
  };
}
var _liftEffect = Aff.Sync;
var makeAff = Aff.Async;
function _makeFiber(util, aff) {
  return function() {
    return Aff.Fiber(util, null, aff);
  };
}
var _delay = function() {
  function setDelay(n, k) {
    if (n === 0 && typeof setImmediate !== "undefined") {
      return setImmediate(k);
    } else {
      return setTimeout(k, n);
    }
  }
  function clearDelay(n, t) {
    if (n === 0 && typeof clearImmediate !== "undefined") {
      return clearImmediate(t);
    } else {
      return clearTimeout(t);
    }
  }
  return function(right2, ms) {
    return Aff.Async(function(cb2) {
      return function() {
        var timer = setDelay(ms, cb2(right2()));
        return function() {
          return Aff.Sync(function() {
            return right2(clearDelay(ms, timer));
          });
        };
      };
    });
  };
}();
var _sequential = Aff.Seq;

// output/Effect.Aff/index.js
var $runtime_lazy5 = function(name16, moduleName, init3) {
  var state4 = 0;
  var val;
  return function(lineNumber) {
    if (state4 === 2)
      return val;
    if (state4 === 1)
      throw new ReferenceError(name16 + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state4 = 1;
    val = init3();
    state4 = 2;
    return val;
  };
};
var $$void8 = /* @__PURE__ */ $$void(functorEffect);
var functorAff = {
  map: _map
};
var ffiUtil = /* @__PURE__ */ function() {
  var unsafeFromRight = function(v) {
    if (v instanceof Right) {
      return v.value0;
    }
    ;
    if (v instanceof Left) {
      return unsafeCrashWith("unsafeFromRight: Left");
    }
    ;
    throw new Error("Failed pattern match at Effect.Aff (line 412, column 21 - line 414, column 54): " + [v.constructor.name]);
  };
  var unsafeFromLeft = function(v) {
    if (v instanceof Left) {
      return v.value0;
    }
    ;
    if (v instanceof Right) {
      return unsafeCrashWith("unsafeFromLeft: Right");
    }
    ;
    throw new Error("Failed pattern match at Effect.Aff (line 407, column 20 - line 409, column 55): " + [v.constructor.name]);
  };
  var isLeft = function(v) {
    if (v instanceof Left) {
      return true;
    }
    ;
    if (v instanceof Right) {
      return false;
    }
    ;
    throw new Error("Failed pattern match at Effect.Aff (line 402, column 12 - line 404, column 21): " + [v.constructor.name]);
  };
  return {
    isLeft,
    fromLeft: unsafeFromLeft,
    fromRight: unsafeFromRight,
    left: Left.create,
    right: Right.create
  };
}();
var makeFiber = function(aff) {
  return _makeFiber(ffiUtil, aff);
};
var launchAff = function(aff) {
  return function __do3() {
    var fiber = makeFiber(aff)();
    fiber.run();
    return fiber;
  };
};
var launchAff_ = function($74) {
  return $$void8(launchAff($74));
};
var monadAff = {
  Applicative0: function() {
    return applicativeAff;
  },
  Bind1: function() {
    return bindAff;
  }
};
var bindAff = {
  bind: _bind,
  Apply0: function() {
    return $lazy_applyAff(0);
  }
};
var applicativeAff = {
  pure: _pure,
  Apply0: function() {
    return $lazy_applyAff(0);
  }
};
var $lazy_applyAff = /* @__PURE__ */ $runtime_lazy5("applyAff", "Effect.Aff", function() {
  return {
    apply: ap(monadAff),
    Functor0: function() {
      return functorAff;
    }
  };
});
var pure22 = /* @__PURE__ */ pure(applicativeAff);
var monadEffectAff = {
  liftEffect: _liftEffect,
  Monad0: function() {
    return monadAff;
  }
};
var monadThrowAff = {
  throwError: _throwError,
  Monad0: function() {
    return monadAff;
  }
};
var monadErrorAff = {
  catchError: _catchError,
  MonadThrow0: function() {
    return monadThrowAff;
  }
};
var nonCanceler = /* @__PURE__ */ $$const(/* @__PURE__ */ pure22(unit));

// output/Effect.Aff.Compat/index.js
var fromEffectFnAff = function(v) {
  return makeAff(function(k) {
    return function __do3() {
      var v1 = v(function($9) {
        return k(Left.create($9))();
      }, function($10) {
        return k(Right.create($10))();
      });
      return function(e) {
        return makeAff(function(k2) {
          return function __do4() {
            v1(e, function($11) {
              return k2(Left.create($11))();
            }, function($12) {
              return k2(Right.create($12))();
            });
            return nonCanceler;
          };
        });
      };
    };
  });
};

// output/Foreign/foreign.js
function tagOf(value13) {
  return Object.prototype.toString.call(value13).slice(8, -1);
}
var isArray = Array.isArray || function(value13) {
  return Object.prototype.toString.call(value13) === "[object Array]";
};

// output/Foreign/index.js
var show3 = /* @__PURE__ */ show(showString);
var show12 = /* @__PURE__ */ show(showInt);
var ForeignError = /* @__PURE__ */ function() {
  function ForeignError2(value0) {
    this.value0 = value0;
  }
  ;
  ForeignError2.create = function(value0) {
    return new ForeignError2(value0);
  };
  return ForeignError2;
}();
var TypeMismatch2 = /* @__PURE__ */ function() {
  function TypeMismatch3(value0, value1) {
    this.value0 = value0;
    this.value1 = value1;
  }
  ;
  TypeMismatch3.create = function(value0) {
    return function(value1) {
      return new TypeMismatch3(value0, value1);
    };
  };
  return TypeMismatch3;
}();
var ErrorAtIndex = /* @__PURE__ */ function() {
  function ErrorAtIndex2(value0, value1) {
    this.value0 = value0;
    this.value1 = value1;
  }
  ;
  ErrorAtIndex2.create = function(value0) {
    return function(value1) {
      return new ErrorAtIndex2(value0, value1);
    };
  };
  return ErrorAtIndex2;
}();
var ErrorAtProperty = /* @__PURE__ */ function() {
  function ErrorAtProperty2(value0, value1) {
    this.value0 = value0;
    this.value1 = value1;
  }
  ;
  ErrorAtProperty2.create = function(value0) {
    return function(value1) {
      return new ErrorAtProperty2(value0, value1);
    };
  };
  return ErrorAtProperty2;
}();
var unsafeToForeign = unsafeCoerce;
var unsafeFromForeign = unsafeCoerce;
var renderForeignError = function(v) {
  if (v instanceof ForeignError) {
    return v.value0;
  }
  ;
  if (v instanceof ErrorAtIndex) {
    return "Error at array index " + (show12(v.value0) + (": " + renderForeignError(v.value1)));
  }
  ;
  if (v instanceof ErrorAtProperty) {
    return "Error at property " + (show3(v.value0) + (": " + renderForeignError(v.value1)));
  }
  ;
  if (v instanceof TypeMismatch2) {
    return "Type mismatch: expected " + (v.value0 + (", found " + v.value1));
  }
  ;
  throw new Error("Failed pattern match at Foreign (line 78, column 1 - line 78, column 45): " + [v.constructor.name]);
};
var fail = function(dictMonad) {
  var $153 = throwError(monadThrowExceptT(dictMonad));
  return function($154) {
    return $153(singleton10($154));
  };
};
var unsafeReadTagged = function(dictMonad) {
  var pure114 = pure(applicativeExceptT(dictMonad));
  var fail1 = fail(dictMonad);
  return function(tag) {
    return function(value13) {
      if (tagOf(value13) === tag) {
        return pure114(unsafeFromForeign(value13));
      }
      ;
      if (otherwise) {
        return fail1(new TypeMismatch2(tag, tagOf(value13)));
      }
      ;
      throw new Error("Failed pattern match at Foreign (line 123, column 1 - line 123, column 104): " + [tag.constructor.name, value13.constructor.name]);
    };
  };
};

// output/Affjax/index.js
var pure17 = /* @__PURE__ */ pure(/* @__PURE__ */ applicativeExceptT(monadIdentity));
var fail2 = /* @__PURE__ */ fail(monadIdentity);
var unsafeReadTagged2 = /* @__PURE__ */ unsafeReadTagged(monadIdentity);
var alt4 = /* @__PURE__ */ alt(/* @__PURE__ */ altExceptT(semigroupNonEmptyList)(monadIdentity));
var composeKleisliFlipped2 = /* @__PURE__ */ composeKleisliFlipped(/* @__PURE__ */ bindExceptT(monadIdentity));
var map18 = /* @__PURE__ */ map(functorMaybe);
var any3 = /* @__PURE__ */ any(foldableArray)(heytingAlgebraBoolean);
var eq5 = /* @__PURE__ */ eq(eqString);
var bindFlipped3 = /* @__PURE__ */ bindFlipped(bindMaybe);
var map19 = /* @__PURE__ */ map(functorArray);
var mapFlipped2 = /* @__PURE__ */ mapFlipped(functorAff);
var $$try2 = /* @__PURE__ */ $$try(monadErrorAff);
var pure18 = /* @__PURE__ */ pure(applicativeAff);
var RequestContentError = /* @__PURE__ */ function() {
  function RequestContentError2(value0) {
    this.value0 = value0;
  }
  ;
  RequestContentError2.create = function(value0) {
    return new RequestContentError2(value0);
  };
  return RequestContentError2;
}();
var ResponseBodyError = /* @__PURE__ */ function() {
  function ResponseBodyError2(value0, value1) {
    this.value0 = value0;
    this.value1 = value1;
  }
  ;
  ResponseBodyError2.create = function(value0) {
    return function(value1) {
      return new ResponseBodyError2(value0, value1);
    };
  };
  return ResponseBodyError2;
}();
var TimeoutError = /* @__PURE__ */ function() {
  function TimeoutError2() {
  }
  ;
  TimeoutError2.value = new TimeoutError2();
  return TimeoutError2;
}();
var RequestFailedError = /* @__PURE__ */ function() {
  function RequestFailedError2() {
  }
  ;
  RequestFailedError2.value = new RequestFailedError2();
  return RequestFailedError2;
}();
var XHROtherError = /* @__PURE__ */ function() {
  function XHROtherError2(value0) {
    this.value0 = value0;
  }
  ;
  XHROtherError2.create = function(value0) {
    return new XHROtherError2(value0);
  };
  return XHROtherError2;
}();
var request = function(driver2) {
  return function(req) {
    var parseJSON = function(v2) {
      if (v2 === "") {
        return pure17(jsonEmptyObject);
      }
      ;
      return either(function($74) {
        return fail2(ForeignError.create($74));
      })(pure17)(jsonParser(v2));
    };
    var fromResponse = function() {
      if (req.responseFormat instanceof $$ArrayBuffer) {
        return unsafeReadTagged2("ArrayBuffer");
      }
      ;
      if (req.responseFormat instanceof Blob2) {
        return unsafeReadTagged2("Blob");
      }
      ;
      if (req.responseFormat instanceof Document2) {
        return function(x) {
          return alt4(unsafeReadTagged2("Document")(x))(alt4(unsafeReadTagged2("XMLDocument")(x))(unsafeReadTagged2("HTMLDocument")(x)));
        };
      }
      ;
      if (req.responseFormat instanceof Json2) {
        return composeKleisliFlipped2(function($75) {
          return req.responseFormat.value0(parseJSON($75));
        })(unsafeReadTagged2("String"));
      }
      ;
      if (req.responseFormat instanceof $$String2) {
        return unsafeReadTagged2("String");
      }
      ;
      if (req.responseFormat instanceof Ignore) {
        return $$const(req.responseFormat.value0(pure17(unit)));
      }
      ;
      throw new Error("Failed pattern match at Affjax (line 274, column 18 - line 283, column 57): " + [req.responseFormat.constructor.name]);
    }();
    var extractContent = function(v2) {
      if (v2 instanceof ArrayView) {
        return new Right(v2.value0(unsafeToForeign));
      }
      ;
      if (v2 instanceof Blob) {
        return new Right(unsafeToForeign(v2.value0));
      }
      ;
      if (v2 instanceof Document) {
        return new Right(unsafeToForeign(v2.value0));
      }
      ;
      if (v2 instanceof $$String) {
        return new Right(unsafeToForeign(v2.value0));
      }
      ;
      if (v2 instanceof FormData) {
        return new Right(unsafeToForeign(v2.value0));
      }
      ;
      if (v2 instanceof FormURLEncoded) {
        return note("Body contains values that cannot be encoded as application/x-www-form-urlencoded")(map18(unsafeToForeign)(encode2(v2.value0)));
      }
      ;
      if (v2 instanceof Json) {
        return new Right(unsafeToForeign(stringify(v2.value0)));
      }
      ;
      throw new Error("Failed pattern match at Affjax (line 235, column 20 - line 250, column 69): " + [v2.constructor.name]);
    };
    var addHeader = function(mh) {
      return function(hs) {
        if (mh instanceof Just && !any3(on(eq5)(name)(mh.value0))(hs)) {
          return snoc(hs)(mh.value0);
        }
        ;
        return hs;
      };
    };
    var headers = function(reqContent) {
      return addHeader(map18(ContentType.create)(bindFlipped3(toMediaType)(reqContent)))(addHeader(map18(Accept.create)(toMediaType2(req.responseFormat)))(req.headers));
    };
    var ajaxRequest = function(v2) {
      return {
        method: print(req.method),
        url: req.url,
        headers: map19(function(h) {
          return {
            field: name(h),
            value: value(h)
          };
        })(headers(req.content)),
        content: v2,
        responseType: toResponseType(req.responseFormat),
        username: toNullable(req.username),
        password: toNullable(req.password),
        withCredentials: req.withCredentials,
        timeout: fromMaybe(0)(map18(function(v1) {
          return v1;
        })(req.timeout))
      };
    };
    var send = function(content3) {
      return mapFlipped2($$try2(fromEffectFnAff(_ajax(driver2, "AffjaxTimeoutErrorMessageIdent", "AffjaxRequestFailedMessageIdent", ResponseHeader.create, ajaxRequest(content3)))))(function(v2) {
        if (v2 instanceof Right) {
          var v1 = runExcept(fromResponse(v2.value0.body));
          if (v1 instanceof Left) {
            return new Left(new ResponseBodyError(head3(v1.value0), v2.value0));
          }
          ;
          if (v1 instanceof Right) {
            return new Right({
              body: v1.value0,
              headers: v2.value0.headers,
              status: v2.value0.status,
              statusText: v2.value0.statusText
            });
          }
          ;
          throw new Error("Failed pattern match at Affjax (line 209, column 9 - line 211, column 52): " + [v1.constructor.name]);
        }
        ;
        if (v2 instanceof Left) {
          return new Left(function() {
            var message2 = message(v2.value0);
            var $61 = message2 === "AffjaxTimeoutErrorMessageIdent";
            if ($61) {
              return TimeoutError.value;
            }
            ;
            var $62 = message2 === "AffjaxRequestFailedMessageIdent";
            if ($62) {
              return RequestFailedError.value;
            }
            ;
            return new XHROtherError(v2.value0);
          }());
        }
        ;
        throw new Error("Failed pattern match at Affjax (line 207, column 144 - line 219, column 28): " + [v2.constructor.name]);
      });
    };
    if (req.content instanceof Nothing) {
      return send(toNullable(Nothing.value));
    }
    ;
    if (req.content instanceof Just) {
      var v = extractContent(req.content.value0);
      if (v instanceof Right) {
        return send(toNullable(new Just(v.value0)));
      }
      ;
      if (v instanceof Left) {
        return pure18(new Left(new RequestContentError(v.value0)));
      }
      ;
      throw new Error("Failed pattern match at Affjax (line 199, column 7 - line 203, column 48): " + [v.constructor.name]);
    }
    ;
    throw new Error("Failed pattern match at Affjax (line 195, column 3 - line 203, column 48): " + [req.content.constructor.name]);
  };
};
var printError = function(v) {
  if (v instanceof RequestContentError) {
    return "There was a problem with the request content: " + v.value0;
  }
  ;
  if (v instanceof ResponseBodyError) {
    return "There was a problem with the response body: " + renderForeignError(v.value0);
  }
  ;
  if (v instanceof TimeoutError) {
    return "There was a problem making the request: timeout";
  }
  ;
  if (v instanceof RequestFailedError) {
    return "There was a problem making the request: request failed";
  }
  ;
  if (v instanceof XHROtherError) {
    return "There was a problem making the request: " + message(v.value0);
  }
  ;
  throw new Error("Failed pattern match at Affjax (line 113, column 14 - line 123, column 66): " + [v.constructor.name]);
};
var defaultRequest = /* @__PURE__ */ function() {
  return {
    method: new Left(GET.value),
    url: "/",
    headers: [],
    content: Nothing.value,
    username: Nothing.value,
    password: Nothing.value,
    withCredentials: false,
    responseFormat: ignore,
    timeout: Nothing.value
  };
}();

// output/Affjax.Web/foreign.js
var driver = {
  newXHR: function() {
    return new XMLHttpRequest();
  },
  fixupUrl: function(url) {
    return url || "/";
  }
};

// output/Affjax.Web/index.js
var request2 = /* @__PURE__ */ request(driver);

// output/Deku.Example.Docs.Effects/index.js
var bind4 = /* @__PURE__ */ bind(bindAff);
var liftEffect2 = /* @__PURE__ */ liftEffect(monadEffectAff);
var pursxToElementConsInsert3 = /* @__PURE__ */ pursxToElementConsInsert();
var makePursx3 = /* @__PURE__ */ makePursx({
  reflectType: function() {
    return `<div>
  <h1>Effects</h1>

  <h2>Let's make a network call</h2>
  <p>
    This example is similar to the previous one in its design: the looping function is called in response to an event. The difference is that the response isn't immediate. Instead, we wait for the result of a network call.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Arbitrary effects</h2>
  <p>Because all event listeners execute in the <code>Effect</code> monad, you can do more or less whatever you want. Make a network call, run a monad transformer stack just for fun, play music using <a href="https://github.com/mikesol/purescript-wags">purescript-wags</a>. The sky's the limit!</p>

  <p>Another useful pattern when working with effects is to throttle input. For example, if we are making a network call, we may want to show a loading indicator and prevent additional network calls. This can be achieved by setting the callback to a no-op while the network call is executing, as shown in the example above.</p>

  <h2>Next steps</h2>
  <p>It is also possible to handle events (and by extension effectful actions in events, like network calls) in Pursx. Let's see how in the <a ~next~ style="cursor:pointer;">second Pursx section</a>.</p>
</div>`;
  }
})()()(/* @__PURE__ */ pursxToElementConsInsert3(/* @__PURE__ */ pursxToElementConsAttr()(/* @__PURE__ */ pursxToElementConsInsert3(pursxToElementNil)({
  reflectType: function() {
    return "result";
  }
})({
  reflectSymbol: function() {
    return "result";
  }
}))({
  reflectType: function() {
    return "next";
  }
})({
  reflectSymbol: function() {
    return "next";
  }
}))({
  reflectType: function() {
    return "code";
  }
})({
  reflectSymbol: function() {
    return "code";
  }
}));
var filterMap2 = /* @__PURE__ */ filterMap(filterableEvent);
var pure19 = /* @__PURE__ */ pure(applicativeEvent);
var attr3 = /* @__PURE__ */ attr(attrOnClickCb);
var alt5 = /* @__PURE__ */ alt(altEvent);
var voidLeft3 = /* @__PURE__ */ voidLeft(functorEvent);
var attr12 = /* @__PURE__ */ attr(attrDiv_StyleString);
var compact2 = /* @__PURE__ */ compact(compactableEvent);
var mapAccum3 = /* @__PURE__ */ mapAccum(eventIsEvent);
var oneOfMap4 = /* @__PURE__ */ oneOfMap(foldableArray)(plusEvent);
var applySecond4 = /* @__PURE__ */ applySecond(applyEffect);
var attr23 = /* @__PURE__ */ attr(attrA_HrefString);
var Loading = /* @__PURE__ */ function() {
  function Loading4() {
  }
  ;
  Loading4.value = new Loading4();
  return Loading4;
}();
var Result = /* @__PURE__ */ function() {
  function Result3(value0) {
    this.value0 = value0;
  }
  ;
  Result3.create = function(value0) {
    return new Result3(value0);
  };
  return Result3;
}();
var px2 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var clickText = "Click to get some random user data.";
var clickCb = function(push2) {
  return cb($$const(function __do3() {
    push2(Loading.value)();
    return launchAff_(bind4(request2({
      method: new Left(GET.value),
      url: "https://randomuser.me/api/",
      headers: defaultRequest.headers,
      content: defaultRequest.content,
      username: defaultRequest.username,
      password: defaultRequest.password,
      withCredentials: defaultRequest.withCredentials,
      responseFormat: json,
      timeout: defaultRequest.timeout
    }))(function(result) {
      if (result instanceof Left) {
        return liftEffect2(push2(new Result("GET /api response failed to decode: " + printError(result.value0))));
      }
      ;
      if (result instanceof Right) {
        return liftEffect2(push2(new Result(stringifyWithIndent(2)(result.value0.body))));
      }
      ;
      throw new Error("Failed pattern match at Deku.Example.Docs.Effects (line 44, column 9 - line 51, column 48): " + [result.constructor.name]);
    }))();
  }));
};
var effects2 = function(options2) {
  return makePursx3(px2)({
    code: pre_([code_([text_(effects)])]),
    result: bussed(function(push2) {
      return function(event) {
        var loadingOrResult = filterMap2(function(v) {
          if (v instanceof Loading) {
            return new Just(new Left(unit));
          }
          ;
          if (v instanceof Result) {
            return new Just(new Right(v.value0));
          }
          ;
          return Nothing.value;
        })(event);
        var result = filterMap2(function(v) {
          if (v instanceof Right) {
            return new Just(v.value0);
          }
          ;
          return Nothing.value;
        })(loadingOrResult);
        var loading = filterMap2(function(v) {
          if (v instanceof Left) {
            return new Just(unit);
          }
          ;
          return Nothing.value;
        })(loadingOrResult);
        return div_([div_([button(pure19(attr3(OnClick.value)(clickCb(push2))))([text(alt5(pure19(clickText))(alt5(voidLeft3(loading)("Loading..."))(voidLeft3(result)(clickText))))])]), div2(alt5(pure19(attr12(Style.value)("display: none;")))(voidLeft3(compact2(mapAccum3(function(b2) {
          return function(v) {
            return new Tuple(b2 && false, function() {
              if (b2) {
                return new Just(unit);
              }
              ;
              return Nothing.value;
            }());
          };
        })(true)(result)))(attr12(Style.value)("display: block;"))))([pre_([code_([text(alt5(pure19(""))(result))])])])]);
      };
    }),
    next: oneOfMap4(pure19)([attr3(OnClick.value)(cb(function(e) {
      return applySecond4(applySecond4(preventDefault(e))(options2.dpage(PURSX2.value)))(scrollToTop);
    })), attr23(Href.value)(options2.slug + "pursx2/")])
  });
};

// output/Deku.DOM.Elt.Input/index.js
var coerce17 = /* @__PURE__ */ coerce();
var input = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("input")(attributes)(coerce17(fixed(coerce17(mapWithIndex2(unsafeSetPos)(kids))))));
  };
};

// output/Deku.DOM.Attr.Controls/index.js
var Controls = /* @__PURE__ */ function() {
  function Controls2() {
  }
  ;
  Controls2.value = new Controls2();
  return Controls2;
}();
var attrVideo_ControlsString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "controls",
        value: prop$prime(value13)
      });
    };
  }
};

// output/Deku.DOM.Attr.OnInput/index.js
var OnInput = /* @__PURE__ */ function() {
  function OnInput2() {
  }
  ;
  OnInput2.value = new OnInput2();
  return OnInput2;
}();
var attrOnInputCb = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "input",
        value: cb$prime(value13)
      });
    };
  }
};

// output/Deku.DOM.Attr.OnKeyup/index.js
var OnKeyup = /* @__PURE__ */ function() {
  function OnKeyup2() {
  }
  ;
  OnKeyup2.value = new OnKeyup2();
  return OnKeyup2;
}();
var attrOnKeyupCb = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "keyup",
        value: cb$prime(value13)
      });
    };
  }
};

// output/Deku.DOM.Attr.Src/index.js
var Src = /* @__PURE__ */ function() {
  function Src2() {
  }
  ;
  Src2.value = new Src2();
  return Src2;
}();
var attrSource_SrcString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "src",
        value: prop$prime(value13)
      });
    };
  }
};

// output/Deku.DOM.Attr.Xtype/index.js
var Xtype = /* @__PURE__ */ function() {
  function Xtype2() {
  }
  ;
  Xtype2.value = new Xtype2();
  return Xtype2;
}();
var attrSource_XtypeString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "type",
        value: prop$prime(value13)
      });
    };
  }
};
var attrInput_XtypeString = {
  attr: function(v) {
    return function(value13) {
      return unsafeAttribute({
        key: "type",
        value: prop$prime(value13)
      });
    };
  }
};

// output/Deku.DOM.Elt.P/index.js
var coerce18 = /* @__PURE__ */ coerce();
var p = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("p")(attributes)(coerce18(fixed(coerce18(mapWithIndex2(unsafeSetPos)(kids))))));
  };
};
var p_ = /* @__PURE__ */ p(/* @__PURE__ */ empty(plusEvent));

// output/Deku.DOM.Elt.Source/index.js
var coerce19 = /* @__PURE__ */ coerce();
var source = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("source")(attributes)(coerce19(fixed(coerce19(mapWithIndex2(unsafeSetPos)(kids))))));
  };
};

// output/Deku.DOM.Elt.Video/index.js
var coerce20 = /* @__PURE__ */ coerce();
var video = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("video")(attributes)(coerce20(fixed(coerce20(mapWithIndex2(unsafeSetPos)(kids))))));
  };
};

// output/Web.HTML.HTMLInputElement/foreign.js
function value2(input2) {
  return function() {
    return input2.value;
  };
}
function valueAsNumber(input2) {
  return function() {
    return input2.valueAsNumber;
  };
}

// output/Web.Internal.FFI/foreign.js
function _unsafeReadProtoTagged(nothing, just, name16, value13) {
  if (typeof window !== "undefined") {
    var ty = window[name16];
    if (ty != null && value13 instanceof ty) {
      return just(value13);
    }
  }
  var obj = value13;
  while (obj != null) {
    var proto = Object.getPrototypeOf(obj);
    var constructorName = proto.constructor.name;
    if (constructorName === name16) {
      return just(value13);
    } else if (constructorName === "Object") {
      return nothing;
    }
    obj = proto;
  }
  return nothing;
}

// output/Web.Internal.FFI/index.js
var unsafeReadProtoTagged = function(name16) {
  return function(value13) {
    return _unsafeReadProtoTagged(Nothing.value, Just.create, name16, value13);
  };
};

// output/Web.HTML.HTMLInputElement/index.js
var fromEventTarget = /* @__PURE__ */ unsafeReadProtoTagged("HTMLInputElement");

// output/Web.UIEvent.KeyboardEvent/foreign.js
function code2(e) {
  return e.code;
}

// output/Web.UIEvent.KeyboardEvent/index.js
var fromEvent = /* @__PURE__ */ unsafeReadProtoTagged("KeyboardEvent");

// output/Deku.Listeners/index.js
var map21 = /* @__PURE__ */ map(functorEvent);
var attr4 = /* @__PURE__ */ attr(attrOnInputCb);
var for_4 = /* @__PURE__ */ for_(applicativeEffect)(foldableMaybe);
var bind5 = /* @__PURE__ */ bind(bindMaybe);
var composeKleisli2 = /* @__PURE__ */ composeKleisli(bindEffect);
var pure20 = /* @__PURE__ */ pure(applicativeEvent);
var alt7 = /* @__PURE__ */ alt(altEvent);
var attr13 = /* @__PURE__ */ attr(attrInput_XtypeString);
var slider = /* @__PURE__ */ function() {
  var $29 = alt7(pure20(attr13(Xtype.value)("range")));
  var $30 = map21(function(push2) {
    return attr4(OnInput.value)(cb(function(e) {
      return for_4(bind5(target(e))(fromEventTarget))(composeKleisli2(valueAsNumber)(push2));
    }));
  });
  return function($31) {
    return $29($30($31));
  };
}();
var click = function(dictAttr) {
  return map21(attr(dictAttr)(OnClick.value));
};
var click_ = function(dictAttr) {
  var $40 = click(dictAttr);
  return function($41) {
    return $40(pure20($41));
  };
};

// output/Deku.Example.Docs.Events/index.js
var pursxToElementConsInsert4 = /* @__PURE__ */ pursxToElementConsInsert();
var makePursx4 = /* @__PURE__ */ makePursx({
  reflectType: function() {
    return `<div>
  <h1>Events</h1>

  <h2>Listening to the DOM</h2>
  <p>
    We'll spice up the previous example by adding an event listener to our button. When we do, Deku will keep track of how many times we clicked it. The same goes for a range slider, whose current value is displayed underneath it.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Event handling</h2>
  <p>All DOM event handlers, like <code>OnClick</code> and <code>OnInput</code>, can be set with a value of type <code>Cb</code>. This type is a <code>newtype</code> around <code>(Event -> Effect Boolean)</code>. To hook the event up to the Deku event bus, you can use the <code>push</code> function within the event handler. The push function has a signature of <code>(push -> Effect Unit)</code>. Here, the type one can push in to <code>push</code> is UIEvents. Whenever a push happens, our <code>Event</code> receives it and all attributes are updated accordingly.</p>

  <h2>Next steps</h2>
  <p>In this section, saw how to react to events. In the next section, we'll use a similar mechanism to deal with arbitrary <a ~next~ style="cursor:pointer;">effects</a>.</p>
</div>`;
  }
})()()(/* @__PURE__ */ pursxToElementConsInsert4(/* @__PURE__ */ pursxToElementConsAttr()(/* @__PURE__ */ pursxToElementConsInsert4(pursxToElementNil)({
  reflectType: function() {
    return "result";
  }
})({
  reflectSymbol: function() {
    return "result";
  }
}))({
  reflectType: function() {
    return "next";
  }
})({
  reflectSymbol: function() {
    return "next";
  }
}))({
  reflectType: function() {
    return "code";
  }
})({
  reflectSymbol: function() {
    return "code";
  }
}));
var vbussed2 = /* @__PURE__ */ vbussed()(/* @__PURE__ */ vbusCons2({
  reflectSymbol: function() {
    return "buttonClicked";
  }
})()()(/* @__PURE__ */ vbusCons2({
  reflectSymbol: function() {
    return "sliderMoved";
  }
})()()(vbusNil)()())()());
var click_2 = /* @__PURE__ */ click_(attrOnClickEffectUnit);
var alt8 = /* @__PURE__ */ alt(altEvent);
var pure21 = /* @__PURE__ */ pure(applicativeEvent);
var map23 = /* @__PURE__ */ map(functorEvent);
var append7 = /* @__PURE__ */ append(semigroupString);
var show4 = /* @__PURE__ */ show(showInt);
var fold4 = /* @__PURE__ */ fold3(eventIsEvent);
var show13 = /* @__PURE__ */ show(showNumber);
var oneOfMap5 = /* @__PURE__ */ oneOfMap(foldableArray)(plusEvent);
var attr5 = /* @__PURE__ */ attr(attrOnClickCb);
var applySecond5 = /* @__PURE__ */ applySecond(applyEffect);
var attr14 = /* @__PURE__ */ attr(attrA_HrefString);
var px3 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var events2 = function(options2) {
  return makePursx4(px3)({
    code: pre_([code_([text_(events)])]),
    result: vbussed2($$Proxy.value)(function(push2) {
      return function(event) {
        return div_([button(click_2(push2.buttonClicked(unit)))([text_("Click")]), div_([text(alt8(pure21("Val: 0"))(map23(function() {
          var $55 = append7("Val: ");
          return function($56) {
            return $55(show4($56));
          };
        }())(fold4(function(a2) {
          return function(v) {
            return 1 + a2 | 0;
          };
        })(-1 | 0)(alt8(pure21(unit))(event.buttonClicked)))))]), div_([input(slider(pure21(push2.sliderMoved)))([]), div_([text(alt8(pure21("Val: 50.0"))(map23(function() {
          var $57 = append7("Val: ");
          return function($58) {
            return $57(show13($58));
          };
        }())(event.sliderMoved)))])])]);
      };
    }),
    next: oneOfMap5(pure21)([attr5(OnClick.value)(cb(function(e) {
      return applySecond5(applySecond5(preventDefault(e))(options2.dpage(Effects.value)))(scrollToTop);
    })), attr14(Href.value)(options2.slug + "effects/")])
  });
};

// output/Deku.Do/index.js
var bind6 = function(f) {
  return function(a2) {
    return f(a2);
  };
};

// output/Deku.Hooks/index.js
var alt9 = /* @__PURE__ */ alt(altEvent);
var pure23 = /* @__PURE__ */ pure(applicativeEvent);
var keepLatest5 = /* @__PURE__ */ keepLatest(eventIsEvent);
var useDyn = function(i2) {
  return function(f) {
    return keepLatest5(bind6(function($48) {
      return bus2(curry($48));
    })(function(v) {
      return alt9(pure23(insert7(i2)(f({
        remove: v.value0(remove),
        sendTo: function($49) {
          return v.value0(sendToPos($49));
        }
      }))))(v.value1);
    }));
  };
};
var useDyn_ = /* @__PURE__ */ useDyn(0);

// output/Deku.Example.Docs.Events2/index.js
var pursxToElementConsInsert5 = /* @__PURE__ */ pursxToElementConsInsert();
var makePursx5 = /* @__PURE__ */ makePursx({
  reflectType: function() {
    return `<div>
  <h1>Events 2</h1>

  <h2>Dynamic children</h2>
  <p>
    Up until now, our DOM has been static. This is OK in some cases, but in many cases, we need a dynamic DOM: one whose elements are inserted and removed based on user interaction. In Deku, we achieve this with <code>Event</code>-s.
  </p>

  <p>
    The code below creates a todo list that allows a user to add, prioritize, and remove elements.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Events of events</h2>

  <p>In the previous sections, DOM element constructors like <code>div_</code> could only accept an <code>Array</code>. They <i>also</i> can accept an event of events. In this case, the outer event represents a dynamic element, and the inner event represents the <i>stage</i> of dynamism with a data type called <code>Child</code>. <code>Child</code> has three constructors:</p>

  <ul>
    <li><code>insert</code>, which takes an element.</li>
    <li><code>sendToTop</code>, which sends the current element to the top of its parent.</li>
    <li><code>remove</code>, which removes the element from its parent.</li>
  </ul>

  <p>The Deku engine listens for these in a specific order. <code>Insert</code> can be followed by 0 or more <code>SendToTop</code>-s. When a <code>Remove</code> is called, the stream is unsubscribed from the parent. Because we're in the land of <code>Event</code>-s, you can emit anything, but this is the how they will be listened to.</p>

  <h2>Next steps</h2>
  <p>In this section, we used nested events to insert and remove elements from a parent. In the next section, we'll see how we can use <a ~next~ style="cursor:pointer;">portals to move an element to a different place of the DOM</a>.</p>
</div>`;
  }
})()()(/* @__PURE__ */ pursxToElementConsInsert5(/* @__PURE__ */ pursxToElementConsAttr()(/* @__PURE__ */ pursxToElementConsInsert5(pursxToElementNil)({
  reflectType: function() {
    return "result";
  }
})({
  reflectSymbol: function() {
    return "result";
  }
}))({
  reflectType: function() {
    return "next";
  }
})({
  reflectSymbol: function() {
    return "next";
  }
}))({
  reflectType: function() {
    return "code";
  }
})({
  reflectSymbol: function() {
    return "code";
  }
}));
var lcmap5 = /* @__PURE__ */ lcmap(profunctorFn);
var alt10 = /* @__PURE__ */ alt(altEvent);
var pure24 = /* @__PURE__ */ pure(applicativeEvent);
var oneOfMap6 = /* @__PURE__ */ oneOfMap(foldableArray)(plusEvent);
var attr6 = /* @__PURE__ */ attr(attrInput_StyleString);
var attr15 = /* @__PURE__ */ attr(attrOnInputCb);
var for_5 = /* @__PURE__ */ for_(applicativeEffect)(foldableMaybe);
var bind7 = /* @__PURE__ */ bind(bindMaybe);
var composeKleisli3 = /* @__PURE__ */ composeKleisli(bindEffect);
var attr24 = /* @__PURE__ */ attr(attrOnKeyupCb);
var when3 = /* @__PURE__ */ when(applicativeEffect);
var attr32 = /* @__PURE__ */ attr(attrButton_StyleString);
var attr42 = /* @__PURE__ */ attr(attrOnClickCb);
var map24 = /* @__PURE__ */ map(functorEvent);
var attr52 = /* @__PURE__ */ attr(attrSpan_StyleString);
var click2 = /* @__PURE__ */ click(attrOnClickEffectUnit);
var filterMap3 = /* @__PURE__ */ filterMap(filterableEvent);
var mapAccum4 = /* @__PURE__ */ mapAccum(eventIsEvent);
var applySecond6 = /* @__PURE__ */ applySecond(applyEffect);
var attr62 = /* @__PURE__ */ attr(attrA_HrefString);
var UIShown = /* @__PURE__ */ function() {
  function UIShown2() {
  }
  ;
  UIShown2.value = new UIShown2();
  return UIShown2;
}();
var AddTodo = /* @__PURE__ */ function() {
  function AddTodo2() {
  }
  ;
  AddTodo2.value = new AddTodo2();
  return AddTodo2;
}();
var ChangeText = /* @__PURE__ */ function() {
  function ChangeText2(value0) {
    this.value0 = value0;
  }
  ;
  ChangeText2.create = function(value0) {
    return new ChangeText2(value0);
  };
  return ChangeText2;
}();
var px4 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var events22 = function(options2) {
  return makePursx5(px4)({
    code: pre_([code_([text_(events3)])]),
    result: bussed(function(push2) {
      return lcmap5(function(v) {
        return alt10(pure24(UIShown.value))(v);
      })(function(event) {
        return div_([div_([input(oneOfMap6(pure24)([attr6(Style.value)("border-style:solid;border-width: 1px;border-color: black;"), attr15(OnInput.value)(cb(function(e) {
          return for_5(bind7(target(e))(fromEventTarget))(composeKleisli3(value2)(function($59) {
            return push2(ChangeText.create($59));
          }));
        })), attr24(OnKeyup.value)(cb(function(e) {
          return for_5(fromEvent(e))(function(evt) {
            return when3(code2(evt) === "Enter")(push2(AddTodo.value));
          });
        }))]))([]), button(alt10(pure24(attr32(Style.value)("margin: 5px;")))(pure24(attr42(OnClick.value)(cb($$const(push2(AddTodo.value)))))))([text_("Add")])]), dyn2(map24(function(txt) {
          return bind6(useDyn_)(function(v) {
            return div_([span2(pure24(attr52(Style.value)("margin: 5px;")))([text_(txt)]), button(alt10(pure24(attr32(Style.value)("margin: 5px;")))(click2(pure24(v.sendTo(0)))))([text_("Prioritize")]), button(alt10(pure24(attr32(Style.value)("margin: 5px;")))(click2(pure24(v.remove))))([text_("Delete")])]);
          });
        })(filterMap3(function(v) {
          if (v.value0) {
            return new Just(v.value1);
          }
          ;
          return Nothing.value;
        })(mapAccum4(function(a2) {
          return function(b2) {
            if (b2 instanceof ChangeText) {
              return new Tuple(b2.value0, new Tuple(false, b2.value0));
            }
            ;
            if (b2 instanceof AddTodo) {
              return new Tuple(a2, new Tuple(true, a2));
            }
            ;
            return new Tuple("", new Tuple(false, ""));
          };
        })("")(event))))]);
      });
    }),
    next: oneOfMap6(pure24)([attr42(OnClick.value)(cb(function(e) {
      return applySecond6(applySecond6(preventDefault(e))(options2.dpage(Portals.value)))(scrollToTop);
    })), attr62(Href.value)(options2.slug + "portals/")])
  });
};

// output/Deku.Example.Docs.HelloWorld/index.js
var pursxToElementConsInsert6 = /* @__PURE__ */ pursxToElementConsInsert();
var makePursx6 = /* @__PURE__ */ makePursx({
  reflectType: function() {
    return `<div>
  <h1>Hello world</h1>

  <h3>A small example</h3>

  <p>Here is "hello world" in Deku. In this and all the following sections, we'll start with a full example, and we'll pick it apart afterwards.</p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <p>You gotta start somewhere!</p>

  <h2>Our top-level component</h2>

  <p>Deku sets up shop in an arbitrary DOM component. In the main function above, we use \u{1F680} to automatically insert our Deku tree into the body.</p>

  <h2>Next steps</h2>
  <p>Now that we have our setup running, let's make a more interesting <a ~next~ style="cursor:pointer;">component</a>.</p>
</div>`;
  }
})()()(/* @__PURE__ */ pursxToElementConsInsert6(/* @__PURE__ */ pursxToElementConsAttr()(/* @__PURE__ */ pursxToElementConsInsert6(pursxToElementNil)({
  reflectType: function() {
    return "result";
  }
})({
  reflectSymbol: function() {
    return "result";
  }
}))({
  reflectType: function() {
    return "next";
  }
})({
  reflectSymbol: function() {
    return "next";
  }
}))({
  reflectType: function() {
    return "code";
  }
})({
  reflectSymbol: function() {
    return "code";
  }
}));
var oneOfMap7 = /* @__PURE__ */ oneOfMap(foldableArray)(plusEvent);
var pure25 = /* @__PURE__ */ pure(applicativeEvent);
var attr7 = /* @__PURE__ */ attr(attrOnClickCb);
var applySecond7 = /* @__PURE__ */ applySecond(applyEffect);
var attr16 = /* @__PURE__ */ attr(attrA_HrefString);
var px5 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var helloWorld2 = function(options2) {
  return makePursx6(px5)({
    code: pre_([code_([text_(helloWorld)])]),
    result: div_([text_("Hello world")]),
    next: oneOfMap7(pure25)([attr7(OnClick.value)(cb(function(e) {
      return applySecond7(applySecond7(preventDefault(e))(options2.dpage(SimpleComponent.value)))(scrollToTop);
    })), attr16(Href.value)(options2.slug + "component/")])
  });
};

// output/Deku.Example.Docs.Intro/index.js
var makePursx7 = /* @__PURE__ */ makePursx({
  reflectType: function() {
    return `<div>
  <h1>Deku</h1>

  <h3>A web micro-framework written in PureScript</h3>

  <p>Hi! You've found <a href="https://github.com/mikesol/purescript-deku">Deku</a>.</p>

  <p>Deku is the coolest web micro-framework that no one knows about yet. Except you, of course, as you're here. So welcome!</p>

  <p>The main goal of Deku is speed. I made it for the purpose of creating interactive web-based musical instruments, but it's equally useful as a general-purpose web framework. Its standard event-handling patterns tend to outperform those of React and Vue by a factor of 1.5-2x.</p>

  <p>This documentation is written in Deku and can be found <a href="https://github.com/mikesol/purescript-deku/tree/main/examples/docs">here</a>. One good way to follow along is by using the Deku starter repo, which you can clone <a href="https://github.com/mikesol/purescript-deku-starter">here</a>.</p>

  <p>And now, without further ado, check out the <a ~next~ style="cursor:pointer;">hello world section</a>!</p>
</div>`;
  }
})()()(/* @__PURE__ */ pursxToElementConsAttr()(pursxToElementNil)({
  reflectType: function() {
    return "next";
  }
})({
  reflectSymbol: function() {
    return "next";
  }
}));
var oneOfMap8 = /* @__PURE__ */ oneOfMap(foldableArray)(plusEvent);
var pure26 = /* @__PURE__ */ pure(applicativeEvent);
var attr8 = /* @__PURE__ */ attr(attrOnClickCb);
var applySecond8 = /* @__PURE__ */ applySecond(applyEffect);
var attr17 = /* @__PURE__ */ attr(attrA_HrefString);
var px6 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var intro = function(options2) {
  return makePursx7(px6)({
    next: oneOfMap8(pure26)([attr8(OnClick.value)(cb(function(e) {
      return applySecond8(applySecond8(preventDefault(e))(options2.dpage(HelloWorld.value)))(scrollToTop);
    })), attr17(Href.value)(options2.slug + "hello/")])
  });
};

// output/Deku.Example.Docs.Portals1/index.js
var pursxToElementConsInsert7 = /* @__PURE__ */ pursxToElementConsInsert();
var makePursx8 = /* @__PURE__ */ makePursx({
  reflectType: function() {
    return `<div>
  <h1>Portals</h1>

  <h2>Zapping from place to place</h2>
  <p>
    Sometimes, we have referentially opaque nodes like videos or audio that we can't destroy and recreate when they need to move around the DOM. In these cases, we can use portals to "zap" nodes from one part of the DOM to another.
  </p>

  <p>
    The code below uses portals to flip two videos across a boundary. If you press play on either video, you'll see that it keeps playing uninterrupted, event when it is removed and reinserted.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Events of portals</h2>

  <p>Portals work by sending a referentially-opaque reference to a DOM element into a closure where it can be safely used. Whenever an event is emitted containing the element, the element will be rendered at that place in the DOM, as in the example above. Note that portals "hog the blanket", meaning that they end up in the last place in which they were called.</p>

  <p><code>switcher</code> is a <a href="https://github.com/mikesol/purescript-deku/blob/ff3e2d2dc89b39088c5d5d6ab3492fb8730dd9a4/src/Deku/Control.purs#L325">small function</a> included in Deku to switch between different elements in an enclosure. It's how the tabs in this documentation are implemented as well.</p>

  <h2>Next steps</h2>
  <p>In this section, we used portals to move an element to different areas of the DOM. In the next section, we'll learn how to do <a ~next~ style="cursor:pointer;">static site rendering</a>.</p>
</div>`;
  }
})()()(/* @__PURE__ */ pursxToElementConsInsert7(/* @__PURE__ */ pursxToElementConsAttr()(/* @__PURE__ */ pursxToElementConsInsert7(pursxToElementNil)({
  reflectType: function() {
    return "result";
  }
})({
  reflectSymbol: function() {
    return "result";
  }
}))({
  reflectType: function() {
    return "next";
  }
})({
  reflectSymbol: function() {
    return "next";
  }
}))({
  reflectType: function() {
    return "code";
  }
})({
  reflectSymbol: function() {
    return "code";
  }
}));
var lcmap6 = /* @__PURE__ */ lcmap(profunctorFn);
var alt11 = /* @__PURE__ */ alt(altEvent);
var pure27 = /* @__PURE__ */ pure(applicativeEvent);
var portal2 = /* @__PURE__ */ portal();
var map25 = /* @__PURE__ */ map(functorVect);
var oneOfMap9 = /* @__PURE__ */ oneOfMap(foldableArray)(plusEvent);
var attr9 = /* @__PURE__ */ attr(attrVideo_ControlsString);
var attr18 = /* @__PURE__ */ attr(attrVideo_WidthString);
var attr25 = /* @__PURE__ */ attr(attrSource_SrcString);
var attr33 = /* @__PURE__ */ attr(attrSource_XtypeString);
var cons4 = /* @__PURE__ */ cons3()();
var index4 = /* @__PURE__ */ index2({
  reflectType: function() {
    return 1;
  }
})()()();
var index1 = /* @__PURE__ */ index2({
  reflectType: function() {
    return 0;
  }
})()()();
var fold5 = /* @__PURE__ */ fold3(eventIsEvent);
var pure110 = /* @__PURE__ */ pure(applicativeArray);
var attr43 = /* @__PURE__ */ attr(attrOnClickCb);
var applySecond9 = /* @__PURE__ */ applySecond(applyEffect);
var attr53 = /* @__PURE__ */ attr(attrA_HrefString);
var px7 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var portals12 = function(options2) {
  return makePursx8(px7)({
    code: pre_([code_([text_(portals1)])]),
    result: dyn2(bus2(function(push2) {
      return lcmap6(alt11(pure27(unit)))(function(event) {
        return pure27(insert_(portal2(map25(function(i2) {
          return video(oneOfMap9(pure27)([attr9(Controls.value)("true"), attr18(Width.value)("250")]))([source(oneOfMap9(pure27)([attr25(Src.value)(i2), attr33(Xtype.value)("video/mp4")]))([])]);
        })(cons4("https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4")(cons4("https://www.w3schools.com/jsref/movie.mp4")(empty5))))(function(v) {
          var p1 = index4($$Proxy.value)(v.value0);
          var p0 = index1($$Proxy.value)(v.value0);
          var ev = function(i2) {
            return fold5(function(a2) {
              return function(v2) {
                return !a2;
              };
            })(i2)(event);
          };
          var flips = function() {
            var $60 = switcher(function(v2) {
              if (v2) {
                return p0;
              }
              ;
              return p1;
            });
            return function($61) {
              return span_(pure110($60(ev($61))));
            };
          }();
          return div_([button(pure27(attr43(OnClick.value)(cb($$const(push2(unit))))))([text_("Switch videos")]), div_([flips(true), flips(false)])]);
        })));
      });
    })),
    next: oneOfMap9(pure27)([attr43(OnClick.value)(cb(function(e) {
      return applySecond9(applySecond9(preventDefault(e))(options2.dpage(SSR.value)))(scrollToTop);
    })), attr53(Href.value)(options2.slug + "ssr/")])
  });
};

// output/Deku.Example.Docs.Pursx1/index.js
var pursxToElementConsInsert8 = /* @__PURE__ */ pursxToElementConsInsert();
var makePursx9 = /* @__PURE__ */ makePursx({
  reflectType: function() {
    return `<div>
  <h1>PursX 1</h1>

  <h2>Like JSX... but better!</h2>

  <p>Writing out PureScript code for the DOM only really makes sense if you're doing some sort of interesting manipulations on the JS layer. Otherwise, it's pretty tedious and longer than HTML. Thankfully, there's a solution: PursX.</p>

  <p>PursX takes its name from JSX and it accomplishes a similar goal: the ability to embed HTML in your document. In the example below, we create the same exact component from the previous article, but in PursX.</p>

  ~code~

  <p>Here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Puurrrrrr ...sx</h2>

  <p>Static Pursx (meaning Pursx without any dynamic content) can be activated with the function <code>psx</code>.</p>

  <h2>Next steps</h2>
  <p>In this section, we used PursX to build the same component as the previous section. In the next section, we'll learn how to respond to <a ~next~ style="cursor:pointer;">events</a>.</p>
</div>`;
  }
})()()(/* @__PURE__ */ pursxToElementConsInsert8(/* @__PURE__ */ pursxToElementConsAttr()(/* @__PURE__ */ pursxToElementConsInsert8(pursxToElementNil)({
  reflectType: function() {
    return "result";
  }
})({
  reflectSymbol: function() {
    return "result";
  }
}))({
  reflectType: function() {
    return "next";
  }
})({
  reflectSymbol: function() {
    return "next";
  }
}))({
  reflectType: function() {
    return "code";
  }
})({
  reflectSymbol: function() {
    return "code";
  }
}));
var psx2 = /* @__PURE__ */ psx({
  reflectType: function() {
    return '<div>\n    <button>I do nothing</button>\n    <ul>\n        <li>A</li>\n        <li>B</li>\n        <li>C</li>\n    </ul>\n    <div>\n        <a href="https://example.com">foo</a>\n        <i>bar</i>\n        <span style="font-weight:800;">baz</span>\n    </div>\n    <svg height="100" width="100">\n      <circle cx="50" cy="50" r="40" stroke="black" stroke-width="3" fill="red" />\n    </svg> \n    </div>\n';
  }
})()(pursxToElementNil);
var oneOfMap10 = /* @__PURE__ */ oneOfMap(foldableArray)(plusEvent);
var pure28 = /* @__PURE__ */ pure(applicativeEvent);
var attr10 = /* @__PURE__ */ attr(attrOnClickCb);
var applySecond10 = /* @__PURE__ */ applySecond(applyEffect);
var attr19 = /* @__PURE__ */ attr(attrA_HrefString);
var px8 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var myDom = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var pursx12 = function(options2) {
  return makePursx9(px8)({
    code: pre_([code_([text_(pursx1)])]),
    result: psx2(myDom),
    next: oneOfMap10(pure28)([attr10(OnClick.value)(cb(function(e) {
      return applySecond10(applySecond10(preventDefault(e))(options2.dpage(Events.value)))(scrollToTop);
    })), attr19(Href.value)(options2.slug + "events1/")])
  });
};

// output/Deku.Example.Docs.Pursx2/index.js
var pursxToElementConsInsert9 = /* @__PURE__ */ pursxToElementConsInsert();
var pursxToElementConsAttr2 = /* @__PURE__ */ pursxToElementConsAttr();
var pursxToElementConsInsert1 = /* @__PURE__ */ pursxToElementConsInsert9(pursxToElementNil);
var makePursx$prime2 = /* @__PURE__ */ makePursx$prime({
  reflectType: function() {
    return `<div>
  <h1>Pursx 2</h1>

  <h2>Working with events and effects</h2>
  <p>
    PursX would be of limited utility if it could only render static content. In this section, we'll see how to make it dynamic, both by modifying existing elements and inserting entirely new ones.
  </p>

  <p>The example below is the same one from the Pursx 1 section with two differences. The first is that the background color of the second list item is set dynamically. The second is that there is a new button that is dynamically inserted.
  </p>

  ?code?

  <p>And here's what it produces:</p>

  <blockquote> ?result? </blockquote>

  <h2>Dynamism in static content</h2>
  <p>Named slots for dynamic content are added to PursX with between two tildes, like <code>~foo~</code>. This separator doesn't have to be a tilde - it can be set programatically as well (see the Deku/Pursx.purs module for an example of how that is done). Also, we no longer use the <code>psx</code> command. Instead, we use the infix operator <code>~~</code> followed by arguments to our template. In the case of dynamic attributes, the argument is a stream of attributes. In the case of a dynamic section, the arguments are of type <code>Element</code>.</p>

  <h2>Next steps</h2>
  <p>In more complicated apps, like this documentation, we'll need dynamic logic that allows for components to replace each other, for example in a navigation bar. In the next section, we'll see one way to do this by using <a ?next? style="cursor:pointer;">events to control the presence and absence of elements</a>.</p>
</div>`;
  }
})({
  reflectType: function() {
    return "?";
  }
})()()(/* @__PURE__ */ pursxToElementConsInsert9(/* @__PURE__ */ pursxToElementConsAttr2(/* @__PURE__ */ pursxToElementConsInsert1({
  reflectType: function() {
    return "result";
  }
})({
  reflectSymbol: function() {
    return "result";
  }
}))({
  reflectType: function() {
    return "next";
  }
})({
  reflectSymbol: function() {
    return "next";
  }
}))({
  reflectType: function() {
    return "code";
  }
})({
  reflectSymbol: function() {
    return "code";
  }
}));
var pure29 = /* @__PURE__ */ pure(applicativeEvent);
var makePursx10 = /* @__PURE__ */ makePursx({
  reflectType: function() {
    return '<div>\n        <button>I do nothing</button>\n        <ul>\n          <li>A</li>\n          <li ~myli~>B</li>\n          <li>C</li>\n        </ul>\n        <div>\n          <a href="https://github.com/mikesol/purescript-deku"></a>\n          <i>bar</i>\n          ~somethingNew~\n          <span style="font-weight:800;">baz</span>\n        </div>\n        <div><div></div><div><input type="range"/></div></div>\n      </div>\n';
  }
})()()(/* @__PURE__ */ pursxToElementConsAttr2(/* @__PURE__ */ pursxToElementConsInsert1({
  reflectType: function() {
    return "somethingNew";
  }
})({
  reflectSymbol: function() {
    return "somethingNew";
  }
}))({
  reflectType: function() {
    return "myli";
  }
})({
  reflectSymbol: function() {
    return "myli";
  }
}));
var attr11 = /* @__PURE__ */ attr(attrLi_StyleString);
var attr110 = /* @__PURE__ */ attr(attrOnClickEffectUnit);
var alt12 = /* @__PURE__ */ alt(altEvent);
var voidLeft4 = /* @__PURE__ */ voidLeft(functorEvent);
var compact3 = /* @__PURE__ */ compact(compactableEvent);
var oneOfMap11 = /* @__PURE__ */ oneOfMap(foldableArray)(plusEvent);
var attr26 = /* @__PURE__ */ attr(attrOnClickCb);
var applySecond11 = /* @__PURE__ */ applySecond(applyEffect);
var attr34 = /* @__PURE__ */ attr(attrA_HrefString);
var px9 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var myDom2 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var pursx22 = function(options2) {
  return makePursx$prime2($$Proxy.value)(px9)({
    code: pre_([code_([text_(pursx2)])]),
    result: dyn2(bus2(function(push2) {
      return function(event) {
        return pure29(insert_(makePursx10(myDom2)({
          myli: pure29(attr11(Style.value)("background-color:rgb(200,240,210);")),
          somethingNew: button(pure29(attr110(OnClick.value)(push2(new Just(unit)))))([text(alt12(voidLeft4(compact3(event))("Thanks for clicking me!"))(pure29("I was dynamically inserted")))])
        })));
      };
    })),
    next: oneOfMap11(pure29)([attr26(OnClick.value)(cb(function(e) {
      return applySecond11(applySecond11(preventDefault(e))(options2.dpage(Events2.value)))(scrollToTop);
    })), attr34(Href.value)(options2.slug + "events2/")])
  });
};

// output/Random.LCG/index.js
var mod2 = /* @__PURE__ */ mod(euclideanRingInt);
var fromJust3 = /* @__PURE__ */ fromJust();
var unSeed = function(v) {
  return v;
};
var seedMin = 1;
var lcgM = 2147483647;
var seedMax = /* @__PURE__ */ function() {
  return lcgM - 1 | 0;
}();
var mkSeed = function(x) {
  var ensureBetween = function(min5) {
    return function(max6) {
      return function(n) {
        var rangeSize = max6 - min5 | 0;
        var n$prime = mod2(n)(rangeSize);
        var $25 = n$prime < min5;
        if ($25) {
          return n$prime + max6 | 0;
        }
        ;
        return n$prime;
      };
    };
  };
  return ensureBetween(seedMin)(seedMax)(x);
};
var lcgC = 0;
var lcgA = 48271;
var lcgPerturb = function(d) {
  return function(v) {
    return fromJust3(fromNumber(remainder(toNumber(lcgA) * toNumber(v) + toNumber(d))(toNumber(lcgM))));
  };
};
var lcgNext = /* @__PURE__ */ lcgPerturb(lcgC);

// output/Control.Monad.State.Trans/index.js
var functorStateT = function(dictFunctor) {
  var map31 = map(dictFunctor);
  return {
    map: function(f) {
      return function(v) {
        return function(s2) {
          return map31(function(v1) {
            return new Tuple(f(v1.value0), v1.value1);
          })(v(s2));
        };
      };
    }
  };
};
var monadStateT = function(dictMonad) {
  return {
    Applicative0: function() {
      return applicativeStateT(dictMonad);
    },
    Bind1: function() {
      return bindStateT(dictMonad);
    }
  };
};
var bindStateT = function(dictMonad) {
  var bind11 = bind(dictMonad.Bind1());
  return {
    bind: function(v) {
      return function(f) {
        return function(s2) {
          return bind11(v(s2))(function(v1) {
            var v3 = f(v1.value0);
            return v3(v1.value1);
          });
        };
      };
    },
    Apply0: function() {
      return applyStateT(dictMonad);
    }
  };
};
var applyStateT = function(dictMonad) {
  var functorStateT1 = functorStateT(dictMonad.Bind1().Apply0().Functor0());
  return {
    apply: ap(monadStateT(dictMonad)),
    Functor0: function() {
      return functorStateT1;
    }
  };
};
var applicativeStateT = function(dictMonad) {
  var pure35 = pure(dictMonad.Applicative0());
  return {
    pure: function(a2) {
      return function(s2) {
        return pure35(new Tuple(a2, s2));
      };
    },
    Apply0: function() {
      return applyStateT(dictMonad);
    }
  };
};
var monadStateStateT = function(dictMonad) {
  var pure35 = pure(dictMonad.Applicative0());
  var monadStateT1 = monadStateT(dictMonad);
  return {
    state: function(f) {
      return function($200) {
        return pure35(f($200));
      };
    },
    Monad0: function() {
      return monadStateT1;
    }
  };
};

// output/Control.Monad.State/index.js
var execState = function(v) {
  return function(s2) {
    var v1 = v(s2);
    return v1.value1;
  };
};
var evalState = function(v) {
  return function(s2) {
    var v1 = v(s2);
    return v1.value0;
  };
};

// output/Test.QuickCheck.Gen/index.js
var monadStateStateT2 = /* @__PURE__ */ monadStateStateT(monadIdentity);
var state2 = /* @__PURE__ */ state(monadStateStateT2);
var functorStateT2 = /* @__PURE__ */ functorStateT(functorIdentity);
var mul2 = /* @__PURE__ */ mul(semiringNumber);
var add2 = /* @__PURE__ */ add(semiringNumber);
var unGen = function(v) {
  return v;
};
var lcgStep = /* @__PURE__ */ function() {
  var f = function(s2) {
    return new Tuple(unSeed(s2.newSeed), function() {
      var $94 = {};
      for (var $95 in s2) {
        if ({}.hasOwnProperty.call(s2, $95)) {
          $94[$95] = s2[$95];
        }
        ;
      }
      ;
      $94.newSeed = lcgNext(s2.newSeed);
      return $94;
    }());
  };
  return state2(f);
}();
var functorGen = functorStateT2;
var map26 = /* @__PURE__ */ map(functorGen);
var evalGen = function($104) {
  return evalState(unGen($104));
};
var applyGen = /* @__PURE__ */ applyStateT(monadIdentity);
var apply6 = /* @__PURE__ */ apply(applyGen);
var chooseInt$prime = function(a2) {
  return function(b2) {
    var numB = toNumber(b2);
    var numA = toNumber(a2);
    var clamp = function(x) {
      return numA + remainder(x)(numB - numA + 1);
    };
    var choose31BitPosNumber = map26(toNumber)(lcgStep);
    var choose32BitPosNumber = apply6(map26(add2)(choose31BitPosNumber))(map26(mul2(2))(choose31BitPosNumber));
    return map26(function($109) {
      return floor2(clamp($109));
    })(choose32BitPosNumber);
  };
};
var chooseInt2 = function(a2) {
  return function(b2) {
    var $101 = a2 <= b2;
    if ($101) {
      return chooseInt$prime(a2)(b2);
    }
    ;
    return chooseInt$prime(b2)(a2);
  };
};

// output/Test.QuickCheck.Arbitrary/index.js
var arbitrary = function(dict) {
  return dict.arbitrary;
};
var arbInt = /* @__PURE__ */ function() {
  return {
    arbitrary: chooseInt2(-1e6 | 0)(1e6)
  };
}();

// output/Deku.Interpret/index.js
var $$void9 = /* @__PURE__ */ $$void(functorST);
var append8 = /* @__PURE__ */ append(semigroupArray);
var show5 = /* @__PURE__ */ show(showInt);
var arbitrary2 = /* @__PURE__ */ arbitrary(arbInt);
var add3 = /* @__PURE__ */ add(semiringInt);
var pure30 = /* @__PURE__ */ pure(applicativeST);
var MakeElement = /* @__PURE__ */ function() {
  function MakeElement2(value0) {
    this.value0 = value0;
  }
  ;
  MakeElement2.create = function(value0) {
    return new MakeElement2(value0);
  };
  return MakeElement2;
}();
var MakeText = /* @__PURE__ */ function() {
  function MakeText2(value0) {
    this.value0 = value0;
  }
  ;
  MakeText2.create = function(value0) {
    return new MakeText2(value0);
  };
  return MakeText2;
}();
var MakeOpenDynBeacon = /* @__PURE__ */ function() {
  function MakeOpenDynBeacon2(value0) {
    this.value0 = value0;
  }
  ;
  MakeOpenDynBeacon2.create = function(value0) {
    return new MakeOpenDynBeacon2(value0);
  };
  return MakeOpenDynBeacon2;
}();
var MakeCloseDynBeacon = /* @__PURE__ */ function() {
  function MakeCloseDynBeacon2(value0) {
    this.value0 = value0;
  }
  ;
  MakeCloseDynBeacon2.create = function(value0) {
    return new MakeCloseDynBeacon2(value0);
  };
  return MakeCloseDynBeacon2;
}();
var MakePursx = /* @__PURE__ */ function() {
  function MakePursx2(value0) {
    this.value0 = value0;
  }
  ;
  MakePursx2.create = function(value0) {
    return new MakePursx2(value0);
  };
  return MakePursx2;
}();
var SetProp = /* @__PURE__ */ function() {
  function SetProp2(value0) {
    this.value0 = value0;
  }
  ;
  SetProp2.create = function(value0) {
    return new SetProp2(value0);
  };
  return SetProp2;
}();
var SetText = /* @__PURE__ */ function() {
  function SetText2(value0) {
    this.value0 = value0;
  }
  ;
  SetText2.create = function(value0) {
    return new SetText2(value0);
  };
  return SetText2;
}();
var UnsetAttribute = /* @__PURE__ */ function() {
  function UnsetAttribute2(value0) {
    this.value0 = value0;
  }
  ;
  UnsetAttribute2.create = function(value0) {
    return new UnsetAttribute2(value0);
  };
  return UnsetAttribute2;
}();
var SendToPos = /* @__PURE__ */ function() {
  function SendToPos2(value0) {
    this.value0 = value0;
  }
  ;
  SendToPos2.create = function(value0) {
    return new SendToPos2(value0);
  };
  return SendToPos2;
}();
var MakeRoot = /* @__PURE__ */ function() {
  function MakeRoot2(value0) {
    this.value0 = value0;
  }
  ;
  MakeRoot2.create = function(value0) {
    return new MakeRoot2(value0);
  };
  return MakeRoot2;
}();
var GiveNewParent = /* @__PURE__ */ function() {
  function GiveNewParent2(value0) {
    this.value0 = value0;
  }
  ;
  GiveNewParent2.create = function(value0) {
    return new GiveNewParent2(value0);
  };
  return GiveNewParent2;
}();
var DisconnectElement = /* @__PURE__ */ function() {
  function DisconnectElement2(value0) {
    this.value0 = value0;
  }
  ;
  DisconnectElement2.create = function(value0) {
    return new DisconnectElement2(value0);
  };
  return DisconnectElement2;
}();
var RemoveDynBeacon = /* @__PURE__ */ function() {
  function RemoveDynBeacon2(value0) {
    this.value0 = value0;
  }
  ;
  RemoveDynBeacon2.create = function(value0) {
    return new RemoveDynBeacon2(value0);
  };
  return RemoveDynBeacon2;
}();
var DeleteFromCache = /* @__PURE__ */ function() {
  function DeleteFromCache2(value0) {
    this.value0 = value0;
  }
  ;
  DeleteFromCache2.create = function(value0) {
    return new DeleteFromCache2(value0);
  };
  return DeleteFromCache2;
}();
var RenderableInstruction = /* @__PURE__ */ function() {
  function RenderableInstruction2(value0) {
    this.value0 = value0;
  }
  ;
  RenderableInstruction2.create = function(value0) {
    return new RenderableInstruction2(value0);
  };
  return RenderableInstruction2;
}();
var EliminatableInstruction = /* @__PURE__ */ function() {
  function EliminatableInstruction2(value0) {
    this.value0 = value0;
  }
  ;
  EliminatableInstruction2.create = function(value0) {
    return new EliminatableInstruction2(value0);
  };
  return EliminatableInstruction2;
}();
var ssrUnsetAttribute = function(a2) {
  return function(i2) {
    return $$void9(modify2(function(v) {
      return append8(v)([new RenderableInstruction(new UnsetAttribute(a2))]);
    })(i2));
  };
};
var ssrSetText = function(a2) {
  return function(i2) {
    return $$void9(modify2(function(v) {
      return append8(v)([new RenderableInstruction(new SetText(a2))]);
    })(i2));
  };
};
var ssrSetProp = function(a2) {
  return function(i2) {
    return $$void9(modify2(function(v) {
      return append8(v)([new RenderableInstruction(new SetProp(a2))]);
    })(i2));
  };
};
var ssrSendToPos = function(a2) {
  return function(i2) {
    return $$void9(modify2(function(v) {
      return append8(v)([new EliminatableInstruction(new SendToPos(a2))]);
    })(i2));
  };
};
var ssrRemoveDynBeacon = function(a2) {
  return function(i2) {
    return $$void9(modify2(function(v) {
      return append8(v)([new EliminatableInstruction(new RemoveDynBeacon(a2))]);
    })(i2));
  };
};
var ssrMakeText = function(a2) {
  return function(i2) {
    return $$void9(modify2(function(v) {
      return append8(v)([new RenderableInstruction(new MakeText(a2))]);
    })(i2));
  };
};
var ssrMakeRoot = function(a2) {
  return function(i2) {
    return $$void9(modify2(function(v) {
      return append8(v)([new EliminatableInstruction(new MakeRoot(a2))]);
    })(i2));
  };
};
var ssrMakePursx = function(a2) {
  return function(i2) {
    return $$void9(modify2(function(v) {
      return append8(v)([new RenderableInstruction(new MakePursx(a2))]);
    })(i2));
  };
};
var ssrMakeElement = function(a2) {
  return function(i2) {
    return $$void9(modify2(function(v) {
      return append8(v)([new RenderableInstruction(new MakeElement(a2))]);
    })(i2));
  };
};
var ssrMakeDynBeacon = function(a2) {
  return function(i2) {
    return $$void9(modify2(function(v) {
      return append8(v)([new RenderableInstruction(new MakeOpenDynBeacon(a2)), new RenderableInstruction(new MakeCloseDynBeacon(a2))]);
    })(i2));
  };
};
var ssrGiveNewParent = function(a2) {
  return function(i2) {
    return $$void9(modify2(function(v) {
      return append8(v)([new EliminatableInstruction(new GiveNewParent(a2))]);
    })(i2));
  };
};
var ssrDisconnectElement = function(a2) {
  return function(i2) {
    return $$void9(modify2(function(v) {
      return append8(v)([new EliminatableInstruction(new DisconnectElement(a2))]);
    })(i2));
  };
};
var ssrDeleteFromCache = function(a2) {
  return function(i2) {
    return $$void9(modify2(function(v) {
      return append8(v)([new EliminatableInstruction(new DeleteFromCache(a2))]);
    })(i2));
  };
};
var ssrDOMInterpret = function(seed) {
  return {
    ids: function __do3() {
      var s2 = read(seed)();
      var o = show5(evalGen(arbitrary2)({
        newSeed: mkSeed(s2),
        size: 5
      }));
      $$void9(modify2(add3(1))(seed))();
      return o;
    },
    makeElement: ssrMakeElement,
    attributeParent: function(v) {
      return function(v1) {
        return pure30(unit);
      };
    },
    makeRoot: ssrMakeRoot,
    makeText: ssrMakeText,
    makePursx: ssrMakePursx,
    setProp: ssrSetProp,
    unsetAttribute: ssrUnsetAttribute,
    makeDynBeacon: ssrMakeDynBeacon,
    setCb: function(v) {
      return function(v1) {
        return pure30(unit);
      };
    },
    setText: ssrSetText,
    sendToPos: ssrSendToPos,
    deleteFromCache: ssrDeleteFromCache,
    removeDynBeacon: ssrRemoveDynBeacon,
    giveNewParent: ssrGiveNewParent,
    disconnectElement: ssrDisconnectElement
  };
};

// output/Deku.SSR/foreign.js
var encodedString = (rawStr) => rawStr.replace(/[\u00A0-\u9999<>\&]/g, function(i2) {
  return "&#" + i2.charCodeAt(0) + ";";
});
var doPursxReplacements = ({ id: id2, html: html2, pxScope, cache, verb }) => {
  let vhtml = html2;
  const entries = Object.entries(cache);
  for (var i2 = 0; i2 < entries.length; i2++) {
    const key2 = entries[i2][0];
    if (entries[i2][1] === true) {
      vhtml = vhtml.replace(
        verb + key2 + verb,
        'data-deku-attr-internal="' + key2 + '" data-deku-ssr="' + key2 + "@!%" + pxScope + '"'
      );
    } else {
      vhtml = vhtml.replace(
        verb + key2 + verb,
        '<span style="display:contents;" data-deku-elt-internal="' + key2 + '" data-deku-ssr="' + key2 + "@!%" + pxScope + '"></span>'
      );
    }
  }
  const gtix = vhtml.indexOf(">");
  const cix = vhtml.indexOf("/>");
  const ix = cix == gtix - 1 ? cix : gtix;
  return vhtml.slice(0, ix) + ' data-deku-ssr="' + id2 + '" ' + vhtml.slice(ix);
};

// output/Data.CatQueue/index.js
var $runtime_lazy6 = function(name16, moduleName, init3) {
  var state4 = 0;
  var val;
  return function(lineNumber) {
    if (state4 === 2)
      return val;
    if (state4 === 1)
      throw new ReferenceError(name16 + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state4 = 1;
    val = init3();
    state4 = 2;
    return val;
  };
};
var map27 = /* @__PURE__ */ map(functorList);
var CatQueue = /* @__PURE__ */ function() {
  function CatQueue2(value0, value1) {
    this.value0 = value0;
    this.value1 = value1;
  }
  ;
  CatQueue2.create = function(value0) {
    return function(value1) {
      return new CatQueue2(value0, value1);
    };
  };
  return CatQueue2;
}();
var unsnoc3 = function($copy_v) {
  var $tco_done = false;
  var $tco_result;
  function $tco_loop(v) {
    if (v.value1 instanceof Cons) {
      $tco_done = true;
      return new Just(new Tuple(v.value1.value0, new CatQueue(v.value0, v.value1.value1)));
    }
    ;
    if (v.value0 instanceof Nil && v.value1 instanceof Nil) {
      $tco_done = true;
      return Nothing.value;
    }
    ;
    if (v.value1 instanceof Nil) {
      $copy_v = new CatQueue(Nil.value, reverse2(v.value0));
      return;
    }
    ;
    throw new Error("Failed pattern match at Data.CatQueue (line 92, column 1 - line 92, column 63): " + [v.constructor.name]);
  }
  ;
  while (!$tco_done) {
    $tco_result = $tco_loop($copy_v);
  }
  ;
  return $tco_result;
};
var uncons3 = function($copy_v) {
  var $tco_done = false;
  var $tco_result;
  function $tco_loop(v) {
    if (v.value0 instanceof Nil && v.value1 instanceof Nil) {
      $tco_done = true;
      return Nothing.value;
    }
    ;
    if (v.value0 instanceof Nil) {
      $copy_v = new CatQueue(reverse2(v.value1), Nil.value);
      return;
    }
    ;
    if (v.value0 instanceof Cons) {
      $tco_done = true;
      return new Just(new Tuple(v.value0.value0, new CatQueue(v.value0.value1, v.value1)));
    }
    ;
    throw new Error("Failed pattern match at Data.CatQueue (line 82, column 1 - line 82, column 63): " + [v.constructor.name]);
  }
  ;
  while (!$tco_done) {
    $tco_result = $tco_loop($copy_v);
  }
  ;
  return $tco_result;
};
var snoc3 = function(v) {
  return function(a2) {
    return new CatQueue(v.value0, new Cons(a2, v.value1));
  };
};
var functorCatQueue = {
  map: function(f) {
    return function(v) {
      return new CatQueue(map27(f)(v.value0), map27(f)(v.value1));
    };
  }
};
var foldableCatQueue = {
  foldMap: function(dictMonoid) {
    return foldMapDefaultL(foldableCatQueue)(dictMonoid);
  },
  foldr: function(f) {
    return foldrDefault(foldableCatQueue)(f);
  },
  foldl: function(f) {
    var go2 = function($copy_acc) {
      return function($copy_q) {
        var $tco_var_acc = $copy_acc;
        var $tco_done = false;
        var $tco_result;
        function $tco_loop(acc, q2) {
          var v = uncons3(q2);
          if (v instanceof Just) {
            $tco_var_acc = f(acc)(v.value0.value0);
            $copy_q = v.value0.value1;
            return;
          }
          ;
          if (v instanceof Nothing) {
            $tco_done = true;
            return acc;
          }
          ;
          throw new Error("Failed pattern match at Data.CatQueue (line 147, column 16 - line 149, column 22): " + [v.constructor.name]);
        }
        ;
        while (!$tco_done) {
          $tco_result = $tco_loop($tco_var_acc, $copy_q);
        }
        ;
        return $tco_result;
      };
    };
    return go2;
  }
};
var foldl5 = /* @__PURE__ */ foldl(foldableCatQueue);
var semigroupCatQueue = {
  append: /* @__PURE__ */ foldl5(snoc3)
};
var empty10 = /* @__PURE__ */ function() {
  return new CatQueue(Nil.value, Nil.value);
}();
var monoidCatQueue = {
  mempty: empty10,
  Semigroup0: function() {
    return semigroupCatQueue;
  }
};
var singleton11 = /* @__PURE__ */ snoc3(empty10);
var fromFoldable5 = function(dictFoldable) {
  var foldMap5 = foldMap(dictFoldable)(monoidCatQueue);
  return function(f) {
    return foldMap5(singleton11)(f);
  };
};
var traversableCatQueue = {
  traverse: function(dictApplicative) {
    var Apply0 = dictApplicative.Apply0();
    var map112 = map(Apply0.Functor0());
    var lift24 = lift2(Apply0);
    var pure35 = pure(dictApplicative);
    return function(f) {
      var $123 = map112(foldl5(snoc3)(empty10));
      var $124 = foldl5(function(acc) {
        var $126 = lift24(snoc3)(acc);
        return function($127) {
          return $126(f($127));
        };
      })(pure35(empty10));
      return function($125) {
        return $123($124($125));
      };
    };
  },
  sequence: function(dictApplicative) {
    return sequenceDefault(traversableCatQueue)(dictApplicative);
  },
  Functor0: function() {
    return functorCatQueue;
  },
  Foldable1: function() {
    return foldableCatQueue;
  }
};
var cons6 = function(a2) {
  return function(v) {
    return new CatQueue(new Cons(a2, v.value0), v.value1);
  };
};
var monadCatQueue = {
  Applicative0: function() {
    return applicativeCatQueue;
  },
  Bind1: function() {
    return bindCatQueue;
  }
};
var bindCatQueue = {
  bind: /* @__PURE__ */ flip(/* @__PURE__ */ foldMap(foldableCatQueue)(monoidCatQueue)),
  Apply0: function() {
    return $lazy_applyCatQueue(0);
  }
};
var applicativeCatQueue = {
  pure: singleton11,
  Apply0: function() {
    return $lazy_applyCatQueue(0);
  }
};
var $lazy_applyCatQueue = /* @__PURE__ */ $runtime_lazy6("applyCatQueue", "Data.CatQueue", function() {
  return {
    apply: ap(monadCatQueue),
    Functor0: function() {
      return functorCatQueue;
    }
  };
});

// output/Deku.SSR/index.js
var $runtime_lazy7 = function(name16, moduleName, init3) {
  var state4 = 0;
  var val;
  return function(lineNumber) {
    if (state4 === 2)
      return val;
    if (state4 === 1)
      throw new ReferenceError(name16 + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state4 = 1;
    val = init3();
    state4 = 2;
    return val;
  };
};
var append9 = /* @__PURE__ */ append(semigroupArray);
var unwrap8 = /* @__PURE__ */ unwrap();
var map28 = /* @__PURE__ */ map(functorArray);
var join2 = /* @__PURE__ */ join(bindArray);
var mapFlipped3 = /* @__PURE__ */ mapFlipped(functorArray);
var $$void10 = /* @__PURE__ */ $$void(/* @__PURE__ */ functorStateT(functorIdentity));
var modify7 = /* @__PURE__ */ modify6(/* @__PURE__ */ monadStateStateT(monadIdentity));
var alter2 = /* @__PURE__ */ alter(ordString);
var filterMap4 = /* @__PURE__ */ filterMap(filterableArray);
var discard3 = /* @__PURE__ */ discard(discardUnit)(/* @__PURE__ */ bindStateT(monadIdentity));
var eq13 = /* @__PURE__ */ eq(/* @__PURE__ */ eqMaybe(eqString));
var append13 = /* @__PURE__ */ append(semigroupCatQueue);
var pure31 = /* @__PURE__ */ pure(applicativeCatQueue);
var map110 = /* @__PURE__ */ map(functorCatQueue);
var fromFoldable6 = /* @__PURE__ */ fromFoldable5(foldableArray);
var mapFlipped1 = /* @__PURE__ */ mapFlipped(functorMap);
var bind8 = /* @__PURE__ */ bind(bindMaybe);
var lookup3 = /* @__PURE__ */ lookup2(ordString);
var compact4 = /* @__PURE__ */ compact(compactableArray);
var applicativeStateT2 = /* @__PURE__ */ applicativeStateT(monadIdentity);
var traverse3 = /* @__PURE__ */ traverse(traversableCatQueue)(applicativeStateT2);
var for_6 = /* @__PURE__ */ for_(applicativeStateT2)(foldableMaybe);
var intercalate3 = /* @__PURE__ */ intercalate(foldableArray)(monoidString);
var foldMap4 = /* @__PURE__ */ foldMap(foldableArray)(monoidString);
var foldl6 = /* @__PURE__ */ foldl(foldableMap);
var toSortableDyns = function(a2) {
  var go2 = function(acc) {
    return function(currentDyn) {
      return function($383) {
        return function(v) {
          if (v instanceof Nothing) {
            return {
              acc,
              rest: []
            };
          }
          ;
          if (v instanceof Just) {
            if (v.value0.head instanceof MakeOpenDynBeacon) {
              var ar = go2([])(new Just({
                id: v.value0.head.value0.id,
                e: v.value0.head.value0
              }))(v.value0.tail);
              return go2(append9(acc)(ar.acc))(currentDyn)(ar.rest);
            }
            ;
            if (v.value0.head instanceof MakeCloseDynBeacon) {
              if (currentDyn instanceof Just) {
                return {
                  acc: [{
                    pos: currentDyn.value0.e.pos,
                    elt: new Right({
                      o: currentDyn.value0.e,
                      a: acc,
                      c: v.value0.head.value0
                    })
                  }],
                  rest: v.value0.tail
                };
              }
              ;
              if (currentDyn instanceof Nothing) {
                return {
                  acc: [],
                  rest: []
                };
              }
              ;
              throw new Error("Failed pattern match at Deku.SSR (line 58, column 34 - line 66, column 41): " + [currentDyn.constructor.name]);
            }
            ;
            var pos$prime = function() {
              if (v.value0.head instanceof MakeElement) {
                return v.value0.head.value0.pos;
              }
              ;
              if (v.value0.head instanceof MakeText) {
                return v.value0.head.value0.pos;
              }
              ;
              if (v.value0.head instanceof MakePursx) {
                return v.value0.head.value0.pos;
              }
              ;
              if (v.value0.head instanceof MakeOpenDynBeacon) {
                return v.value0.head.value0.pos;
              }
              ;
              if (v.value0.head instanceof MakeCloseDynBeacon) {
                return v.value0.head.value0.pos;
              }
              ;
              if (v.value0.head instanceof SetProp) {
                return Nothing.value;
              }
              ;
              if (v.value0.head instanceof UnsetAttribute) {
                return Nothing.value;
              }
              ;
              if (v.value0.head instanceof SetText) {
                return Nothing.value;
              }
              ;
              throw new Error("Failed pattern match at Deku.SSR (line 69, column 18 - line 77, column 33): " + [v.value0.head.constructor.name]);
            }();
            return go2(append9(acc)([{
              pos: pos$prime,
              elt: new Left(v.value0.head)
            }]))(currentDyn)(v.value0.tail);
          }
          ;
          throw new Error("Failed pattern match at Deku.SSR (line 52, column 40 - line 79, column 15): " + [v.constructor.name]);
        }(uncons($383));
      };
    };
  };
  return go2([])(Nothing.value)(a2).acc;
};
var $lazy_sortSortableDyns = /* @__PURE__ */ $runtime_lazy7("sortSortableDyns", "Deku.SSR", function() {
  var $384 = map28(function(v) {
    if (v.elt instanceof Left) {
      return v;
    }
    ;
    if (v.elt instanceof Right) {
      return {
        pos: v.pos,
        elt: new Right({
          o: v.elt.value0.o,
          c: v.elt.value0.c,
          a: $lazy_sortSortableDyns(47)(v.elt.value0.a)
        })
      };
    }
    ;
    throw new Error("Failed pattern match at Deku.SSR (line 44, column 5 - line 47, column 81): " + [v.elt.constructor.name]);
  });
  var $385 = sortBy(on(compare(ordMaybe(ordInt)))(function($387) {
    return function(v) {
      return v.pos;
    }(unwrap8($387));
  }));
  return function($386) {
    return $384($385($386));
  };
});
var sortSortableDyns = /* @__PURE__ */ $lazy_sortSortableDyns(41);
var fromSortableDyns = function(arr) {
  return join2(mapFlipped3(arr)(function($388) {
    return function(v) {
      if (v instanceof Left) {
        return [v.value0];
      }
      ;
      if (v instanceof Right) {
        return append9([new MakeOpenDynBeacon(v.value0.o)])(append9(fromSortableDyns(v.value0.a))([new MakeCloseDynBeacon(v.value0.c)]));
      }
      ;
      throw new Error("Failed pattern match at Deku.SSR (line 35, column 26 - line 38, column 33): " + [v.constructor.name]);
    }(function(v) {
      return v.elt;
    }(unwrap8($388)));
  }));
};
var ssr$prime = function(topTag) {
  return function(arr$prime) {
    var unsetting = function(id2) {
      return function(key2) {
        return $$void10(modify7(function(s2) {
          var $123 = {};
          for (var $124 in s2) {
            if ({}.hasOwnProperty.call(s2, $124)) {
              $123[$124] = s2[$124];
            }
            ;
          }
          ;
          $123.idToActions = alter2(function(v1) {
            if (v1 instanceof Just) {
              return new Just(filterMap4(function(v2) {
                if (v2 instanceof SetProp) {
                  if (v2.value0.key === key2) {
                    return Nothing.value;
                  }
                  ;
                  if (otherwise) {
                    return new Just(new SetProp(v2.value0));
                  }
                  ;
                }
                ;
                return new Just(v2);
              })(v1.value0));
            }
            ;
            if (v1 instanceof Nothing) {
              return Nothing.value;
            }
            ;
            throw new Error("Failed pattern match at Deku.SSR (line 296, column 17 - line 307, column 37): " + [v1.constructor.name]);
          })(id2)(s2.idToActions);
          return $123;
        }));
      };
    };
    var setting = function(id2) {
      return function(action2) {
        return $$void10(modify7(function(s2) {
          var $128 = {};
          for (var $129 in s2) {
            if ({}.hasOwnProperty.call(s2, $129)) {
              $128[$129] = s2[$129];
            }
            ;
          }
          ;
          $128.idToActions = alter2(function(v1) {
            if (v1 instanceof Just) {
              return new Just(append9(v1.value0)([action2]));
            }
            ;
            if (v1 instanceof Nothing) {
              return new Just([action2]);
            }
            ;
            throw new Error("Failed pattern match at Deku.SSR (line 317, column 17 - line 319, column 45): " + [v1.constructor.name]);
          })(id2)(s2.idToActions);
          return $128;
        }));
      };
    };
    var rootId = fromMaybe("deku-root")(findMap(function(v2) {
      if (v2 instanceof EliminatableInstruction && v2.value0 instanceof MakeRoot) {
        return new Just(v2.value0.value0.id);
      }
      ;
      return Nothing.value;
    })(arr$prime));
    var making = function(parent2) {
      return function(id2) {
        return function(action2) {
          return discard3($$void10(modify7(function(s2) {
            var $137 = {};
            for (var $138 in s2) {
              if ({}.hasOwnProperty.call(s2, $138)) {
                $137[$138] = s2[$138];
              }
              ;
            }
            ;
            $137.parentToChild = alter2(function(v1) {
              if (v1 instanceof Just) {
                return new Just(append9(v1.value0)([id2]));
              }
              ;
              if (v1 instanceof Nothing) {
                return new Just([id2]);
              }
              ;
              throw new Error("Failed pattern match at Deku.SSR (line 283, column 19 - line 285, column 43): " + [v1.constructor.name]);
            })(parent2)(s2.parentToChild);
            return $137;
          })))(function() {
            return setting(id2)(action2);
          });
        };
      };
    };
    var instructionsToRenderableInstructions = function(aa) {
      var sendPos = function(id$prime) {
        return function(pos$prime) {
          return function(v2) {
            if (v2 instanceof MakeElement) {
              var $141 = v2.value0.id === id$prime || eq13(v2.value0.dynFamily)(new Just(v2.value0.id));
              if ($141) {
                return new MakeElement({
                  id: v2.value0.id,
                  scope: v2.value0.scope,
                  parent: v2.value0.parent,
                  tag: v2.value0.tag,
                  pos: new Just(pos$prime),
                  dynFamily: v2.value0.dynFamily
                });
              }
              ;
              return v2;
            }
            ;
            if (v2 instanceof MakeText) {
              var $145 = v2.value0.id === id$prime || eq13(v2.value0.dynFamily)(new Just(v2.value0.id));
              if ($145) {
                return new MakeText({
                  id: v2.value0.id,
                  pos: new Just(pos$prime),
                  scope: v2.value0.scope,
                  parent: v2.value0.parent,
                  dynFamily: v2.value0.dynFamily
                });
              }
              ;
              return v2;
            }
            ;
            if (v2 instanceof MakePursx) {
              var $149 = v2.value0.id === id$prime || eq13(v2.value0.dynFamily)(new Just(v2.value0.id));
              if ($149) {
                return new MakePursx({
                  id: v2.value0.id,
                  parent: v2.value0.parent,
                  html: v2.value0.html,
                  scope: v2.value0.scope,
                  pos: new Just(pos$prime),
                  pxScope: v2.value0.pxScope,
                  verb: v2.value0.verb,
                  cache: v2.value0.cache,
                  dynFamily: v2.value0.dynFamily
                });
              }
              ;
              return v2;
            }
            ;
            if (v2 instanceof MakeOpenDynBeacon) {
              var $153 = v2.value0.id === id$prime || eq13(v2.value0.dynFamily)(new Just(v2.value0.id));
              if ($153) {
                return new MakeOpenDynBeacon({
                  id: v2.value0.id,
                  parent: v2.value0.parent,
                  pos: new Just(pos$prime),
                  scope: v2.value0.scope,
                  dynFamily: v2.value0.dynFamily
                });
              }
              ;
              return v2;
            }
            ;
            if (v2 instanceof MakeCloseDynBeacon) {
              var $157 = v2.value0.id === id$prime || eq13(v2.value0.dynFamily)(new Just(v2.value0.id));
              if ($157) {
                return new MakeCloseDynBeacon({
                  id: v2.value0.id,
                  parent: v2.value0.parent,
                  pos: new Just(pos$prime),
                  scope: v2.value0.scope,
                  dynFamily: v2.value0.dynFamily
                });
              }
              ;
              return v2;
            }
            ;
            if (v2 instanceof SetText) {
              return v2;
            }
            ;
            if (v2 instanceof SetProp) {
              return v2;
            }
            ;
            if (v2 instanceof UnsetAttribute) {
              return v2;
            }
            ;
            throw new Error("Failed pattern match at Deku.SSR (line 201, column 24 - line 224, column 36): " + [v2.constructor.name]);
          };
        };
      };
      var removeParent = function(id$prime) {
        return function(v2) {
          if (v2 instanceof MakeElement) {
            var $165 = v2.value0.id === id$prime || eq13(v2.value0.dynFamily)(new Just(v2.value0.id));
            if ($165) {
              return new MakeElement({
                id: v2.value0.id,
                scope: v2.value0.scope,
                parent: Nothing.value,
                tag: v2.value0.tag,
                pos: v2.value0.pos,
                dynFamily: v2.value0.dynFamily
              });
            }
            ;
            return v2;
          }
          ;
          if (v2 instanceof MakeText) {
            var $169 = v2.value0.id === id$prime || eq13(v2.value0.dynFamily)(new Just(v2.value0.id));
            if ($169) {
              return new MakeText({
                id: v2.value0.id,
                pos: v2.value0.pos,
                scope: v2.value0.scope,
                parent: Nothing.value,
                dynFamily: v2.value0.dynFamily
              });
            }
            ;
            return v2;
          }
          ;
          if (v2 instanceof MakePursx) {
            var $173 = v2.value0.id === id$prime || eq13(v2.value0.dynFamily)(new Just(v2.value0.id));
            if ($173) {
              return new MakePursx({
                id: v2.value0.id,
                parent: Nothing.value,
                html: v2.value0.html,
                scope: v2.value0.scope,
                pos: v2.value0.pos,
                pxScope: v2.value0.pxScope,
                verb: v2.value0.verb,
                cache: v2.value0.cache,
                dynFamily: v2.value0.dynFamily
              });
            }
            ;
            return v2;
          }
          ;
          if (v2 instanceof MakeOpenDynBeacon) {
            var $177 = v2.value0.id === id$prime || eq13(v2.value0.dynFamily)(new Just(v2.value0.id));
            if ($177) {
              return new MakeOpenDynBeacon({
                id: v2.value0.id,
                parent: Nothing.value,
                pos: v2.value0.pos,
                scope: v2.value0.scope,
                dynFamily: v2.value0.dynFamily
              });
            }
            ;
            return v2;
          }
          ;
          if (v2 instanceof MakeCloseDynBeacon) {
            var $181 = v2.value0.id === id$prime || eq13(v2.value0.dynFamily)(new Just(v2.value0.id));
            if ($181) {
              return new MakeCloseDynBeacon({
                id: v2.value0.id,
                parent: Nothing.value,
                pos: v2.value0.pos,
                scope: v2.value0.scope,
                dynFamily: v2.value0.dynFamily
              });
            }
            ;
            return v2;
          }
          ;
          if (v2 instanceof SetText) {
            return v2;
          }
          ;
          if (v2 instanceof SetProp) {
            return v2;
          }
          ;
          if (v2 instanceof UnsetAttribute) {
            return v2;
          }
          ;
          throw new Error("Failed pattern match at Deku.SSR (line 225, column 24 - line 248, column 36): " + [v2.constructor.name]);
        };
      };
      var moveClosingToEnd = function(staging1) {
        return function(staging2) {
          return function(dbc) {
            return function($389) {
              return function(v2) {
                if (v2 instanceof Just && v2.value0.value0 instanceof MakeOpenDynBeacon) {
                  if (eq13(v2.value0.value0.value0.dynFamily)(new Just(dbc.id))) {
                    return moveClosingToEnd(snoc3(append13(staging1)(staging2))(v2.value0.value0))(empty10)(dbc)(v2.value0.value1);
                  }
                  ;
                  if (otherwise) {
                    return moveClosingToEnd(staging1)(snoc3(staging2)(v2.value0.value0))(dbc)(v2.value0.value1);
                  }
                  ;
                }
                ;
                if (v2 instanceof Just && v2.value0.value0 instanceof MakeCloseDynBeacon) {
                  if (eq13(v2.value0.value0.value0.dynFamily)(new Just(dbc.id))) {
                    return moveClosingToEnd(snoc3(append13(staging1)(staging2))(v2.value0.value0))(empty10)(dbc)(v2.value0.value1);
                  }
                  ;
                  if (otherwise) {
                    return moveClosingToEnd(staging1)(snoc3(staging2)(v2.value0.value0))(dbc)(v2.value0.value1);
                  }
                  ;
                }
                ;
                if (v2 instanceof Just && v2.value0.value0 instanceof MakeText) {
                  if (eq13(v2.value0.value0.value0.dynFamily)(new Just(dbc.id))) {
                    return moveClosingToEnd(snoc3(append13(staging1)(staging2))(v2.value0.value0))(empty10)(dbc)(v2.value0.value1);
                  }
                  ;
                  if (otherwise) {
                    return moveClosingToEnd(staging1)(snoc3(staging2)(v2.value0.value0))(dbc)(v2.value0.value1);
                  }
                  ;
                }
                ;
                if (v2 instanceof Just && v2.value0.value0 instanceof MakePursx) {
                  if (eq13(v2.value0.value0.value0.dynFamily)(new Just(dbc.id))) {
                    return moveClosingToEnd(snoc3(append13(staging1)(staging2))(v2.value0.value0))(empty10)(dbc)(v2.value0.value1);
                  }
                  ;
                  if (otherwise) {
                    return moveClosingToEnd(staging1)(snoc3(staging2)(v2.value0.value0))(dbc)(v2.value0.value1);
                  }
                  ;
                }
                ;
                if (v2 instanceof Just && v2.value0.value0 instanceof MakeElement) {
                  if (eq13(v2.value0.value0.value0.dynFamily)(new Just(dbc.id))) {
                    return moveClosingToEnd(snoc3(append13(staging1)(staging2))(v2.value0.value0))(empty10)(dbc)(v2.value0.value1);
                  }
                  ;
                  if (otherwise) {
                    return moveClosingToEnd(staging1)(snoc3(staging2)(v2.value0.value0))(dbc)(v2.value0.value1);
                  }
                  ;
                }
                ;
                if (v2 instanceof Just && v2.value0.value0 instanceof SetProp) {
                  return moveClosingToEnd(staging1)(snoc3(staging2)(v2.value0.value0))(dbc)(v2.value0.value1);
                }
                ;
                if (v2 instanceof Just && v2.value0.value0 instanceof UnsetAttribute) {
                  return moveClosingToEnd(staging1)(snoc3(staging2)(v2.value0.value0))(dbc)(v2.value0.value1);
                }
                ;
                if (v2 instanceof Just && v2.value0.value0 instanceof SetText) {
                  return moveClosingToEnd(staging1)(snoc3(staging2)(v2.value0.value0))(dbc)(v2.value0.value1);
                }
                ;
                if (v2 instanceof Nothing) {
                  return append13(staging1)(append13(pure31(new MakeCloseDynBeacon({
                    id: dbc.id + "%-%",
                    parent: dbc.parent,
                    pos: dbc.pos,
                    scope: dbc.scope,
                    dynFamily: dbc.dynFamily
                  })))(staging2));
                }
                ;
                throw new Error("Failed pattern match at Deku.SSR (line 123, column 63 - line 178, column 20): " + [v2.constructor.name]);
              }(uncons3($389));
            };
          };
        };
      };
      var moveClosingsToEnd = function(cl) {
        return function($390) {
          return function(v2) {
            if (v2 instanceof Just && v2.value0.value0 instanceof MakeCloseDynBeacon) {
              return moveClosingsToEnd(moveClosingToEnd(empty10)(empty10)(v2.value0.value0.value0)(cl))(v2.value0.value1);
            }
            ;
            if (v2 instanceof Just) {
              return moveClosingsToEnd(cons6(v2.value0.value0)(cl))(v2.value0.value1);
            }
            ;
            if (v2 instanceof Nothing) {
              return cl;
            }
            ;
            throw new Error("Failed pattern match at Deku.SSR (line 110, column 45 - line 115, column 20): " + [v2.constructor.name]);
          }(unsnoc3($390));
        };
      };
      var doDeleteFromCache = function(cl) {
        return function(id$prime) {
          return function($391) {
            return function(v2) {
              if (v2 instanceof Just && v2.value0.value0 instanceof MakeElement) {
                var $230 = v2.value0.value0.value0.id === id$prime;
                if ($230) {
                  return doDeleteFromCache(cl)(id$prime)(v2.value0.value1);
                }
                ;
                return doDeleteFromCache(snoc3(cl)(v2.value0.value0))(id$prime)(v2.value0.value1);
              }
              ;
              if (v2 instanceof Just && v2.value0.value0 instanceof MakeText) {
                var $236 = v2.value0.value0.value0.id === id$prime;
                if ($236) {
                  return doDeleteFromCache(cl)(id$prime)(v2.value0.value1);
                }
                ;
                return doDeleteFromCache(snoc3(cl)(v2.value0.value0))(id$prime)(v2.value0.value1);
              }
              ;
              if (v2 instanceof Just && v2.value0.value0 instanceof MakePursx) {
                var $242 = v2.value0.value0.value0.id === id$prime;
                if ($242) {
                  return doDeleteFromCache(cl)(id$prime)(v2.value0.value1);
                }
                ;
                return doDeleteFromCache(snoc3(cl)(v2.value0.value0))(id$prime)(v2.value0.value1);
              }
              ;
              if (v2 instanceof Just && v2.value0.value0 instanceof MakeOpenDynBeacon) {
                var $248 = v2.value0.value0.value0.id === id$prime;
                if ($248) {
                  return doDeleteFromCache(cl)(id$prime)(v2.value0.value1);
                }
                ;
                return doDeleteFromCache(snoc3(cl)(v2.value0.value0))(id$prime)(v2.value0.value1);
              }
              ;
              if (v2 instanceof Just && v2.value0.value0 instanceof MakeCloseDynBeacon) {
                var $254 = v2.value0.value0.value0.id === id$prime;
                if ($254) {
                  return doDeleteFromCache(cl)(id$prime)(v2.value0.value1);
                }
                ;
                return doDeleteFromCache(snoc3(cl)(v2.value0.value0))(id$prime)(v2.value0.value1);
              }
              ;
              if (v2 instanceof Just && v2.value0.value0 instanceof SetProp) {
                var $260 = v2.value0.value0.value0.id === id$prime;
                if ($260) {
                  return doDeleteFromCache(cl)(id$prime)(v2.value0.value1);
                }
                ;
                return doDeleteFromCache(snoc3(cl)(v2.value0.value0))(id$prime)(v2.value0.value1);
              }
              ;
              if (v2 instanceof Just && v2.value0.value0 instanceof SetText) {
                var $266 = v2.value0.value0.value0.id === id$prime;
                if ($266) {
                  return doDeleteFromCache(cl)(id$prime)(v2.value0.value1);
                }
                ;
                return doDeleteFromCache(snoc3(cl)(v2.value0.value0))(id$prime)(v2.value0.value1);
              }
              ;
              if (v2 instanceof Just && v2.value0.value0 instanceof UnsetAttribute) {
                var $272 = v2.value0.value0.value0.id === id$prime;
                if ($272) {
                  return doDeleteFromCache(cl)(id$prime)(v2.value0.value1);
                }
                ;
                return doDeleteFromCache(snoc3(cl)(v2.value0.value0))(id$prime)(v2.value0.value1);
              }
              ;
              if (v2 instanceof Nothing) {
                return cl;
              }
              ;
              throw new Error("Failed pattern match at Deku.SSR (line 250, column 49 - line 275, column 20): " + [v2.constructor.name]);
            }(uncons3($391));
          };
        };
      };
      var doEliminations = function(cl) {
        return function($392) {
          return function(v2) {
            if (v2 instanceof Just && v2.value0.value0 instanceof RenderableInstruction) {
              return doEliminations(snoc3(cl)(v2.value0.value0.value0))(v2.value0.value1);
            }
            ;
            if (v2 instanceof Just && (v2.value0.value0 instanceof EliminatableInstruction && v2.value0.value0.value0 instanceof SendToPos)) {
              return doEliminations(map110(sendPos(v2.value0.value0.value0.value0.id)(v2.value0.value0.value0.value0.pos))(cl))(v2.value0.value1);
            }
            ;
            if (v2 instanceof Just && (v2.value0.value0 instanceof EliminatableInstruction && v2.value0.value0.value0 instanceof MakeRoot)) {
              return doEliminations(cl)(v2.value0.value1);
            }
            ;
            if (v2 instanceof Just && (v2.value0.value0 instanceof EliminatableInstruction && v2.value0.value0.value0 instanceof GiveNewParent)) {
              return doEliminations(cl)(v2.value0.value1);
            }
            ;
            if (v2 instanceof Just && (v2.value0.value0 instanceof EliminatableInstruction && v2.value0.value0.value0 instanceof DisconnectElement)) {
              return doEliminations(map110(removeParent(v2.value0.value0.value0.value0.id))(cl))(v2.value0.value1);
            }
            ;
            if (v2 instanceof Just && (v2.value0.value0 instanceof EliminatableInstruction && v2.value0.value0.value0 instanceof RemoveDynBeacon)) {
              return doEliminations(doDeleteFromCache(empty10)(v2.value0.value0.value0.value0.id)(cl))(v2.value0.value1);
            }
            ;
            if (v2 instanceof Just && (v2.value0.value0 instanceof EliminatableInstruction && v2.value0.value0.value0 instanceof DeleteFromCache)) {
              return doEliminations(doDeleteFromCache(empty10)(v2.value0.value0.value0.value0.id)(cl))(v2.value0.value1);
            }
            ;
            if (v2 instanceof Nothing) {
              return cl;
            }
            ;
            throw new Error("Failed pattern match at Deku.SSR (line 179, column 42 - line 200, column 20): " + [v2.constructor.name]);
          }(uncons3($392));
        };
      };
      var asList = fromFoldable6(aa);
      var beforeClosingsMoved = doEliminations(empty10)(asList);
      var go2 = moveClosingsToEnd(empty10)(beforeClosingsMoved);
      return go2;
    };
    var arr = instructionsToRenderableInstructions(arr$prime);
    var v = function(x) {
      return {
        parentToChild: mapFlipped1(x.parentToChild)(function() {
          var $393 = map28(function(v1) {
            if (v1 instanceof MakeElement) {
              return v1.value0.id;
            }
            ;
            if (v1 instanceof MakeText) {
              return v1.value0.id;
            }
            ;
            if (v1 instanceof MakePursx) {
              return v1.value0.id;
            }
            ;
            if (v1 instanceof MakeOpenDynBeacon) {
              return v1.value0.id;
            }
            ;
            if (v1 instanceof MakeCloseDynBeacon) {
              return v1.value0.id;
            }
            ;
            if (v1 instanceof SetProp) {
              return v1.value0.id;
            }
            ;
            if (v1 instanceof SetText) {
              return v1.value0.id;
            }
            ;
            if (v1 instanceof UnsetAttribute) {
              return v1.value0.id;
            }
            ;
            throw new Error("Failed pattern match at Deku.SSR (line 336, column 23 - line 344, column 52): " + [v1.constructor.name]);
          });
          var $394 = map28(function(i2) {
            return bind8(lookup3(i2)(x.idToActions))(head);
          });
          return function($395) {
            return $393(fromSortableDyns(sortSortableDyns(toSortableDyns(compact4($394($395))))));
          };
        }()),
        idToActions: x.idToActions
      };
    }(execState(traverse3(function(i2) {
      if (i2 instanceof MakeElement) {
        return for_6(i2.value0.parent)(function(p2) {
          return making(p2)(i2.value0.id)(i2);
        });
      }
      ;
      if (i2 instanceof MakeText) {
        return for_6(i2.value0.parent)(function(p2) {
          return making(p2)(i2.value0.id)(i2);
        });
      }
      ;
      if (i2 instanceof MakePursx) {
        return for_6(i2.value0.parent)(function(p2) {
          return making(p2)(i2.value0.id)(i2);
        });
      }
      ;
      if (i2 instanceof MakeOpenDynBeacon) {
        return for_6(i2.value0.parent)(function(p2) {
          return making(p2)(i2.value0.id)(i2);
        });
      }
      ;
      if (i2 instanceof MakeCloseDynBeacon) {
        return for_6(i2.value0.parent)(function(p2) {
          return making(p2)(i2.value0.id)(i2);
        });
      }
      ;
      if (i2 instanceof SetProp) {
        return setting(i2.value0.id)(i2);
      }
      ;
      if (i2 instanceof SetText) {
        return setting(i2.value0.id)(i2);
      }
      ;
      if (i2 instanceof UnsetAttribute) {
        return unsetting(i2.value0.id)(i2.value0.key);
      }
      ;
      throw new Error("Failed pattern match at Deku.SSR (line 352, column 19 - line 364, column 61): " + [i2.constructor.name]);
    })(arr))({
      parentToChild: empty3,
      idToActions: empty3
    }));
    var hasMake = function(a2) {
      return isJust(find2(function(v1) {
        if (v1 instanceof MakeElement) {
          return true;
        }
        ;
        if (v1 instanceof MakeText) {
          return true;
        }
        ;
        if (v1 instanceof MakeOpenDynBeacon) {
          return true;
        }
        ;
        if (v1 instanceof MakeCloseDynBeacon) {
          return true;
        }
        ;
        return false;
      })(a2));
    };
    var eltTag = function(i2a) {
      return fromMaybe("")(findMap(function(v1) {
        if (v1 instanceof MakeElement) {
          return new Just(v1.value0.tag);
        }
        ;
        return Nothing.value;
      })(i2a));
    };
    var eltAtts = function(i2a) {
      return intercalate3(" ")(filterMap4(function(v1) {
        if (v1 instanceof SetProp) {
          return new Just(v1.value0.key + ('="' + (v1.value0.value + '"')));
        }
        ;
        return Nothing.value;
      })(i2a));
    };
    var singleElt = function(id2) {
      return maybe("")(function(i2a) {
        var makeText = function(v12) {
          return fromMaybe("")(findMap(function(v2) {
            if (v2 instanceof SetText) {
              return new Just(encodedString(v2.value0.text) + ("<!--" + (id2 + "-->")));
            }
            ;
            return Nothing.value;
          })(i2a));
        };
        var makeOpenDynBeacon = function(v12) {
          return "<!--%-%" + (id2 + "-->");
        };
        var makeElt = function(v12) {
          var tag = eltTag(i2a);
          var atts = eltAtts(i2a);
          return "<" + (tag + (" " + (atts + (' data-deku-ssr="' + (id2 + ('">' + (o(id2) + ("</" + (tag + ">")))))))));
        };
        var makeCloseDynBeacon = function(v12) {
          return "<!--%-%" + (id2 + "-->");
        };
        var v1 = index(i2a)(0);
        if (v1 instanceof Just && v1.value0 instanceof SetText) {
          return makeText(unit);
        }
        ;
        if (v1 instanceof Just && v1.value0 instanceof MakeText) {
          return makeText(unit);
        }
        ;
        if (v1 instanceof Just && v1.value0 instanceof MakeOpenDynBeacon) {
          return makeOpenDynBeacon(unit);
        }
        ;
        if (v1 instanceof Just && v1.value0 instanceof MakeCloseDynBeacon) {
          return makeCloseDynBeacon(unit);
        }
        ;
        if (v1 instanceof Just && v1.value0 instanceof MakePursx) {
          return doPursxReplacements(v1.value0.value0);
        }
        ;
        return makeElt(unit);
      })(lookup3(id2)(v.idToActions));
    };
    var o = function(id2) {
      var elts = fromMaybe([])(lookup3(id2)(v.parentToChild));
      return foldMap4(singleElt)(elts);
    };
    var oo = function(id2) {
      return foldl6(function(b2) {
        return function(a2) {
          var v1 = hasMake(a2);
          if (v1) {
            return b2;
          }
          ;
          if (!v1) {
            return replace("data-deku-ssr")(eltAtts(a2) + " data-deku-ssr")(b2);
          }
          ;
          throw new Error("Failed pattern match at Deku.SSR (line 386, column 17 - line 390, column 14): " + [v1.constructor.name]);
        };
      })(o(id2))(v.idToActions);
    };
    return "<" + (topTag + (' data-deku-ssr="deku-root" data-deku-root="' + (rootId + ('">' + (oo(rootId) + ("</" + (topTag + ">")))))));
  };
};

// output/Deku.Toplevel/index.js
var unwrap9 = /* @__PURE__ */ unwrap();
var eq6 = /* @__PURE__ */ eq(eqScope);
var coerce21 = /* @__PURE__ */ coerce();
var pure111 = /* @__PURE__ */ pure(applicativeST);
var map111 = /* @__PURE__ */ map(functorST);
var void1 = /* @__PURE__ */ $$void(functorST);
var __internalDekuFlatten4 = function(a2) {
  return function(b2) {
    return function(c) {
      return flatten({
        doLogic: function(pos) {
          return function(v) {
            return function(id2) {
              return v.sendToPos({
                id: id2,
                pos
              });
            };
          };
        },
        ids: function($41) {
          return function(v) {
            return v.ids;
          }(unwrap9($41));
        },
        disconnectElement: function(v) {
          return function(v1) {
            return v.disconnectElement({
              id: v1.id,
              scope: v1.scope,
              parent: v1.parent,
              scopeEq: eq6
            });
          };
        },
        toElt: function(v) {
          return v;
        }
      })(a2)(b2)(coerce21(c));
    };
  };
};
var runSSR$prime = function(topTag) {
  var go2 = function(children$prime) {
    return map111(ssr$prime(topTag))(function __do3() {
      var seed = newSTRef(0)();
      var instr = newSTRef([])();
      var di = ssrDOMInterpret(seed);
      void1(subscribePure(__internalDekuFlatten4({
        parent: new Just("deku-root"),
        scope: new Local("rootScope"),
        raiseId: function(v) {
          return pure111(unit);
        },
        ez: true,
        pos: Nothing.value,
        dynFamily: Nothing.value
      })(di)(children$prime))(function(i2) {
        return i2(instr);
      }))();
      return read(instr)();
    });
  };
  return go2;
};
var runSSR = /* @__PURE__ */ runSSR$prime("body");

// output/Deku.Example.Docs.SSR/index.js
var click_3 = /* @__PURE__ */ click_(attrOnClickEffectUnit);
var alt15 = /* @__PURE__ */ alt(altEvent);
var pure32 = /* @__PURE__ */ pure(applicativeEvent);
var map29 = /* @__PURE__ */ map(functorEvent);
var append10 = /* @__PURE__ */ append(semigroupString);
var show6 = /* @__PURE__ */ show(showInt);
var fold6 = /* @__PURE__ */ fold3(eventIsEvent);
var show14 = /* @__PURE__ */ show(showNumber);
var pursxToElementConsInsert10 = /* @__PURE__ */ pursxToElementConsInsert();
var makePursx11 = /* @__PURE__ */ makePursx({
  reflectType: function() {
    return "<div>\n  <h1>Server-side rendering</h1>\n\n  <h2>When performance matters!</h2>\n  <p>\n    In web development, it's good practice to send a plain-HTML version of your site over the wire before any JavaScript starts executing. This is called <i>server-side rendering</i>, or SSR, where the server renders HTML in an initial pass before rendering any JavaScript.\n  </p>\n  <p>\n    The most performant form of SSR is pre-rendering HTML and serving them from memory or from a file system. This is Deku's strategy via the following two functions:\n  </p>\n  <ul>\n    <li><code>runSSR</code> generates HTML; and</li>\n    <li><code>hydrate</code> generates JavaScript that will hydrate your HTML with anything that's dynamic. Note that this is <i>partial</i> hydration, meaning it will only hydrate the bits that need hydrating. This means that, for example, you can do CSS animations on load without fear of jank when the JavaScript kicks in.</li>\n  </ul>\n\n  <p>\n    This documentation is generated using SSR, and if you add <code>view-source:</code> before the URL, you'll see the intro page rendered as HTML. If you're reading this documentation on a computer screen, you won't see much of a difference, but if you're reading it on a 3G mobile network, you'll spot the difference immedaitely.\n  </p>\n\n  <h2>A motivating example</h2>\n\n  <p>Here is a small application using SSR. We'll split it up into three files:</p>\n  <ul>\n    <li><code>App.purs</code> has our application logic.</li>\n    <li><code>Build.purs</code> creates a <code>.js</code> file, for example <code>make.js</code>, that will render our HTML.</li>\n    <li><code>Live.purs</code> uses hydration to add dynamic logic to the website.</li>\n  </ul>\n\n  <h3>App</h3>\n  <p>Unlike the previous examples that used <code>runInBody</code>, our application code here has an explicit type annotation <code>Nut</code>. The definition of <code>Nut</code> is <code>type Nut = forall s m lock payload. Korok s m => Domable m lock payload</code>, and in larger projects, you may need to write this type out explicitly, for example if you are working with an <code>Array</code> of <code>Domable</code> and need <code>m</code> to be consistant over the <code>Array</code>.</p>\n  ~code0~\n  <h3>Build</h3>\n  <p>This is the code we use to generate our HTML site. The example below creates a small script that logs our HTML to the command line,but we can also call <code>runSSR</code> from a NodeJS server, in which case we wouldn't <code>log</code> the HTML string but rather we would instead send it over the wire as the response to a request.</p>\n  ~code1~\n  <h3>Live</h3>\n  <p><code>Live.purs</code> can be bundled to generate our dynamic JS. The JS will hydrate our elements instead of replacing them, and will only hydrate elements that potentially will interactive content.</p>\n  ~code2~\n\n  <h3>Result</h3>\n\n  <p>Here is the resulting code from our static-site generation. It is rendered dynamically in your browser, but in production settings, we'd use NodeJS to render or pre-render this HTML.</p>\n\n  ~codegen~\n\n  <p>And here is what the result looks like after hydration.</p>\n\n  <blockquote> ~result~ </blockquote>\n\n  <p>One important thing to note about SSR is that it leaves a lot of things out. For example, it will not respond to send-to-position requests if they are emitted immediately. These are only evaluated on the client once a document is rendered. For this reason, it is recommended to <i>only</i> use SSR for elements that should be statically rendered, like a loading screen or blog. If you need your initial HTML to reflect lots of inserting and deleting of dynamic nodes, deku SSR may not work for you yet.</p>\n\n  <h2>Parting shot</h2>\n  <p>Thanks for checking out Deku! I had a blast writing it, and I hope you enjoy using it for your projects!</p>\n</div>";
  }
})()()(/* @__PURE__ */ pursxToElementConsInsert10(/* @__PURE__ */ pursxToElementConsInsert10(/* @__PURE__ */ pursxToElementConsInsert10(/* @__PURE__ */ pursxToElementConsInsert10(/* @__PURE__ */ pursxToElementConsInsert10(pursxToElementNil)({
  reflectType: function() {
    return "result";
  }
})({
  reflectSymbol: function() {
    return "result";
  }
}))({
  reflectType: function() {
    return "codegen";
  }
})({
  reflectSymbol: function() {
    return "codegen";
  }
}))({
  reflectType: function() {
    return "code2";
  }
})({
  reflectSymbol: function() {
    return "code2";
  }
}))({
  reflectType: function() {
    return "code1";
  }
})({
  reflectSymbol: function() {
    return "code1";
  }
}))({
  reflectType: function() {
    return "code0";
  }
})({
  reflectSymbol: function() {
    return "code0";
  }
}));
var bind9 = /* @__PURE__ */ bind(bindST);
var append14 = /* @__PURE__ */ append(/* @__PURE__ */ semigroupST(semigroupString));
var pure112 = /* @__PURE__ */ pure(applicativeST);
var px10 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var app2 = /* @__PURE__ */ function() {
  return vbussed()(vbusCons2({
    reflectSymbol: function() {
      return "buttonClicked";
    }
  })()()(vbusCons2({
    reflectSymbol: function() {
      return "sliderMoved";
    }
  })()()(vbusNil)()())()())($$Proxy.value)(function(push2) {
    return function(event) {
      return div_([p_([text_("Here's an example of SSR in deku.\nAll of the static bits are rendered as HTML,\nand all of the dynamic bits are hydrated on page load.")]), button(click_3(push2.buttonClicked(unit)))([text_("Click")]), div_([text(alt15(pure32("Val: 0"))(map29(function() {
        var $66 = append10("Val: ");
        return function($67) {
          return $66(show6($67));
        };
      }())(fold6(function(a2) {
        return function(v) {
          return 1 + a2 | 0;
        };
      })(-1 | 0)(alt15(pure32(unit))(event.buttonClicked)))))]), div_([input(slider(pure32(push2.sliderMoved)))([]), div_([text(alt15(pure32("Val: 50"))(map29(function() {
        var $68 = append10("Val: ");
        return function($69) {
          return $68(show14($69));
        };
      }())(event.sliderMoved)))])])]);
    };
  });
}();
var ssrPage = function(v) {
  return makePursx11(px10)({
    code2: pre_([code_([text_(live)])]),
    code1: pre_([code_([text_(build2)])]),
    code0: pre_([code_([text_(app)])]),
    result: app2,
    codegen: pre_([code_([text(makePureEvent(function(k) {
      return function __do3() {
        bind9(append14(pure112('<!DOCTYPE html><html><head><script src="bundle.js" defer><\/script></head>'))(append14(runSSR(app2))(pure112("</html>"))))(k)();
        return pure112(unit);
      };
    }))])])
  });
};

// output/Deku.Example.Docs.Scene/index.js
var lcmap7 = /* @__PURE__ */ lcmap(profunctorFn);
var alt16 = /* @__PURE__ */ alt(altEvent);
var pure33 = /* @__PURE__ */ pure(applicativeEvent);
var map30 = /* @__PURE__ */ map(functorArray);
var oneOfMap12 = /* @__PURE__ */ oneOfMap(foldableArray)(plusEvent);
var attr20 = /* @__PURE__ */ attr(attrOnClickCb);
var applySecond12 = /* @__PURE__ */ applySecond(applyEffect);
var attr111 = /* @__PURE__ */ attr(attrA_StyleString);
var attr27 = /* @__PURE__ */ attr(attrA_HrefString);
var attr35 = /* @__PURE__ */ attr(attrSpan_StyleString);
var scene = function(options2) {
  return bussed(function(push2) {
    return lcmap7(function(v) {
      return alt16(pure33(options2.startsWith))(v);
    })(function(event) {
      var go2 = function(v) {
        if (v instanceof Intro) {
          return intro;
        }
        ;
        if (v instanceof HelloWorld) {
          return helloWorld2;
        }
        ;
        if (v instanceof SimpleComponent) {
          return components;
        }
        ;
        if (v instanceof PURSX1) {
          return pursx12;
        }
        ;
        if (v instanceof Events) {
          return events2;
        }
        ;
        if (v instanceof Effects) {
          return effects2;
        }
        ;
        if (v instanceof PURSX2) {
          return pursx22;
        }
        ;
        if (v instanceof Events2) {
          return events22;
        }
        ;
        if (v instanceof Portals) {
          return portals12;
        }
        ;
        if (v instanceof SSR) {
          return ssrPage;
        }
        ;
        throw new Error("Failed pattern match at Deku.Example.Docs.Scene (line 33, column 7 - line 33, column 34): " + [v.constructor.name]);
      };
      var page = function(dpage) {
        return function(i2) {
          return go2(i2)({
            dpage,
            slug: options2.slug
          });
        };
      };
      return div_([div_(map30(function(v) {
        return span_([a(oneOfMap12(pure33)([attr20(OnClick.value)(cb(function(e) {
          return applySecond12(preventDefault(e))(push2(v.value0));
        })), attr111(Style.value)("cursor:pointer;"), attr27(Href.value)(options2.slug + v.value1.value1.value0)]))([text_(v.value1.value0)]), span2(pure33(attr35(Style.value)(function() {
          if (v.value1.value1.value1) {
            return "";
          }
          ;
          return "display:none;";
        }())))([text_(" | ")])]);
      })([new Tuple(Intro.value, new Tuple("Home", new Tuple("", true))), new Tuple(HelloWorld.value, new Tuple("Hello world", new Tuple("hello/", true))), new Tuple(SimpleComponent.value, new Tuple("Component", new Tuple("simple/", true))), new Tuple(PURSX1.value, new Tuple("Pursx 1", new Tuple("pursx1/", true))), new Tuple(Events.value, new Tuple("Events 1", new Tuple("events1/", true))), new Tuple(Effects.value, new Tuple("Effects", new Tuple("effects/", true))), new Tuple(PURSX2.value, new Tuple("Pursx 2", new Tuple("pursx2/", true))), new Tuple(Events2.value, new Tuple("Events 2", new Tuple("events2/", true))), new Tuple(Portals.value, new Tuple("Portals", new Tuple("portals/", true))), new Tuple(SSR.value, new Tuple("SSR", new Tuple("ssr/", false)))])), switcher(page(push2))(event)]);
    });
  });
};

// output/Effect.Console/foreign.js
var log2 = function(s2) {
  return function() {
    console.log(s2);
  };
};

// output/Node.Encoding/index.js
var ASCII = /* @__PURE__ */ function() {
  function ASCII2() {
  }
  ;
  ASCII2.value = new ASCII2();
  return ASCII2;
}();
var UTF8 = /* @__PURE__ */ function() {
  function UTF82() {
  }
  ;
  UTF82.value = new UTF82();
  return UTF82;
}();
var UTF16LE = /* @__PURE__ */ function() {
  function UTF16LE2() {
  }
  ;
  UTF16LE2.value = new UTF16LE2();
  return UTF16LE2;
}();
var UCS2 = /* @__PURE__ */ function() {
  function UCS22() {
  }
  ;
  UCS22.value = new UCS22();
  return UCS22;
}();
var Base64 = /* @__PURE__ */ function() {
  function Base642() {
  }
  ;
  Base642.value = new Base642();
  return Base642;
}();
var Latin1 = /* @__PURE__ */ function() {
  function Latin12() {
  }
  ;
  Latin12.value = new Latin12();
  return Latin12;
}();
var Binary = /* @__PURE__ */ function() {
  function Binary2() {
  }
  ;
  Binary2.value = new Binary2();
  return Binary2;
}();
var Hex = /* @__PURE__ */ function() {
  function Hex2() {
  }
  ;
  Hex2.value = new Hex2();
  return Hex2;
}();
var showEncoding = {
  show: function(v) {
    if (v instanceof ASCII) {
      return "ASCII";
    }
    ;
    if (v instanceof UTF8) {
      return "UTF8";
    }
    ;
    if (v instanceof UTF16LE) {
      return "UTF16LE";
    }
    ;
    if (v instanceof UCS2) {
      return "UCS2";
    }
    ;
    if (v instanceof Base64) {
      return "Base64";
    }
    ;
    if (v instanceof Latin1) {
      return "Latin1";
    }
    ;
    if (v instanceof Binary) {
      return "Binary";
    }
    ;
    if (v instanceof Hex) {
      return "Hex";
    }
    ;
    throw new Error("Failed pattern match at Node.Encoding (line 19, column 1 - line 27, column 23): " + [v.constructor.name]);
  }
};

// output/Node.FS.Sync/foreign.js
import {
  renameSync,
  truncateSync,
  chownSync,
  chmodSync,
  statSync,
  lstatSync,
  linkSync,
  symlinkSync,
  readlinkSync,
  realpathSync,
  unlinkSync,
  rmdirSync,
  rmSync,
  mkdirSync,
  readdirSync,
  utimesSync,
  readFileSync,
  writeFileSync,
  appendFileSync,
  existsSync,
  openSync,
  readSync,
  writeSync,
  fsyncSync,
  closeSync
} from "fs";

// output/Node.FS.Sync/index.js
var show7 = /* @__PURE__ */ show(showEncoding);
var readTextFile = function(encoding2) {
  return function(file) {
    return function() {
      return readFileSync(file, {
        encoding: show7(encoding2)
      });
    };
  };
};

// output/Node.Process/foreign.js
import process from "process";
function copyArray(xs) {
  return () => xs.slice();
}

// output/Node.Process/index.js
var argv = /* @__PURE__ */ function() {
  return copyArray(process.argv);
}();

// output/Deku.Example.Docs.Static.Build/index.js
var bind10 = /* @__PURE__ */ bind(bindEffect);
var pure34 = /* @__PURE__ */ pure(applicativeEffect);
var show8 = /* @__PURE__ */ show(showString);
var show15 = /* @__PURE__ */ show(showJsonDecodeError);
var record3 = /* @__PURE__ */ record2()(/* @__PURE__ */ rowListCodecCons(/* @__PURE__ */ rowListCodecCons(/* @__PURE__ */ rowListCodecCons(rowListCodecNil)()()({
  reflectSymbol: function() {
    return "top";
  }
}))()()({
  reflectSymbol: function() {
    return "slug";
  }
}))()()({
  reflectSymbol: function() {
    return "page";
  }
}));
var append15 = /* @__PURE__ */ append(/* @__PURE__ */ semigroupST(semigroupString));
var pure113 = /* @__PURE__ */ pure(applicativeST);
var main2 = function __do2() {
  var args = argv();
  var options2 = maybe(pure34({
    pageString: "Intro",
    startsWith: Intro.value,
    slug: "/",
    top: true
  }))(function(f) {
    return function __do3() {
      var s2 = readTextFile(UTF8.value)(f)();
      var parsed = either(function(e) {
        return throwException(error("cannot convert string to json: " + (s2 + (" err: " + show8(e)))));
      })(pure34)(jsonParser(s2))();
      var decoded = either(function(e) {
        return throwException(error("cannot decode json: " + (s2 + (" err: " + show15(e)))));
      })(pure34)(decode(object("Info")(record3({
        page: string,
        slug: string,
        top: $$boolean
      })))(parsed))();
      var page = maybe(throwException(error("cannot parse page: " + decoded.page)))(pure34)(stringToPage(decoded.page))();
      return {
        pageString: decoded.page,
        top: decoded.top,
        startsWith: page,
        slug: decoded.slug
      };
    };
  })(index(args)(2))();
  return bind10(toEffect(append15(pure113('<!DOCTYPE html>\n  <html>\n    <head>\n      <title>Deku documentation</title>\n      <meta charset="UTF-8">\n      <meta name="viewport" content="width=device-width">\n      <link rel="stylesheet" href=' + (function() {
    if (options2.top) {
      return '"style.css"';
    }
    ;
    return '"../style.css"';
  }() + ('>\n      <script type="module">\n        import { main } from ' + (function() {
    if (options2.top) {
      return '"bundle.js"';
    }
    ;
    return '"../bundle.js"';
  }() + (';\n        main({"startsWith":' + ('"' + (options2.pageString + ('"' + (',"slug":' + ('"' + (options2.slug + '"})();\n      <\/script>\n    </head>'))))))))))))(append15(runSSR(scene(options2)))(pure113("</html>")))))(log2)();
};

// <stdin>
main2();
