// output/Control.Semigroupoid/index.js
var semigroupoidFn = {
  compose: function(f) {
    return function(g) {
      return function(x) {
        return f(g(x));
      };
    };
  }
};
var compose = function(dict) {
  return dict.compose;
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
  return function(g) {
    return function(x) {
      return function(y) {
        return f(g(x))(g(y));
      };
    };
  };
};
var flip = function(f) {
  return function(b) {
    return function(a2) {
      return f(a2)(b);
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
  return function(fa) {
    return function(f) {
      return map(dictFunctor)(f)(fa);
    };
  };
};
var $$void = function(dictFunctor) {
  return map(dictFunctor)($$const(unit));
};
var voidLeft = function(dictFunctor) {
  return function(f) {
    return function(x) {
      return map(dictFunctor)($$const(x))(f);
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
var apply = function(dict) {
  return dict.apply;
};
var applySecond = function(dictApply) {
  return function(a2) {
    return function(b) {
      return apply(dictApply)(map(dictApply.Functor0())($$const(identity(categoryFn)))(a2))(b);
    };
  };
};
var lift2 = function(dictApply) {
  return function(f) {
    return function(a2) {
      return function(b) {
        return apply(dictApply)(map(dictApply.Functor0())(f)(a2))(b);
      };
    };
  };
};

// output/Control.Applicative/index.js
var pure = function(dict) {
  return dict.pure;
};
var when = function(dictApplicative) {
  return function(v) {
    return function(v1) {
      if (v) {
        return v1;
      }
      ;
      if (!v) {
        return pure(dictApplicative)(unit);
      }
      ;
      throw new Error("Failed pattern match at Control.Applicative (line 63, column 1 - line 63, column 63): " + [v.constructor.name, v1.constructor.name]);
    };
  };
};
var liftA1 = function(dictApplicative) {
  return function(f) {
    return function(a2) {
      return apply(dictApplicative.Apply0())(pure(dictApplicative)(f))(a2);
    };
  };
};

// output/Control.Bind/index.js
var bind = function(dict) {
  return dict.bind;
};
var bindFlipped = function(dictBind) {
  return flip(bind(dictBind));
};
var composeKleisliFlipped = function(dictBind) {
  return function(f) {
    return function(g) {
      return function(a2) {
        return bindFlipped(dictBind)(f)(g(a2));
      };
    };
  };
};
var composeKleisli = function(dictBind) {
  return function(f) {
    return function(g) {
      return function(a2) {
        return bind(dictBind)(f(a2))(g);
      };
    };
  };
};
var join = function(dictBind) {
  return function(m) {
    return bind(dictBind)(m)(identity(categoryFn));
  };
};

// output/Data.Foldable/foreign.js
var foldrArray = function(f) {
  return function(init4) {
    return function(xs) {
      var acc = init4;
      var len = xs.length;
      for (var i2 = len - 1; i2 >= 0; i2--) {
        acc = f(xs[i2])(acc);
      }
      return acc;
    };
  };
};
var foldlArray = function(f) {
  return function(init4) {
    return function(xs) {
      var acc = init4;
      var len = xs.length;
      for (var i2 = 0; i2 < len; i2++) {
        acc = f(acc)(xs[i2]);
      }
      return acc;
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
var unsafeGet = function(label4) {
  return function(rec) {
    return rec[label4];
  };
};
var unsafeSet = function(label4) {
  return function(value13) {
    return function(rec) {
      var copy = {};
      for (var key2 in rec) {
        if ({}.hasOwnProperty.call(rec, key2)) {
          copy[key2] = rec[key2];
        }
      }
      copy[label4] = value13;
      return copy;
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
var semigroupFn = function(dictSemigroup) {
  return {
    append: function(f) {
      return function(g) {
        return function(x) {
          return append(dictSemigroup)(f(x))(g(x));
        };
      };
    }
  };
};

// output/Control.Alt/index.js
var alt = function(dict) {
  return dict.alt;
};

// output/Control.Plus/index.js
var empty = function(dict) {
  return dict.empty;
};

// output/Data.Bounded/foreign.js
var topChar = String.fromCharCode(65535);
var bottomChar = String.fromCharCode(0);
var topNumber = Number.POSITIVE_INFINITY;
var bottomNumber = Number.NEGATIVE_INFINITY;

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

// output/Data.Semiring/index.js
var semiringInt = {
  add: intAdd,
  zero: 0,
  mul: intMul,
  one: 1
};
var add = function(dict) {
  return dict.add;
};

// output/Data.Show/foreign.js
var showIntImpl = function(n) {
  return n.toString();
};
var showNumberImpl = function(n) {
  var str = n.toString();
  return isNaN(str + ".0") ? str : str + ".0";
};
var showStringImpl = function(s) {
  var l = s.length;
  return '"' + s.replace(/[\0-\x1F\x7F"\\]/g, function(c, i2) {
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
    var empty6 = k < l && s[k] >= "0" && s[k] <= "9" ? "\\&" : "";
    return "\\" + c.charCodeAt(0).toString(10) + empty6;
  }) + '"';
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
var fromMaybe = function(a2) {
  return maybe(a2)(identity(categoryFn));
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
var applyMaybe = {
  apply: function(v) {
    return function(v1) {
      if (v instanceof Just) {
        return map(functorMaybe)(v.value0)(v1);
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
      throw new Error("Failed pattern match at Data.Either (line 31, column 1 - line 31, column 52): " + [m.constructor.name]);
    };
  }
};
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
var boolNot = function(b) {
  return !b;
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
    return function(b) {
      return disj(heytingAlgebraBoolean)(not(heytingAlgebraBoolean)(a2))(b);
    };
  },
  conj: boolConj,
  disj: boolDisj,
  not: boolNot
};

// output/Data.Monoid/index.js
var monoidUnit = {
  mempty: unit,
  Semigroup0: function() {
    return semigroupUnit;
  }
};
var mempty = function(dict) {
  return dict.mempty;
};
var monoidFn = function(dictMonoid) {
  return {
    mempty: function(v) {
      return mempty(dictMonoid);
    },
    Semigroup0: function() {
      return semigroupFn(dictMonoid.Semigroup0());
    }
  };
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

// output/Data.Monoid.Disj/index.js
var Disj = function(x) {
  return x;
};
var semigroupDisj = function(dictHeytingAlgebra) {
  return {
    append: function(v) {
      return function(v1) {
        return disj(dictHeytingAlgebra)(v)(v1);
      };
    }
  };
};
var monoidDisj = function(dictHeytingAlgebra) {
  return {
    mempty: ff(dictHeytingAlgebra),
    Semigroup0: function() {
      return semigroupDisj(dictHeytingAlgebra);
    }
  };
};

// output/Unsafe.Coerce/foreign.js
var unsafeCoerce2 = function(x) {
  return x;
};

// output/Safe.Coerce/index.js
var coerce = function() {
  return unsafeCoerce2;
};

// output/Data.Newtype/index.js
var unwrap = coerce;
var alaF = function() {
  return function() {
    return function() {
      return function() {
        return function(v) {
          return coerce();
        };
      };
    };
  };
};

// output/Data.Foldable/index.js
var foldr = function(dict) {
  return dict.foldr;
};
var oneOf = function(dictFoldable) {
  return function(dictPlus) {
    return foldr(dictFoldable)(alt(dictPlus.Alt0()))(empty(dictPlus));
  };
};
var oneOfMap = function(dictFoldable) {
  return function(dictPlus) {
    return function(f) {
      return foldr(dictFoldable)(function() {
        var $314 = alt(dictPlus.Alt0());
        return function($315) {
          return $314(f($315));
        };
      }())(empty(dictPlus));
    };
  };
};
var traverse_ = function(dictApplicative) {
  return function(dictFoldable) {
    return function(f) {
      return foldr(dictFoldable)(function() {
        var $316 = applySecond(dictApplicative.Apply0());
        return function($317) {
          return $316(f($317));
        };
      }())(pure(dictApplicative)(unit));
    };
  };
};
var for_ = function(dictApplicative) {
  return function(dictFoldable) {
    return flip(traverse_(dictApplicative)(dictFoldable));
  };
};
var sequence_ = function(dictApplicative) {
  return function(dictFoldable) {
    return traverse_(dictApplicative)(dictFoldable)(identity(categoryFn));
  };
};
var foldl = function(dict) {
  return dict.foldl;
};
var foldableMaybe = {
  foldr: function(v) {
    return function(z) {
      return function(v1) {
        if (v1 instanceof Nothing) {
          return z;
        }
        ;
        if (v1 instanceof Just) {
          return v(v1.value0)(z);
        }
        ;
        throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): " + [v.constructor.name, z.constructor.name, v1.constructor.name]);
      };
    };
  },
  foldl: function(v) {
    return function(z) {
      return function(v1) {
        if (v1 instanceof Nothing) {
          return z;
        }
        ;
        if (v1 instanceof Just) {
          return v(z)(v1.value0);
        }
        ;
        throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): " + [v.constructor.name, z.constructor.name, v1.constructor.name]);
      };
    };
  },
  foldMap: function(dictMonoid) {
    return function(v) {
      return function(v1) {
        if (v1 instanceof Nothing) {
          return mempty(dictMonoid);
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
  return function(dictMonoid) {
    return function(f) {
      return foldr(dictFoldable)(function(x) {
        return function(acc) {
          return append(dictMonoid.Semigroup0())(f(x))(acc);
        };
      })(mempty(dictMonoid));
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
var foldMap = function(dict) {
  return dict.foldMap;
};
var fold = function(dictFoldable) {
  return function(dictMonoid) {
    return foldMap(dictFoldable)(dictMonoid)(identity(categoryFn));
  };
};
var any = function(dictFoldable) {
  return function(dictHeytingAlgebra) {
    return alaF()()()()(Disj)(foldMap(dictFoldable)(monoidDisj(dictHeytingAlgebra)));
  };
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
var foreachE = function(as) {
  return function(f) {
    return function() {
      for (var i2 = 0, l = as.length; i2 < l; i2++) {
        f(as[i2])();
      }
    };
  };
};

// output/Control.Monad/index.js
var ap = function(dictMonad) {
  return function(f) {
    return function(a2) {
      return bind(dictMonad.Bind1())(f)(function(f$prime) {
        return bind(dictMonad.Bind1())(a2)(function(a$prime) {
          return pure(dictMonad.Applicative0())(f$prime(a$prime));
        });
      });
    };
  };
};

// output/Effect/index.js
var $runtime_lazy = function(name16, moduleName, init4) {
  var state3 = 0;
  var val;
  return function(lineNumber) {
    if (state3 === 2)
      return val;
    if (state3 === 1)
      throw new ReferenceError(name16 + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state3 = 1;
    val = init4();
    state3 = 2;
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
var semigroupEffect = function(dictSemigroup) {
  return {
    append: lift2(applyEffect)(append(dictSemigroup))
  };
};
var monoidEffect = function(dictMonoid) {
  return {
    mempty: pureE(mempty(dictMonoid)),
    Semigroup0: function() {
      return semigroupEffect(dictMonoid.Semigroup0());
    }
  };
};

// output/Deku.Attribute/index.js
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
  var $6 = map(functorFn)(map(functorEffect)($$const(true)));
  return function($7) {
    return Cb($6($7));
  };
}();
var attr = function(dict) {
  return dict.attr;
};

// output/Deku.Control/foreign.js
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
  function Cons3(head6, tail3) {
    this.head = head6;
    this.tail = tail3;
  }
  var emptyList = {};
  function curryCons(head6) {
    return function(tail3) {
      return new Cons3(head6, tail3);
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
  return function(foldr2) {
    return function(xs) {
      return listToArray(foldr2(curryCons)(emptyList)(xs));
    };
  };
}();
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
var sortByImpl = function() {
  function mergeFromTo(compare2, fromOrdering, xs1, xs2, from3, to2) {
    var mid;
    var i2;
    var j;
    var k;
    var x;
    var y;
    var c;
    mid = from3 + (to2 - from3 >> 1);
    if (mid - from3 > 1)
      mergeFromTo(compare2, fromOrdering, xs2, xs1, from3, mid);
    if (to2 - mid > 1)
      mergeFromTo(compare2, fromOrdering, xs2, xs1, mid, to2);
    i2 = from3;
    j = mid;
    k = from3;
    while (i2 < mid && j < to2) {
      x = xs2[i2];
      y = xs2[j];
      c = fromOrdering(compare2(x)(y));
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
  return function(compare2) {
    return function(fromOrdering) {
      return function(xs) {
        var out;
        if (xs.length < 2)
          return xs;
        out = xs.slice(0);
        mergeFromTo(compare2, fromOrdering, out, xs.slice(0), 0, xs.length);
        return out;
      };
    };
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

// output/Effect.Ref/foreign.js
var _new = function(val) {
  return function() {
    return { value: val };
  };
};
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
var write = function(val) {
  return function(ref) {
    return function() {
      ref.value = val;
    };
  };
};

// output/Effect.Ref/index.js
var $$new = _new;
var modify$prime = modifyImpl;
var modify = function(f) {
  return modify$prime(function(s) {
    var s$prime = f(s);
    return {
      state: s$prime,
      value: s$prime
    };
  });
};
var modify_ = function(f) {
  return function(s) {
    return $$void(functorEffect)(modify(f)(s));
  };
};

// output/Data.Array.ST/foreign.js
var pushAll = function(as) {
  return function(xs) {
    return function() {
      return xs.push.apply(xs, as);
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
var thaw = copyImpl;
var sortByImpl2 = function() {
  function mergeFromTo(compare2, fromOrdering, xs1, xs2, from3, to2) {
    var mid;
    var i2;
    var j;
    var k;
    var x;
    var y;
    var c;
    mid = from3 + (to2 - from3 >> 1);
    if (mid - from3 > 1)
      mergeFromTo(compare2, fromOrdering, xs2, xs1, from3, mid);
    if (to2 - mid > 1)
      mergeFromTo(compare2, fromOrdering, xs2, xs1, mid, to2);
    i2 = from3;
    j = mid;
    k = from3;
    while (i2 < mid && j < to2) {
      x = xs2[i2];
      y = xs2[j];
      c = fromOrdering(compare2(x)(y));
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
  return function(compare2) {
    return function(fromOrdering) {
      return function(xs) {
        return function() {
          if (xs.length < 2)
            return xs;
          mergeFromTo(compare2, fromOrdering, xs, xs.slice(0), 0, xs.length);
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

// output/Data.Traversable/foreign.js
var traverseArrayImpl = function() {
  function array1(a2) {
    return [a2];
  }
  function array2(a2) {
    return function(b) {
      return [a2, b];
    };
  }
  function array3(a2) {
    return function(b) {
      return function(c) {
        return [a2, b, c];
      };
    };
  }
  function concat2(xs) {
    return function(ys) {
      return xs.concat(ys);
    };
  }
  return function(apply3) {
    return function(map2) {
      return function(pure2) {
        return function(f) {
          return function(array) {
            function go2(bot, top2) {
              switch (top2 - bot) {
                case 0:
                  return pure2([]);
                case 1:
                  return map2(array1)(f(array[bot]));
                case 2:
                  return apply3(map2(array2)(f(array[bot])))(f(array[bot + 1]));
                case 3:
                  return apply3(apply3(map2(array3)(f(array[bot])))(f(array[bot + 1])))(f(array[bot + 2]));
                default:
                  var pivot = bot + Math.floor((top2 - bot) / 4) * 2;
                  return apply3(map2(concat2)(go2(bot, pivot)))(go2(pivot, top2));
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
var traverse = function(dict) {
  return dict.traverse;
};
var sequenceDefault = function(dictTraversable) {
  return function(dictApplicative) {
    return traverse(dictTraversable)(dictApplicative)(identity(categoryFn));
  };
};
var traversableArray = {
  traverse: function(dictApplicative) {
    return traverseArrayImpl(apply(dictApplicative.Apply0()))(map(dictApplicative.Apply0().Functor0()))(pure(dictApplicative));
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
var snoc = function(xs) {
  return function(x) {
    return withArray(push(x))(xs)();
  };
};
var findIndex = /* @__PURE__ */ function() {
  return findIndexImpl(Just.create)(Nothing.value);
}();
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
        return fromJust()(deleteAt(i2)(v2));
      })(findIndex(v(v1))(v2));
    };
  };
};
var cons2 = function(x) {
  return function(xs) {
    return append(semigroupArray)([x])(xs);
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
var singleton2 = function(dictPlus) {
  return function(a2) {
    return new NonEmpty(a2, empty(dictPlus));
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
  var chunkedRevMap = function($copy_chunksAcc) {
    return function($copy_v) {
      var $tco_var_chunksAcc = $copy_chunksAcc;
      var $tco_done = false;
      var $tco_result;
      function $tco_loop(chunksAcc, v) {
        if (v instanceof Cons && (v.value1 instanceof Cons && v.value1.value1 instanceof Cons)) {
          $tco_var_chunksAcc = new Cons(v, chunksAcc);
          $copy_v = v.value1.value1.value1;
          return;
        }
        ;
        var unrolledMap = function(v1) {
          if (v1 instanceof Cons && (v1.value1 instanceof Cons && v1.value1.value1 instanceof Nil)) {
            return new Cons(f(v1.value0), new Cons(f(v1.value1.value0), Nil.value));
          }
          ;
          if (v1 instanceof Cons && v1.value1 instanceof Nil) {
            return new Cons(f(v1.value0), Nil.value);
          }
          ;
          return Nil.value;
        };
        var reverseUnrolledMap = function($copy_v1) {
          return function($copy_acc) {
            var $tco_var_v1 = $copy_v1;
            var $tco_done1 = false;
            var $tco_result2;
            function $tco_loop2(v1, acc) {
              if (v1 instanceof Cons && (v1.value0 instanceof Cons && (v1.value0.value1 instanceof Cons && v1.value0.value1.value1 instanceof Cons))) {
                $tco_var_v1 = v1.value1;
                $copy_acc = new Cons(f(v1.value0.value0), new Cons(f(v1.value0.value1.value0), new Cons(f(v1.value0.value1.value1.value0), acc)));
                return;
              }
              ;
              $tco_done1 = true;
              return acc;
            }
            ;
            while (!$tco_done1) {
              $tco_result2 = $tco_loop2($tco_var_v1, $copy_acc);
            }
            ;
            return $tco_result2;
          };
        };
        $tco_done = true;
        return reverseUnrolledMap(chunksAcc)(unrolledMap(v));
      }
      ;
      while (!$tco_done) {
        $tco_result = $tco_loop($tco_var_chunksAcc, $copy_v);
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
    return function(b) {
      var rev3 = function() {
        var go2 = function($copy_acc) {
          return function($copy_v) {
            var $tco_var_acc = $copy_acc;
            var $tco_done = false;
            var $tco_result;
            function $tco_loop(acc, v) {
              if (v instanceof Nil) {
                $tco_done = true;
                return acc;
              }
              ;
              if (v instanceof Cons) {
                $tco_var_acc = new Cons(v.value0, acc);
                $copy_v = v.value1;
                return;
              }
              ;
              throw new Error("Failed pattern match at Data.List.Types (line 107, column 7 - line 107, column 23): " + [acc.constructor.name, v.constructor.name]);
            }
            ;
            while (!$tco_done) {
              $tco_result = $tco_loop($tco_var_acc, $copy_v);
            }
            ;
            return $tco_result;
          };
        };
        return go2(Nil.value);
      }();
      var $205 = foldl(foldableList)(flip(f))(b);
      return function($206) {
        return $205(rev3($206));
      };
    };
  },
  foldl: function(f) {
    var go2 = function($copy_b) {
      return function($copy_v) {
        var $tco_var_b = $copy_b;
        var $tco_done1 = false;
        var $tco_result;
        function $tco_loop(b, v) {
          if (v instanceof Nil) {
            $tco_done1 = true;
            return b;
          }
          ;
          if (v instanceof Cons) {
            $tco_var_b = f(b)(v.value0);
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
    return function(f) {
      return foldl(foldableList)(function(acc) {
        var $207 = append(dictMonoid.Semigroup0())(acc);
        return function($208) {
          return $207(f($208));
        };
      })(mempty(dictMonoid));
    };
  }
};
var semigroupList = {
  append: function(xs) {
    return function(ys) {
      return foldr(foldableList)(Cons.create)(ys)(xs);
    };
  }
};
var semigroupNonEmptyList = {
  append: function(v) {
    return function(as$prime) {
      return new NonEmpty(v.value0, append(semigroupList)(v.value1)(toList(as$prime)));
    };
  }
};
var altList = {
  alt: /* @__PURE__ */ append(semigroupList),
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
var unsafePartial = _unsafePartial;
var unsafeCrashWith = function(msg) {
  return unsafePartial(function() {
    return crashWith()(msg);
  });
};

// output/Data.Compactable/index.js
var compact = function(dict) {
  return dict.compact;
};

// output/Data.Filterable/index.js
var filterMap = function(dict) {
  return dict.filterMap;
};
var filter4 = function(dict) {
  return dict.filter;
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
var empty3 = {};
function runST(f) {
  return f();
}
function _foldM(bind2) {
  return function(f) {
    return function(mz) {
      return function(m) {
        var acc = mz;
        function g(k2) {
          return function(z) {
            return f(z)(k2)(m[k2]);
          };
        }
        for (var k in m) {
          if (hasOwnProperty.call(m, k)) {
            acc = bind2(acc)(g(k));
          }
        }
        return acc;
      };
    };
  };
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

// output/Data.Function.Uncurried/foreign.js
var runFn3 = function(fn) {
  return function(a2) {
    return function(b) {
      return function(c) {
        return fn(a2, b, c);
      };
    };
  };
};

// output/Foreign.Object.ST/foreign.js
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
var values = /* @__PURE__ */ toArrayWithKey(function(v) {
  return function(v1) {
    return v1;
  };
});
var thawST = _copyST;
var mutate = function(f) {
  return function(m) {
    return runST(function __do3() {
      var s = thawST(m)();
      f(s)();
      return s;
    });
  };
};
var insert2 = function(k) {
  return function(v) {
    return mutate(poke2(k)(v));
  };
};
var fold2 = /* @__PURE__ */ _foldM(applyFlipped);
var foldMap2 = function(dictMonoid) {
  return function(f) {
    return fold2(function(acc) {
      return function(k) {
        return function(v) {
          return append(dictMonoid.Semigroup0())(acc)(f(k)(v));
        };
      };
    })(mempty(dictMonoid));
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
        return foldr(foldableArray)(f)(z)(values(m));
      };
    };
  },
  foldMap: function(dictMonoid) {
    return function(f) {
      return foldMap2(dictMonoid)($$const(f));
    };
  }
};
var $$delete = function(k) {
  return mutate(deleteImpl(k));
};

// output/Data.Argonaut.Core/index.js
var jsonEmptyObject = /* @__PURE__ */ id(empty3);

// output/Data.Array.NonEmpty.Internal/foreign.js
var traverse1Impl = function() {
  function Cont(fn) {
    this.fn = fn;
  }
  var emptyList = {};
  var ConsCell = function(head6, tail3) {
    this.head = head6;
    this.tail = tail3;
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
  return function(apply3) {
    return function(map2) {
      return function(f) {
        var buildFrom = function(x, ys) {
          return apply3(map2(consList)(f(x)))(ys);
        };
        var go2 = function(acc, currentLen, xs) {
          if (currentLen === 0) {
            return acc;
          } else {
            var last4 = xs[currentLen - 1];
            return new Cont(function() {
              var built = go2(buildFrom(last4, acc), currentLen - 1, xs);
              return built;
            });
          }
        };
        return function(array) {
          var acc = map2(finalCell)(f(array[array.length - 1]));
          var result = go2(acc, array.length - 1, array);
          while (result instanceof Cont) {
            result = result.fn();
          }
          return map2(listToArray)(result);
        };
      };
    };
  };
}();

// output/Data.List.NonEmpty/index.js
var singleton5 = /* @__PURE__ */ function() {
  var $169 = singleton2(plusList);
  return function($170) {
    return NonEmptyList($169($170));
  };
}();
var head3 = function(v) {
  return v.value0;
};

// output/Data.String.CodePoints/foreign.js
var hasArrayFrom = typeof Array.from === "function";
var hasStringIterator = typeof Symbol !== "undefined" && Symbol != null && typeof Symbol.iterator !== "undefined" && typeof String.prototype[Symbol.iterator] === "function";
var hasFromCodePoint = typeof String.prototype.fromCodePoint === "function";
var hasCodePointAt = typeof String.prototype.codePointAt === "function";

// output/Data.String.Common/foreign.js
var joinWith = function(s) {
  return function(xs) {
    return xs.join(s);
  };
};

// output/Record/index.js
var insert4 = function(dictIsSymbol) {
  return function() {
    return function() {
      return function(l) {
        return function(a2) {
          return function(r) {
            return unsafeSet(reflectSymbol(dictIsSymbol)(l))(a2)(r);
          };
        };
      };
    };
  };
};
var get = function(dictIsSymbol) {
  return function() {
    return function(l) {
      return function(r) {
        return unsafeGet(reflectSymbol(dictIsSymbol)(l))(r);
      };
    };
  };
};

// output/Type.Equality/index.js
var refl = {
  proof: function(a2) {
    return a2;
  },
  Coercible0: function() {
    return void 0;
  }
};
var proof = function(dict) {
  return dict.proof;
};

// output/Data.Typelevel.Undefined/index.js
var $$undefined = unit;

// output/Data.Typelevel.Num.Sets/index.js
var toInt = function(dict) {
  return dict.toInt;
};
var natD2 = {
  toInt: function(v) {
    return 2;
  }
};
var posD2 = {
  Nat0: function() {
    return natD2;
  }
};
var natD1 = {
  toInt: function(v) {
    return 1;
  }
};
var posD1 = {
  Nat0: function() {
    return natD1;
  }
};
var natD0 = {
  toInt: function(v) {
    return 0;
  }
};

// output/Data.Typelevel.Num.Ops/index.js
var typelevelSucc = function(dictPos) {
  return function() {
    return function(dictDivMod10) {
      return function() {
        return function(dictDivMod101) {
          return {
            Nat0: dictDivMod10.Nat1,
            Pos1: function() {
              return dictPos;
            }
          };
        };
      };
    };
  };
};
var divMod10D2D0 = {
  Nat0: function() {
    return natD0;
  },
  Nat1: function() {
    return natD2;
  }
};
var divMod10D1D0 = {
  Nat0: function() {
    return natD0;
  },
  Nat1: function() {
    return natD1;
  }
};
var divMod10D0D0 = {
  Nat0: function() {
    return natD0;
  },
  Nat1: function() {
    return natD0;
  }
};

// output/Effect.Exception/foreign.js
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
  return function(a2) {
    return catchError(dictMonadError)(map(dictMonadError.MonadThrow0().Monad0().Bind1().Apply0().Functor0())(Right.create)(a2))(function() {
      var $21 = pure(dictMonadError.MonadThrow0().Monad0().Applicative0());
      return function($22) {
        return $21(Left.create($22));
      };
    }());
  };
};

// output/Effect.Class/index.js
var liftEffect = function(dict) {
  return dict.liftEffect;
};

// output/Effect.Random/foreign.js
var random = Math.random;

// output/Data.Vec/index.js
var toArray3 = function(v) {
  return v;
};
var index4 = function(dictNat) {
  return function() {
    return function(v) {
      return function(i2) {
        return v[toInt(dictNat)(i2)];
      };
    };
  };
};
var functorWithIndexVec = functorWithIndexArray;
var functorVec = functorArray;
var foldableVec = foldableArray;
var empty4 = [];
var cons5 = function(dictSucc) {
  return function(x) {
    return function(v) {
      return cons2(x)(v);
    };
  };
};

// output/Deku.Core/index.js
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
var SendToTop = /* @__PURE__ */ function() {
  function SendToTop2() {
  }
  ;
  SendToTop2.value = new SendToTop2();
  return SendToTop2;
}();
var Remove = /* @__PURE__ */ function() {
  function Remove2() {
  }
  ;
  Remove2.value = new Remove2();
  return Remove2;
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

// output/Effect.AVar/foreign.js
var AVar = function() {
  function MutableQueue() {
    this.head = null;
    this.last = null;
    this.size = 0;
  }
  function MutableCell(queue, value13) {
    this.queue = queue;
    this.value = value13;
    this.next = null;
    this.prev = null;
  }
  function AVar2(value13) {
    this.draining = false;
    this.error = null;
    this.value = value13;
    this.takes = new MutableQueue();
    this.reads = new MutableQueue();
    this.puts = new MutableQueue();
  }
  var EMPTY = {};
  function runEff(eff) {
    try {
      eff();
    } catch (error2) {
      setTimeout(function() {
        throw error2;
      }, 0);
    }
  }
  function putLast(queue, value13) {
    var cell = new MutableCell(queue, value13);
    switch (queue.size) {
      case 0:
        queue.head = cell;
        break;
      case 1:
        cell.prev = queue.head;
        queue.head.next = cell;
        queue.last = cell;
        break;
      default:
        cell.prev = queue.last;
        queue.last.next = cell;
        queue.last = cell;
    }
    queue.size++;
    return cell;
  }
  function takeLast(queue) {
    var cell;
    switch (queue.size) {
      case 0:
        return null;
      case 1:
        cell = queue.head;
        queue.head = null;
        break;
      case 2:
        cell = queue.last;
        queue.head.next = null;
        queue.last = null;
        break;
      default:
        cell = queue.last;
        queue.last = cell.prev;
        queue.last.next = null;
    }
    cell.prev = null;
    cell.queue = null;
    queue.size--;
    return cell.value;
  }
  function takeHead(queue) {
    var cell;
    switch (queue.size) {
      case 0:
        return null;
      case 1:
        cell = queue.head;
        queue.head = null;
        break;
      case 2:
        cell = queue.head;
        queue.last.prev = null;
        queue.head = queue.last;
        queue.last = null;
        break;
      default:
        cell = queue.head;
        queue.head = cell.next;
        queue.head.prev = null;
    }
    cell.next = null;
    cell.queue = null;
    queue.size--;
    return cell.value;
  }
  function deleteCell2(cell) {
    if (cell.queue === null) {
      return;
    }
    if (cell.queue.last === cell) {
      takeLast(cell.queue);
      return;
    }
    if (cell.queue.head === cell) {
      takeHead(cell.queue);
      return;
    }
    if (cell.prev) {
      cell.prev.next = cell.next;
    }
    if (cell.next) {
      cell.next.prev = cell.prev;
    }
    cell.queue.size--;
    cell.queue = null;
    cell.value = null;
    cell.next = null;
    cell.prev = null;
  }
  function drainVar(util, avar) {
    if (avar.draining) {
      return;
    }
    var ps = avar.puts;
    var ts = avar.takes;
    var rs = avar.reads;
    var p, r, t, value13, rsize;
    avar.draining = true;
    while (1) {
      p = null;
      r = null;
      t = null;
      value13 = avar.value;
      rsize = rs.size;
      if (avar.error !== null) {
        value13 = util.left(avar.error);
        while (p = takeHead(ps)) {
          runEff(p.cb(value13));
        }
        while (r = takeHead(rs)) {
          runEff(r(value13));
        }
        while (t = takeHead(ts)) {
          runEff(t(value13));
        }
        break;
      }
      if (value13 === EMPTY && (p = takeHead(ps))) {
        avar.value = value13 = p.value;
      }
      if (value13 !== EMPTY) {
        t = takeHead(ts);
        while (rsize-- && (r = takeHead(rs))) {
          runEff(r(util.right(value13)));
        }
        if (t !== null) {
          avar.value = EMPTY;
          runEff(t(util.right(value13)));
        }
      }
      if (p !== null) {
        runEff(p.cb(util.right(void 0)));
      }
      if (avar.value === EMPTY && ps.size === 0 || avar.value !== EMPTY && ts.size === 0) {
        break;
      }
    }
    avar.draining = false;
  }
  AVar2.EMPTY = EMPTY;
  AVar2.putLast = putLast;
  AVar2.takeLast = takeLast;
  AVar2.takeHead = takeHead;
  AVar2.deleteCell = deleteCell2;
  AVar2.drainVar = drainVar;
  return AVar2;
}();
function empty5() {
  return new AVar(AVar.EMPTY);
}
function _takeVar(util, avar, cb2) {
  return function() {
    var cell = AVar.putLast(avar.takes, cb2);
    AVar.drainVar(util, avar);
    return function() {
      AVar.deleteCell(cell);
    };
  };
}
function _tryPutVar(util, value13, avar) {
  return function() {
    if (avar.value === AVar.EMPTY && avar.error === null) {
      avar.value = value13;
      AVar.drainVar(util, avar);
      return true;
    } else {
      return false;
    }
  };
}

// output/Effect.AVar/index.js
var Killed = /* @__PURE__ */ function() {
  function Killed2(value0) {
    this.value0 = value0;
  }
  ;
  Killed2.create = function(value0) {
    return new Killed2(value0);
  };
  return Killed2;
}();
var Filled = /* @__PURE__ */ function() {
  function Filled2(value0) {
    this.value0 = value0;
  }
  ;
  Filled2.create = function(value0) {
    return new Filled2(value0);
  };
  return Filled2;
}();
var Empty = /* @__PURE__ */ function() {
  function Empty3() {
  }
  ;
  Empty3.value = new Empty3();
  return Empty3;
}();
var ffiUtil = /* @__PURE__ */ function() {
  return {
    left: Left.create,
    right: Right.create,
    nothing: Nothing.value,
    just: Just.create,
    killed: Killed.create,
    filled: Filled.create,
    empty: Empty.value
  };
}();
var take4 = function(avar) {
  return function(cb2) {
    return _takeVar(ffiUtil, avar, cb2);
  };
};
var tryPut = function(value13) {
  return function(avar) {
    return _tryPutVar(ffiUtil, value13, avar);
  };
};

// output/Effect.Unsafe/foreign.js
var unsafePerformEffect = function(f) {
  return f();
};

// output/FRP.Event.Class/index.js
var keepLatest = function(dict) {
  return dict.keepLatest;
};
var fold3 = function(dict) {
  return dict.fold;
};
var mapAccum = function(dictIsEvent) {
  return function(f) {
    return function(xs) {
      return function(acc) {
        return filterMap(dictIsEvent.Filterable1())(snd)(fold3(dictIsEvent)(function(a2) {
          return function(v) {
            return map(functorTuple)(pure(applicativeMaybe))(f(a2)(v.value0));
          };
        })(xs)(new Tuple(acc, Nothing.value)));
      };
    };
  };
};
var bang = function(dict) {
  return dict.bang;
};

// output/Unsafe.Reference/foreign.js
function reallyUnsafeRefEq(a2) {
  return function(b) {
    return a2 === b;
  };
}

// output/Unsafe.Reference/index.js
var unsafeRefEq = reallyUnsafeRefEq;

// output/FRP.Event/index.js
var Event = function(x) {
  return x;
};
var subscribe = function(v) {
  return function(k) {
    return v(k);
  };
};
var sampleOn2 = function(v) {
  return function(v1) {
    return function(k) {
      return function __do3() {
        var latest = $$new(Nothing.value)();
        var c1 = v(function(a2) {
          return write(new Just(a2))(latest);
        })();
        var c2 = v1(function(f) {
          return bind(bindEffect)(read(latest))(traverse_(applicativeEffect)(foldableMaybe)(function($54) {
            return k(f($54));
          }));
        })();
        return applySecond(applyEffect)(c1)(c2);
      };
    };
  };
};
var makeEvent = Event;
var keepLatest2 = function(v) {
  return function(k) {
    return function __do3() {
      var cancelInner = $$new(Nothing.value)();
      var cancelOuter = v(function(inner) {
        return function __do4() {
          bind(bindEffect)(read(cancelInner))(sequence_(applicativeEffect)(foldableMaybe))();
          var c = subscribe(inner)(k)();
          return write(new Just(c))(cancelInner)();
        };
      })();
      return function __do4() {
        bind(bindEffect)(read(cancelInner))(sequence_(applicativeEffect)(foldableMaybe))();
        return cancelOuter();
      };
    };
  };
};
var functorEvent = {
  map: function(f) {
    return function(v) {
      return function(k) {
        return v(function($55) {
          return k(f($55));
        });
      };
    };
  }
};
var fold4 = function(f) {
  return function(v) {
    return function(b) {
      return function(k) {
        return function __do3() {
          var result = $$new(b)();
          return v(function(a2) {
            return bind(bindEffect)(modify(f(a2))(result))(k);
          })();
        };
      };
    };
  };
};
var filter5 = function(p) {
  return function(v) {
    return function(k) {
      return v(function(a2) {
        var v1 = p(a2);
        if (v1 instanceof Just) {
          return k(v1.value0);
        }
        ;
        if (v1 instanceof Nothing) {
          return pure(applicativeEffect)(unit);
        }
        ;
        throw new Error("Failed pattern match at FRP.Event (line 108, column 13 - line 110, column 27): " + [v1.constructor.name]);
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
    throw new Error("Failed pattern match at FRP.Event (line 66, column 13 - line 68, column 25): " + [v.constructor.name]);
  });
};
var create = function __do() {
  var subscribers = $$new([])();
  return {
    event: function(k) {
      return function __do3() {
        modify(function(v) {
          return append(semigroupArray)(v)([k]);
        })(subscribers)();
        return function __do4() {
          modify(deleteBy(unsafeRefEq)(k))(subscribers)();
          return unit;
        };
      };
    },
    push: function(a2) {
      return bind(bindEffect)(read(subscribers))(traverse_(applicativeEffect)(foldableArray)(function(k) {
        return k(a2);
      }));
    }
  };
};
var fix3 = function(f) {
  var v = unsafePerformEffect(create);
  var v1 = f(v.event);
  return function(k) {
    return function __do3() {
      var c1 = subscribe(v1.input)(v.push)();
      var c2 = subscribe(v1.output)(k)();
      return applySecond(applyEffect)(c1)(c2);
    };
  };
};
var memoize = function(e) {
  return function(f) {
    return makeEvent(function(k) {
      return function __do3() {
        var v = create();
        k(f(v.event))();
        return subscribe(e)(v.push)();
      };
    });
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
        throw new Error("Failed pattern match at FRP.Event (line 49, column 13 - line 51, column 33): " + [v.constructor.name]);
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
        throw new Error("Failed pattern match at FRP.Event (line 56, column 13 - line 58, column 32): " + [v.constructor.name]);
      })(xs)
    };
  }
};
var filterableEvent = {
  filter: filter$prime,
  filterMap: filter5,
  partition: function(p) {
    return function(xs) {
      return {
        yes: filter$prime(p)(xs),
        no: filter$prime(function() {
          var $56 = not(heytingAlgebraBoolean);
          return function($57) {
            return $56(p($57));
          };
        }())(xs)
      };
    };
  },
  partitionMap: function(f) {
    return function(xs) {
      return {
        left: filterMap(filterableEvent)(function() {
          var $58 = either(Just.create)($$const(Nothing.value));
          return function($59) {
            return $58(f($59));
          };
        }())(xs),
        right: filterMap(filterableEvent)(function($60) {
          return hush(f($60));
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
var bus = function(f) {
  return makeEvent(function(k) {
    return function __do3() {
      var v = create();
      k(f(v.push)(v.event))();
      return pure(applicativeEffect)(unit);
    };
  });
};
var bang2 = function(a2) {
  return function(k) {
    return function __do3() {
      k(a2)();
      return pure(applicativeEffect)(unit);
    };
  };
};
var altEvent = {
  alt: function(v) {
    return function(v1) {
      return function(k) {
        return function __do3() {
          var c1 = v(k)();
          var c2 = v1(k)();
          return applySecond(applyEffect)(c1)(c2);
        };
      };
    };
  },
  Functor0: function() {
    return functorEvent;
  }
};
var plusEvent = {
  empty: function(v) {
    return pure(applicativeEffect)(pure(applicativeEffect)(unit));
  },
  Alt0: function() {
    return altEvent;
  }
};
var eventIsEvent = {
  fold: fold4,
  keepLatest: keepLatest2,
  sampleOn: sampleOn2,
  fix: fix3,
  bang: bang2,
  Plus0: function() {
    return plusEvent;
  },
  Filterable1: function() {
    return filterableEvent;
  }
};

// output/Deku.Internal/index.js
var Begin = /* @__PURE__ */ function() {
  function Begin2() {
  }
  ;
  Begin2.value = new Begin2();
  return Begin2;
}();
var Middle = /* @__PURE__ */ function() {
  function Middle2() {
  }
  ;
  Middle2.value = new Middle2();
  return Middle2;
}();
var End = /* @__PURE__ */ function() {
  function End2() {
  }
  ;
  End2.value = new End2();
  return End2;
}();
var __internalDekuFlatten = function(parent2) {
  return function(scope2) {
    return function(v) {
      var element = function(v1) {
        return v1({
          parent: parent2,
          scope: scope2,
          raiseId: mempty(monoidFn(monoidEffect(monoidUnit)))
        })(v);
      };
      return function(v1) {
        if (v1 instanceof FixedChildren$prime) {
          return oneOfMap(foldableArray)(plusEvent)(element)(v1.value0);
        }
        ;
        if (v1 instanceof EventfulElement$prime) {
          return keepLatest(eventIsEvent)(map(functorEvent)(__internalDekuFlatten(parent2)(scope2)(v))(v1.value0));
        }
        ;
        if (v1 instanceof Element$prime) {
          return element(v1.value0);
        }
        ;
        if (v1 instanceof DynamicChildren$prime) {
          return makeEvent(function(k) {
            return function __do3() {
              var cancelInner = $$new(empty3)();
              var cancelOuter = subscribe(v1.value0)(function(inner) {
                return function __do4() {
                  var myUnsubId = v.ids();
                  var myUnsub = $$new(pure(applicativeEffect)(unit))();
                  var eltsUnsubId = v.ids();
                  var eltsUnsub = $$new(pure(applicativeEffect)(unit))();
                  var myId = $$new(Nothing.value)();
                  var myImmediateCancellation = $$new(pure(applicativeEffect)(unit))();
                  var myScope = v.ids();
                  var stageRef = $$new(Begin.value)();
                  var c0 = subscribe(inner)(function(kid$prime) {
                    return function __do5() {
                      var stage = read(stageRef)();
                      if (kid$prime instanceof SendToTop && stage instanceof Middle) {
                        return bind(bindEffect)(read(myId))(traverse_(applicativeEffect)(foldableMaybe)(function($22) {
                          return k(v.sendToTop(function(v2) {
                            return {
                              id: v2
                            };
                          }($22)));
                        }))();
                      }
                      ;
                      if (kid$prime instanceof Remove && stage instanceof Middle) {
                        write(End.value)(stageRef)();
                        var mic = applySecond(applyEffect)(applySecond(applyEffect)(applySecond(applyEffect)(applySecond(applyEffect)(bind(bindEffect)(read(myId))(traverse_(applicativeEffect)(foldableMaybe)(function(old) {
                          return k(v.disconnectElement({
                            id: old,
                            parent: parent2,
                            scope: myScope
                          }));
                        })))(join(bindEffect)(read(myUnsub))))(join(bindEffect)(read(eltsUnsub))))(modify_($$delete(myUnsubId))(cancelInner)))(modify_($$delete(eltsUnsubId))(cancelInner));
                        return applySecond(applyEffect)(write(mic)(myImmediateCancellation))(mic)();
                      }
                      ;
                      if (kid$prime instanceof Insert && stage instanceof Begin) {
                        write(Middle.value)(stageRef)();
                        var av = empty5();
                        var c1 = subscribe(kid$prime.value0({
                          parent: parent2,
                          scope: myScope,
                          raiseId: function(id2) {
                            return $$void(functorEffect)(tryPut(id2)(av));
                          }
                        })(v))(k)();
                        var cncl = take4(av)(function(q) {
                          if (q instanceof Right) {
                            return function __do6() {
                              write(new Just(q.value0))(myId)();
                              modify_(insert2(eltsUnsubId)(c1))(cancelInner)();
                              return write(c1)(eltsUnsub)();
                            };
                          }
                          ;
                          if (q instanceof Left) {
                            return throwException(q.value0);
                          }
                          ;
                          throw new Error("Failed pattern match at Deku.Internal (line 87, column 48 - line 92, column 49): " + [q.constructor.name]);
                        })();
                        return cncl();
                      }
                      ;
                      return unit;
                    };
                  })();
                  write(c0)(myUnsub)();
                  modify_(insert2(myUnsubId)(c0))(cancelInner)();
                  return join(bindEffect)(read(myImmediateCancellation))();
                };
              })();
              return function __do4() {
                bind(bindEffect)(read(cancelInner))(fold(foldableObject)(monoidEffect(monoidUnit)))();
                return cancelOuter();
              };
            };
          });
        }
        ;
        throw new Error("Failed pattern match at Deku.Internal (line 30, column 61 - line 104, column 22): " + [v1.constructor.name]);
      };
    };
  };
};

// output/Deku.Control/index.js
var plantEventEventChildDomab = function(dictTypeEquals) {
  return function(dictTypeEquals1) {
    return {
      plant: function(i2) {
        return new DynamicChildren$prime(proof(refl)(coerce()(i2)));
      }
    };
  };
};
var plantElementDomable = function(dictTypeEquals) {
  return function(dictTypeEquals1) {
    return {
      plant: function(i2) {
        return new Element$prime(proof(dictTypeEquals1)(coerce()(i2)));
      }
    };
  };
};
var plantArrayElementDomable = function(dictTypeEquals) {
  return function(dictTypeEquals1) {
    return {
      plant: function(i2) {
        return new FixedChildren$prime(proof(refl)(coerce()(i2)));
      }
    };
  };
};
var unsafeText = function(v) {
  return v.makeText;
};
var unsafeSetText = function(v) {
  return function(id2) {
    return function(txt) {
      return map(functorEvent)(function($101) {
        return v.setText(function(v1) {
          return {
            id: id2,
            text: v1
          };
        }($101));
      })(txt);
    };
  };
};
var unsafeSetAttribute = function(v) {
  return function(id2) {
    return function(atts) {
      return map(functorEvent)(function($102) {
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
          throw new Error("Failed pattern match at Deku.Control (line 72, column 24 - line 74, column 41): " + [v1.value.constructor.name]);
        }(unsafeUnAttribute($102));
      })(atts);
    };
  };
};
var unsafeElement = function(v) {
  return v.makeElement;
};
var text = function(txt) {
  var go2 = function(v) {
    return function(v1) {
      return makeEvent(function(k) {
        return function __do3() {
          var me = v1.ids();
          v.raiseId(me)();
          return map(functorEffect)(applySecond(applyEffect)(k(v1.deleteFromCache({
            id: me
          }))))(subscribe(oneOf(foldableArray)(plusEvent)([bang2(unsafeText(v1)({
            id: me,
            parent: v.parent,
            scope: v.scope
          })), unsafeSetText(v1)(me)(txt)]))(k))();
        };
      });
    };
  };
  return go2;
};
var text_ = function(txt) {
  return text(bang2(txt));
};
var plant = function(dict) {
  return dict.plant;
};
var switcher = function(f) {
  return function(event) {
    var counter = function(ev) {
      var fn = function(a2) {
        return function(b) {
          return new Tuple(b + 1 | 0, new Tuple(a2, b));
        };
      };
      return mapAccum(eventIsEvent)(fn)(ev)(0);
    };
    return plant(plantEventEventChildDomab(refl)(refl))(keepLatest(eventIsEvent)(memoize(counter(event))(function(cenv) {
      return map(functorEvent)(function(v) {
        return alt(altEvent)(bang2(new Insert(f(v.value0))))(map(functorEvent)($$const(Remove.value))(filter4(filterableEvent)(function() {
          var $103 = eq(eqInt)(v.value1 + 1 | 0);
          return function($104) {
            return $103(snd($104));
          };
        }())(cenv)));
      })(cenv);
    })));
  };
};
var elementify = function(tag) {
  return function(atts) {
    return function(children) {
      var go2 = function(v) {
        return function(v1) {
          return makeEvent(function(k) {
            return function __do3() {
              var me = v1.ids();
              v.raiseId(me)();
              return map(functorEffect)(applySecond(applyEffect)(k(v1.deleteFromCache({
                id: me
              }))))(subscribe(alt(altEvent)(oneOf(foldableArray)(plusEvent)([bang2(unsafeElement(v1)({
                id: me,
                parent: v.parent,
                scope: v.scope,
                tag
              })), unsafeSetAttribute(v1)(me)(atts)]))(__internalDekuFlatten(me)(v.scope)(v1)(children)))(k))();
            };
          });
        };
      };
      return go2;
    };
  };
};
var deleteMeASAP = function(dictTypeEquals) {
  return function(dictTypeEquals1) {
    return unsafeCoerce2;
  };
};
var internalPortal = function(isGlobal) {
  return function(scopeF) {
    return function(gaga) {
      return function(closure) {
        var go2 = function(psr) {
          return function(v) {
            return makeEvent(function(k) {
              return function __do3() {
                var av = mutAr(map(functorArray)($$const(""))(toArray3(gaga)))();
                var actualized = oneOf(foldableVec)(plusEvent)(mapWithIndex(functorWithIndexVec)(function(ix) {
                  return function(v1) {
                    return v1({
                      parent: "@portal@",
                      scope: scopeF(psr.scope),
                      raiseId: function(id2) {
                        return unsafeUpdateMutAr(ix)(id2)(av);
                      }
                    })(v);
                  };
                })(gaga));
                var u0 = subscribe(actualized)(k)();
                var av2 = empty5();
                var idz = map(functorEffect)(unsafeCoerce2)(readAr(av))();
                var injectable = map(functorVec)(function(id2) {
                  return function(v1) {
                    return function(v2) {
                      return makeEvent(function(k2) {
                        return function __do4() {
                          v1.raiseId(id2)();
                          k2(v2.giveNewParent({
                            id: id2,
                            parent: v1.parent,
                            scope: v1.scope
                          }))();
                          return pure(applicativeEffect)(unit);
                        };
                      });
                    };
                  };
                })(idz);
                var realized = __internalDekuFlatten(psr.parent)(psr.scope)(v)(deleteMeASAP(refl)(refl)(closure(injectable)(function(v1) {
                  return v1;
                })));
                var u = subscribe(realized)(k)();
                $$void(functorEffect)(tryPut(u)(av2))();
                return function __do4() {
                  u0();
                  when(applicativeEffect)(!isGlobal)(foreachE(toArray3(idz))(function(id2) {
                    return k(v.deleteFromCache({
                      id: id2
                    }));
                  }))();
                  var cncl2 = take4(av2)(function(q) {
                    if (q instanceof Right) {
                      return q.value0;
                    }
                    ;
                    if (q instanceof Left) {
                      return throwException(q.value0);
                    }
                    ;
                    throw new Error("Failed pattern match at Deku.Control (line 164, column 36 - line 166, column 35): " + [q.constructor.name]);
                  })();
                  return cncl2();
                };
              };
            });
          };
        };
        return go2;
      };
    };
  };
};
var portal = function(e) {
  return internalPortal(false)(identity(categoryFn))(e);
};
var plantDomableDomable = function(dictTypeEquals) {
  return function(dictTypeEquals1) {
    return {
      plant: function(i2) {
        return deleteMeASAP(dictTypeEquals)(dictTypeEquals1)(i2);
      }
    };
  };
};
var plantEventDomableDomable = function(dictTypeEquals) {
  return function(dictTypeEquals1) {
    return {
      plant: function(i2) {
        return new EventfulElement$prime(map(functorEvent)(deleteMeASAP(dictTypeEquals)(dictTypeEquals1))(i2));
      }
    };
  };
};
var deku = function(root) {
  return function(children) {
    return function(v) {
      return makeEvent(function(k) {
        return function __do3() {
          var me = v.ids();
          return subscribe(alt(altEvent)(bang2(v.makeRoot({
            id: me,
            root
          })))(__internalDekuFlatten(me)("rootScope")(v)(deleteMeASAP(refl)(refl)(children))))(k)();
        };
      });
    };
  };
};
var dekuA = function(root) {
  return function(children) {
    return deku(root)(plant(plantArrayElementDomable(refl)(refl))(children));
  };
};
var blank = /* @__PURE__ */ function() {
  var go2 = function(v) {
    return function(v1) {
      return makeEvent(function(k) {
        return function __do3() {
          var me = v1.ids();
          v.raiseId(me)();
          return map(functorEffect)(applySecond(applyEffect)(k(v1.deleteFromCache({
            id: me
          }))))(subscribe(bang2(v1.makeNoop({
            id: me,
            parent: v.parent,
            scope: v.scope
          })))(k))();
        };
      });
    };
  };
  return go2;
}();

// output/Deku.DOM.Attr.OnClick/index.js
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
        value: cb$prime($$const(voidLeft(functorEffect)(value13)(true)))
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
var a = function(dictPlant) {
  return function(attributes) {
    return function(seed) {
      return elementify("a")(attributes)(plant(dictPlant)(seed));
    };
  };
};

// output/Deku.DOM.Elt.Div/index.js
var div2 = function(dictPlant) {
  return function(attributes) {
    return function(seed) {
      return elementify("div")(attributes)(plant(dictPlant)(seed));
    };
  };
};
var div_ = function(dictPlant) {
  return div2(dictPlant)(empty(plusEvent));
};

// output/Deku.DOM.Elt.Span/index.js
var span3 = function(dictPlant) {
  return function(attributes) {
    return function(seed) {
      return elementify("span")(attributes)(plant(dictPlant)(seed));
    };
  };
};
var span_ = function(dictPlant) {
  return span3(dictPlant)(empty(plusEvent));
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

// output/Deku.DOM.Elt.Button/index.js
var button = function(dictPlant) {
  return function(attributes) {
    return function(seed) {
      return elementify("button")(attributes)(plant(dictPlant)(seed));
    };
  };
};
var button_ = function(dictPlant) {
  return button(dictPlant)(empty(plusEvent));
};

// output/Deku.DOM.Elt.Code/index.js
var code = function(dictPlant) {
  return function(attributes) {
    return function(seed) {
      return elementify("code")(attributes)(plant(dictPlant)(seed));
    };
  };
};
var code_ = function(dictPlant) {
  return code(dictPlant)(empty(plusEvent));
};

// output/Deku.DOM.Elt.I/index.js
var i = function(dictPlant) {
  return function(attributes) {
    return function(seed) {
      return elementify("i")(attributes)(plant(dictPlant)(seed));
    };
  };
};
var i_ = function(dictPlant) {
  return i(dictPlant)(empty(plusEvent));
};

// output/Deku.DOM.Elt.Input/index.js
var input = function(dictPlant) {
  return function(attributes) {
    return function(seed) {
      return elementify("input")(attributes)(plant(dictPlant)(seed));
    };
  };
};

// output/Deku.DOM.Elt.Li/index.js
var li = function(dictPlant) {
  return function(attributes) {
    return function(seed) {
      return elementify("li")(attributes)(plant(dictPlant)(seed));
    };
  };
};
var li_ = function(dictPlant) {
  return li(dictPlant)(empty(plusEvent));
};

// output/Deku.DOM.Elt.Pre/index.js
var pre = function(dictPlant) {
  return function(attributes) {
    return function(seed) {
      return elementify("pre")(attributes)(plant(dictPlant)(seed));
    };
  };
};
var pre_ = function(dictPlant) {
  return pre(dictPlant)(empty(plusEvent));
};

// output/Deku.DOM.Elt.Ul/index.js
var ul = function(dictPlant) {
  return function(attributes) {
    return function(seed) {
      return elementify("ul")(attributes)(plant(dictPlant)(seed));
    };
  };
};
var ul_ = function(dictPlant) {
  return ul(dictPlant)(empty(plusEvent));
};

// output/Deku.Example.Docs.Types/index.js
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

// output/Deku.Example.Docs.Util/foreign.js
function scrollToTop_() {
  window.scrollTo(0, 0);
}

// output/Deku.Example.Docs.Util/index.js
var scrollToTop = scrollToTop_;

// output/Data.Profunctor/index.js
var profunctorFn = {
  dimap: function(a2b) {
    return function(c2d) {
      return function(b2c) {
        return function($8) {
          return c2d(b2c(a2b($8)));
        };
      };
    };
  }
};
var dimap = function(dict) {
  return dict.dimap;
};
var lcmap = function(dictProfunctor) {
  return function(a2b) {
    return dimap(dictProfunctor)(a2b)(identity(categoryFn));
  };
};

// output/Data.Reflectable/index.js
var reflectType = function(dict) {
  return dict.reflectType;
};

// output/Deku.Pursx/index.js
var pursxToElementNil = {
  pursxToElement: function(v) {
    return function(v1) {
      return function(v2) {
        return {
          cache: empty3,
          element: function(v3) {
            return function(v4) {
              return empty(plusEvent);
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
    return function(dictReflectable) {
      return function(dictIsSymbol) {
        return {
          pursxToElement: function(pxScope) {
            return function(v) {
              return function(r) {
                var v1 = pursxToElement(dictPursxToElement)(pxScope)($$Proxy.value)(r);
                return {
                  cache: insert2(reflectType(dictReflectable)($$Proxy.value))(true)(v1.cache),
                  element: function(parent2) {
                    return function(v2) {
                      return alt(altEvent)(map(functorEvent)(lcmap(profunctorFn)(unsafeUnAttribute)(function(v3) {
                        if (v3.value instanceof Prop$prime) {
                          return v2.setProp({
                            id: reflectType(dictReflectable)($$Proxy.value) + pxScope,
                            key: v3.key,
                            value: v3.value.value0
                          });
                        }
                        ;
                        if (v3.value instanceof Cb$prime) {
                          return v2.setCb({
                            id: reflectType(dictReflectable)($$Proxy.value) + pxScope,
                            key: v3.key,
                            value: v3.value.value0
                          });
                        }
                        ;
                        throw new Error("Failed pattern match at Deku.Pursx (line 3852, column 38 - line 3862, column 24): " + [v3.value.constructor.name]);
                      }))(get(dictIsSymbol)()($$Proxy.value)(r)))(v1.element(parent2)(v2));
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
var pursxToElementConsInsert = function() {
  return function(dictPursxToElement) {
    return function(dictReflectable) {
      return function(dictIsSymbol) {
        return {
          pursxToElement: function(pxScope) {
            return function(v) {
              return function(r) {
                var v1 = get(dictIsSymbol)()($$Proxy.value)(r);
                var v2 = pursxToElement(dictPursxToElement)(pxScope)($$Proxy.value)(r);
                return {
                  cache: insert2(reflectType(dictReflectable)($$Proxy.value))(false)(v2.cache),
                  element: function(info) {
                    return function(di) {
                      return alt(altEvent)(__internalDekuFlatten(reflectType(dictReflectable)($$Proxy.value) + pxScope)(info.scope)(di)(v1))(v2.element(info)(di));
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
var nut = function(dictPlant) {
  return function(seed) {
    return plant(dictPlant)(seed);
  };
};
var makePursx$prime = function(dictReflectable) {
  return function(dictReflectable1) {
    return function() {
      return function() {
        return function(dictPursxToElement) {
          return function(verb) {
            return function(html) {
              return function(r) {
                var go2 = function(v) {
                  return function(v1) {
                    return makeEvent(function(k1) {
                      return function __do3() {
                        var me = v1.ids();
                        var pxScope = v1.ids();
                        v.raiseId(me)();
                        var v2 = pursxToElement(dictPursxToElement)(pxScope)($$Proxy.value)(r);
                        return map(functorEffect)(applySecond(applyEffect)(k1(v1.deleteFromCache({
                          id: me
                        }))))(subscribe(alt(altEvent)(bang2(v1.makePursx({
                          id: me,
                          parent: v.parent,
                          cache: v2.cache,
                          scope: pxScope,
                          dkScope: v.scope,
                          html: reflectType(dictReflectable)(html),
                          verb: reflectType(dictReflectable1)(verb)
                        })))(v2.element(v)(v1)))(k1))();
                      };
                    });
                  };
                };
                return go2;
              };
            };
          };
        };
      };
    };
  };
};
var makePursx = function(dictReflectable) {
  return function() {
    return function() {
      return function(dictPursxToElement) {
        return makePursx$prime(dictReflectable)({
          reflectType: function() {
            return "~";
          }
        })()()(dictPursxToElement)($$Proxy.value);
      };
    };
  };
};
var psx = function(dictReflectable) {
  return function() {
    return function(dictPursxToElement) {
      return function(px10) {
        return makePursx(dictReflectable)()()(dictPursxToElement)(px10)({});
      };
    };
  };
};

// output/Deku.Example.Docs.Component/index.js
var px = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var components = function(dpage) {
  return makePursx({
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
  <p>Attributes like an element's style or id are specified as the first argument to an element. Attributes are just <a href="https://github.com/mikesol/purescript-event/blob/master/src/FRP/Event.purs"><code>Event</code>-s</a>, so you can <code>bang</code> them to make them happen <i>now</i>, combine two event streams with <code>alt</code> to compose events, etc.</p>

  <p>As an example, we made the input a range slider using <code>bang (Xtype := "range")</code>. Unlike Halogen, there are no checks to make sure you give a valid string. So if you want your range slider to have the value of true, you can. One day, I may build some validators, but passing strings works decently well here.</p>

  <h2>Next steps</h2>
  <p>In this section, we built a simple component. In the next section, we'll recreate the exact same element using a different input syntax called <a ~next~ style="cursor:pointer;">Pursx</a>.</p>
</div>`;
    }
  })()()(pursxToElementConsInsert()(pursxToElementConsAttr()(pursxToElementConsInsert()(pursxToElementNil)({
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
  }))(px)({
    code: nut(plantElementDomable(refl)(refl))(pre_(plantArrayElementDomable(refl)(refl))([code_(plantArrayElementDomable(refl)(refl))([text_('module Main where\n\nimport Prelude\n\nimport Deku.Attribute ((:=))\nimport Deku.Control (blank, text_)\nimport Deku.DOM as D\nimport Deku.Toplevel (runInBodyA)\nimport Effect (Effect)\nimport FRP.Event.Class (bang)\n\nmain :: Effect Unit\nmain = runInBodyA\n  ( [ D.button_ [ text_ "I do nothing" ]\n    , D.ul_ $ map (D.li_ <<< text_) [ "A", "B", "C" ]\n    , D.div_\n        [ D.a (bang $ D.Href := "https://example.com")\n            [ text_ "foo " ]\n        , D.i_ [ text_ " bar " ]\n        , D.span (bang $ D.Style := "font-weight: 800;")\n            [ text_ " baz" ]\n        ]\n    , D.div_\n        [ D.div_\n            [ D.div_ [ D.input (bang $ D.Xtype := "range") blank ]\n            ]\n        ]\n    ]\n  )')])])),
    result: nut(plantElementDomable(refl)(refl))(div_(plantArrayElementDomable(refl)(refl))([button_(plantArrayElementDomable(refl)(refl))([text_("I do nothing")]), ul_(plantArrayElementDomable(refl)(refl))(map(functorArray)(function() {
      var $0 = li_(plantElementDomable(refl)(refl));
      return function($1) {
        return $0(text_($1));
      };
    }())(["A", "B", "C"])), div_(plantArrayElementDomable(refl)(refl))([a(plantArrayElementDomable(refl)(refl))(bang2(attr(attrA_HrefString)(Href.value)("https://example.com")))([text_("foo ")]), i_(plantArrayElementDomable(refl)(refl))([text_(" bar ")]), span3(plantArrayElementDomable(refl)(refl))(bang2(attr(attrSpan_StyleString)(Style.value)("font-weight: 800;")))([text_(" baz")])]), div_(plantArrayElementDomable(refl)(refl))([div_(plantArrayElementDomable(refl)(refl))([div_(plantArrayElementDomable(refl)(refl))([input(plantElementDomable(refl)(refl))(bang2(attr(attrInput_XtypeString)(Xtype.value)("range")))(blank)])])])])),
    next: bang2(attr(attrOnClickCb)(OnClick.value)(cb($$const(applySecond(applyEffect)(dpage(PURSX1.value))(scrollToTop)))))
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
        for (var i2 = 0, header; (header = options2.headers[i2]) != null; i2++) {
          xhr.setRequestHeader(header.field, header.value);
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
        headers: xhr.getAllResponseHeaders().split("\r\n").filter(function(header2) {
          return header2.length > 0;
        }).map(function(header2) {
          var i3 = header2.indexOf(":");
          return mkHeader(header2.substring(0, i3))(header2.substring(i3 + 2));
        }),
        body: xhr.response
      });
    };
    xhr.responseType = options2.responseType;
    xhr.withCredentials = options2.withCredentials;
    xhr.timeout = options2.timeout;
    xhr.send(options2.content);
    return function(error2, cancelErrback, cancelCallback) {
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
var Accept = /* @__PURE__ */ function() {
  function Accept2(value0) {
    this.value0 = value0;
  }
  ;
  Accept2.create = function(value0) {
    return new Accept2(value0);
  };
  return Accept2;
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
    return unwrap()(v.value0);
  }
  ;
  if (v instanceof ContentType) {
    return unwrap()(v.value0);
  }
  ;
  if (v instanceof RequestHeader) {
    return v.value1;
  }
  ;
  throw new Error("Failed pattern match at Affjax.RequestHeader (line 26, column 1 - line 26, column 33): " + [v.constructor.name]);
};
var name2 = function(v) {
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
  return new Json2(identity(categoryFn));
}();
var ignore = /* @__PURE__ */ function() {
  return new Ignore(identity(categoryFn));
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

// output/Control.Monad.Except.Trans/index.js
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
  return {
    map: function(f) {
      return mapExceptT(map(dictFunctor)(map(functorEither)(f)));
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
  return {
    bind: function(v) {
      return function(k) {
        return bind(dictMonad.Bind1())(v)(either(function() {
          var $89 = pure(dictMonad.Applicative0());
          return function($90) {
            return $89(Left.create($90));
          };
        }())(function(a2) {
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
  return {
    apply: ap(monadExceptT(dictMonad)),
    Functor0: function() {
      return functorExceptT(dictMonad.Bind1().Apply0().Functor0());
    }
  };
};
var applicativeExceptT = function(dictMonad) {
  return {
    pure: function() {
      var $91 = pure(dictMonad.Applicative0());
      return function($92) {
        return ExceptT($91(Right.create($92)));
      };
    }(),
    Apply0: function() {
      return applyExceptT(dictMonad);
    }
  };
};
var monadThrowExceptT = function(dictMonad) {
  return {
    throwError: function() {
      var $101 = pure(dictMonad.Applicative0());
      return function($102) {
        return ExceptT($101(Left.create($102)));
      };
    }(),
    Monad0: function() {
      return monadExceptT(dictMonad);
    }
  };
};
var altExceptT = function(dictSemigroup) {
  return function(dictMonad) {
    return {
      alt: function(v) {
        return function(v1) {
          return bind(dictMonad.Bind1())(v)(function(rm) {
            if (rm instanceof Right) {
              return pure(dictMonad.Applicative0())(new Right(rm.value0));
            }
            ;
            if (rm instanceof Left) {
              return bind(dictMonad.Bind1())(v1)(function(rn) {
                if (rn instanceof Right) {
                  return pure(dictMonad.Applicative0())(new Right(rn.value0));
                }
                ;
                if (rn instanceof Left) {
                  return pure(dictMonad.Applicative0())(new Left(append(dictSemigroup)(rm.value0)(rn.value0)));
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
        return functorExceptT(dictMonad.Bind1().Apply0().Functor0());
      }
    };
  };
};

// output/Control.Monad.Except/index.js
var runExcept = /* @__PURE__ */ function() {
  var $0 = unwrap();
  return function($1) {
    return $0(runExceptT($1));
  };
}();

// output/Data.Argonaut.Parser/foreign.js
function _jsonParser(fail2, succ, s) {
  try {
    return succ(JSON.parse(s));
  } catch (e) {
    return fail2(e.message);
  }
}

// output/Data.Argonaut.Parser/index.js
var jsonParser = function(j) {
  return _jsonParser(Left.create, Right.create, j);
};

// output/JSURI/foreign.js
function toRFC3896(input2) {
  return input2.replace(/[!'()*]/g, function(c) {
    return "%" + c.charCodeAt(0).toString(16);
  });
}
var _encodeFormURLComponent = function encode(fail2, succeed, input2) {
  try {
    return succeed(toRFC3896(encodeURIComponent(input2)).replace(/%20/g, "+"));
  } catch (err) {
    return fail2(err);
  }
};

// output/JSURI/index.js
var encodeFormURLComponent = /* @__PURE__ */ function() {
  return runFn3(_encodeFormURLComponent)($$const(Nothing.value))(Just.create);
}();

// output/Data.FormURLEncoded/index.js
var toArray4 = function(v) {
  return v;
};
var encode2 = /* @__PURE__ */ function() {
  var encodePart = function(v) {
    if (v.value1 instanceof Nothing) {
      return encodeFormURLComponent(v.value0);
    }
    ;
    if (v.value1 instanceof Just) {
      return apply(applyMaybe)(map(functorMaybe)(function(key2) {
        return function(val) {
          return key2 + ("=" + val);
        };
      })(encodeFormURLComponent(v.value0)))(encodeFormURLComponent(v.value1.value0));
    }
    ;
    throw new Error("Failed pattern match at Data.FormURLEncoded (line 37, column 16 - line 39, column 114): " + [v.constructor.name]);
  };
  var $16 = map(functorMaybe)(joinWith("&"));
  var $17 = traverse(traversableArray)(applicativeMaybe)(encodePart);
  return function($18) {
    return $16($17(toArray4($18)));
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
  function Aff2(tag, _1, _2, _3) {
    this.tag = tag;
    this._1 = _1;
    this._2 = _2;
    this._3 = _3;
  }
  function AffCtr(tag) {
    var fn = function(_1, _2, _3) {
      return new Aff2(tag, _1, _2, _3);
    };
    fn.tag = tag;
    return fn;
  }
  function nonCanceler2(error2) {
    return new Aff2(PURE, void 0);
  }
  function runEff(eff) {
    try {
      eff();
    } catch (error2) {
      setTimeout(function() {
        throw error2;
      }, 0);
    }
  }
  function runSync(left, right, eff) {
    try {
      return right(eff());
    } catch (error2) {
      return left(error2);
    }
  }
  function runAsync(left, eff, k) {
    try {
      return eff(k)();
    } catch (error2) {
      k(left(error2))();
      return nonCanceler2;
    }
  }
  var Scheduler = function() {
    var limit = 1024;
    var size5 = 0;
    var ix = 0;
    var queue = new Array(limit);
    var draining = false;
    function drain() {
      var thunk;
      draining = true;
      while (size5 !== 0) {
        size5--;
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
        if (size5 === limit) {
          tmp = draining;
          drain();
          draining = tmp;
        }
        queue[(ix + size5) % limit] = cb2;
        size5++;
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
          return function(error2) {
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
    var fail2 = null;
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
              fail2 = util.left(e);
              step3 = null;
            }
            break;
          case STEP_RESULT:
            if (util.isLeft(step3)) {
              status = RETURN;
              fail2 = step3;
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
                fail2 = util.left(step3._1);
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
              step3 = interrupt || fail2 || step3;
            } else {
              tmp = attempts._3;
              attempt = attempts._1;
              attempts = attempts._2;
              switch (attempt.tag) {
                case CATCH:
                  if (interrupt && interrupt !== tmp && bracketCount === 0) {
                    status = RETURN;
                  } else if (fail2) {
                    status = CONTINUE;
                    step3 = attempt._2(util.fromLeft(fail2));
                    fail2 = null;
                  }
                  break;
                case RESUME:
                  if (interrupt && interrupt !== tmp && bracketCount === 0 || fail2) {
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
                  if (fail2 === null) {
                    result = util.fromRight(step3);
                    attempts = new Aff2(CONS, new Aff2(RELEASE, attempt._2, result), attempts, tmp);
                    if (interrupt === tmp || bracketCount > 0) {
                      status = CONTINUE;
                      step3 = attempt._3(result);
                    }
                  }
                  break;
                case RELEASE:
                  attempts = new Aff2(CONS, new Aff2(FINALIZED, step3, fail2), attempts, interrupt);
                  status = CONTINUE;
                  if (interrupt && interrupt !== tmp && bracketCount === 0) {
                    step3 = attempt._1.killed(util.fromLeft(interrupt))(attempt._2);
                  } else if (fail2) {
                    step3 = attempt._1.failed(util.fromLeft(fail2))(attempt._2);
                  } else {
                    step3 = attempt._1.completed(util.fromRight(step3))(attempt._2);
                  }
                  fail2 = null;
                  bracketCount++;
                  break;
                case FINALIZER:
                  bracketCount++;
                  attempts = new Aff2(CONS, new Aff2(FINALIZED, step3, fail2), attempts, interrupt);
                  status = CONTINUE;
                  step3 = attempt._1;
                  break;
                case FINALIZED:
                  bracketCount--;
                  status = RETURN;
                  step3 = attempt._1;
                  fail2 = attempt._2;
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
            if (interrupt && fail2) {
              setTimeout(function() {
                throw util.fromLeft(fail2);
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
    function onComplete(join3) {
      return function() {
        if (status === COMPLETED) {
          rethrow = rethrow && join3.rethrow;
          join3.handler(step3)();
          return function() {
          };
        }
        var jid = joinId++;
        joins = joins || {};
        joins[jid] = join3;
        return function() {
          if (joins !== null) {
            delete joins[jid];
          }
        };
      };
    }
    function kill(error2, cb2) {
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
            interrupt = util.left(error2);
            status = COMPLETED;
            step3 = interrupt;
            run3(runTick);
            break;
          case PENDING:
            if (interrupt === null) {
              interrupt = util.left(error2);
            }
            if (bracketCount === 0) {
              if (status === PENDING) {
                attempts = new Aff2(CONS, new Aff2(FINALIZER, step3(error2)), attempts, interrupt);
              }
              status = RETURN;
              step3 = null;
              fail2 = null;
              run3(++runTick);
            }
            break;
          default:
            if (interrupt === null) {
              interrupt = util.left(error2);
            }
            if (bracketCount === 0) {
              status = RETURN;
              step3 = null;
              fail2 = null;
            }
        }
        return canceler;
      };
    }
    function join2(cb2) {
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
      join: join2,
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
    function kill(error2, par2, cb3) {
      var step3 = par2;
      var head6 = null;
      var tail3 = null;
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
                kills2[count2++] = tmp.kill(error2, function(result) {
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
              if (tail3 === null) {
                head6 = null;
              } else {
                head6 = tail3._1;
                tail3 = tail3._2;
              }
              break;
            case MAP:
              step3 = step3._2;
              break;
            case APPLY:
            case ALT:
              if (head6) {
                tail3 = new Aff2(CONS, head6, tail3);
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
    function join2(result, head6, tail3) {
      var fail2, step3, lhs, rhs, tmp, kid;
      if (util.isLeft(result)) {
        fail2 = result;
        step3 = null;
      } else {
        step3 = result;
        fail2 = null;
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
            cb2(fail2 || step3)();
            return;
          }
          if (head6._3 !== EMPTY) {
            return;
          }
          switch (head6.tag) {
            case MAP:
              if (fail2 === null) {
                head6._3 = util.right(head6._1(util.fromRight(step3)));
                step3 = head6._3;
              } else {
                head6._3 = fail2;
              }
              break;
            case APPLY:
              lhs = head6._1._3;
              rhs = head6._2._3;
              if (fail2) {
                head6._3 = fail2;
                tmp = true;
                kid = killId++;
                kills[kid] = kill(early, fail2 === lhs ? head6._2 : head6._1, function() {
                  return function() {
                    delete kills[kid];
                    if (tmp) {
                      tmp = false;
                    } else if (tail3 === null) {
                      join2(fail2, null, null);
                    } else {
                      join2(fail2, tail3._1, tail3._2);
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
                fail2 = step3 === lhs ? rhs : lhs;
                step3 = null;
                head6._3 = fail2;
              } else {
                head6._3 = step3;
                tmp = true;
                kid = killId++;
                kills[kid] = kill(early, step3 === lhs ? head6._2 : head6._1, function() {
                  return function() {
                    delete kills[kid];
                    if (tmp) {
                      tmp = false;
                    } else if (tail3 === null) {
                      join2(step3, null, null);
                    } else {
                      join2(step3, tail3._1, tail3._2);
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
          if (tail3 === null) {
            head6 = null;
          } else {
            head6 = tail3._1;
            tail3 = tail3._2;
          }
        }
    }
    function resolve(fiber) {
      return function(result) {
        return function() {
          delete fibers[fiber._1];
          fiber._3 = result;
          join2(result, fiber._2._1, fiber._2._2);
        };
      };
    }
    function run3() {
      var status = CONTINUE;
      var step3 = par;
      var head6 = null;
      var tail3 = null;
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
                    tail3 = new Aff2(CONS, head6, tail3);
                  }
                  head6 = new Aff2(MAP, step3._1, EMPTY, EMPTY);
                  step3 = step3._2;
                  break;
                case APPLY:
                  if (head6) {
                    tail3 = new Aff2(CONS, head6, tail3);
                  }
                  head6 = new Aff2(APPLY, EMPTY, step3._2, EMPTY);
                  step3 = step3._1;
                  break;
                case ALT:
                  if (head6) {
                    tail3 = new Aff2(CONS, head6, tail3);
                  }
                  head6 = new Aff2(ALT, EMPTY, step3._2, EMPTY);
                  step3 = step3._1;
                  break;
                default:
                  fid = fiberId++;
                  status = RETURN;
                  tmp = step3;
                  step3 = new Aff2(FORKED, fid, new Aff2(CONS, head6, tail3), EMPTY);
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
                if (tail3 === null) {
                  head6 = null;
                } else {
                  head6 = tail3._1;
                  tail3 = tail3._2;
                }
              }
          }
        }
      root = step3;
      for (fid = 0; fid < fiberId; fid++) {
        fibers[fid].run();
      }
    }
    function cancel(error2, cb3) {
      interrupt = util.left(error2);
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
      var newKills = kill(error2, root, cb3);
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
  return function(right, ms) {
    return Aff.Async(function(cb2) {
      return function() {
        var timer = setDelay(ms, cb2(right()));
        return function() {
          return Aff.Sync(function() {
            return right(clearDelay(ms, timer));
          });
        };
      };
    });
  };
}();
var _sequential = Aff.Seq;

// output/Effect.Aff/index.js
var $runtime_lazy2 = function(name16, moduleName, init4) {
  var state3 = 0;
  var val;
  return function(lineNumber) {
    if (state3 === 2)
      return val;
    if (state3 === 1)
      throw new ReferenceError(name16 + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state3 = 1;
    val = init4();
    state3 = 2;
    return val;
  };
};
var functorAff = {
  map: _map
};
var ffiUtil2 = /* @__PURE__ */ function() {
  var unsafeFromRight = function(v) {
    if (v instanceof Right) {
      return v.value0;
    }
    ;
    if (v instanceof Left) {
      return unsafeCrashWith("unsafeFromRight: Left");
    }
    ;
    throw new Error("Failed pattern match at Effect.Aff (line 407, column 21 - line 409, column 54): " + [v.constructor.name]);
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
    throw new Error("Failed pattern match at Effect.Aff (line 402, column 20 - line 404, column 55): " + [v.constructor.name]);
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
    throw new Error("Failed pattern match at Effect.Aff (line 397, column 12 - line 399, column 21): " + [v.constructor.name]);
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
  return _makeFiber(ffiUtil2, aff);
};
var launchAff = function(aff) {
  return function __do3() {
    var fiber = makeFiber(aff)();
    fiber.run();
    return fiber;
  };
};
var launchAff_ = /* @__PURE__ */ function() {
  var $39 = $$void(functorEffect);
  return function($40) {
    return $39(launchAff($40));
  };
}();
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
var $lazy_applyAff = /* @__PURE__ */ $runtime_lazy2("applyAff", "Effect.Aff", function() {
  return {
    apply: ap(monadAff),
    Functor0: function() {
      return functorAff;
    }
  };
});
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
var nonCanceler = /* @__PURE__ */ $$const(/* @__PURE__ */ pure(applicativeAff)(unit));

// output/Effect.Aff.Compat/index.js
var fromEffectFnAff = function(v) {
  return makeAff(function(k) {
    return function __do3() {
      var v1 = v(function($4) {
        return k(Left.create($4))();
      }, function($5) {
        return k(Right.create($5))();
      });
      return function(e) {
        return makeAff(function(k2) {
          return function __do4() {
            v1(e, function($6) {
              return k2(Left.create($6))();
            }, function($7) {
              return k2(Right.create($7))();
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
var unsafeToForeign = unsafeCoerce2;
var unsafeFromForeign = unsafeCoerce2;
var renderForeignError = function(v) {
  if (v instanceof ForeignError) {
    return v.value0;
  }
  ;
  if (v instanceof ErrorAtIndex) {
    return "Error at array index " + (show(showInt)(v.value0) + (": " + renderForeignError(v.value1)));
  }
  ;
  if (v instanceof ErrorAtProperty) {
    return "Error at property " + (show(showString)(v.value0) + (": " + renderForeignError(v.value1)));
  }
  ;
  if (v instanceof TypeMismatch2) {
    return "Type mismatch: expected " + (v.value0 + (", found " + v.value1));
  }
  ;
  throw new Error("Failed pattern match at Foreign (line 78, column 1 - line 78, column 45): " + [v.constructor.name]);
};
var fail = function(dictMonad) {
  var $118 = throwError(monadThrowExceptT(dictMonad));
  return function($119) {
    return $118(singleton5($119));
  };
};
var unsafeReadTagged = function(dictMonad) {
  return function(tag) {
    return function(value13) {
      if (tagOf(value13) === tag) {
        return pure(applicativeExceptT(dictMonad))(unsafeFromForeign(value13));
      }
      ;
      if (otherwise) {
        return fail(dictMonad)(new TypeMismatch2(tag, tagOf(value13)));
      }
      ;
      throw new Error("Failed pattern match at Foreign (line 123, column 1 - line 123, column 104): " + [tag.constructor.name, value13.constructor.name]);
    };
  };
};

// output/Affjax/index.js
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
        return pure(applicativeExceptT(monadIdentity))(jsonEmptyObject);
      }
      ;
      return either(function() {
        var $51 = fail(monadIdentity);
        return function($52) {
          return $51(ForeignError.create($52));
        };
      }())(pure(applicativeExceptT(monadIdentity)))(jsonParser(v2));
    };
    var fromResponse = function() {
      if (req.responseFormat instanceof $$ArrayBuffer) {
        return unsafeReadTagged(monadIdentity)("ArrayBuffer");
      }
      ;
      if (req.responseFormat instanceof Blob2) {
        return unsafeReadTagged(monadIdentity)("Blob");
      }
      ;
      if (req.responseFormat instanceof Document2) {
        return function(x) {
          return alt(altExceptT(semigroupNonEmptyList)(monadIdentity))(unsafeReadTagged(monadIdentity)("Document")(x))(alt(altExceptT(semigroupNonEmptyList)(monadIdentity))(unsafeReadTagged(monadIdentity)("XMLDocument")(x))(unsafeReadTagged(monadIdentity)("HTMLDocument")(x)));
        };
      }
      ;
      if (req.responseFormat instanceof Json2) {
        return composeKleisliFlipped(bindExceptT(monadIdentity))(function($53) {
          return req.responseFormat.value0(parseJSON($53));
        })(unsafeReadTagged(monadIdentity)("String"));
      }
      ;
      if (req.responseFormat instanceof $$String2) {
        return unsafeReadTagged(monadIdentity)("String");
      }
      ;
      if (req.responseFormat instanceof Ignore) {
        return $$const(req.responseFormat.value0(pure(applicativeExceptT(monadIdentity))(unit)));
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
        return note("Body contains values that cannot be encoded as application/x-www-form-urlencoded")(map(functorMaybe)(unsafeToForeign)(encode2(v2.value0)));
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
        if (mh instanceof Just && !any(foldableArray)(heytingAlgebraBoolean)(on(eq(eqString))(name2)(mh.value0))(hs)) {
          return snoc(hs)(mh.value0);
        }
        ;
        return hs;
      };
    };
    var headers = function(reqContent) {
      return addHeader(map(functorMaybe)(ContentType.create)(bindFlipped(bindMaybe)(toMediaType)(reqContent)))(addHeader(map(functorMaybe)(Accept.create)(toMediaType2(req.responseFormat)))(req.headers));
    };
    var ajaxRequest = function(v2) {
      return {
        method: print(req.method),
        url: req.url,
        headers: map(functorArray)(function(h) {
          return {
            field: name2(h),
            value: value(h)
          };
        })(headers(req.content)),
        content: v2,
        responseType: toResponseType(req.responseFormat),
        username: toNullable(req.username),
        password: toNullable(req.password),
        withCredentials: req.withCredentials,
        timeout: fromMaybe(0)(map(functorMaybe)(function(v1) {
          return v1;
        })(req.timeout))
      };
    };
    var send = function(content3) {
      return mapFlipped(functorAff)($$try(monadErrorAff)(fromEffectFnAff(_ajax(driver2, "AffjaxTimeoutErrorMessageIdent", "AffjaxRequestFailedMessageIdent", ResponseHeader.create, ajaxRequest(content3)))))(function(v2) {
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
            var $38 = message2 === "AffjaxTimeoutErrorMessageIdent";
            if ($38) {
              return TimeoutError.value;
            }
            ;
            var $39 = message2 === "AffjaxRequestFailedMessageIdent";
            if ($39) {
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
        return pure(applicativeAff)(new Left(new RequestContentError(v.value0)));
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
var Loading = /* @__PURE__ */ function() {
  function Loading3() {
  }
  ;
  Loading3.value = new Loading3();
  return Loading3;
}();
var Result = /* @__PURE__ */ function() {
  function Result2(value0) {
    this.value0 = value0;
  }
  ;
  Result2.create = function(value0) {
    return new Result2(value0);
  };
  return Result2;
}();
var px2 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var clickText = "Click to get some random user data.";
var clickCb = function(push2) {
  return cb($$const(function __do3() {
    push2(Loading.value)();
    return launchAff_(bind(bindAff)(request2({
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
        return liftEffect(monadEffectAff)(push2(new Result("GET /api response failed to decode: " + printError(result.value0))));
      }
      ;
      if (result instanceof Right) {
        return liftEffect(monadEffectAff)(push2(new Result(stringifyWithIndent(2)(result.value0.body))));
      }
      ;
      throw new Error("Failed pattern match at Deku.Example.Docs.Effects (line 41, column 9 - line 48, column 48): " + [result.constructor.name]);
    }))();
  }));
};
var effects = function(dpage) {
  return makePursx({
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
  })()()(pursxToElementConsInsert()(pursxToElementConsAttr()(pursxToElementConsInsert()(pursxToElementNil)({
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
  }))(px2)({
    code: nut(plantElementDomable(refl)(refl))(pre_(plantArrayElementDomable(refl)(refl))([code_(plantArrayElementDomable(refl)(refl))([text_('module Main where\n\nimport Prelude\n\nimport Affjax as AX\nimport Affjax.ResponseFormat as ResponseFormat\nimport Control.Alt ((<|>))\nimport Data.Argonaut.Core (stringifyWithIndent)\nimport Data.Either (Either(..))\nimport Data.Filterable (compact, filterMap)\nimport Data.HTTP.Method (Method(..))\nimport Data.Maybe (Maybe(..))\nimport Data.Profunctor (lcmap)\nimport Data.Tuple.Nested ((/\\))\nimport Deku.Attribute (Cb, cb, (:=))\nimport Deku.Control (plant, text)\nimport Deku.DOM as D\nimport Deku.Toplevel (runInBody)\nimport Effect (Effect)\nimport Effect.Aff (launchAff_)\nimport Effect.Class (liftEffect)\nimport FRP.Event (keepLatest, mapAccum, bus, bang)\n\ndata UIAction = Initial | Loading | Result String\n\nclickCb :: (UIAction -> Effect Unit) -> Cb\nclickCb push = cb\n  ( const do\n      push Loading\n      launchAff_ $ do\n        result <- AX.request\n          ( AX.defaultRequest\n              { url = "https://randomuser.me/api/"\n              , method = Left GET\n              , responseFormat = ResponseFormat.json\n              }\n          )\n        case result of\n          Left err -> liftEffect $ push\n            $ Result\n              ( "GET /api response failed to decode: " <>\n                  AX.printError err\n              )\n          Right response -> liftEffect $ push $ Result $\n            stringifyWithIndent 2 response.body\n  )\n\nclickText = "Click to get some random user data." :: String\n\nmain :: Effect Unit\nmain = runInBody\n  ( keepLatest $ bus \\push -> lcmap (bang Initial <|> _)\n      \\event ->\n        let\n          loadingOrResult = filterMap\n            ( case _ of\n                Loading -> Just $ Left unit\n                Result s -> Just $ Right s\n                _ -> Nothing\n            )\n            event\n          loading = filterMap\n            ( case _ of\n                Left _ -> Just unit\n                _ -> Nothing\n            )\n            loadingOrResult\n          result = filterMap\n            ( case _ of\n                Right s -> Just s\n                _ -> Nothing\n            )\n            loadingOrResult\n        in\n          plant\n            [ D.div_\n                [ D.button (bang (D.OnClick := clickCb push))\n                    [ text\n                        ( bang clickText\n                            <|> (loading $> "Loading...")\n                            <|> (result $> clickText)\n                        )\n                    ]\n                ]\n            , D.div\n                ( (bang (D.Style := "display: none;")) <|>\n                    ( compact\n                        ( mapAccum\n                            ( \\_ b -> (b && false) /\\\n                                if b then Just unit else Nothing\n                            )\n                            result\n                            true\n                        ) $> (D.Style := "display: block;")\n                    )\n                )\n                [ D.pre_ [ D.code_ [ text (bang "" <|> result) ] ] ]\n            ]\n  )\n')])])),
    result: nut(plantEventDomableDomable(refl)(refl))(bus(function(push2) {
      return function(event) {
        return plant(plantElementDomable(refl)(refl))(function() {
          var loadingOrResult = filterMap(filterableEvent)(function(v) {
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
          var result = filterMap(filterableEvent)(function(v) {
            if (v instanceof Right) {
              return new Just(v.value0);
            }
            ;
            return Nothing.value;
          })(loadingOrResult);
          var loading = filterMap(filterableEvent)(function(v) {
            if (v instanceof Left) {
              return new Just(unit);
            }
            ;
            return Nothing.value;
          })(loadingOrResult);
          return div_(plantArrayElementDomable(refl)(refl))([div_(plantArrayElementDomable(refl)(refl))([button(plantArrayElementDomable(refl)(refl))(bang2(attr(attrOnClickCb)(OnClick.value)(clickCb(push2))))([text(alt(altEvent)(bang2(clickText))(alt(altEvent)(voidLeft(functorEvent)(loading)("Loading..."))(voidLeft(functorEvent)(result)(clickText))))])]), div2(plantArrayElementDomable(refl)(refl))(alt(altEvent)(bang2(attr(attrDiv_StyleString)(Style.value)("display: none;")))(voidLeft(functorEvent)(compact(compactableEvent)(mapAccum(eventIsEvent)(function(v) {
            return function(b) {
              return new Tuple(b && false, function() {
                if (b) {
                  return new Just(unit);
                }
                ;
                return Nothing.value;
              }());
            };
          })(result)(true)))(attr(attrDiv_StyleString)(Style.value)("display: block;"))))([pre_(plantArrayElementDomable(refl)(refl))([code_(plantArrayElementDomable(refl)(refl))([text(alt(altEvent)(bang2(""))(result))])])])]);
        }());
      };
    })),
    next: bang2(attr(attrOnClickCb)(OnClick.value)(cb($$const(applySecond(applyEffect)(dpage(PURSX2.value))(scrollToTop)))))
  });
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

// output/Web.Event.Event/foreign.js
function _target(e) {
  return e.target;
}

// output/Web.Event.Event/index.js
var target = function($0) {
  return toMaybe(_target($0));
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

// output/Deku.Listeners/index.js
var slider = /* @__PURE__ */ function() {
  var $6 = alt(altEvent)(bang2(attr(attrInput_XtypeString)(Xtype.value)("range")));
  var $7 = map(functorEvent)(function(push2) {
    return attr(attrOnInputCb)(OnInput.value)(cb(function(e) {
      return for_(applicativeEffect)(foldableMaybe)(bind(bindMaybe)(target(e))(fromEventTarget))(composeKleisli(bindEffect)(valueAsNumber)(push2));
    }));
  });
  return function($8) {
    return $6($7($8));
  };
}();
var click_ = function(dictFunctor) {
  return function(dictMonoid) {
    return function(dictAttr) {
      return map(dictFunctor)(function() {
        var $9 = attr(dictAttr)(OnClick.value);
        return function($10) {
          return $9(function(v) {
            return v(mempty(dictMonoid));
          }($10));
        };
      }());
    };
  };
};

// output/FRP.Event.VBus/foreign.js
var _____$__$_$$_vbus = "_____$__$_$$_vbus";
function unsafeDestroyS(s) {
  return () => {
    for (const key2 in s) {
      delete s[key2];
    }
  };
}
function unsafePE(u) {
  return () => {
    const doAssigns = (s2, p2, e2, u2) => {
      const ok = Object.keys(u2);
      for (var i2 = 0; i2 < ok.length; i2++) {
        if (u2[ok[i2]] instanceof Object && u2[ok[i2]][_____$__$_$$_vbus] === _____$__$_$$_vbus) {
          const p0 = {};
          const e0 = {};
          doAssigns(s2, p0, e0, u2[ok[i2]]);
          p2[ok[i2]] = p0;
          e2[ok[i2]] = e0;
        } else {
          const rn = `${Math.random()}`;
          s2[rn] = {};
          p2[ok[i2]] = (v) => () => {
            const rnk = Object.keys(s2[rn]);
            for (var j = 0; j < rnk.length; j++) {
              s2[rn][rnk[j]](v)();
            }
          };
          e2[ok[i2]] = (f) => () => {
            const k = `${Math.random()}`;
            s2[rn][k] = f;
            return () => {
              delete s2[rn][k];
            };
          };
        }
      }
    };
    const s = {};
    const p = {};
    const e = {};
    doAssigns(s, p, e, u);
    return { p, e, s };
  };
}

// output/FRP.Event.VBus/index.js
var vbusNil = {
  vb: function(v) {
    return function(v1) {
      return function(v2) {
        return {};
      };
    };
  }
};
var vb = function(dict) {
  return dict.vb;
};
var vbus = function() {
  return function(dictVBus) {
    return function(v) {
      return function(f) {
        var vbd = vb(dictVBus)($$Proxy.value)($$Proxy.value)($$Proxy.value);
        return makeEvent(function(k) {
          return function __do3() {
            var upe = unsafePE(vbd)();
            k(f(upe.p)(upe.e))();
            return unsafeDestroyS(upe.s);
          };
        });
      };
    };
  };
};
var vbusCons2 = function(dictIsSymbol) {
  return function() {
    return function() {
      return function(dictVBus) {
        return function() {
          return function() {
            return function() {
              return function() {
                return {
                  vb: function(v) {
                    return function(v1) {
                      return function(v2) {
                        return insert4(dictIsSymbol)()()($$Proxy.value)(unit)(vb(dictVBus)($$Proxy.value)($$Proxy.value)($$Proxy.value));
                      };
                    };
                  }
                };
              };
            };
          };
        };
      };
    };
  };
};

// output/Deku.Example.Docs.Events/index.js
var px3 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var events = function(dpage) {
  return makePursx({
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
  })()()(pursxToElementConsInsert()(pursxToElementConsAttr()(pursxToElementConsInsert()(pursxToElementNil)({
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
  }))(px3)({
    code: nut(plantElementDomable(refl)(refl))(pre_(plantArrayElementDomable(refl)(refl))([code_(plantArrayElementDomable(refl)(refl))([text_('module Main where\n\nimport Prelude\n\nimport Control.Alt ((<|>))\nimport Deku.Attribute ((:=))\nimport Deku.Control (blank, plant, text, text_)\nimport Deku.DOM as D\nimport Deku.Listeners (slider)\nimport Deku.Toplevel (runInBody1)\nimport Effect (Effect)\nimport FRP.Event (bang, fold)\nimport FRP.Event.VBus (V, vbus)\nimport Type.Proxy (Proxy(..))\n\ntype UIEvents = V\n  ( uiShow :: Unit\n  , buttonClicked :: Unit\n  , sliderMoved :: Number\n  )\n\nmain :: Effect Unit\nmain = runInBody1\n  ( vbus (Proxy :: _ UIEvents) \\push event -> plant do\n      D.div_\n        [ D.button\n            ( bang\n                ( D.OnClick := push.buttonClicked unit)\n            )\n            [ text_ "Click" ]\n        , D.div_\n            [ text\n                ( bang "Val: 0" <|>\n                    ( append "Val: " <<< show\n                        <$> fold\n                          (const (add 1))\n                          (bang unit <|> event.buttonClicked)\n                          (-1)\n                    )\n                )\n            ]\n        , D.div_\n            [ D.input\n                (slider (bang push.sliderMoved))\n                blank\n            , D.div_\n                [ text\n                    ( bang "Val: 50" <|>\n                        ( append "Val: " <<< show\n                            <$> event.sliderMoved\n                        )\n                    )\n                ]\n            ]\n        ]\n  )\n')])])),
    result: nut(plantEventDomableDomable(refl)(refl))(vbus()(vbusCons2({
      reflectSymbol: function() {
        return "buttonClicked";
      }
    })()()(vbusCons2({
      reflectSymbol: function() {
        return "sliderMoved";
      }
    })()()(vbusCons2({
      reflectSymbol: function() {
        return "uiShow";
      }
    })()()(vbusNil)()()()())()()()())()()()())($$Proxy.value)(function(push2) {
      return function(event) {
        return plant(plantElementDomable(refl)(refl))(div_(plantArrayElementDomable(refl)(refl))([button(plantArrayElementDomable(refl)(refl))(click_(functorEvent)(monoidUnit)(attrOnClickEffectUnit)(bang2(push2.buttonClicked)))([text_("Click")]), div_(plantArrayElementDomable(refl)(refl))([text(alt(altEvent)(bang2("Val: 0"))(map(functorEvent)(function() {
          var $0 = append(semigroupString)("Val: ");
          var $1 = show(showInt);
          return function($2) {
            return $0($1($2));
          };
        }())(fold3(eventIsEvent)($$const(add(semiringInt)(1)))(alt(altEvent)(bang2(unit))(event.buttonClicked))(-1 | 0))))]), div_(plantArrayElementDomable(refl)(refl))([input(plantElementDomable(refl)(refl))(slider(bang2(push2.sliderMoved)))(blank), div_(plantArrayElementDomable(refl)(refl))([text(alt(altEvent)(bang2("Val: 50"))(map(functorEvent)(function() {
          var $3 = append(semigroupString)("Val: ");
          var $4 = show(showNumber);
          return function($5) {
            return $3($4($5));
          };
        }())(event.sliderMoved)))])])]));
      };
    })),
    next: bang2(attr(attrOnClickCb)(OnClick.value)(cb($$const(applySecond(applyEffect)(dpage(Effects.value))(scrollToTop)))))
  });
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

// output/Web.UIEvent.KeyboardEvent/foreign.js
function code2(e) {
  return e.code;
}

// output/Web.UIEvent.KeyboardEvent/index.js
var fromEvent = /* @__PURE__ */ unsafeReadProtoTagged("KeyboardEvent");

// output/Deku.Example.Docs.Events2/index.js
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
var events2 = function(dpage) {
  return makePursx({
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
    <li><code>Insert</code>, which takes an element.</li>
    <li><code>SendToTop</code>, which sends the current element to the top of its parent.</li>
    <li><code>Remove</code>, which removes the element from its parent.</li>
  </ul>

  <p>The Deku engine listens for these in a specific order. <code>Insert</code> can be followed by 0 or more <code>SendToTop</code>-s. When a <code>Remove</code> is called, the stream is unsubscribed from the parent. Because we're in the land of <code>Event</code>-s, you can emit anything, but this is the how they will be listened to.</p>

  <h2>Next steps</h2>
  <p>In this section, we used nested events to insert and remove elements from a parent. In the next section, we'll see how we can use <a ~next~ style="cursor:pointer;">portals to move an element to a different place of the DOM</a>.</p>
</div>`;
    }
  })()()(pursxToElementConsInsert()(pursxToElementConsAttr()(pursxToElementConsInsert()(pursxToElementNil)({
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
  }))(px4)({
    code: nut(plantElementDomable(refl)(refl))(pre_(plantArrayElementDomable(refl)(refl))([code_(plantArrayElementDomable(refl)(refl))([text_(`module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Filterable (filterMap)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\\))
import Deku.Attribute (cb, (:=))
import Deku.Control (blank, plant, text_)
import Deku.Core (Child(..))
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (bang, bus, keepLatest, mapAccum)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromEventTarget, value)
import Web.UIEvent.KeyboardEvent (code, fromEvent)

data MainUIAction
  = UIShown
  | AddTodo
  | ChangeText String

data TodoAction = Prioritize | Delete

main :: Effect Unit
main = runInBody1
  ( bus \\push -> lcmap (bang UIShown <|> _) \\event -> plant do
      let
        top =
          [ D.input
              ( oneOfMap bang
                  [ D.OnInput := cb \\e -> for_
                      ( target e
                          >>= fromEventTarget
                      )
                      ( value
                          >=> push <<< ChangeText
                      )
                  , D.OnKeyup := cb
                      \\e -> for_ (fromEvent e) \\evt -> do
                        when (code evt == "Enter") $ do
                          push AddTodo
                  ]
              )
              blank
          , D.button
              (bang $ D.OnClick :=  push AddTodo)
              (text_ "Add")
          ]
      D.div_
        [ D.div_ top
        , D.div_ $
            ( \\txt -> keepLatest $ bus \\p' e' ->
                ( bang $ Insert $ D.div_
                    [ text_ txt
                    , D.button
                        ( bang
                            $ D.OnClick := p' SendToTop
                        )
                        [ text_ "Prioritize" ]
                    , D.button
                        ( bang
                            $ D.OnClick :=  p' Remove
                        )
                        [ text_ "Delete" ]
                    ]
                ) <|> e'
            ) <$>
              filterMap
                ( \\(tf /\\ s) ->
                    if tf then Just s else Nothing
                )
                ( mapAccum
                    ( \\a b -> case a of
                        ChangeText s -> s /\\ (false /\\ s)
                        AddTodo -> b /\\ (true /\\ b)
                        _ -> "" /\\ (false /\\ "")
                    )
                    event
                    ""
                )
        ]
  )
`)])])),
    result: nut(plantEventDomableDomable(refl)(refl))(bus(function(push2) {
      return lcmap(profunctorFn)(alt(altEvent)(bang2(UIShown.value)))(function(event) {
        return plant(plantElementDomable(refl)(refl))(div_(plantArrayElementDomable(refl)(refl))([div_(plantArrayElementDomable(refl)(refl))([input(plantElementDomable(refl)(refl))(oneOfMap(foldableArray)(plusEvent)(bang2)([attr(attrInput_StyleString)(Style.value)("border-style:solid;border-width: 1px;border-color: black;"), attr(attrOnInputCb)(OnInput.value)(cb(function(e) {
          return for_(applicativeEffect)(foldableMaybe)(bind(bindMaybe)(target(e))(fromEventTarget))(composeKleisli(bindEffect)(value2)(function($7) {
            return push2(ChangeText.create($7));
          }));
        })), attr(attrOnKeyupCb)(OnKeyup.value)(cb(function(e) {
          return for_(applicativeEffect)(foldableMaybe)(fromEvent(e))(function(evt) {
            return when(applicativeEffect)(code2(evt) === "Enter")(push2(AddTodo.value));
          });
        }))]))(blank), button(plantElementDomable(refl)(refl))(alt(altEvent)(bang2(attr(attrButton_StyleString)(Style.value)("margin: 5px;")))(bang2(attr(attrOnClickCb)(OnClick.value)(cb($$const(push2(AddTodo.value)))))))(text_("Add"))]), div_(plantEventEventChildDomab(refl)(refl))(map(functorEvent)(function(txt) {
          return keepLatest(eventIsEvent)(bus(function(p$prime) {
            return function(e$prime) {
              return alt(altEvent)(bang2(new Insert(div_(plantArrayElementDomable(refl)(refl))([span3(plantElementDomable(refl)(refl))(bang2(attr(attrSpan_StyleString)(Style.value)("margin: 5px;")))(text_(txt)), button(plantArrayElementDomable(refl)(refl))(alt(altEvent)(bang2(attr(attrButton_StyleString)(Style.value)("margin: 5px;")))(bang2(attr(attrOnClickCb)(OnClick.value)(cb($$const(p$prime(SendToTop.value)))))))([text_("Prioritize")]), button(plantArrayElementDomable(refl)(refl))(alt(altEvent)(bang2(attr(attrButton_StyleString)(Style.value)("margin: 5px;")))(bang2(attr(attrOnClickCb)(OnClick.value)(cb($$const(p$prime(Remove.value)))))))([text_("Delete")])]))))(e$prime);
            };
          }));
        })(filterMap(filterableEvent)(function(v) {
          if (v.value0) {
            return new Just(v.value1);
          }
          ;
          return Nothing.value;
        })(mapAccum(eventIsEvent)(function(a2) {
          return function(b) {
            if (a2 instanceof ChangeText) {
              return new Tuple(a2.value0, new Tuple(false, a2.value0));
            }
            ;
            if (a2 instanceof AddTodo) {
              return new Tuple(b, new Tuple(true, b));
            }
            ;
            return new Tuple("", new Tuple(false, ""));
          };
        })(event)(""))))]));
      });
    })),
    next: bang2(attr(attrOnClickCb)(OnClick.value)(cb($$const(applySecond(applyEffect)(dpage(Portals.value))(scrollToTop)))))
  });
};

// output/Deku.Example.Docs.HelloWorld/index.js
var px5 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var helloWorld = function(dpage) {
  return makePursx({
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
  })()()(pursxToElementConsInsert()(pursxToElementConsAttr()(pursxToElementConsInsert()(pursxToElementNil)({
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
  }))(px5)({
    code: nut(plantElementDomable(refl)(refl))(pre_(plantArrayElementDomable(refl)(refl))([code_(plantArrayElementDomable(refl)(refl))([text_('module Main where\n\nimport Prelude\n\nimport Deku.Control (text_)\nimport Deku.Toplevel (runInBody2)\nimport Effect (Effect)\n\nmain :: Effect Unit\nmain = runInBody2 (text_ "Hello world")\n')])])),
    result: nut(plantElementDomable(refl)(refl))(div_(plantArrayElementDomable(refl)(refl))([text_("Hello world")])),
    next: bang(eventIsEvent)(attr(attrOnClickCb)(OnClick.value)(cb($$const(applySecond(applyEffect)(dpage(SimpleComponent.value))(scrollToTop)))))
  });
};

// output/Deku.Example.Docs.Intro/index.js
var px6 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var intro = function(dpage) {
  return makePursx({
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
  })()()(pursxToElementConsAttr()(pursxToElementNil)({
    reflectType: function() {
      return "next";
    }
  })({
    reflectSymbol: function() {
      return "next";
    }
  }))(px6)({
    next: bang(eventIsEvent)(attr(attrOnClickCb)(OnClick.value)(cb($$const(applySecond(applyEffect)(dpage(HelloWorld.value))(scrollToTop)))))
  });
};

// output/Data.Typelevel.Num.Reps/index.js
var d1 = $$undefined;
var d0 = $$undefined;

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

// output/Deku.DOM.Elt.Source/index.js
var source = function(dictPlant) {
  return function(attributes) {
    return function(seed) {
      return elementify("source")(attributes)(plant(dictPlant)(seed));
    };
  };
};

// output/Deku.DOM.Elt.Video/index.js
var video = function(dictPlant) {
  return function(attributes) {
    return function(seed) {
      return elementify("video")(attributes)(plant(dictPlant)(seed));
    };
  };
};

// output/Deku.Example.Docs.Portals1/index.js
var px7 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var portals1 = function(v) {
  return makePursx({
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

  <h2>Parting shot</h2>
  <p>Thanks for checking out Deku! I had a blast writing it, and I hope you enjoy using it for your projects!</p>
</div>`;
    }
  })()()(pursxToElementConsInsert()(pursxToElementConsInsert()(pursxToElementNil)({
    reflectType: function() {
      return "result";
    }
  })({
    reflectSymbol: function() {
      return "result";
    }
  }))({
    reflectType: function() {
      return "code";
    }
  })({
    reflectSymbol: function() {
      return "code";
    }
  }))(px7)({
    code: nut(plantElementDomable(refl)(refl))(pre_(plantArrayElementDomable(refl)(refl))([code_(plantArrayElementDomable(refl)(refl))([text_('module Main where\n\nimport Prelude\n\nimport Control.Alt ((<|>))\nimport Data.Foldable (oneOfMap)\nimport Data.Profunctor (lcmap)\nimport Data.Tuple.Nested ((/\\), type (/\\))\nimport Data.Typelevel.Num (d0, d1)\nimport Data.Vec (index, (+>))\nimport Data.Vec as V\nimport Deku.Attribute ((:=))\nimport Deku.Control (blank, plant, portal, switcher, text_)\nimport Deku.DOM as D\nimport Deku.Toplevel (runInBody1)\nimport Effect (Effect)\nimport FRP.Event (Event, bang, bus, fold, mapAccum)\n\ncounter :: forall a. Event a \u2192 Event (a /\\ Int)\ncounter event = mapAccum f event 0\n  where\n  f a b = (b + 1) /\\ (a /\\ b)\n\nmain :: Effect Unit\nmain = runInBody1\n  ( bus \\push -> lcmap  (bang unit <|> _) \\event -> do\n      plant $ portal\n        ( map\n            ( \\i -> D.video\n                (oneOfMap bang [ D.Controls := "true", D.Width := "250" ])\n                ( D.source\n                    (oneOfMap bang [ D.Src := i, D.Xtype := "video/mp4" ])\n                    blank\n                )\n            )\n            ( "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"\n                +> "https://www.w3schools.com/jsref/movie.mp4"\n                +> V.empty\n            )\n        )\n        \\v _ -> do\n          let\n            p0 = index v d0\n            p1 = index v d1\n            ev = fold (const not) event\n            flips = switcher (if _ then p0 else p1) <<< ev\n          plant $ D.div_\n            [ D.button (bang $ D.OnClick := push unit)\n                [ text_ "Switch videos" ]\n            , D.div_ [ D.span_ (flips true), D.span_ (flips false) ]\n            ]\n  )\n')])])),
    result: nut(plantEventEventChildDomab(refl)(refl))(bus(function(push2) {
      return lcmap(profunctorFn)(alt(altEvent)(bang2(unit)))(function(event) {
        return bang2(new Insert(portal(map(functorVec)(function(i2) {
          return video(plantElementDomable(refl)(refl))(oneOfMap(foldableArray)(plusEvent)(bang2)([attr(attrVideo_ControlsString)(Controls.value)("true"), attr(attrVideo_WidthString)(Width.value)("250")]))(source(plantElementDomable(refl)(refl))(oneOfMap(foldableArray)(plusEvent)(bang2)([attr(attrSource_SrcString)(Src.value)(i2), attr(attrSource_XtypeString)(Xtype.value)("video/mp4")]))(blank));
        })(cons5(typelevelSucc(posD2)()(divMod10D1D0)()(divMod10D2D0))("https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4")(cons5(typelevelSucc(posD1)()(divMod10D0D0)()(divMod10D1D0))("https://www.w3schools.com/jsref/movie.mp4")(empty4))))(function(v1) {
          return function(v2) {
            var p1 = index4(natD1)()(v1)(d1);
            var p0 = index4(natD0)()(v1)(d0);
            var ev = fold3(eventIsEvent)($$const(not(heytingAlgebraBoolean)))(event);
            var flips = function() {
              var $4 = switcher(function(v3) {
                if (v3) {
                  return p0;
                }
                ;
                return p1;
              });
              return function($5) {
                return $4(ev($5));
              };
            }();
            return plant(plantElementDomable(refl)(refl))(div_(plantArrayElementDomable(refl)(refl))([button(plantArrayElementDomable(refl)(refl))(bang2(attr(attrOnClickCb)(OnClick.value)(cb($$const(push2(unit))))))([text_("Switch videos")]), div_(plantArrayElementDomable(refl)(refl))([span_(plantDomableDomable(refl)(refl))(flips(true)), span_(plantDomableDomable(refl)(refl))(flips(false))])]));
          };
        })));
      });
    }))
  });
};

// output/Deku.Example.Docs.Pursx1/index.js
var px8 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var myDom = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var pursx1 = function(dpage) {
  return makePursx({
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
  <p>In this section, we PursX to build the same component as the previous section. In the next section, we'll learn how to respond to <a ~next~ style="cursor:pointer;">events</a>.</p>
</div>`;
    }
  })()()(pursxToElementConsInsert()(pursxToElementConsAttr()(pursxToElementConsInsert()(pursxToElementNil)({
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
  }))(px8)({
    code: nut(plantElementDomable(refl)(refl))(pre_(plantArrayElementDomable(refl)(refl))([code_(plantArrayElementDomable(refl)(refl))([text_('module Main where\n\nimport Prelude\n\nimport Deku.Pursx (psx)\nimport Deku.Toplevel (runInBody2)\nimport Effect (Effect)\nimport FRP.Event (bang)\nimport Type.Proxy (Proxy(..))\n\nmyDom = Proxy :: Proxy """<div>\n    <button>I do nothing</button>\n    <ul>\n        <li>A</li>\n        <li>B</li>\n        <li>C</li>\n    </ul>\n    <div>\n        <a href="https://github.com/mikesol/purescript-deku"></a>\n        <i>bar</i>\n        <span style="font-weight:800;">baz</span>\n    </div>\n    <div><div></div><div><input type="range"/></div></div>\n    </div>\n"""\n\nmain :: Effect Unit\nmain = runInBody2 (psx myDom)\n')])])),
    result: nut(plantElementDomable(refl)(refl))(psx({
      reflectType: function() {
        return '<div>\n    <button>I do nothing</button>\n    <ul>\n        <li>A</li>\n        <li>B</li>\n        <li>C</li>\n    </ul>\n    <div>\n        <a href="https://example.com">foo</a>\n        <i>bar</i>\n        <span style="font-weight:800;">baz</span>\n    </div>\n    <div><div></div><div><input type="range"/></div></div>\n    </div>\n';
      }
    })()(pursxToElementNil)(myDom)),
    next: bang(eventIsEvent)(attr(attrOnClickCb)(OnClick.value)(cb($$const(applySecond(applyEffect)(dpage(Events.value))(scrollToTop)))))
  });
};

// output/Deku.Example.Docs.Pursx2/index.js
var px9 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var myDom2 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var pursx2 = function(dpage) {
  return makePursx$prime({
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
  })()()(pursxToElementConsInsert()(pursxToElementConsAttr()(pursxToElementConsInsert()(pursxToElementNil)({
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
  }))($$Proxy.value)(px9)({
    code: nut(plantElementDomable(refl)(refl))(pre_(plantArrayElementDomable(refl)(refl))([code_(plantArrayElementDomable(refl)(refl))([text_('module Main where\n\nimport Prelude\n\nimport Control.Alt ((<|>))\nimport Data.Compactable (compact)\nimport Data.Maybe (Maybe(..))\nimport Deku.Attribute (cb, (:=))\nimport Deku.Control (text)\nimport Deku.DOM as D\nimport Deku.Pursx (nut, (~~))\nimport Deku.Toplevel (runInBody1)\nimport Effect (Effect)\nimport FRP.Event (bus, bang)\nimport Type.Proxy (Proxy(..))\n\nmyDom =\n  Proxy :: Proxy """<div>\n        <button>I do nothing</button>\n        <ul>\n          <li>A</li>\n          <li ~myli~>B</li>\n          <li>C</li>\n        </ul>\n        <div>\n          <a href="https://github.com/mikesol/purescript-deku"></a>\n          <i>bar</i>\n          ~somethingNew~\n          <span style="font-weight:800;">baz</span>\n        </div>\n        <div><div></div><div><input type="range"/></div></div>\n      </div>\n"""\n\nmain :: Effect Unit\nmain = runInBody1\n  ( bus \\push event -> myDom ~~\n      { myli: bang (D.Style := "background-color:rgb(200,240,210);")\n      , somethingNew: nut\n          ( D.button (bang (D.OnClick := push (Just unit)))\n              [ text\n                  $ (compact event $> "Thanks for clicking me!") <|>\n                    bang "I was dynamically inserted"\n              ]\n          )\n      }\n  )')])])),
    result: nut(plantEventEventChildDomab(refl)(refl))(bus(function(push2) {
      return function(event) {
        return bang2(new Insert(makePursx({
          reflectType: function() {
            return '<div>\n        <button>I do nothing</button>\n        <ul>\n          <li>A</li>\n          <li ~myli~>B</li>\n          <li>C</li>\n        </ul>\n        <div>\n          <a href="https://github.com/mikesol/purescript-deku"></a>\n          <i>bar</i>\n          ~somethingNew~\n          <span style="font-weight:800;">baz</span>\n        </div>\n        <div><div></div><div><input type="range"/></div></div>\n      </div>\n';
          }
        })()()(pursxToElementConsAttr()(pursxToElementConsInsert()(pursxToElementNil)({
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
        }))(myDom2)({
          myli: bang2(attr(attrLi_StyleString)(Style.value)("background-color:rgb(200,240,210);")),
          somethingNew: nut(plantElementDomable(refl)(refl))(button(plantArrayElementDomable(refl)(refl))(bang2(attr(attrOnClickEffectUnit)(OnClick.value)(push2(new Just(unit)))))([text(alt(altEvent)(voidLeft(functorEvent)(compact(compactableEvent)(event))("Thanks for clicking me!"))(bang2("I was dynamically inserted")))]))
        })));
      };
    })),
    next: bang2(attr(attrOnClickCb)(OnClick.value)(cb($$const(applySecond(applyEffect)(dpage(Events2.value))(scrollToTop)))))
  });
};

// output/Deku.Interpret/foreign.js
var connectXToY_ = function(x) {
  return function(y) {
    return function(state3) {
      return function() {
        if (y === "@portal@") {
          return;
        }
        state3.units[y].main.appendChild(state3.units[x].main);
      };
    };
  };
};
function makeElement_(a2) {
  return function(state3) {
    return function() {
      var ptr = a2.id;
      if (!state3.scopes[a2.scope]) {
        state3.scopes[a2.scope] = [];
      }
      state3.scopes[a2.scope].push(ptr);
      state3.units[ptr] = {
        listeners: {},
        parent: a2.parent,
        scope: a2.scope,
        main: document.createElement(a2.tag)
      };
      connectXToY_(ptr)(a2.parent)(state3)();
    };
  };
}
function makeText_(a2) {
  return function(state3) {
    return function() {
      var ptr = a2.id;
      if (!state3.scopes[a2.scope]) {
        state3.scopes[a2.scope] = [];
      }
      state3.scopes[a2.scope].push(ptr);
      state3.units[ptr] = {
        main: document.createTextNode(""),
        parent: a2.parent,
        scope: a2.scope
      };
      connectXToY_(ptr)(a2.parent)(state3)();
    };
  };
}
function makeFFIDOMSnapshot() {
  return {
    units: {},
    scopes: {}
  };
}
function setProp_(a2) {
  return function(state3) {
    return function() {
      var ptr = a2.id;
      var avv = a2.value;
      if (state3.units[ptr].main.tagName === "INPUT" && a2.key === "value") {
        state3.units[ptr].main.value = avv;
      } else if (state3.units[ptr].main.tagName === "INPUT" && a2.key === "checked") {
        state3.units[ptr].main.checked = avv === "true";
      } else {
        state3.units[ptr].main.setAttribute(a2.key, avv);
      }
    };
  };
}
function setCb_(a2) {
  return function(state3) {
    return function() {
      var ptr = a2.id;
      var avv = a2.value;
      if (a2.key === "@self@") {
        avv(state3.units[ptr].main)();
      } else {
        if (state3.units[ptr].listeners[a2.key]) {
          state3.units[ptr].main.removeEventListener(a2.key, state3.units[ptr].listeners[a2.key]);
        }
        var el = (e) => avv(e)();
        state3.units[ptr].main.addEventListener(a2.key, el);
        state3.units[ptr].listeners[a2.key] = el;
      }
    };
  };
}
function setText_(a2) {
  return function(state3) {
    return function() {
      var ptr = a2.id;
      state3.units[ptr].main.nodeValue = a2.text;
    };
  };
}
var makePursx_ = function(a2) {
  return function(state3) {
    return function() {
      var ptr = a2.id;
      var html = a2.html;
      var verb = a2.verb;
      var cache = a2.cache;
      var parent2 = a2.parent;
      var scope2 = a2.scope;
      var entries = Object.entries(cache);
      for (var i2 = 0; i2 < entries.length; i2++) {
        var key2 = entries[i2][0];
        if (entries[i2][1] === true) {
          html = html.replace(verb + key2 + verb, 'data-deku-attr-internal="' + key2 + '"');
        } else {
          html = html.replace(verb + key2 + verb, '<span style="display:contents;" data-deku-elt-internal="' + key2 + '"></span>');
        }
      }
      var tmp = document.createElement("div");
      tmp.innerHTML = html.trim();
      if (!state3.scopes[a2.dkScope]) {
        state3.scopes[a2.dkScope] = [];
      }
      state3.scopes[a2.dkScope].push(ptr);
      state3.units[ptr] = {
        listeners: {},
        scope: a2.dkScope,
        parent: parent2,
        main: tmp.firstChild
      };
      tmp.querySelectorAll("[data-deku-attr-internal]").forEach(function(e) {
        var key3 = e.getAttribute("data-deku-attr-internal");
        state3.units[key3 + scope2] = {
          listeners: {},
          main: e,
          scope: a2.dkScope
        };
        state3.scopes[a2.dkScope].push(key3 + scope2);
      });
      tmp.querySelectorAll("[data-deku-elt-internal]").forEach(function(e) {
        var key3 = e.getAttribute("data-deku-elt-internal");
        state3.units[key3 + scope2] = {
          listeners: {},
          main: e,
          scope: a2.dkScope
        };
        state3.scopes[a2.dkScope].push(key3 + scope2);
      });
      connectXToY_(ptr)(parent2)(state3)();
    };
  };
};
function makeRoot_(a2) {
  return function(state3) {
    return function() {
      var ptr = a2.id;
      state3.units[ptr] = {
        main: a2.root
      };
    };
  };
}
function makeNoop_(a2) {
  return function(state3) {
    return function() {
      var ptr = a2.id;
      state3.units[ptr] = {
        noop: true
      };
    };
  };
}
function giveNewParent_(a2) {
  return function(state3) {
    return function() {
      var ptr = a2.id;
      var parent2 = a2.parent;
      state3.units[ptr].containingScope = a2.scope;
      state3.units[parent2].main.prepend(state3.units[ptr].main);
    };
  };
}
function disconnectElement_(a2) {
  return function(state3) {
    return function() {
      var ptr = a2.id;
      if (state3.units[ptr].noop) {
        return;
      }
      if (state3.units[ptr].containingScope && state3.units[ptr].containingScope !== a2.scope) {
        return;
      }
      state3.units[ptr].main.remove();
    };
  };
}
function deleteFromCache_(a2) {
  return function(state3) {
    return function() {
      delete state3.units[a2.id];
    };
  };
}
function sendToTop_(a2) {
  return function(state3) {
    return function() {
      var ptr = a2.id;
      state3.units[ptr].main.parentNode.prepend(state3.units[ptr].main);
    };
  };
}

// output/Deku.Interpret/index.js
var effectfulDOMInterpret = {
  ids: /* @__PURE__ */ map(functorEffect)(/* @__PURE__ */ show(showNumber))(random),
  makeElement: makeElement_,
  makeRoot: makeRoot_,
  makeText: makeText_,
  makePursx: makePursx_,
  setProp: setProp_,
  setCb: setCb_,
  setText: setText_,
  sendToTop: sendToTop_,
  makeNoop: makeNoop_,
  deleteFromCache: deleteFromCache_,
  giveNewParent: giveNewParent_,
  disconnectElement: disconnectElement_
};

// output/Web.HTML/foreign.js
var windowImpl = function() {
  return window;
};

// output/Web.HTML.HTMLDocument/foreign.js
function _body(doc) {
  return function() {
    return doc.body;
  };
}

// output/Web.HTML.HTMLDocument/index.js
var body = /* @__PURE__ */ function() {
  var $10 = map(functorEffect)(toMaybe);
  return function($11) {
    return $10(_body($11));
  };
}();

// output/Web.HTML.HTMLElement/index.js
var toElement = unsafeCoerce2;

// output/Web.HTML.Window/foreign.js
function document2(window2) {
  return function() {
    return window2.document;
  };
}

// output/Deku.Example.Docs/index.js
var scene = function(push2) {
  return function(event) {
    var page = function(dpage) {
      return function(v) {
        if (v instanceof Intro) {
          return intro(dpage);
        }
        ;
        if (v instanceof HelloWorld) {
          return helloWorld(dpage);
        }
        ;
        if (v instanceof SimpleComponent) {
          return components(dpage);
        }
        ;
        if (v instanceof PURSX1) {
          return pursx1(dpage);
        }
        ;
        if (v instanceof Events) {
          return events(dpage);
        }
        ;
        if (v instanceof Effects) {
          return effects(dpage);
        }
        ;
        if (v instanceof PURSX2) {
          return pursx2(dpage);
        }
        ;
        if (v instanceof Events2) {
          return events2(dpage);
        }
        ;
        if (v instanceof Portals) {
          return portals1(dpage);
        }
        ;
        throw new Error("Failed pattern match at Deku.Example.Docs (line 90, column 3 - line 90, column 64): " + [dpage.constructor.name, v.constructor.name]);
      };
    };
    return [div_(plantArrayElementDomable(refl)(refl))(map(functorArray)(function(v) {
      return span_(plantArrayElementDomable(refl)(refl))([a(plantArrayElementDomable(refl)(refl))(oneOfMap(foldableArray)(plusEvent)(bang2)([attr(attrOnClickCb)(OnClick.value)(cb($$const(push2(v.value0)))), attr(attrA_StyleString)(Style.value)("cursor:pointer;")]))([text_(v.value1.value0)]), span3(plantArrayElementDomable(refl)(refl))(bang2(attr(attrSpan_StyleString)(Style.value)(function() {
        if (v.value1.value1) {
          return "";
        }
        ;
        return "display:none;";
      }())))([text_(" | ")])]);
    })([new Tuple(Intro.value, new Tuple("Home", true)), new Tuple(HelloWorld.value, new Tuple("Hello world", true)), new Tuple(SimpleComponent.value, new Tuple("Component", true)), new Tuple(PURSX1.value, new Tuple("Pursx 1", true)), new Tuple(Events.value, new Tuple("Events 1", true)), new Tuple(Effects.value, new Tuple("Effects", true)), new Tuple(PURSX2.value, new Tuple("Pursx 2", true)), new Tuple(Events2.value, new Tuple("Events 2", true)), new Tuple(Portals.value, new Tuple("Portals", false))])), div_(plantDomableDomable(refl)(refl))(switcher(page(push2))(event))];
  };
};
var main = function __do2() {
  var b$prime = bind(bindEffect)(bind(bindEffect)(windowImpl)(document2))(body)();
  return for_(applicativeEffect)(foldableMaybe)(map(functorMaybe)(toElement)(b$prime))(function(b) {
    return function __do3() {
      var ffi = makeFFIDOMSnapshot();
      var v = create();
      var evt = dekuA(b)(scene(v.push)(v.event))(effectfulDOMInterpret);
      $$void(functorEffect)(subscribe(evt)(function(i2) {
        return i2(ffi);
      }))();
      return v.push(Intro.value)();
    };
  })();
};

// <stdin>
main();
