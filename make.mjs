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
var composeFlipped = function(dictSemigroupoid) {
  return function(f) {
    return function(g) {
      return compose(dictSemigroupoid)(g)(f);
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
  return function(g) {
    return function(x) {
      return function(y) {
        return f(g(x))(g(y));
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
  return function(a2) {
    return function(b2) {
      return apply(dictApply)(map(dictApply.Functor0())($$const(identity(categoryFn)))(a2))(b2);
    };
  };
};
var lift2 = function(dictApply) {
  return function(f) {
    return function(a2) {
      return function(b2) {
        return apply(dictApply)(map(dictApply.Functor0())(f)(a2))(b2);
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
var discardUnit = {
  discard: function(dictBind) {
    return bind(dictBind);
  }
};
var join = function(dictBind) {
  return function(m) {
    return bind(dictBind)(m)(identity(categoryFn));
  };
};

// output/Unsafe.Coerce/foreign.js
var unsafeCoerce = function(x) {
  return x;
};

// output/Control.Monad.ST.Global/index.js
var toEffect = unsafeCoerce;

// output/Data.Argonaut.Parser/foreign.js
function _jsonParser(fail2, succ2, s2) {
  try {
    return succ2(JSON.parse(s2));
  } catch (e) {
    return fail2(e.message);
  }
}

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
  return function(eq2) {
    return function(gt) {
      return function(x) {
        return function(y) {
          return x < y ? lt : x === y ? eq2 : gt;
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
  return '"' + s2.replace(/[\0-\x1F\x7F"\\]/g, function(c, i2) {
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
    var empty7 = k < l && s2[k] >= "0" && s2[k] <= "9" ? "\\&" : "";
    return "\\" + c.charCodeAt(0).toString(10) + empty7;
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
var eqMaybe = function(dictEq) {
  return {
    eq: function(x) {
      return function(y) {
        if (x instanceof Nothing && y instanceof Nothing) {
          return true;
        }
        ;
        if (x instanceof Just && y instanceof Just) {
          return eq(dictEq)(x.value0)(y.value0);
        }
        ;
        return false;
      };
    }
  };
};
var ordMaybe = function(dictOrd) {
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
          return compare(dictOrd)(x.value0)(y.value0);
        }
        ;
        throw new Error("Failed pattern match at Data.Maybe (line 212, column 1 - line 212, column 51): " + [x.constructor.name, y.constructor.name]);
      };
    },
    Eq0: function() {
      return eqMaybe(dictOrd.Eq0());
    }
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
var applyEither = {
  apply: function(v) {
    return function(v1) {
      if (v instanceof Left) {
        return new Left(v.value0);
      }
      ;
      if (v instanceof Right) {
        return map(functorEither)(v.value0)(v1);
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

// output/Data.Argonaut.Parser/index.js
var jsonParser = function(j) {
  return _jsonParser(Left.create, Right.create, j);
};

// output/Data.Array/foreign.js
var range = function(start2) {
  return function(end) {
    var step3 = start2 > end ? -1 : 1;
    var result = new Array(step3 * (end - start2) + 1);
    var i2 = start2, n = 0;
    while (i2 !== end) {
      result[n++] = i2;
      i2 += step3;
    }
    result[n] = i2;
    return result;
  };
};
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
  return function(foldr2) {
    return function(xs) {
      return listToArray(foldr2(curryCons)(emptyList)(xs));
    };
  };
}();
var length = function(xs) {
  return xs.length;
};
var unconsImpl = function(empty7) {
  return function(next2) {
    return function(xs) {
      return xs.length === 0 ? empty7({}) : next2(xs[0])(xs.slice(1));
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
var zipWith = function(f) {
  return function(xs) {
    return function(ys) {
      var l = xs.length < ys.length ? xs.length : ys.length;
      var result = new Array(l);
      for (var i2 = 0; i2 < l; i2++) {
        result[i2] = f(xs[i2])(ys[i2]);
      }
      return result;
    };
  };
};
var unsafeIndexImpl = function(xs) {
  return function(n) {
    return xs[n];
  };
};

// output/Control.Lazy/index.js
var $runtime_lazy = function(name16, moduleName, init3) {
  var state3 = 0;
  var val;
  return function(lineNumber) {
    if (state3 === 2)
      return val;
    if (state3 === 1)
      throw new ReferenceError(name16 + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state3 = 1;
    val = init3();
    state3 = 2;
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
  return function(f) {
    var $lazy_go = $runtime_lazy("go", "Control.Lazy", function() {
      return defer(dictLazy)(function(v) {
        return f($lazy_go(25));
      });
    });
    var go2 = $lazy_go(25);
    return go2;
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
var foreachE = function(as) {
  return function(f) {
    return function() {
      for (var i2 = 0, l = as.length; i2 < l; i2++) {
        f(as[i2])();
      }
    };
  };
};

// output/Effect/index.js
var $runtime_lazy2 = function(name16, moduleName, init3) {
  var state3 = 0;
  var val;
  return function(lineNumber) {
    if (state3 === 2)
      return val;
    if (state3 === 1)
      throw new ReferenceError(name16 + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state3 = 1;
    val = init3();
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
var $lazy_functorEffect = /* @__PURE__ */ $runtime_lazy2("functorEffect", "Effect", function() {
  return {
    map: liftA1(applicativeEffect)
  };
});
var $lazy_applyEffect = /* @__PURE__ */ $runtime_lazy2("applyEffect", "Effect", function() {
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
    return $$void(functorEffect)(modify(f)(s2));
  };
};

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
var write2 = function(a2) {
  return function(ref) {
    return function() {
      return ref.value = a2;
    };
  };
};

// output/Control.Monad.ST.Internal/index.js
var $runtime_lazy3 = function(name16, moduleName, init3) {
  var state3 = 0;
  var val;
  return function(lineNumber) {
    if (state3 === 2)
      return val;
    if (state3 === 1)
      throw new ReferenceError(name16 + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state3 = 1;
    val = init3();
    state3 = 2;
    return val;
  };
};
var modify$prime2 = modifyImpl2;
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
var $lazy_applyST = /* @__PURE__ */ $runtime_lazy3("applyST", "Control.Monad.ST.Internal", function() {
  return {
    apply: ap(monadST),
    Functor0: function() {
      return functorST;
    }
  };
});
var applyST = /* @__PURE__ */ $lazy_applyST(46);

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
    var i2 = read2(v.value1)();
    modify2(function(v1) {
      return v1 + 1 | 0;
    })(v.value1)();
    return v.value0(i2);
  };
};
var iterator = function(f) {
  return map(functorST)(Iterator.create(f))(newSTRef(0));
};
var iterate = function(iter) {
  return function(f) {
    return function __do3() {
      var $$break = newSTRef(false)();
      while (map(functorST)(not(heytingAlgebraBoolean))(read2($$break))()) {
        (function __do4() {
          var mx = next(iter)();
          if (mx instanceof Just) {
            return f(mx.value0)();
          }
          ;
          if (mx instanceof Nothing) {
            return $$void(functorST)(write2(true)($$break))();
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

// output/Data.Bifunctor/index.js
var bimap = function(dict) {
  return dict.bimap;
};
var lmap = function(dictBifunctor) {
  return function(f) {
    return bimap(dictBifunctor)(f)(identity(categoryFn));
  };
};
var rmap = function(dictBifunctor) {
  return bimap(dictBifunctor)(identity(categoryFn));
};
var bifunctorTuple = {
  bimap: function(f) {
    return function(g) {
      return function(v) {
        return new Tuple(f(v.value0), g(v.value1));
      };
    };
  }
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

// output/Data.Monoid.Endo/index.js
var Endo = function(x) {
  return x;
};
var semigroupEndo = function(dictSemigroupoid) {
  return {
    append: function(v) {
      return function(v1) {
        return compose(dictSemigroupoid)(v)(v1);
      };
    }
  };
};
var monoidEndo = function(dictCategory) {
  return {
    mempty: identity(dictCategory),
    Semigroup0: function() {
      return semigroupEndo(dictCategory.Semigroupoid0());
    }
  };
};

// output/Safe.Coerce/index.js
var coerce = function() {
  return unsafeCoerce;
};

// output/Data.Newtype/index.js
var wrap = coerce;
var unwrap = coerce;
var un = function() {
  return function(v) {
    return unwrap();
  };
};
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
var foldl = function(dict) {
  return dict.foldl;
};
var intercalate2 = function(dictFoldable) {
  return function(dictMonoid) {
    return function(sep) {
      return function(xs) {
        var go2 = function(v) {
          return function(x) {
            if (v.init) {
              return {
                init: false,
                acc: x
              };
            }
            ;
            return {
              init: false,
              acc: append(dictMonoid.Semigroup0())(v.acc)(append(dictMonoid.Semigroup0())(sep)(x))
            };
          };
        };
        return foldl(dictFoldable)(go2)({
          init: true,
          acc: mempty(dictMonoid)
        })(xs).acc;
      };
    };
  };
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
var foldMapDefaultL = function(dictFoldable) {
  return function(dictMonoid) {
    return function(f) {
      return foldl(dictFoldable)(function(acc) {
        return function(x) {
          return append(dictMonoid.Semigroup0())(acc)(f(x));
        };
      })(mempty(dictMonoid));
    };
  };
};
var foldMap = function(dict) {
  return dict.foldMap;
};
var foldrDefault = function(dictFoldable) {
  return function(c) {
    return function(u2) {
      return function(xs) {
        return unwrap()(foldMap(dictFoldable)(monoidEndo(categoryFn))(function($322) {
          return Endo(c($322));
        })(xs))(u2);
      };
    };
  };
};
var any = function(dictFoldable) {
  return function(dictHeytingAlgebra) {
    return alaF()()()()(Disj)(foldMap(dictFoldable)(monoidDisj(dictHeytingAlgebra)));
  };
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
  return function(apply3) {
    return function(map3) {
      return function(pure2) {
        return function(f) {
          return function(array) {
            function go2(bot, top2) {
              switch (top2 - bot) {
                case 0:
                  return pure2([]);
                case 1:
                  return map3(array1)(f(array[bot]));
                case 2:
                  return apply3(map3(array2)(f(array[bot])))(f(array[bot + 1]));
                case 3:
                  return apply3(apply3(map3(array3)(f(array[bot])))(f(array[bot + 1])))(f(array[bot + 2]));
                default:
                  var pivot = bot + Math.floor((top2 - bot) / 4) * 2;
                  return apply3(map3(concat22)(go2(bot, pivot)))(go2(pivot, top2));
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
var unsafeIndex = function() {
  return unsafeIndexImpl;
};
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
    throw new Error("Failed pattern match at Data.Array (line 829, column 31 - line 832, column 11): " + [v.constructor.name]);
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
var mapWithIndex = function(f) {
  return function(xs) {
    return zipWith(f)(range(0)(length(xs) - 1 | 0))(xs);
  };
};
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
    return map(functorMaybe)(unsafeIndex()(xs))(findIndex(f)(xs));
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
var concatMap = /* @__PURE__ */ flip(/* @__PURE__ */ bind(bindArray));
var mapMaybe = function(f) {
  return concatMap(function() {
    var $99 = maybe([])(singleton2);
    return function($100) {
      return $99(f($100));
    };
  }());
};

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
  return function(a2) {
    return catchError(dictMonadError)(map(dictMonadError.MonadThrow0().Monad0().Bind1().Apply0().Functor0())(Right.create)(a2))(function() {
      var $21 = pure(dictMonadError.MonadThrow0().Monad0().Applicative0());
      return function($22) {
        return $21(Left.create($22));
      };
    }());
  };
};

// output/Control.Monad.State.Class/index.js
var state = function(dict) {
  return dict.state;
};
var modify4 = function(dictMonadState) {
  return function(f) {
    return state(dictMonadState)(function(s2) {
      var s$prime = f(s2);
      return new Tuple(s$prime, s$prime);
    });
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
var from = function(dictTypeEquals) {
  var v = proof(dictTypeEquals)(function(a2) {
    return a2;
  });
  return v;
};

// output/Effect.Class/index.js
var liftEffect = function(dict) {
  return dict.liftEffect;
};

// output/Control.Monad.Reader.Trans/index.js
var ReaderT = function(x) {
  return x;
};
var runReaderT = function(v) {
  return v;
};
var mapReaderT = function(f) {
  return function(v) {
    return function($64) {
      return f(v($64));
    };
  };
};
var functorReaderT = function(dictFunctor) {
  return {
    map: function() {
      var $65 = map(dictFunctor);
      return function($66) {
        return mapReaderT($65($66));
      };
    }()
  };
};
var applyReaderT = function(dictApply) {
  return {
    apply: function(v) {
      return function(v1) {
        return function(r) {
          return apply(dictApply)(v(r))(v1(r));
        };
      };
    },
    Functor0: function() {
      return functorReaderT(dictApply.Functor0());
    }
  };
};
var applicativeReaderT = function(dictApplicative) {
  return {
    pure: function() {
      var $70 = pure(dictApplicative);
      return function($71) {
        return ReaderT($$const($70($71)));
      };
    }(),
    Apply0: function() {
      return applyReaderT(dictApplicative.Apply0());
    }
  };
};

// output/Control.Monad.Writer.Trans/index.js
var WriterT = function(x) {
  return x;
};
var runWriterT = function(v) {
  return v;
};
var mapWriterT = function(f) {
  return function(v) {
    return f(v);
  };
};

// output/Control.Monad.Writer/index.js
var writer = /* @__PURE__ */ function() {
  var $0 = pure(applicativeIdentity);
  return function($1) {
    return WriterT($0($1));
  };
}();
var runWriter = /* @__PURE__ */ function() {
  var $2 = unwrap();
  return function($3) {
    return $2(runWriterT($3));
  };
}();
var mapWriter = function(f) {
  return mapWriterT(function() {
    var $4 = unwrap();
    return function($5) {
      return Identity(f($4($5)));
    };
  }());
};
var execWriter = function(m) {
  return snd(runWriter(m));
};

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

// output/Data.Profunctor.Star/index.js
var Star = function(x) {
  return x;
};

// output/Data.Codec/index.js
var GCodec = /* @__PURE__ */ function() {
  function GCodec2(value0, value1) {
    this.value0 = value0;
    this.value1 = value1;
  }
  ;
  GCodec2.create = function(value0) {
    return function(value1) {
      return new GCodec2(value0, value1);
    };
  };
  return GCodec2;
}();
var encoder = function(v) {
  return v.value1;
};
var encode = function(c) {
  var $102 = un()(Star)(encoder(c));
  return function($103) {
    return execWriter($102($103));
  };
};
var decoder = function(v) {
  return v.value0;
};
var decode = function($104) {
  return runReaderT(decoder($104));
};
var bihoistGCodec = function(f) {
  return function(g) {
    return function(v) {
      return new GCodec(f(v.value0), function($105) {
        return g(v.value1($105));
      });
    };
  };
};
var basicCodec = function(f) {
  return function(g) {
    return new GCodec(f, function(x) {
      return writer(new Tuple(x, g(x)));
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
var mapWithIndex2 = function(dict) {
  return dict.mapWithIndex;
};
var functorWithIndexArray = {
  mapWithIndex: mapWithIndexArray,
  Functor0: function() {
    return functorArray;
  }
};

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
  return function(l) {
    return runST(function __do3() {
      var s2 = newImpl();
      foreach(fromFoldable(dictFoldable)(l))(function(v) {
        return $$void(functorST)(poke2(v.value0)(v.value1)(s2));
      })();
      return s2;
    });
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
var verbJsonType = function(def) {
  return function(f) {
    return function(g) {
      return g(def)(f);
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
var fromNumber = /* @__PURE__ */ function() {
  return fromNumberImpl(Just.create)(Nothing.value);
}();
var unsafeClamp = function(x) {
  if (!isFiniteImpl(x)) {
    return 0;
  }
  ;
  if (x >= toNumber(top(boundedInt))) {
    return top(boundedInt);
  }
  ;
  if (x <= toNumber(bottom(boundedInt))) {
    return bottom(boundedInt);
  }
  ;
  if (otherwise) {
    return fromMaybe(0)(fromNumber(x));
  }
  ;
  throw new Error("Failed pattern match at Data.Int (line 72, column 1 - line 72, column 29): " + [x.constructor.name]);
};
var floor2 = function($25) {
  return unsafeClamp(floor($25));
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
    return function(b2) {
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
      var $205 = foldl(foldableList)(flip(f))(b2);
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
      return "(TypeMismatch " + (show(showString)(v.value0) + ")");
    }
    ;
    if (v instanceof UnexpectedValue) {
      return "(UnexpectedValue " + (stringify(v.value0) + ")");
    }
    ;
    if (v instanceof AtIndex) {
      return "(AtIndex " + (show(showInt)(v.value0) + (" " + (show(showJsonDecodeError)(v.value1) + ")")));
    }
    ;
    if (v instanceof AtKey) {
      return "(AtKey " + (show(showString)(v.value0) + (" " + (show(showJsonDecodeError)(v.value1) + ")")));
    }
    ;
    if (v instanceof Named) {
      return "(Named " + (show(showString)(v.value0) + (" " + (show(showJsonDecodeError)(v.value1) + ")")));
    }
    ;
    if (v instanceof MissingValue) {
      return "MissingValue";
    }
    ;
    throw new Error("Failed pattern match at Data.Codec.Argonaut (line 74, column 10 - line 80, column 35): " + [v.constructor.name]);
  }
};
var recordProp = function(dictIsSymbol) {
  return function() {
    return function(p2) {
      return function(codecA) {
        return function(codecR) {
          var unsafeSet2 = function(key3) {
            return function(a2) {
              var $176 = insert(key3)(a2);
              return function($177) {
                return $176($177);
              };
            };
          };
          var unsafeGet2 = function(s2) {
            var $178 = fromJust();
            var $179 = lookup(s2);
            return function($180) {
              return $178($179($180));
            };
          };
          var enc$prime = function(key3) {
            return function(val) {
              return writer(new Tuple(val, new Cons(new Tuple(key3, encode(codecA)(unsafeGet2(key3)(val))), encode(codecR)(val))));
            };
          };
          var dec$prime = function(key3) {
            return function(obj) {
              return bind(bindEither)(decode(codecR)(obj))(function(r) {
                return bind(bindEither)(lmap(bifunctorEither)(AtKey.create(key3))(function() {
                  var v = lookup(key3)(obj);
                  if (v instanceof Just) {
                    return decode(codecA)(v.value0);
                  }
                  ;
                  if (v instanceof Nothing) {
                    return new Left(MissingValue.value);
                  }
                  ;
                  throw new Error("Failed pattern match at Data.Codec.Argonaut (line 270, column 31 - line 272, column 36): " + [v.constructor.name]);
                }()))(function(a2) {
                  return pure(applicativeEither)(unsafeSet2(key3)(a2)(r));
                });
              });
            };
          };
          var key2 = reflectSymbol(dictIsSymbol)(p2);
          return new GCodec(dec$prime(key2), enc$prime(key2));
        };
      };
    };
  };
};
var record = /* @__PURE__ */ function() {
  return new GCodec(pure(applicativeReaderT(applicativeEither))({}), function(val) {
    return writer(new Tuple(val, Nil.value));
  });
}();
var jsonPrimCodec = function(ty) {
  return function(f) {
    return basicCodec(function() {
      var $185 = maybe(new Left(new TypeMismatch(ty)))(pure(applicativeEither));
      return function($186) {
        return $185(f($186));
      };
    }());
  };
};
var string = /* @__PURE__ */ jsonPrimCodec("String")(toString)(id);
var jobject = /* @__PURE__ */ jsonPrimCodec("Object")(toObject)(id);
var object = function(name16) {
  return bihoistGCodec(function(r) {
    return composeKleisliFlipped(bindEither)(function() {
      var $187 = lmap(bifunctorEither)(Named.create(name16));
      var $188 = runReaderT(r);
      return function($189) {
        return $187($188($189));
      };
    }())(decode(jobject));
  })(mapWriter(rmap(bifunctorTuple)(function() {
    var $190 = fromFoldable2(foldableList);
    return function($191) {
      return id($190($191));
    };
  }())));
};
var $$boolean = /* @__PURE__ */ jsonPrimCodec("Boolean")(toBoolean)(id);

// output/Record/index.js
var insert2 = function(dictIsSymbol) {
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
  return function() {
    return function() {
      return function(dictIsSymbol) {
        return function(dictTypeEquals) {
          return {
            rowListCodec: function(v) {
              return function(codecs) {
                var tail2 = rowListCodec(dictRowListCodec)($$Proxy.value)(codecs);
                var codec = from(refl)(get(dictIsSymbol)()($$Proxy.value)(codecs));
                return recordProp(dictIsSymbol)()($$Proxy.value)(codec)(tail2);
              };
            }
          };
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

// output/Control.Monad.ST.Class/index.js
var monadSTST = {
  liftST: /* @__PURE__ */ identity(categoryFn),
  Monad0: function() {
    return monadST;
  }
};
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
        throw new Error("Failed pattern match at Data.List (line 368, column 3 - line 368, column 19): " + [acc.constructor.name, v.constructor.name]);
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
  return function(k) {
    var comp = compare(dictOrd);
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
          var v2 = comp(k)(v.value1);
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
          var v3 = comp(k)(v.value1);
          if (v3 instanceof EQ) {
            $tco_done = true;
            return new Just(v.value2);
          }
          ;
          var v4 = comp(k)(v.value4);
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
    return function($copy_tree) {
      var $tco_var_dictOrd = $copy_dictOrd;
      var $tco_var_v = $copy_v;
      var $tco_done = false;
      var $tco_result;
      function $tco_loop(dictOrd, v, tree) {
        if (v instanceof Nil) {
          $tco_done = true;
          return tree;
        }
        ;
        if (v instanceof Cons) {
          if (v.value0 instanceof TwoLeft) {
            $tco_var_dictOrd = dictOrd;
            $tco_var_v = v.value1;
            $copy_tree = new Two(tree, v.value0.value0, v.value0.value1, v.value0.value2);
            return;
          }
          ;
          if (v.value0 instanceof TwoRight) {
            $tco_var_dictOrd = dictOrd;
            $tco_var_v = v.value1;
            $copy_tree = new Two(v.value0.value0, v.value0.value1, v.value0.value2, tree);
            return;
          }
          ;
          if (v.value0 instanceof ThreeLeft) {
            $tco_var_dictOrd = dictOrd;
            $tco_var_v = v.value1;
            $copy_tree = new Three(tree, v.value0.value0, v.value0.value1, v.value0.value2, v.value0.value3, v.value0.value4, v.value0.value5);
            return;
          }
          ;
          if (v.value0 instanceof ThreeMiddle) {
            $tco_var_dictOrd = dictOrd;
            $tco_var_v = v.value1;
            $copy_tree = new Three(v.value0.value0, v.value0.value1, v.value0.value2, tree, v.value0.value3, v.value0.value4, v.value0.value5);
            return;
          }
          ;
          if (v.value0 instanceof ThreeRight) {
            $tco_var_dictOrd = dictOrd;
            $tco_var_v = v.value1;
            $copy_tree = new Three(v.value0.value0, v.value0.value1, v.value0.value2, v.value0.value3, v.value0.value4, v.value0.value5, tree);
            return;
          }
          ;
          throw new Error("Failed pattern match at Data.Map.Internal (line 462, column 3 - line 467, column 88): " + [v.value0.constructor.name]);
        }
        ;
        throw new Error("Failed pattern match at Data.Map.Internal (line 459, column 1 - line 459, column 80): " + [v.constructor.name, tree.constructor.name]);
      }
      ;
      while (!$tco_done) {
        $tco_result = $tco_loop($tco_var_dictOrd, $tco_var_v, $copy_tree);
      }
      ;
      return $tco_result;
    };
  };
};
var insert3 = function(dictOrd) {
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
                return fromZipper(dictOrd)(v1.value1)(new Three(v2.value0, v2.value1, v2.value2, v2.value3, v1.value0.value0, v1.value0.value1, v1.value0.value2));
              }
              ;
              if (v1.value0 instanceof TwoRight) {
                $tco_done = true;
                return fromZipper(dictOrd)(v1.value1)(new Three(v1.value0.value0, v1.value0.value1, v1.value0.value2, v2.value0, v2.value1, v2.value2, v2.value3));
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
      var comp = compare(dictOrd);
      var down = function($copy_ctx) {
        return function($copy_v1) {
          var $tco_var_ctx = $copy_ctx;
          var $tco_done1 = false;
          var $tco_result;
          function $tco_loop(ctx, v1) {
            if (v1 instanceof Leaf) {
              $tco_done1 = true;
              return up(ctx)(new KickUp(Leaf.value, k, v, Leaf.value));
            }
            ;
            if (v1 instanceof Two) {
              var v2 = comp(k)(v1.value1);
              if (v2 instanceof EQ) {
                $tco_done1 = true;
                return fromZipper(dictOrd)(ctx)(new Two(v1.value0, k, v, v1.value3));
              }
              ;
              if (v2 instanceof LT) {
                $tco_var_ctx = new Cons(new TwoLeft(v1.value1, v1.value2, v1.value3), ctx);
                $copy_v1 = v1.value0;
                return;
              }
              ;
              $tco_var_ctx = new Cons(new TwoRight(v1.value0, v1.value1, v1.value2), ctx);
              $copy_v1 = v1.value3;
              return;
            }
            ;
            if (v1 instanceof Three) {
              var v3 = comp(k)(v1.value1);
              if (v3 instanceof EQ) {
                $tco_done1 = true;
                return fromZipper(dictOrd)(ctx)(new Three(v1.value0, k, v, v1.value3, v1.value4, v1.value5, v1.value6));
              }
              ;
              var v4 = comp(k)(v1.value4);
              if (v4 instanceof EQ) {
                $tco_done1 = true;
                return fromZipper(dictOrd)(ctx)(new Three(v1.value0, v1.value1, v1.value2, v1.value3, k, v, v1.value6));
              }
              ;
              if (v3 instanceof LT) {
                $tco_var_ctx = new Cons(new ThreeLeft(v1.value1, v1.value2, v1.value3, v1.value4, v1.value5, v1.value6), ctx);
                $copy_v1 = v1.value0;
                return;
              }
              ;
              if (v3 instanceof GT && v4 instanceof LT) {
                $tco_var_ctx = new Cons(new ThreeMiddle(v1.value0, v1.value1, v1.value2, v1.value4, v1.value5, v1.value6), ctx);
                $copy_v1 = v1.value3;
                return;
              }
              ;
              $tco_var_ctx = new Cons(new ThreeRight(v1.value0, v1.value1, v1.value2, v1.value3, v1.value4, v1.value5), ctx);
              $copy_v1 = v1.value6;
              return;
            }
            ;
            throw new Error("Failed pattern match at Data.Map.Internal (line 478, column 3 - line 478, column 55): " + [ctx.constructor.name, v1.constructor.name]);
          }
          ;
          while (!$tco_done1) {
            $tco_result = $tco_loop($tco_var_ctx, $copy_v1);
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
              return fromZipper(dictOrd)(ctxs.value1)(new Two(Leaf.value, ctxs.value0.value0, ctxs.value0.value1, Leaf.value));
            }
            ;
            if (ctxs.value0 instanceof TwoRight && (ctxs.value0.value0 instanceof Leaf && tree instanceof Leaf)) {
              $tco_done = true;
              return fromZipper(dictOrd)(ctxs.value1)(new Two(Leaf.value, ctxs.value0.value1, ctxs.value0.value2, Leaf.value));
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
              return fromZipper(dictOrd)(ctxs.value1)(new Two(new Two(tree, ctxs.value0.value0, ctxs.value0.value1, ctxs.value0.value2.value0), ctxs.value0.value2.value1, ctxs.value0.value2.value2, new Two(ctxs.value0.value2.value3, ctxs.value0.value2.value4, ctxs.value0.value2.value5, ctxs.value0.value2.value6)));
            }
            ;
            if (ctxs.value0 instanceof TwoRight && ctxs.value0.value0 instanceof Three) {
              $tco_done = true;
              return fromZipper(dictOrd)(ctxs.value1)(new Two(new Two(ctxs.value0.value0.value0, ctxs.value0.value0.value1, ctxs.value0.value0.value2, ctxs.value0.value0.value3), ctxs.value0.value0.value4, ctxs.value0.value0.value5, new Two(ctxs.value0.value0.value6, ctxs.value0.value1, ctxs.value0.value2, tree)));
            }
            ;
            if (ctxs.value0 instanceof ThreeLeft && (ctxs.value0.value2 instanceof Leaf && (ctxs.value0.value5 instanceof Leaf && tree instanceof Leaf))) {
              $tco_done = true;
              return fromZipper(dictOrd)(ctxs.value1)(new Three(Leaf.value, ctxs.value0.value0, ctxs.value0.value1, Leaf.value, ctxs.value0.value3, ctxs.value0.value4, Leaf.value));
            }
            ;
            if (ctxs.value0 instanceof ThreeMiddle && (ctxs.value0.value0 instanceof Leaf && (ctxs.value0.value5 instanceof Leaf && tree instanceof Leaf))) {
              $tco_done = true;
              return fromZipper(dictOrd)(ctxs.value1)(new Three(Leaf.value, ctxs.value0.value1, ctxs.value0.value2, Leaf.value, ctxs.value0.value3, ctxs.value0.value4, Leaf.value));
            }
            ;
            if (ctxs.value0 instanceof ThreeRight && (ctxs.value0.value0 instanceof Leaf && (ctxs.value0.value3 instanceof Leaf && tree instanceof Leaf))) {
              $tco_done = true;
              return fromZipper(dictOrd)(ctxs.value1)(new Three(Leaf.value, ctxs.value0.value1, ctxs.value0.value2, Leaf.value, ctxs.value0.value4, ctxs.value0.value5, Leaf.value));
            }
            ;
            if (ctxs.value0 instanceof ThreeLeft && ctxs.value0.value2 instanceof Two) {
              $tco_done = true;
              return fromZipper(dictOrd)(ctxs.value1)(new Two(new Three(tree, ctxs.value0.value0, ctxs.value0.value1, ctxs.value0.value2.value0, ctxs.value0.value2.value1, ctxs.value0.value2.value2, ctxs.value0.value2.value3), ctxs.value0.value3, ctxs.value0.value4, ctxs.value0.value5));
            }
            ;
            if (ctxs.value0 instanceof ThreeMiddle && ctxs.value0.value0 instanceof Two) {
              $tco_done = true;
              return fromZipper(dictOrd)(ctxs.value1)(new Two(new Three(ctxs.value0.value0.value0, ctxs.value0.value0.value1, ctxs.value0.value0.value2, ctxs.value0.value0.value3, ctxs.value0.value1, ctxs.value0.value2, tree), ctxs.value0.value3, ctxs.value0.value4, ctxs.value0.value5));
            }
            ;
            if (ctxs.value0 instanceof ThreeMiddle && ctxs.value0.value5 instanceof Two) {
              $tco_done = true;
              return fromZipper(dictOrd)(ctxs.value1)(new Two(ctxs.value0.value0, ctxs.value0.value1, ctxs.value0.value2, new Three(tree, ctxs.value0.value3, ctxs.value0.value4, ctxs.value0.value5.value0, ctxs.value0.value5.value1, ctxs.value0.value5.value2, ctxs.value0.value5.value3)));
            }
            ;
            if (ctxs.value0 instanceof ThreeRight && ctxs.value0.value3 instanceof Two) {
              $tco_done = true;
              return fromZipper(dictOrd)(ctxs.value1)(new Two(ctxs.value0.value0, ctxs.value0.value1, ctxs.value0.value2, new Three(ctxs.value0.value3.value0, ctxs.value0.value3.value1, ctxs.value0.value3.value2, ctxs.value0.value3.value3, ctxs.value0.value4, ctxs.value0.value5, tree)));
            }
            ;
            if (ctxs.value0 instanceof ThreeLeft && ctxs.value0.value2 instanceof Three) {
              $tco_done = true;
              return fromZipper(dictOrd)(ctxs.value1)(new Three(new Two(tree, ctxs.value0.value0, ctxs.value0.value1, ctxs.value0.value2.value0), ctxs.value0.value2.value1, ctxs.value0.value2.value2, new Two(ctxs.value0.value2.value3, ctxs.value0.value2.value4, ctxs.value0.value2.value5, ctxs.value0.value2.value6), ctxs.value0.value3, ctxs.value0.value4, ctxs.value0.value5));
            }
            ;
            if (ctxs.value0 instanceof ThreeMiddle && ctxs.value0.value0 instanceof Three) {
              $tco_done = true;
              return fromZipper(dictOrd)(ctxs.value1)(new Three(new Two(ctxs.value0.value0.value0, ctxs.value0.value0.value1, ctxs.value0.value0.value2, ctxs.value0.value0.value3), ctxs.value0.value0.value4, ctxs.value0.value0.value5, new Two(ctxs.value0.value0.value6, ctxs.value0.value1, ctxs.value0.value2, tree), ctxs.value0.value3, ctxs.value0.value4, ctxs.value0.value5));
            }
            ;
            if (ctxs.value0 instanceof ThreeMiddle && ctxs.value0.value5 instanceof Three) {
              $tco_done = true;
              return fromZipper(dictOrd)(ctxs.value1)(new Three(ctxs.value0.value0, ctxs.value0.value1, ctxs.value0.value2, new Two(tree, ctxs.value0.value3, ctxs.value0.value4, ctxs.value0.value5.value0), ctxs.value0.value5.value1, ctxs.value0.value5.value2, new Two(ctxs.value0.value5.value3, ctxs.value0.value5.value4, ctxs.value0.value5.value5, ctxs.value0.value5.value6)));
            }
            ;
            if (ctxs.value0 instanceof ThreeRight && ctxs.value0.value3 instanceof Three) {
              $tco_done = true;
              return fromZipper(dictOrd)(ctxs.value1)(new Three(ctxs.value0.value0, ctxs.value0.value1, ctxs.value0.value2, new Two(ctxs.value0.value3.value0, ctxs.value0.value3.value1, ctxs.value0.value3.value2, ctxs.value0.value3.value3), ctxs.value0.value3.value4, ctxs.value0.value3.value5, new Two(ctxs.value0.value3.value6, ctxs.value0.value4, ctxs.value0.value5, tree)));
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
    var comp = compare(dictOrd);
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
            var v = comp(k)(m.value1);
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
            var v = comp(k)(m.value4);
            var v3 = comp(k)(m.value1);
            if (leaves && v3 instanceof EQ) {
              $tco_done3 = true;
              return new Just(new Tuple(m.value2, fromZipper(dictOrd)(ctx)(new Two(Leaf.value, m.value4, m.value5, Leaf.value))));
            }
            ;
            if (leaves && v instanceof EQ) {
              $tco_done3 = true;
              return new Just(new Tuple(m.value5, fromZipper(dictOrd)(ctx)(new Two(Leaf.value, m.value1, m.value2, Leaf.value))));
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
    return function(f) {
      return function(m) {
        if (m instanceof Leaf) {
          return mempty(dictMonoid);
        }
        ;
        if (m instanceof Two) {
          return append(dictMonoid.Semigroup0())(foldMap(foldableMap)(dictMonoid)(f)(m.value0))(append(dictMonoid.Semigroup0())(f(m.value2))(foldMap(foldableMap)(dictMonoid)(f)(m.value3)));
        }
        ;
        if (m instanceof Three) {
          return append(dictMonoid.Semigroup0())(foldMap(foldableMap)(dictMonoid)(f)(m.value0))(append(dictMonoid.Semigroup0())(f(m.value2))(append(dictMonoid.Semigroup0())(foldMap(foldableMap)(dictMonoid)(f)(m.value3))(append(dictMonoid.Semigroup0())(f(m.value5))(foldMap(foldableMap)(dictMonoid)(f)(m.value6)))));
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
    return function(f) {
      return function(m) {
        if (m instanceof Leaf) {
          return mempty(dictMonoid);
        }
        ;
        if (m instanceof Two) {
          return append(dictMonoid.Semigroup0())(foldMapWithIndex(foldableWithIndexMap)(dictMonoid)(f)(m.value0))(append(dictMonoid.Semigroup0())(f(m.value1)(m.value2))(foldMapWithIndex(foldableWithIndexMap)(dictMonoid)(f)(m.value3)));
        }
        ;
        if (m instanceof Three) {
          return append(dictMonoid.Semigroup0())(foldMapWithIndex(foldableWithIndexMap)(dictMonoid)(f)(m.value0))(append(dictMonoid.Semigroup0())(f(m.value1)(m.value2))(append(dictMonoid.Semigroup0())(foldMapWithIndex(foldableWithIndexMap)(dictMonoid)(f)(m.value3))(append(dictMonoid.Semigroup0())(f(m.value4)(m.value5))(foldMapWithIndex(foldableWithIndexMap)(dictMonoid)(f)(m.value6)))));
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
var keys2 = /* @__PURE__ */ function() {
  return foldrWithIndex(foldableWithIndexMap)(function(k) {
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
  return function(k) {
    return function(m) {
      return maybe(m)(snd)(pop(dictOrd)(k)(m));
    };
  };
};
var alter = function(dictOrd) {
  return function(f) {
    return function(k) {
      return function(m) {
        var v = f(lookup2(dictOrd)(k)(m));
        if (v instanceof Nothing) {
          return $$delete2(dictOrd)(k)(m);
        }
        ;
        if (v instanceof Just) {
          return insert3(dictOrd)(k)(v.value0)(m);
        }
        ;
        throw new Error("Failed pattern match at Data.Map.Internal (line 596, column 15 - line 598, column 25): " + [v.constructor.name]);
      };
    };
  };
};
var unionWith = function(dictOrd) {
  return function(f) {
    return function(m1) {
      return function(m2) {
        var go2 = function(k) {
          return function(m) {
            return function(v) {
              return alter(dictOrd)(function() {
                var $808 = maybe(v)(f(v));
                return function($809) {
                  return Just.create($808($809));
                };
              }())(k)(m);
            };
          };
        };
        return foldlWithIndex(foldableWithIndexMap)(go2)(m2)(m1);
      };
    };
  };
};
var union = function(dictOrd) {
  return unionWith(dictOrd)($$const);
};

// output/Data.Compactable/index.js
var compactableArray = {
  compact: function(xs) {
    return function __do3() {
      var result = newSTArray();
      var iter = iterator(function(v) {
        return index(xs)(v);
      })();
      iterate(iter)(function() {
        var $79 = $$void(functorST);
        return function($80) {
          return $79(function(v) {
            if (v instanceof Nothing) {
              return pure(applicativeST)(0);
            }
            ;
            if (v instanceof Just) {
              return push(v.value0)(result);
            }
            ;
            throw new Error("Failed pattern match at Data.Compactable (line 111, column 34 - line 113, column 35): " + [v.constructor.name]);
          }($80));
        };
      }())();
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
      iterate(iter)(function() {
        var $81 = $$void(functorST);
        return function($82) {
          return $81(function(v) {
            if (v instanceof Left) {
              return push(v.value0)(ls);
            }
            ;
            if (v instanceof Right) {
              return push(v.value0)(rs);
            }
            ;
            throw new Error("Failed pattern match at Data.Compactable (line 122, column 34 - line 124, column 31): " + [v.constructor.name]);
          }($82));
        };
      }())();
      return apply(applyST)(map(functorST)(function(v) {
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
var filterableArray = {
  partitionMap: function(p2) {
    var go2 = function(acc) {
      return function(x) {
        var v = p2(x);
        if (v instanceof Left) {
          return {
            left: append(semigroupArray)(acc.left)([v.value0]),
            right: acc.right
          };
        }
        ;
        if (v instanceof Right) {
          return {
            right: append(semigroupArray)(acc.right)([v.value0]),
            left: acc.left
          };
        }
        ;
        throw new Error("Failed pattern match at Data.Filterable (line 149, column 16 - line 151, column 50): " + [v.constructor.name]);
      };
    };
    return foldl(foldableArray)(go2)({
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
var union2 = function(dictOrd) {
  return function(v) {
    return function(v1) {
      return union(dictOrd)(v)(v1);
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
    return function(f) {
      var $72 = foldMap(foldableList)(dictMonoid)(f);
      return function($73) {
        return $72(toList2($73));
      };
    };
  },
  foldl: function(f) {
    return function(x) {
      var $74 = foldl(foldableList)(f)(x);
      return function($75) {
        return $74(toList2($75));
      };
    };
  },
  foldr: function(f) {
    return function(x) {
      var $76 = foldr(foldableList)(f)(x);
      return function($77) {
        return $76(toList2($77));
      };
    };
  }
};
var empty4 = empty3;
var monoidSet = function(dictOrd) {
  return {
    mempty: empty4,
    Semigroup0: function() {
      return semigroupSet(dictOrd);
    }
  };
};
var $$delete3 = function(dictOrd) {
  return function(a2) {
    return function(v) {
      return $$delete2(dictOrd)(a2)(v);
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
      return compare(ordInt)(x)(y);
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
  return {
    append: function(f1) {
      return function(f2) {
        return mkEffectFn1(function(a2) {
          return append(semigroupEffect(dictSemigroup))(runEffectFn1(f1)(a2))(runEffectFn1(f2)(a2));
        });
      };
    }
  };
};
var monoidEffectFn1 = function(dictMonoid) {
  return {
    mempty: mkEffectFn1(function(v) {
      return mempty(monoidEffect(dictMonoid));
    }),
    Semigroup0: function() {
      return semigroupEffectFn1(dictMonoid.Semigroup0());
    }
  };
};

// output/FRP.Event.Class/index.js
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
  return function(f) {
    return function(b2) {
      return function(e) {
        return fix2(dictIsEvent)(function(i2) {
          return sampleOnRight(dictIsEvent)(alt(dictIsEvent.Alternative0().Plus1().Alt0())(i2)(pure(dictIsEvent.Alternative0().Applicative0())(b2)))(map(dictIsEvent.Filterable1().Functor1())(flip(f))(e));
        });
      };
    };
  };
};
var mapAccum = function(dictIsEvent) {
  return function(f) {
    return function(acc) {
      return function(xs) {
        return filterMap(dictIsEvent.Filterable1())(snd)(fold3(dictIsEvent)(function(v) {
          return function(b2) {
            return map(functorTuple)(pure(applicativeMaybe))(f(v.value0)(b2));
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
  var state3 = 0;
  var val;
  return function(lineNumber) {
    if (state3 === 2)
      return val;
    if (state3 === 1)
      throw new ReferenceError(name16 + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state3 = 1;
    val = init3();
    state3 = 2;
    return val;
  };
};
var sampleOnRight2 = function(v) {
  return function(v1) {
    return function(b2, k) {
      var latest = $$new(Nothing.value)();
      var c1 = v(b2, function(a2) {
        return write(new Just(a2))(latest)();
      });
      var c2 = v1(b2, function(f) {
        var o = read(latest)();
        return for_(applicativeEffect)(foldableMaybe)(o)(function(a2) {
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
        var o = read(latest)();
        return for_(applicativeEffect)(foldableMaybe)(o)(function(f) {
          return function() {
            return k(f(a2));
          };
        })();
      });
      var c2 = v1(b2, function(f) {
        return write(new Just(f))(latest)();
      });
      return function __do3() {
        c1();
        return c2();
      };
    };
  };
};
var keepLatest2 = function(v) {
  return function(tf, k) {
    var cancelInner = $$new(pure(applicativeEffect)(unit))();
    var cancelOuter = v(tf, function(v1) {
      var ci = read(cancelInner)();
      ci();
      var c = v1(tf, k);
      return write(c)(cancelInner)();
    });
    return function __do3() {
      var ci = read(cancelInner)();
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
        throw new Error("Failed pattern match at FRP.Event (line 190, column 31 - line 192, column 35): " + [v1.constructor.name]);
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
    throw new Error("Failed pattern match at FRP.Event (line 117, column 13 - line 119, column 25): " + [v.constructor.name]);
  });
};
var create$prime = function __do() {
  var subscribers = $$new([])();
  return {
    event: function(v, k) {
      var rk = $$new(k)();
      modify_(function(v1) {
        return append(semigroupArray)(v1)([rk]);
      })(subscribers)();
      return function __do3() {
        write(mempty(monoidEffectFn1(monoidUnit)))(rk)();
        modify(deleteBy(unsafeRefEq)(rk))(subscribers)();
        return unit;
      };
    },
    push: function(a2) {
      var o = read(subscribers)();
      return foreachE(o)(function(rk) {
        return function __do3() {
          var k = read(rk)();
          return k(a2);
        };
      })();
    }
  };
};
var fix3 = function(f) {
  return function(tf, k) {
    var v = create$prime();
    var v1 = f(v.event);
    var c1 = v1(tf, v.push);
    var c2 = v.event(tf, k);
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
        throw new Error("Failed pattern match at FRP.Event (line 100, column 13 - line 102, column 33): " + [v.constructor.name]);
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
        throw new Error("Failed pattern match at FRP.Event (line 107, column 13 - line 109, column 32): " + [v.constructor.name]);
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
        no: filter$prime(function() {
          var $145 = not(heytingAlgebraBoolean);
          return function($146) {
            return $145(p2($146));
          };
        }())(xs)
      };
    };
  },
  partitionMap: function(f) {
    return function(xs) {
      return {
        left: filterMap(filterableEvent)(function() {
          var $147 = either(Just.create)($$const(Nothing.value));
          return function($148) {
            return $147(f($148));
          };
        }())(xs),
        right: filterMap(filterableEvent)(function($149) {
          return hush(f($149));
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
      var replay1 = liftST(monadSTEffect)(newSTArray)();
      var latest2 = $$new(Nothing.value)();
      var replay2 = liftST(monadSTEffect)(newSTArray)();
      var capturing = $$new(true)();
      var c1 = v(tf, function(a2) {
        var o = read(capturing)();
        if (o) {
          return $$void(functorEffect)(liftST(monadSTEffect)(push(a2)(replay1)))();
        }
        ;
        write(new Just(a2))(latest1)();
        var res = read(latest2)();
        return for_(applicativeEffect)(foldableMaybe)(res)(function(f) {
          return function() {
            return k(f(a2));
          };
        })();
      });
      var c2 = v1(tf, function(f) {
        var o = read(capturing)();
        if (o) {
          return $$void(functorEffect)(liftST(monadSTEffect)(push(f)(replay2)))();
        }
        ;
        write(new Just(f))(latest2)();
        var res = read(latest1)();
        return for_(applicativeEffect)(foldableMaybe)(res)(function(a2) {
          return function() {
            return k(f(a2));
          };
        })();
      });
      write(false)(capturing)();
      var samples1 = liftST(monadSTEffect)(freeze(replay1))();
      var samples2 = liftST(monadSTEffect)(freeze(replay2))();
      (function() {
        if (samples1.length === 0) {
          return write(last(samples2))(latest2)();
        }
        ;
        return foreachE(samples1)(function(a2) {
          return function __do3() {
            write(new Just(a2))(latest1)();
            return foreachE(samples2)(function(f) {
              return function __do4() {
                write(new Just(f))(latest2)();
                return k(f(a2));
              };
            })();
          };
        })();
      })();
      liftST(monadSTEffect)(splice(0)(length(samples1))([])(replay1))();
      liftST(monadSTEffect)(splice(0)(length(samples2))([])(replay2))();
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
  }($lazy_backdoor(311).subscribe)(i2);
};
var $lazy_backdoor = /* @__PURE__ */ $runtime_lazy4("backdoor", "FRP.Event", function() {
  var create_ = function __do3() {
    var subscribers = $$new([])();
    return {
      event: function(v, k) {
        var rk = $$new(k)();
        modify_(function(v1) {
          return append(semigroupArray)(v1)([rk]);
        })(subscribers)();
        return function __do4() {
          write(mempty(monoidEffectFn1(monoidUnit)))(rk)();
          modify(deleteBy(unsafeRefEq)(rk))(subscribers)();
          return unit;
        };
      },
      push: function(a2) {
        return function __do4() {
          var o = read(subscribers)();
          return foreachE(o)(function(rk) {
            return function __do5() {
              var k = read(rk)();
              return k(a2);
            };
          })();
        };
      }
    };
  };
  return {
    makeEvent: function() {
      var makeEvent_ = function(e) {
        return function(tf, k) {
          if (tf) {
            return pure(applicativeEffect)(unit);
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
    create: create_,
    createPure: create_,
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
          var v1 = $lazy_create(609)();
          k(f(v1.push)(v1.event));
          return pure(applicativeEffect)(unit);
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
          var v = $lazy_create(627)();
          var unsubscribe = subscribe(e)(v.push)();
          return {
            event: v.event,
            unsubscribe
          };
        };
      };
      return hot_;
    }(),
    mailboxed: function() {
      var mailboxed_ = function(dictOrd) {
        return function(v) {
          return function(f) {
            return function(tf, k1) {
              var r = $$new(empty3)();
              k1(f(function(a2) {
                return function(v1, k2) {
                  $$void(functorEffect)(modify(alter(dictOrd)(function(v2) {
                    if (v2 instanceof Nothing) {
                      return new Just([k2]);
                    }
                    ;
                    if (v2 instanceof Just) {
                      return new Just(append(semigroupArray)(v2.value0)([k2]));
                    }
                    ;
                    throw new Error("Failed pattern match at FRP.Event (line 640, column 21 - line 642, column 55): " + [v2.constructor.name]);
                  })(a2))(r))();
                  return $$void(functorEffect)(modify(alter(dictOrd)(function(v2) {
                    if (v2 instanceof Nothing) {
                      return Nothing.value;
                    }
                    ;
                    if (v2 instanceof Just) {
                      return new Just(deleteBy(unsafeRefEq)(k2)(v2.value0));
                    }
                    ;
                    throw new Error("Failed pattern match at FRP.Event (line 649, column 21 - line 651, column 69): " + [v2.constructor.name]);
                  })(a2))(r));
                };
              }));
              var unsub = v(tf, function(v1) {
                var o = read(r)();
                var v2 = lookup2(dictOrd)(v1.address)(o);
                if (v2 instanceof Nothing) {
                  return unit;
                }
                ;
                if (v2 instanceof Just) {
                  return foreachE(v2.value0)(function(i2) {
                    return function() {
                      return i2(v1.payload);
                    };
                  })();
                }
                ;
                throw new Error("Failed pattern match at FRP.Event (line 658, column 13 - line 660, column 70): " + [v2.constructor.name]);
              });
              return function __do3() {
                $$void(functorEffect)(write(empty3)(r))();
                return unsub();
              };
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
            var tid = $$new(mempty(monoidSet(ordTimeoutId)))();
            var canceler = v(tf, function(a2) {
              var localId = $$new(Nothing.value)();
              var id2 = setTimeout2(n)(function __do3() {
                k(a2);
                var lid = read(localId)();
                return maybe(pure(applicativeEffect)(unit))(function(id3) {
                  return modify_($$delete3(ordTimeoutId)(id3))(tid);
                })(lid)();
              })();
              write(new Just(id2))(localId)();
              return modify_(append(semigroupSet(ordTimeoutId))(singleton8(id2)))(tid)();
            });
            return function __do3() {
              var ids = read(tid)();
              for_(applicativeEffect)(foldableSet)(ids)(clearTimeout2)();
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
    }($lazy_backdoor(388).create)();
  };
});
var backdoor = /* @__PURE__ */ $lazy_backdoor(520);
var create = /* @__PURE__ */ $lazy_create(385);
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
      return biSampleOn(a2)(map(functorEvent)(applyFlipped)(b2));
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
      return pure(applicativeEffect)(unit);
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
        return apply(applyEffect)(map(functorEffect)(function(v2) {
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
    return pure(applicativeEffect)(unit);
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
  var $18 = map(functorFn)(map(functorEffect)($$const(true)));
  return function($19) {
    return Cb($18($19));
  };
}();
var attr = function(dict) {
  return dict.attr;
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
var vbusNil = {
  vb: function(v) {
    return pure(applicativeST)(new Tuple({}, {}));
  }
};
var vb = function(dict) {
  return dict.vb;
};
var vbackdoor = {
  vbus: /* @__PURE__ */ function() {
    var vbus__ = function() {
      return function(dictVBus) {
        return function(v) {
          return function(f) {
            return makeLemmingEvent(function(v1) {
              return function(k) {
                return function __do3() {
                  var v2 = vb(dictVBus)($$Proxy.value)();
                  k(f(v2.value0)(v2.value1))();
                  return pure(applicativeST)(unit);
                };
              };
            });
          };
        };
      };
    };
    var vbus_ = function() {
      return function(dictVBus) {
        return vbus__()(dictVBus);
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
  return function() {
    return function() {
      return function(dictVBus) {
        return function() {
          return function() {
            return {
              vb: function(v) {
                return function __do3() {
                  var v1 = vb(dictVBus)($$Proxy.value)();
                  var v2 = create();
                  return new Tuple(insert2(dictIsSymbol)()()($$Proxy.value)(v2.push)(v1.value0), insert2(dictIsSymbol)()()($$Proxy.value)(v2.event)(v1.value1));
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
var toArray2 = function() {
  return function(v) {
    return v;
  };
};
var index2 = function() {
  return function() {
    return function() {
      return function() {
        return function() {
          return function(dictReflectable) {
            var $70 = toInt(dictReflectable);
            return function($71) {
              return indexImpl2($70($71));
            };
          };
        };
      };
    };
  };
};
var empty5 = [];
var cons4 = function() {
  return function() {
    return function(elem3) {
      return function(v) {
        return cons2(elem3)(v);
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
var modify5 = function() {
  return function() {
    return function(dictIsSymbol) {
      return function(l) {
        return function(f) {
          return function(r1) {
            return unsafeModify(reflectSymbol(dictIsSymbol)(l))(f)(r1);
          };
        };
      };
    };
  };
};
var insert4 = function() {
  return function() {
    return function(dictIsSymbol) {
      return function(l) {
        return function(a2) {
          return function(r1) {
            return unsafeInsert(reflectSymbol(dictIsSymbol)(l))(a2)(r1);
          };
        };
      };
    };
  };
};
var $$delete4 = function(dictIsSymbol) {
  return function() {
    return function() {
      return function(l) {
        return function(r2) {
          return unsafeDelete2(reflectSymbol(dictIsSymbol)(l))(r2);
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
var flatten = function(v) {
  return function(psr) {
    return function(interpreter) {
      var element = function(v1) {
        return v1(psr)(interpreter);
      };
      return function(v1) {
        if (v1 instanceof FixedChildren$prime) {
          return oneOfMap(foldableArray)(plusEvent)(flatten(v)(psr)(interpreter))(v1.value0);
        }
        ;
        if (v1 instanceof EventfulElement$prime) {
          return keepLatest(eventIsEvent)(map(functorEvent)(flatten(v)(psr)(interpreter))(v1.value0));
        }
        ;
        if (v1 instanceof Element$prime) {
          return element(v.toElt(v1.value0));
        }
        ;
        if (v1 instanceof DynamicChildren$prime) {
          return makeLemmingEvent(function(mySub) {
            return function(v2) {
              return function __do3() {
                var cancelInner = newSTRef(empty2)();
                var cancelOuter = mySub(v1.value0)(function(inner) {
                  return function __do4() {
                    var myUnsubId = v.ids(interpreter)();
                    var myUnsub = newSTRef(pure(applicativeST)(unit))();
                    var eltsUnsubId = v.ids(interpreter)();
                    var eltsUnsub = newSTRef(pure(applicativeST)(unit))();
                    var myIds = newSTRef([])();
                    var myImmediateCancellation = newSTRef(pure(applicativeST)(unit))();
                    var myScope = map(functorST)(Local.create)(v.ids(interpreter))();
                    var stageRef = newSTRef(Begin.value)();
                    var c0 = mySub(inner)(function(kid$prime) {
                      return function __do5() {
                        var stage = read2(stageRef)();
                        if (kid$prime instanceof Logic && stage instanceof Middle) {
                          return bind(bindST)(read2(myIds))(traverse_(applicativeST)(foldableArray)(function() {
                            var $115 = v.doLogic(kid$prime.value0)(interpreter);
                            return function($116) {
                              return v2($115($116));
                            };
                          }()))();
                        }
                        ;
                        if (kid$prime instanceof Remove && stage instanceof Middle) {
                          $$void(functorST)(write2(End.value)(stageRef))();
                          var mic = function __do6() {
                            var idRef = read2(myIds)();
                            for_(applicativeST)(foldableArray)(idRef)(function(old) {
                              return for_(applicativeST)(foldableMaybe)(psr.parent)(function(pnt) {
                                return v2(v.disconnectElement(interpreter)({
                                  id: old,
                                  parent: pnt,
                                  scope: myScope
                                }));
                              });
                            })();
                            var myu = read2(myUnsub)();
                            myu();
                            var eltu = read2(eltsUnsub)();
                            eltu();
                            $$void(functorST)(modify2($$delete(myUnsubId))(cancelInner))();
                            return $$void(functorST)(modify2($$delete(eltsUnsubId))(cancelInner))();
                          };
                          $$void(functorST)(write2(mic)(myImmediateCancellation))();
                          return mic();
                        }
                        ;
                        if (kid$prime instanceof Insert && stage instanceof Begin) {
                          $$void(functorST)(write2(Middle.value)(stageRef))();
                          var c1 = mySub(flatten(v)(function() {
                            var $61 = {};
                            for (var $62 in psr) {
                              if ({}.hasOwnProperty.call(psr, $62)) {
                                $61[$62] = psr[$62];
                              }
                              ;
                            }
                            ;
                            $61.scope = myScope;
                            $61.raiseId = function(id2) {
                              return $$void(functorST)(modify2(append(semigroupArray)([id2]))(myIds));
                            };
                            return $61;
                          }())(interpreter)(kid$prime.value0))(v2)();
                          $$void(functorST)(modify2(insert(eltsUnsubId)(c1))(cancelInner))();
                          return $$void(functorST)(write2(c1)(eltsUnsub))();
                        }
                        ;
                        return unit;
                      };
                    })();
                    $$void(functorST)(write2(c0)(myUnsub))();
                    $$void(functorST)(modify2(insert(myUnsubId)(c0))(cancelInner))();
                    var mican = read2(myImmediateCancellation)();
                    return mican();
                  };
                })();
                return function __do4() {
                  bind(bindST)(read2(cancelInner))(foldl(foldableObject)(applySecond(applyST))(pure(applicativeST)(unit)))();
                  return cancelOuter();
                };
              };
            };
          });
        }
        ;
        throw new Error("Failed pattern match at Bolson.Control (line 543, column 17 - line 628, column 20): " + [v1.constructor.name]);
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
                      return makeLemmingEvent(function(mySub) {
                        return function(k) {
                          return function __do3() {
                            var av = mutAr(map(functorArray)($$const(""))(toArray2()(toBeam)))();
                            var actualized = oneOf(foldableArray)(plusEvent)(mapWithIndex2(functorWithIndexArray)(function(ix) {
                              return fix(lazyFn)(function(f) {
                                return function(i2) {
                                  if (i2 instanceof Element$prime) {
                                    return function(v1) {
                                      return v1(function() {
                                        var $78 = {};
                                        for (var $79 in psr) {
                                          if ({}.hasOwnProperty.call(psr, $79)) {
                                            $78[$79] = psr[$79];
                                          }
                                          ;
                                        }
                                        ;
                                        $78.parent = Nothing.value;
                                        $78.scope = scopeF(psr.scope);
                                        $78.raiseId = function(id2) {
                                          return unsafeUpdateMutAr(ix)(id2)(av);
                                        };
                                        return $78;
                                      }())(interpreter);
                                    }(v.toElt(i2.value0));
                                  }
                                  ;
                                  return f(v.wrapElt(i2));
                                };
                              });
                            })(toArray2()(toBeam)));
                            var u0 = mySub(actualized)(k)();
                            var av2 = newSTRef(pure(applicativeST)(unit))();
                            var idz = map(functorST)(unsafeCoerce)(readAr(av))();
                            var injectable = map(functorVect)(function(id2) {
                              return function(specialization) {
                                return new Element$prime(v.fromEltO1(function(psr2) {
                                  return function(itp) {
                                    return makeLemmingEvent(function(v1) {
                                      return function(k2) {
                                        return function __do4() {
                                          psr2.raiseId(id2)();
                                          for_(applicativeST)(foldableMaybe)(psr2.parent)(function(pt) {
                                            return k2(v.giveNewParent(itp)(build(composeFlipped(semigroupoidBuilder)(insert4()()({
                                              reflectSymbol: function() {
                                                return "id";
                                              }
                                            })($$Proxy.value)(id2))(composeFlipped(semigroupoidBuilder)(modify5()()({
                                              reflectSymbol: function() {
                                                return "parent";
                                              }
                                            })($$Proxy.value)($$const(pt)))($$delete4({
                                              reflectSymbol: function() {
                                                return "raiseId";
                                              }
                                            })()()($$Proxy.value))))(psr2))(specialization));
                                          })();
                                          return pure(applicativeST)(unit);
                                        };
                                      };
                                    });
                                  };
                                }));
                              };
                            })(idz);
                            var realized = flatten(flatArgs)(psr)(interpreter)(closure(injectable)(unsafeCoerce));
                            var u2 = mySub(realized)(k)();
                            $$void(functorST)(write2(u2)(av2))();
                            return function __do4() {
                              u0();
                              when(applicativeST)(!isGlobal)(for_(applicativeST)(foldableArray)(toArray2()(idz))(function(id2) {
                                return k(v.deleteFromCache(interpreter)({
                                  id: id2
                                }));
                              }))();
                              var av2c = read2(av2)();
                              return av2c();
                            };
                          };
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
var portalComplexComplex = function() {
  return function() {
    return function() {
      return function(flatArgs) {
        return function(portalArgs) {
          return function(toBeam) {
            return function(closure) {
              return internalPortalComplexComplex()()()(false)(identity(categoryFn))(flatArgs)(portalArgs)(toBeam)(closure);
            };
          };
        };
      };
    };
  };
};

// output/Deku.Core/index.js
var vbussed = function() {
  return function(dictVBus) {
    return function(px11) {
      return function(f) {
        return new EventfulElement$prime(coerce()(vbus()(dictVBus)(px11)(f)));
      };
    };
  };
};
var unsafeSetPos$prime = function(i2) {
  return function(v) {
    var f = function(v1) {
      if (v1 instanceof Element$prime) {
        return new Element$prime(lcmap(profunctorFn)(function(v2) {
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
        return new EventfulElement$prime(map(functorEvent)(f)(v1.value0));
      }
      ;
      return v;
    };
    return f(v);
  };
};
var unsafeSetPos = function($56) {
  return unsafeSetPos$prime(Just.create($56));
};
var sendToTop = /* @__PURE__ */ function() {
  return new Logic(0);
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
    ids: function() {
      var $57 = unwrap();
      return function($58) {
        return function(v) {
          return v.ids;
        }($57($58));
      };
    }(),
    disconnectElement: function(v) {
      return function(v1) {
        return v.disconnectElement({
          id: v1.id,
          scope: v1.scope,
          parent: v1.parent,
          scopeEq: eq(eqScope)
        });
      };
    },
    toElt: function(v) {
      return v;
    }
  };
};
var insert_ = function(d) {
  return new Insert(unwrap()(unsafeSetPos$prime(Nothing.value)(d)));
};
var bus2 = function(f) {
  return bus(f);
};
var bussed = function(f) {
  return new EventfulElement$prime(coerce()(bus2(f)));
};
var __internalDekuFlatten = function(a2) {
  return function(b2) {
    return function(v) {
      return flatten(portalFlatten())(a2)(b2)(v);
    };
  };
};
var dynify = function(f) {
  return function(es) {
    var go2 = function(v) {
      return function(v1) {
        return makeLemmingEvent(function(mySub) {
          return function(k) {
            return function __do3() {
              var me = v1.ids();
              v.raiseId(me)();
              var v2 = function() {
                if (v.parent instanceof Nothing) {
                  var dummyParent = v1.ids();
                  return new Tuple(pure(applicativeEvent)(v1.makeElement({
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
                  return new Tuple(empty(plusEvent), v.parent.value0);
                }
                ;
                throw new Error("Failed pattern match at Deku.Core (line 338, column 34 - line 352, column 36): " + [v.parent.constructor.name]);
              }();
              var unsub = mySub(oneOf(foldableArray)(plusEvent)([v2.value0, pure(applicativeEvent)(v1.makeDynBeacon({
                id: me,
                parent: new Just(v2.value1),
                scope: v.scope,
                dynFamily: v.dynFamily,
                pos: v.pos
              })), pure(applicativeEvent)(v1.attributeParent({
                id: me,
                parent: v2.value1,
                pos: v.pos,
                dynFamily: v.dynFamily,
                ez: v.ez
              })), __internalDekuFlatten({
                parent: new Just(v2.value1),
                scope: v.scope,
                ez: false,
                raiseId: function(v3) {
                  return pure(applicativeST)(unit);
                },
                pos: Nothing.value,
                dynFamily: new Just(me)
              })(v1)(f(es))]))(k)();
              return function __do4() {
                k(v1.removeDynBeacon({
                  id: me
                }))();
                return unsub();
              };
            };
          };
        });
      };
    };
    return new Element$prime(go2);
  };
};
var dyn2 = /* @__PURE__ */ dynify(/* @__PURE__ */ coerce()(dyn));

// output/Deku.Control/index.js
var unsafeSetText = function(v) {
  return function(id2) {
    return function(txt) {
      return map(functorEvent)(function($82) {
        return v.setText(function(v1) {
          return {
            id: id2,
            text: v1
          };
        }($82));
      })(txt);
    };
  };
};
var unsafeSetAttribute = function(v) {
  return function(id2) {
    return function(atts) {
      return map(functorEvent)(function($83) {
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
          throw new Error("Failed pattern match at Deku.Control (line 61, column 26 - line 63, column 45): " + [v1.value.constructor.name]);
        }(unsafeUnAttribute($83));
      })(atts);
    };
  };
};
var text = function(txt) {
  var go2 = function(v) {
    return function(v1) {
      return makeLemmingEvent(function(mySub) {
        return function(k) {
          return function __do3() {
            var me = v1.ids();
            v.raiseId(me)();
            var unsub = mySub(oneOf(foldableArray)(plusEvent)([pure(applicativeEvent)(v1.makeText({
              id: me,
              parent: v.parent,
              pos: v.pos,
              scope: v.scope,
              dynFamily: v.dynFamily
            })), unsafeSetText(v1)(me)(txt), maybe(empty(plusEvent))(function(p2) {
              return pure(applicativeEvent)(v1.attributeParent({
                id: me,
                parent: p2,
                pos: v.pos,
                dynFamily: v.dynFamily,
                ez: v.ez
              }));
            })(v.parent)]))(k)();
            return function __do4() {
              k(v1.deleteFromCache({
                id: me
              }))();
              return unsub();
            };
          };
        };
      });
    };
  };
  return new Element$prime(go2);
};
var text_ = function(txt) {
  return text(pure(applicativeEvent)(txt));
};
var switcher = function(f) {
  return function(event) {
    var counter = function() {
      var fn = function(a2) {
        return function(b2) {
          return new Tuple(a2 + 1 | 0, new Tuple(b2, a2));
        };
      };
      return mapAccum(eventIsEvent)(fn)(0);
    }();
    return dyn2(keepLatest(eventIsEvent)(memoize(counter(event))(function(cenv) {
      return map(functorEvent)(function(v) {
        return oneOf(foldableArray)(plusEvent)([map(functorEvent)($$const(Remove.value))(filter4(filterableEvent)(function() {
          var $84 = eq(eqInt)(v.value1 + 1 | 0);
          return function($85) {
            return $84(snd($85));
          };
        }())(cenv)), pure(applicativeEvent)(insert_(coerce()(f(v.value0))))]);
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
    ids: function() {
      var $86 = unwrap();
      return function($87) {
        return function(v) {
          return v.ids;
        }($86($87));
      };
    }(),
    disconnectElement: function(v) {
      return function(v1) {
        return v.disconnectElement({
          id: v1.id,
          scope: v1.scope,
          parent: v1.parent,
          scopeEq: eq(eqScope)
        });
      };
    },
    toElt: function(v) {
      return v;
    }
  };
};
var __internalDekuFlatten2 = function(a2) {
  return function(b2) {
    return function(v) {
      return flatten(portalFlatten2())(a2)(b2)(v);
    };
  };
};
var elementify = function(tag) {
  return function(atts) {
    return function(children) {
      var go2 = function(v) {
        return function(v1) {
          return makeLemmingEvent(function(mySub) {
            return function(k) {
              return function __do3() {
                var me = v1.ids();
                v.raiseId(me)();
                var unsub = mySub(alt(altEvent)(oneOf(foldableArray)(plusEvent)(append(semigroupArray)([pure(applicativeEvent)(v1.makeElement({
                  id: me,
                  parent: v.parent,
                  scope: v.scope,
                  tag,
                  pos: v.pos,
                  dynFamily: v.dynFamily
                })), unsafeSetAttribute(v1)(me)(atts)])(maybe([])(function(p2) {
                  return [pure(applicativeEvent)(v1.attributeParent({
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
                  raiseId: function(v2) {
                    return pure(applicativeST)(unit);
                  },
                  pos: Nothing.value,
                  dynFamily: Nothing.value
                })(v1)(children)))(k)();
                return function __do4() {
                  k(v1.deleteFromCache({
                    id: me
                  }))();
                  return unsub();
                };
              };
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
      return portalComplexComplex()()()(portalFlatten2())({
        fromEltO1: coerce(),
        fromEltO2: coerce(),
        toElt: coerce(),
        wrapElt: function(i2) {
          return new Element$prime(elementify("div")(empty(plusEvent))(wrap()(i2)));
        },
        giveNewParent: function(q2) {
          return function(r) {
            return function(v) {
              return unwrap()(q2).giveNewParent(r);
            };
          };
        },
        deleteFromCache: function() {
          var $92 = unwrap();
          return function($93) {
            return function(v) {
              return v.deleteFromCache;
            }($92($93));
          };
        }()
      })(map(functorVect)(unwrap())(a2))(lcmap(profunctorFn)(map(functorVect)(function(v) {
        return v(unit);
      }))(coerce()(b2)));
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
var a = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("a")(attributes)(coerce()(fixed(coerce()(mapWithIndex(unsafeSetPos)(kids))))));
  };
};

// output/Deku.DOM.Elt.Div/index.js
var div2 = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("div")(attributes)(coerce()(fixed(coerce()(mapWithIndex(unsafeSetPos)(kids))))));
  };
};
var div_ = /* @__PURE__ */ div2(/* @__PURE__ */ empty(plusEvent));

// output/Deku.DOM.Elt.Span/index.js
var span = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("span")(attributes)(coerce()(fixed(coerce()(mapWithIndex(unsafeSetPos)(kids))))));
  };
};
var span_ = /* @__PURE__ */ span(/* @__PURE__ */ empty(plusEvent));

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
var button = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("button")(attributes)(coerce()(fixed(coerce()(mapWithIndex(unsafeSetPos)(kids))))));
  };
};
var button_ = /* @__PURE__ */ button(/* @__PURE__ */ empty(plusEvent));

// output/Deku.DOM.Elt.Code/index.js
var code = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("code")(attributes)(coerce()(fixed(coerce()(mapWithIndex(unsafeSetPos)(kids))))));
  };
};
var code_ = /* @__PURE__ */ code(/* @__PURE__ */ empty(plusEvent));

// output/Deku.DOM.Elt.I/index.js
var i = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("i")(attributes)(coerce()(fixed(coerce()(mapWithIndex(unsafeSetPos)(kids))))));
  };
};
var i_ = /* @__PURE__ */ i(/* @__PURE__ */ empty(plusEvent));

// output/Deku.DOM.Elt.Input/index.js
var input = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("input")(attributes)(coerce()(fixed(coerce()(mapWithIndex(unsafeSetPos)(kids))))));
  };
};

// output/Deku.DOM.Elt.Li/index.js
var li = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("li")(attributes)(coerce()(fixed(coerce()(mapWithIndex(unsafeSetPos)(kids))))));
  };
};
var li_ = /* @__PURE__ */ li(/* @__PURE__ */ empty(plusEvent));

// output/Deku.DOM.Elt.Pre/index.js
var pre = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("pre")(attributes)(coerce()(fixed(coerce()(mapWithIndex(unsafeSetPos)(kids))))));
  };
};
var pre_ = /* @__PURE__ */ pre(/* @__PURE__ */ empty(plusEvent));

// output/Deku.DOM.Elt.Ul/index.js
var ul = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("ul")(attributes)(coerce()(fixed(coerce()(mapWithIndex(unsafeSetPos)(kids))))));
  };
};
var ul_ = /* @__PURE__ */ ul(/* @__PURE__ */ empty(plusEvent));

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
var SSR = /* @__PURE__ */ function() {
  function SSR2() {
  }
  ;
  SSR2.value = new SSR2();
  return SSR2;
}();
var stringToPage = function(v) {
  if (v === "Intro") {
    return pure(applicativeMaybe)(Intro.value);
  }
  ;
  if (v === "HelloWorld") {
    return pure(applicativeMaybe)(HelloWorld.value);
  }
  ;
  if (v === "SimpleComponent") {
    return pure(applicativeMaybe)(SimpleComponent.value);
  }
  ;
  if (v === "PURSX1") {
    return pure(applicativeMaybe)(PURSX1.value);
  }
  ;
  if (v === "PURSX2") {
    return pure(applicativeMaybe)(PURSX2.value);
  }
  ;
  if (v === "Events") {
    return pure(applicativeMaybe)(Events.value);
  }
  ;
  if (v === "Effects") {
    return pure(applicativeMaybe)(Effects.value);
  }
  ;
  if (v === "Events2") {
    return pure(applicativeMaybe)(Events2.value);
  }
  ;
  if (v === "Portals") {
    return pure(applicativeMaybe)(Portals.value);
  }
  ;
  if (v === "SSR") {
    return pure(applicativeMaybe)(SSR.value);
  }
  ;
  return empty(plusMaybe);
};

// output/Deku.Example.Docs.Util/foreign.js
function scrollToTop_() {
  window.scrollTo(0, 0);
}

// output/Deku.Example.Docs.Util/index.js
var scrollToTop = scrollToTop_;

// output/Deku.Pursx/index.js
var PursxElement = function(x) {
  return x;
};
var pursxToElementNil = {
  pursxToElement: function(v) {
    return function(v1) {
      return function(v2) {
        return {
          cache: empty2,
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
                  cache: insert(reflectType(dictReflectable)($$Proxy.value))(true)(v1.cache),
                  element: function(parent2) {
                    return function(v2) {
                      return alt(altEvent)(map(functorEvent)(lcmap(profunctorFn)(unsafeUnAttribute)(function(v3) {
                        if (v3.value instanceof Prop$prime) {
                          return v2.setProp({
                            id: reflectType(dictReflectable)($$Proxy.value) + ("@!%" + pxScope),
                            key: v3.key,
                            value: v3.value.value0
                          });
                        }
                        ;
                        if (v3.value instanceof Cb$prime) {
                          return v2.setCb({
                            id: reflectType(dictReflectable)($$Proxy.value) + ("@!%" + pxScope),
                            key: v3.key,
                            value: v3.value.value0
                          });
                        }
                        ;
                        throw new Error("Failed pattern match at Deku.Pursx (line 4195, column 38 - line 4205, column 24): " + [v3.value.constructor.name]);
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
var nut = PursxElement;
var makePursx$prime = function(dictReflectable) {
  return function(dictReflectable1) {
    return function() {
      return function() {
        return function(dictPursxToElement) {
          return function(verb) {
            return function(html2) {
              return function(r) {
                var go2 = function(v) {
                  return function(v1) {
                    return makeLemmingEvent(function(mySub) {
                      return function(k1) {
                        return function __do3() {
                          var me = v1.ids();
                          var pxScope = v1.ids();
                          v.raiseId(me)();
                          var v2 = pursxToElement(dictPursxToElement)(pxScope)($$Proxy.value)(r);
                          var unsub = mySub(oneOf(foldableArray)(plusEvent)([pure(applicativeEvent)(v1.makePursx({
                            id: me,
                            parent: v.parent,
                            cache: v2.cache,
                            dynFamily: v.dynFamily,
                            pos: v.pos,
                            pxScope,
                            scope: v.scope,
                            html: reflectType(dictReflectable)(html2),
                            verb: reflectType(dictReflectable1)(verb)
                          })), v2.element(v)(v1), maybe(empty(plusEvent))(function(p2) {
                            return pure(applicativeEvent)(v1.attributeParent({
                              id: me,
                              parent: p2,
                              pos: v.pos,
                              dynFamily: v.dynFamily,
                              ez: false
                            }));
                          })(v.parent)]))(k1)();
                          return function __do4() {
                            k1(v1.deleteFromCache({
                              id: me
                            }))();
                            return unsub();
                          };
                        };
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
      return function(px11) {
        return makePursx(dictReflectable)()()(dictPursxToElement)(px11)({});
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
        ids: function() {
          var $440 = unwrap();
          return function($441) {
            return function(v) {
              return v.ids;
            }($440($441));
          };
        }(),
        disconnectElement: function(v) {
          return function(v1) {
            return v.disconnectElement({
              id: v1.id,
              scope: v1.scope,
              parent: v1.parent,
              scopeEq: eq(eqScope)
            });
          };
        },
        toElt: function(v) {
          return v;
        }
      })(a2)(b2)(coerce()(c));
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
                  cache: insert(reflectType(dictReflectable)($$Proxy.value))(false)(v2.cache),
                  element: function(info2) {
                    return function(di) {
                      return alt(altEvent)(__internalDekuFlatten3({
                        parent: new Just(reflectType(dictReflectable)($$Proxy.value) + ("@!%" + pxScope)),
                        scope: info2.scope,
                        raiseId: function(v3) {
                          return pure(applicativeST)(unit);
                        },
                        pos: info2.pos,
                        ez: false,
                        dynFamily: Nothing.value
                      })(di)(v1))(v2.element(info2)(di));
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
var pursx2 = 'module Main where\n\nimport Prelude\n\nimport Control.Alt ((<|>))\nimport Data.Compactable (compact)\nimport Data.Maybe (Maybe(..))\nimport Deku.Attribute ((:=))\nimport Deku.Control (text)\nimport Deku.Core (envy)\nimport Deku.DOM as D\nimport Deku.Pursx (nut, (~~))\nimport Deku.Toplevel (runInBody)\nimport Effect (Effect)\nimport FRP.Event (bus)\nimport Type.Proxy (Proxy(..))\n\nmyDom =\n  Proxy\n    :: Proxy\n         """<div>\n        <button>I do nothing</button>\n        <ul>\n          <li>A</li>\n          <li ~myli~>B</li>\n          <li>C</li>\n        </ul>\n        <div>\n          <a href="https://github.com/mikesol/purescript-deku"></a>\n          <i>bar</i>\n          ~somethingNew~\n          <span style="font-weight:800;">baz</span>\n        </div>\n        <div><div></div><div><input type="range"/></div></div>\n      </div>\n"""\n\nmain :: Effect Unit\nmain = runInBody\n  (envy ( bus \\push event -> myDom ~~\n      { myli: pure (D.Style := "background-color:rgb(200,240,210);")\n      , somethingNew: nut\n          ( D.button (pure (D.OnClick := push (Just unit)))\n              [ text\n                  $ (compact event $> "Thanks for clicking me!") <|>\n                      pure "I was dynamically inserted"\n              ]\n          )\n      }\n  ))';
var pursx1 = 'module Main where\n\nimport Prelude\n\nimport Deku.Pursx (psx)\nimport Deku.Toplevel (runInBody)\nimport Effect (Effect)\nimport Type.Proxy (Proxy(..))\n\nmyDom =\n  Proxy\n    :: Proxy\n         """<div>\n    <button>I do nothing</button>\n    <ul>\n        <li>A</li>\n        <li>B</li>\n        <li>C</li>\n    </ul>\n    <div>\n        <a href="https://github.com/mikesol/purescript-deku"></a>\n        <i>bar</i>\n        <span style="font-weight:800;">baz</span>\n    </div>\n    <div><div></div><div><input type="range"/></div></div>\n    </div>\n"""\n\nmain :: Effect Unit\nmain = runInBody (psx myDom)';
var portals1 = 'module Main where\n\nimport Prelude\n\nimport Control.Alt ((<|>))\nimport Data.FastVect.FastVect (index, (:))\nimport Data.FastVect.FastVect as V\nimport Data.Foldable (oneOfMap)\nimport Data.Profunctor (lcmap)\nimport Deku.Attribute ((:=))\nimport Deku.Control (portal, switcher, text_)\nimport Deku.Core (Domable, envy)\nimport Deku.DOM as D\nimport Deku.Toplevel (runInBody)\nimport Effect (Effect)\nimport FRP.Event (Event, bus, fold)\nimport Type.Prelude (Proxy(..))\n\nmain :: Effect Unit\nmain = runInBody\n  (envy $ bus \\push -> lcmap (pure unit <|> _) \\event -> do\n      portal\n        ( map\n            ( \\i -> D.video\n                (oneOfMap pure [ D.Controls := "true", D.Width := "250" ])\n                [ D.source\n                    (oneOfMap pure [ D.Src := i, D.Xtype := "video/mp4" ])\n                    []\n                ]\n            )\n            ( "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"\n                : "https://www.w3schools.com/jsref/movie.mp4"\n                : V.empty\n            )\n        )\n        \\v _ -> do\n          let\n            p0 :: Domable _ _\n            p0 = index (Proxy :: _ 0) v\n\n            p1 :: Domable _ _\n            p1 = index (Proxy :: _ 1) v\n\n            ev :: Boolean -> Event Boolean\n            ev b = fold (\\a _ -> not a) b event\n\n            flips :: Boolean -> Domable _ _\n            flips = D.span_ <<< pure <<< switcher (if _ then p0 else p1) <<< ev\n          D.div_\n            [ D.button (pure $ D.OnClick := push unit)\n                [ text_ "Switch videos" ]\n            , D.div_ [ D.span_ [ flips true ], flips false ]\n            ]\n  )\n';
var helloWorld = 'module Main where\n\nimport Prelude\n\nimport Deku.Control (text_)\nimport Deku.Toplevel (runInBody)\nimport Effect (Effect)\n\nmain :: Effect Unit\nmain = runInBody (text_ "Hello world")';
var events3 = `module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Filterable (compact)
import Data.Foldable (oneOf)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\\))
import Deku.Control (text_)
import Deku.Core (Nut, dyn, bussed, insert_, remove, sendToTop)
import Deku.DOM as D
import Deku.Listeners (click, keyUp, textInput)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, bus, keepLatest, mapAccum)
import Web.UIEvent.KeyboardEvent (code)

data MainUIAction
  = AddTodo
  | ChangeText String

data TodoAction = Prioritize | Delete

main :: Effect Unit
main = runInBody
  ( bussed \\pushAction actionEvent -> do
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
                ( \\txt -> keepLatest $ bus \\p' e' ->
                    ( pure $ insert_ $ D.div_
                        [ text_ txt
                        , D.button
                            (click $ pure (p' sendToTop))
                            [ text_ "Prioritize" ]
                        , D.button
                            (click $ pure (p' remove))
                            [ text_ "Delete" ]
                        ]
                    ) <|> e'
                )
                accumulateTextAndEmitOnSubmit
        ]
  )
`;
var events = 'module Main where\n\nimport Prelude\n\nimport Control.Alt ((<|>))\nimport Deku.Control (text, text_)\nimport Deku.Core (vbussed)\nimport Deku.DOM as D\nimport Deku.Listeners (click_, slider)\nimport Deku.Toplevel (runInBody)\nimport Effect (Effect)\nimport FRP.Event (Event, fold)\nimport FRP.Event.VBus (V)\nimport Type.Proxy (Proxy(..))\n\ntype UIEvents = V\n  ( buttonClicked :: Unit\n  , sliderMoved :: Number\n  )\n\nmain :: Effect Unit\nmain = runInBody\n  ( vbussed (Proxy :: _ UIEvents) \\push event -> do\n      let\n        countUp :: Event Int\n        countUp = fold\n          (\\a _ -> 1 + a)\n          (-1)\n          (pure unit <|> event.buttonClicked)\n      D.div_\n        [ D.button\n            (click_ (push.buttonClicked unit))\n            [ text_ "Click" ]\n        , D.div_\n            [ text\n                ( pure "Val: 0" <|>\n                    ( append "Val: " <<< show <$> countUp\n                    )\n                )\n            ]\n        , D.div_\n            [ D.input\n                (slider (pure push.sliderMoved))\n                []\n            , D.div_\n                [ text\n                    ( pure "Val: 50" <|>\n                        ( append "Val: " <<< show\n                            <$> event.sliderMoved\n                        )\n                    )\n                ]\n            ]\n        ]\n  )\n';
var effects = 'module Main where\n\nimport Prelude\n\nimport Affjax.ResponseFormat as ResponseFormat\nimport Affjax.Web as AX\nimport Control.Alt ((<|>))\nimport Data.Argonaut.Core (stringifyWithIndent)\nimport Data.Either (Either(..))\nimport Data.Filterable (compact, separate)\nimport Data.HTTP.Method (Method(..))\nimport Data.Maybe (Maybe(..))\nimport Data.Profunctor (lcmap)\nimport Data.Tuple.Nested ((/\\))\nimport Deku.Attribute (Cb, cb, (:=))\nimport Deku.Control (text)\nimport Deku.Core (bus, envy)\nimport Deku.DOM as D\nimport Deku.Toplevel (runInBody)\nimport Effect (Effect)\nimport Effect.Aff (launchAff_)\nimport Effect.Class (liftEffect)\nimport FRP.Event (Event, mapAccum)\n\ndata UIAction = Initial | Loading | Result String\n\nclickCb :: (UIAction -> Effect Unit) -> Cb\nclickCb push = cb\n  ( const do\n      push Loading\n      launchAff_ $ do\n        result <- AX.request\n          ( AX.defaultRequest\n              { url = "https://randomuser.me/api/"\n              , method = Left GET\n              , responseFormat = ResponseFormat.json\n              }\n          )\n        case result of\n          Left err -> liftEffect $ push\n            $ Result\n                ( "GET /api response failed to decode: " <>\n                    AX.printError err\n                )\n          Right response -> liftEffect $ push $ Result $\n            stringifyWithIndent 2 response.body\n  )\n\nclickText = "Click to get some random user data." :: String\n\nmain :: Effect Unit\nmain = runInBody\n  (envy $ bus \\push -> lcmap (pure Initial <|> _)\n      \\event -> do\n        let\n          split :: { left :: Event Unit, right :: Event String }\n          split = separate $ compact $\n            map\n              ( case _ of\n                  Loading -> Just $ Left unit\n                  Result s -> Just $ Right s\n                  _ -> Nothing\n              )\n              event\n          { left: loading, right: result } = split\n        D.div_\n          [ D.div_\n              [ D.button (pure (D.OnClick := clickCb push))\n                  [ text\n                      ( pure clickText\n                          <|> (loading $> "Loading...")\n                          <|> (result $> clickText)\n                      )\n                  ]\n              ]\n          , D.div\n              ( (pure (D.Style := "display: none;")) <|>\n                  ( compact\n                      ( mapAccum\n                          ( \\b _ -> (b && false) /\\\n                              if b then Just unit else Nothing\n                          )\n                          true\n                          result\n                      ) $> (D.Style := "display: block;")\n                  )\n              )\n              [ D.pre_ [ D.code_ [ text (pure "" <|> result) ] ] ]\n          ]\n  )\n';
var component = 'module Main where\n\nimport Prelude\n\nimport Deku.Attribute ((:=))\nimport Deku.Control (text_)\nimport Deku.Core (fixed)\nimport Deku.DOM as D\nimport Deku.Toplevel (runInBody)\nimport Effect (Effect)\n\nmain :: Effect Unit\nmain = runInBody\n  (fixed [ D.button_ [ text_ "I do nothing" ]\n    , D.ul_ $ map (D.li_ <<< pure <<< text_) [ "A", "B", "C" ]\n    , D.div_\n        [ D.a (pure $ D.Href := "https://example.com")\n            [ text_ "foo " ]\n        , D.i_ [ text_ " bar " ]\n        , D.span (pure $ D.Style := "font-weight: 800;")\n            [ text_ " baz" ]\n        ]\n    , D.div_\n        [ D.div_\n            [ D.div_ [ D.input (pure $ D.Xtype := "range") [] ]\n            ]\n        ]\n    ]\n  )';
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
var build2 = 'module Deku.Example.Docs.Examples.SSR.Build where\n\nimport Prelude\n\nimport Control.Monad.ST.Global (toEffect)\nimport Deku.Examples.Docs.Examples.SSR.App (app)\nimport Deku.Toplevel (Template(..), runSSR)\nimport Effect (Effect)\nimport Effect.Console (log)\n\nmain :: Effect Unit\nmain =\n  toEffect\n    ( runSSR\n        ( Template\n            { head:\n                """<!DOCTYPE html>\n<html>\n  <head>\n    <title>My static page</title>\n		<script src="bundle.js" defer><\/script>\n  </head>"""\n            , tail: "</html>"\n            }\n        )\n        app\n    ) >>= log';
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
var target = function($0) {
  return toMaybe(_target($0));
};

// output/Deku.Example.Docs.Component/index.js
var px = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var components = function(options2) {
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
  <p>Attributes like an element's style or id are specified as the first argument to an element. Attributes are just <a href="https://github.com/mikesol/purescript-event/blob/master/src/FRP/Event.purs"><code>Event</code>-s</a>, so you can <code>pure</code> them to make them happen <i>now</i>, combine two event streams with <code>alt</code> to compose events, etc.</p>

  <p>As an example, we made the input a range slider using <code>pure (Xtype := "range")</code>. Unlike Halogen, there are no checks to make sure you give a valid string. So if you want your range slider to have the value of true, you can. One day, I may build some validators, but passing strings works decently well here.</p>

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
    code: nut(pre_([code_([text_(component)])])),
    result: nut(div_([button_([text_("I do nothing")]), ul_(map(functorArray)(function() {
      var $0 = pure(applicativeArray);
      return function($1) {
        return li_($0(text_($1)));
      };
    }())(["A", "B", "C"])), div_([a(pure(applicativeEvent)(attr(attrA_HrefString)(Href.value)("https://example.com")))([text_("foo ")]), i_([text_(" bar ")]), span(pure(applicativeEvent)(attr(attrSpan_StyleString)(Style.value)("font-weight: 800;")))([text_(" baz")])]), div_([div_([div_([input(pure(applicativeEvent)(attr(attrInput_XtypeString)(Xtype.value)("range")))([])])])])])),
    next: oneOfMap(foldableArray)(plusEvent)(pure(applicativeEvent))([attr(attrOnClickCb)(OnClick.value)(cb(function(e) {
      return applySecond(applyEffect)(applySecond(applyEffect)(preventDefault(e))(options2.dpage(PURSX1.value)))(scrollToTop);
    })), attr(attrA_HrefString)(Href.value)(options2.slug + "pursx1/")])
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

// output/JSURI/foreign.js
function toRFC3896(input2) {
  return input2.replace(/[!'()*]/g, function(c) {
    return "%" + c.charCodeAt(0).toString(16);
  });
}
var _encodeFormURLComponent = function encode2(fail2, succeed, input2) {
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
var toArray3 = function(v) {
  return v;
};
var encode3 = /* @__PURE__ */ function() {
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
    return $16($17(toArray3($18)));
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
  var $169 = singleton4(plusList);
  return function($170) {
    return NonEmptyList($169($170));
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
  function runSync(left, right, eff) {
    try {
      return right(eff());
    } catch (error3) {
      return left(error3);
    }
  }
  function runAsync(left, eff, k) {
    try {
      return eff(k)();
    } catch (error3) {
      k(left(error3))();
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
              fail2 = null;
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
    function join2(result, head6, tail2) {
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
                    } else if (tail2 === null) {
                      join2(fail2, null, null);
                    } else {
                      join2(fail2, tail2._1, tail2._2);
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
                    } else if (tail2 === null) {
                      join2(step3, null, null);
                    } else {
                      join2(step3, tail2._1, tail2._2);
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
          join2(result, fiber._2._1, fiber._2._2);
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
var $runtime_lazy5 = function(name16, moduleName, init3) {
  var state3 = 0;
  var val;
  return function(lineNumber) {
    if (state3 === 2)
      return val;
    if (state3 === 1)
      throw new ReferenceError(name16 + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state3 = 1;
    val = init3();
    state3 = 2;
    return val;
  };
};
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
  return _makeFiber(ffiUtil, aff);
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
var $lazy_applyAff = /* @__PURE__ */ $runtime_lazy5("applyAff", "Effect.Aff", function() {
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
var unsafeToForeign = unsafeCoerce;
var unsafeFromForeign = unsafeCoerce;
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
    return $118(singleton10($119));
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
        return note("Body contains values that cannot be encoded as application/x-www-form-urlencoded")(map(functorMaybe)(unsafeToForeign)(encode3(v2.value0)));
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
  function Loading4() {
  }
  ;
  Loading4.value = new Loading4();
  return Loading4;
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
      throw new Error("Failed pattern match at Deku.Example.Docs.Effects (line 44, column 9 - line 51, column 48): " + [result.constructor.name]);
    }))();
  }));
};
var effects2 = function(options2) {
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
    code: nut(pre_([code_([text_(effects)])])),
    result: nut(bussed(function(push2) {
      return function(event) {
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
        return div_([div_([button(pure(applicativeEvent)(attr(attrOnClickCb)(OnClick.value)(clickCb(push2))))([text(alt(altEvent)(pure(applicativeEvent)(clickText))(alt(altEvent)(voidLeft(functorEvent)(loading)("Loading..."))(voidLeft(functorEvent)(result)(clickText))))])]), div2(alt(altEvent)(pure(applicativeEvent)(attr(attrDiv_StyleString)(Style.value)("display: none;")))(voidLeft(functorEvent)(compact(compactableEvent)(mapAccum(eventIsEvent)(function(b2) {
          return function(v) {
            return new Tuple(b2 && false, function() {
              if (b2) {
                return new Just(unit);
              }
              ;
              return Nothing.value;
            }());
          };
        })(true)(result)))(attr(attrDiv_StyleString)(Style.value)("display: block;"))))([pre_([code_([text(alt(altEvent)(pure(applicativeEvent)(""))(result))])])])]);
      };
    })),
    next: oneOfMap(foldableArray)(plusEvent)(pure(applicativeEvent))([attr(attrOnClickCb)(OnClick.value)(cb(function(e) {
      return applySecond(applyEffect)(applySecond(applyEffect)(preventDefault(e))(options2.dpage(PURSX2.value)))(scrollToTop);
    })), attr(attrA_HrefString)(Href.value)(options2.slug + "pursx2/")])
  });
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

// output/Deku.DOM.Elt.P/index.js
var p = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("p")(attributes)(coerce()(fixed(coerce()(mapWithIndex(unsafeSetPos)(kids))))));
  };
};
var p_ = /* @__PURE__ */ p(/* @__PURE__ */ empty(plusEvent));

// output/Deku.DOM.Elt.Source/index.js
var source = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("source")(attributes)(coerce()(fixed(coerce()(mapWithIndex(unsafeSetPos)(kids))))));
  };
};

// output/Deku.DOM.Elt.Video/index.js
var video = function(attributes) {
  return function(kids) {
    return new Element$prime(elementify("video")(attributes)(coerce()(fixed(coerce()(mapWithIndex(unsafeSetPos)(kids))))));
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
var slider = /* @__PURE__ */ function() {
  var $9 = alt(altEvent)(pure(applicativeEvent)(attr(attrInput_XtypeString)(Xtype.value)("range")));
  var $10 = map(functorEvent)(function(push2) {
    return attr(attrOnInputCb)(OnInput.value)(cb(function(e) {
      return for_(applicativeEffect)(foldableMaybe)(bind(bindMaybe)(target(e))(fromEventTarget))(composeKleisli(bindEffect)(valueAsNumber)(push2));
    }));
  });
  return function($11) {
    return $9($10($11));
  };
}();
var click = function(dictAttr) {
  return map(functorEvent)(attr(dictAttr)(OnClick.value));
};
var click_ = function(dictAttr) {
  var $17 = click(dictAttr);
  var $18 = pure(applicativeEvent);
  return function($19) {
    return $17($18($19));
  };
};

// output/Deku.Example.Docs.Events/index.js
var px3 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var events2 = function(options2) {
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
    code: nut(pre_([code_([text_(events)])])),
    result: nut(vbussed()(vbusCons2({
      reflectSymbol: function() {
        return "buttonClicked";
      }
    })()()(vbusCons2({
      reflectSymbol: function() {
        return "sliderMoved";
      }
    })()()(vbusNil)()())()())($$Proxy.value)(function(push2) {
      return function(event) {
        return div_([button(click_(attrOnClickEffectUnit)(push2.buttonClicked(unit)))([text_("Click")]), div_([text(alt(altEvent)(pure(applicativeEvent)("Val: 0"))(map(functorEvent)(function() {
          var $1 = append(semigroupString)("Val: ");
          var $2 = show(showInt);
          return function($3) {
            return $1($2($3));
          };
        }())(fold3(eventIsEvent)(function(a2) {
          return function(v) {
            return 1 + a2 | 0;
          };
        })(-1 | 0)(alt(altEvent)(pure(applicativeEvent)(unit))(event.buttonClicked)))))]), div_([input(slider(pure(applicativeEvent)(push2.sliderMoved)))([]), div_([text(alt(altEvent)(pure(applicativeEvent)("Val: 50.0"))(map(functorEvent)(function() {
          var $4 = append(semigroupString)("Val: ");
          var $5 = show(showNumber);
          return function($6) {
            return $4($5($6));
          };
        }())(event.sliderMoved)))])])]);
      };
    })),
    next: oneOfMap(foldableArray)(plusEvent)(pure(applicativeEvent))([attr(attrOnClickCb)(OnClick.value)(cb(function(e) {
      return applySecond(applyEffect)(applySecond(applyEffect)(preventDefault(e))(options2.dpage(Effects.value)))(scrollToTop);
    })), attr(attrA_HrefString)(Href.value)(options2.slug + "effects/")])
  });
};

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
var events22 = function(options2) {
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
    <li><code>insert</code>, which takes an element.</li>
    <li><code>sendToTop</code>, which sends the current element to the top of its parent.</li>
    <li><code>remove</code>, which removes the element from its parent.</li>
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
    code: nut(pre_([code_([text_(events3)])])),
    result: nut(bussed(function(push2) {
      return lcmap(profunctorFn)(function(v) {
        return alt(altEvent)(pure(applicativeEvent)(UIShown.value))(v);
      })(function(event) {
        return div_([div_([input(oneOfMap(foldableArray)(plusEvent)(pure(applicativeEvent))([attr(attrInput_StyleString)(Style.value)("border-style:solid;border-width: 1px;border-color: black;"), attr(attrOnInputCb)(OnInput.value)(cb(function(e) {
          return for_(applicativeEffect)(foldableMaybe)(bind(bindMaybe)(target(e))(fromEventTarget))(composeKleisli(bindEffect)(value2)(function($8) {
            return push2(ChangeText.create($8));
          }));
        })), attr(attrOnKeyupCb)(OnKeyup.value)(cb(function(e) {
          return for_(applicativeEffect)(foldableMaybe)(fromEvent(e))(function(evt) {
            return when(applicativeEffect)(code2(evt) === "Enter")(push2(AddTodo.value));
          });
        }))]))([]), button(alt(altEvent)(pure(applicativeEvent)(attr(attrButton_StyleString)(Style.value)("margin: 5px;")))(pure(applicativeEvent)(attr(attrOnClickCb)(OnClick.value)(cb($$const(push2(AddTodo.value)))))))([text_("Add")])]), dyn2(map(functorEvent)(function(txt) {
          return keepLatest(eventIsEvent)(bus2(function(p$prime) {
            return function(e$prime) {
              return alt(altEvent)(pure(applicativeEvent)(insert_(div_([span(pure(applicativeEvent)(attr(attrSpan_StyleString)(Style.value)("margin: 5px;")))([text_(txt)]), button(alt(altEvent)(pure(applicativeEvent)(attr(attrButton_StyleString)(Style.value)("margin: 5px;")))(pure(applicativeEvent)(attr(attrOnClickCb)(OnClick.value)(cb($$const(p$prime(sendToTop)))))))([text_("Prioritize")]), button(alt(altEvent)(pure(applicativeEvent)(attr(attrButton_StyleString)(Style.value)("margin: 5px;")))(pure(applicativeEvent)(attr(attrOnClickCb)(OnClick.value)(cb($$const(p$prime(remove)))))))([text_("Delete")])]))))(e$prime);
            };
          }));
        })(filterMap(filterableEvent)(function(v) {
          if (v.value0) {
            return new Just(v.value1);
          }
          ;
          return Nothing.value;
        })(mapAccum(eventIsEvent)(function(a2) {
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
    })),
    next: oneOfMap(foldableArray)(plusEvent)(pure(applicativeEvent))([attr(attrOnClickCb)(OnClick.value)(cb(function(e) {
      return applySecond(applyEffect)(applySecond(applyEffect)(preventDefault(e))(options2.dpage(Portals.value)))(scrollToTop);
    })), attr(attrA_HrefString)(Href.value)(options2.slug + "portals/")])
  });
};

// output/Deku.Example.Docs.HelloWorld/index.js
var px5 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var helloWorld2 = function(options2) {
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
    code: nut(pre_([code_([text_(helloWorld)])])),
    result: nut(div_([text_("Hello world")])),
    next: oneOfMap(foldableArray)(plusEvent)(pure(applicativeEvent))([attr(attrOnClickCb)(OnClick.value)(cb(function(e) {
      return applySecond(applyEffect)(applySecond(applyEffect)(preventDefault(e))(options2.dpage(SimpleComponent.value)))(scrollToTop);
    })), attr(attrA_HrefString)(Href.value)(options2.slug + "component/")])
  });
};

// output/Deku.Example.Docs.Intro/index.js
var px6 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var intro = function(options2) {
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
    next: oneOfMap(foldableArray)(plusEvent)(pure(applicativeEvent))([attr(attrOnClickCb)(OnClick.value)(cb(function(e) {
      return applySecond(applyEffect)(applySecond(applyEffect)(preventDefault(e))(options2.dpage(HelloWorld.value)))(scrollToTop);
    })), attr(attrA_HrefString)(Href.value)(options2.slug + "hello/")])
  });
};

// output/Deku.Example.Docs.Portals1/index.js
var px7 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var portals12 = function(options2) {
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

  <h2>Next steps</h2>
  <p>In this section, we used portals to move an element to different areas of the DOM. In the next section, we'll learn how to do <a ~next~ style="cursor:pointer;">static site rendering</a>.</p>
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
  }))(px7)({
    code: nut(pre_([code_([text_(portals1)])])),
    result: nut(dyn2(bus2(function(push2) {
      return lcmap(profunctorFn)(alt(altEvent)(pure(applicativeEvent)(unit)))(function(event) {
        return pure(applicativeEvent)(insert_(portal()(map(functorVect)(function(i2) {
          return video(oneOfMap(foldableArray)(plusEvent)(pure(applicativeEvent))([attr(attrVideo_ControlsString)(Controls.value)("true"), attr(attrVideo_WidthString)(Width.value)("250")]))([source(oneOfMap(foldableArray)(plusEvent)(pure(applicativeEvent))([attr(attrSource_SrcString)(Src.value)(i2), attr(attrSource_XtypeString)(Xtype.value)("video/mp4")]))([])]);
        })(cons4()()("https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4")(cons4()()("https://www.w3schools.com/jsref/movie.mp4")(empty5))))(function(v) {
          return function(v1) {
            var p1 = index2()()()()()({
              reflectType: function() {
                return 1;
              }
            })($$Proxy.value)(v);
            var p0 = index2()()()()()({
              reflectType: function() {
                return 0;
              }
            })($$Proxy.value)(v);
            var ev = function(i2) {
              return fold3(eventIsEvent)(function(a2) {
                return function(v2) {
                  return !a2;
                };
              })(i2)(event);
            };
            var flips = function() {
              var $4 = pure(applicativeArray);
              var $5 = switcher(function(v2) {
                if (v2) {
                  return p0;
                }
                ;
                return p1;
              });
              return function($6) {
                return span_($4($5(ev($6))));
              };
            }();
            return div_([button(pure(applicativeEvent)(attr(attrOnClickCb)(OnClick.value)(cb($$const(push2(unit))))))([text_("Switch videos")]), div_([flips(true), flips(false)])]);
          };
        })));
      });
    }))),
    next: oneOfMap(foldableArray)(plusEvent)(pure(applicativeEvent))([attr(attrOnClickCb)(OnClick.value)(cb(function(e) {
      return applySecond(applyEffect)(applySecond(applyEffect)(preventDefault(e))(options2.dpage(SSR.value)))(scrollToTop);
    })), attr(attrA_HrefString)(Href.value)(options2.slug + "ssr/")])
  });
};

// output/Deku.Example.Docs.Pursx1/index.js
var px8 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var myDom = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var pursx12 = function(options2) {
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
  <p>In this section, we used PursX to build the same component as the previous section. In the next section, we'll learn how to respond to <a ~next~ style="cursor:pointer;">events</a>.</p>
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
    code: nut(pre_([code_([text_(pursx1)])])),
    result: nut(psx({
      reflectType: function() {
        return '<div>\n    <button>I do nothing</button>\n    <ul>\n        <li>A</li>\n        <li>B</li>\n        <li>C</li>\n    </ul>\n    <div>\n        <a href="https://example.com">foo</a>\n        <i>bar</i>\n        <span style="font-weight:800;">baz</span>\n    </div>\n    <div><div></div><div><input type="range"/></div></div>\n    </div>\n';
      }
    })()(pursxToElementNil)(myDom)),
    next: oneOfMap(foldableArray)(plusEvent)(pure(applicativeEvent))([attr(attrOnClickCb)(OnClick.value)(cb(function(e) {
      return applySecond(applyEffect)(applySecond(applyEffect)(preventDefault(e))(options2.dpage(Events.value)))(scrollToTop);
    })), attr(attrA_HrefString)(Href.value)(options2.slug + "events1/")])
  });
};

// output/Deku.Example.Docs.Pursx2/index.js
var px9 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var myDom2 = /* @__PURE__ */ function() {
  return $$Proxy.value;
}();
var pursx22 = function(options2) {
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
    code: nut(pre_([code_([text_(pursx2)])])),
    result: nut(dyn2(bus2(function(push2) {
      return function(event) {
        return pure(applicativeEvent)(insert_(makePursx({
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
          myli: pure(applicativeEvent)(attr(attrLi_StyleString)(Style.value)("background-color:rgb(200,240,210);")),
          somethingNew: nut(button(pure(applicativeEvent)(attr(attrOnClickEffectUnit)(OnClick.value)(push2(new Just(unit)))))([text(alt(altEvent)(voidLeft(functorEvent)(compact(compactableEvent)(event))("Thanks for clicking me!"))(pure(applicativeEvent)("I was dynamically inserted")))]))
        })));
      };
    }))),
    next: oneOfMap(foldableArray)(plusEvent)(pure(applicativeEvent))([attr(attrOnClickCb)(OnClick.value)(cb(function(e) {
      return applySecond(applyEffect)(applySecond(applyEffect)(preventDefault(e))(options2.dpage(Events2.value)))(scrollToTop);
    })), attr(attrA_HrefString)(Href.value)(options2.slug + "events2/")])
  });
};

// output/Random.LCG/index.js
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
        var n$prime = mod(euclideanRingInt)(n)(rangeSize);
        var $13 = n$prime < min5;
        if ($13) {
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
    return fromJust()(fromNumber(remainder(toNumber(lcgA) * toNumber(v) + toNumber(d))(toNumber(lcgM))));
  };
};
var lcgNext = /* @__PURE__ */ lcgPerturb(lcgC);

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
  return function(apply3) {
    return function(map3) {
      return function(f) {
        var buildFrom = function(x, ys) {
          return apply3(map3(consList)(f(x)))(ys);
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
          var acc = map3(finalCell)(f(array[array.length - 1]));
          var result = go2(acc, array.length - 1, array);
          while (result instanceof Cont) {
            result = result.fn();
          }
          return map3(listToArray)(result);
        };
      };
    };
  };
}();

// output/Control.Monad.State.Trans/index.js
var functorStateT = function(dictFunctor) {
  return {
    map: function(f) {
      return function(v) {
        return function(s2) {
          return map(dictFunctor)(function(v1) {
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
  return {
    bind: function(v) {
      return function(f) {
        return function(s2) {
          return bind(dictMonad.Bind1())(v(s2))(function(v1) {
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
  return {
    apply: ap(monadStateT(dictMonad)),
    Functor0: function() {
      return functorStateT(dictMonad.Bind1().Apply0().Functor0());
    }
  };
};
var applicativeStateT = function(dictMonad) {
  return {
    pure: function(a2) {
      return function(s2) {
        return pure(dictMonad.Applicative0())(new Tuple(a2, s2));
      };
    },
    Apply0: function() {
      return applyStateT(dictMonad);
    }
  };
};
var monadStateStateT = function(dictMonad) {
  return {
    state: function(f) {
      var $112 = pure(dictMonad.Applicative0());
      return function($113) {
        return $112(f($113));
      };
    },
    Monad0: function() {
      return monadStateT(dictMonad);
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
var unGen = function(v) {
  return v;
};
var lcgStep = /* @__PURE__ */ function() {
  var f = function(s2) {
    return new Tuple(unSeed(s2.newSeed), function() {
      var $30 = {};
      for (var $31 in s2) {
        if ({}.hasOwnProperty.call(s2, $31)) {
          $30[$31] = s2[$31];
        }
        ;
      }
      ;
      $30.newSeed = lcgNext(s2.newSeed);
      return $30;
    }());
  };
  return state(monadStateStateT(monadIdentity))(f);
}();
var functorGen = /* @__PURE__ */ functorStateT(functorIdentity);
var evalGen = function($40) {
  return evalState(unGen($40));
};
var applyGen = /* @__PURE__ */ applyStateT(monadIdentity);
var chooseInt$prime = function(a2) {
  return function(b2) {
    var numB = toNumber(b2);
    var numA = toNumber(a2);
    var clamp = function(x) {
      return numA + remainder(x)(numB - numA + 1);
    };
    var choose31BitPosNumber = map(functorGen)(toNumber)(lcgStep);
    var choose32BitPosNumber = apply(applyGen)(map(functorGen)(add(semiringNumber))(choose31BitPosNumber))(map(functorGen)(mul(semiringNumber)(2))(choose31BitPosNumber));
    return map(functorGen)(function($45) {
      return floor2(clamp($45));
    })(choose32BitPosNumber);
  };
};
var chooseInt2 = function(a2) {
  return function(b2) {
    var $37 = a2 <= b2;
    if ($37) {
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
var ssrSetText = function(a2) {
  return function(i2) {
    return $$void(functorST)(modify2(function(v) {
      return append(semigroupArray)(v)([new RenderableInstruction(new SetText(a2))]);
    })(i2));
  };
};
var ssrSetProp = function(a2) {
  return function(i2) {
    return $$void(functorST)(modify2(function(v) {
      return append(semigroupArray)(v)([new RenderableInstruction(new SetProp(a2))]);
    })(i2));
  };
};
var ssrSendToPos = function(a2) {
  return function(i2) {
    return $$void(functorST)(modify2(function(v) {
      return append(semigroupArray)(v)([new EliminatableInstruction(new SendToPos(a2))]);
    })(i2));
  };
};
var ssrRemoveDynBeacon = function(a2) {
  return function(i2) {
    return $$void(functorST)(modify2(function(v) {
      return append(semigroupArray)(v)([new EliminatableInstruction(new RemoveDynBeacon(a2))]);
    })(i2));
  };
};
var ssrMakeText = function(a2) {
  return function(i2) {
    return $$void(functorST)(modify2(function(v) {
      return append(semigroupArray)(v)([new RenderableInstruction(new MakeText(a2))]);
    })(i2));
  };
};
var ssrMakeRoot = function(a2) {
  return function(i2) {
    return $$void(functorST)(modify2(function(v) {
      return append(semigroupArray)(v)([new EliminatableInstruction(new MakeRoot(a2))]);
    })(i2));
  };
};
var ssrMakePursx = function(a2) {
  return function(i2) {
    return $$void(functorST)(modify2(function(v) {
      return append(semigroupArray)(v)([new RenderableInstruction(new MakePursx(a2))]);
    })(i2));
  };
};
var ssrMakeElement = function(a2) {
  return function(i2) {
    return $$void(functorST)(modify2(function(v) {
      return append(semigroupArray)(v)([new RenderableInstruction(new MakeElement(a2))]);
    })(i2));
  };
};
var ssrMakeDynBeacon = function(a2) {
  return function(i2) {
    return $$void(functorST)(modify2(function(v) {
      return append(semigroupArray)(v)([new RenderableInstruction(new MakeOpenDynBeacon(a2)), new RenderableInstruction(new MakeCloseDynBeacon(a2))]);
    })(i2));
  };
};
var ssrGiveNewParent = function(a2) {
  return function(i2) {
    return $$void(functorST)(modify2(function(v) {
      return append(semigroupArray)(v)([new EliminatableInstruction(new GiveNewParent(a2))]);
    })(i2));
  };
};
var ssrDisconnectElement = function(a2) {
  return function(i2) {
    return $$void(functorST)(modify2(function(v) {
      return append(semigroupArray)(v)([new EliminatableInstruction(new DisconnectElement(a2))]);
    })(i2));
  };
};
var ssrDeleteFromCache = function(a2) {
  return function(i2) {
    return $$void(functorST)(modify2(function(v) {
      return append(semigroupArray)(v)([new EliminatableInstruction(new DeleteFromCache(a2))]);
    })(i2));
  };
};
var ssrDOMInterpret = function(seed) {
  return {
    ids: function __do3() {
      var s2 = read2(seed)();
      var o = show(showInt)(evalGen(arbitrary(arbInt))({
        newSeed: mkSeed(s2),
        size: 5
      }));
      $$void(functorST)(modify2(add(semiringInt)(1))(seed))();
      return o;
    },
    makeElement: ssrMakeElement,
    attributeParent: function(v) {
      return function(v1) {
        return pure(applicativeST)(unit);
      };
    },
    makeRoot: ssrMakeRoot,
    makeText: ssrMakeText,
    makePursx: ssrMakePursx,
    setProp: ssrSetProp,
    makeDynBeacon: ssrMakeDynBeacon,
    setCb: function(v) {
      return function(v1) {
        return pure(applicativeST)(unit);
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
      vhtml = vhtml.replace(verb + key2 + verb, 'data-deku-attr-internal="' + key2 + '" data-deku-ssr="' + key2 + "@!%" + pxScope + '"');
    } else {
      vhtml = vhtml.replace(verb + key2 + verb, '<span style="display:contents;" data-deku-elt-internal="' + key2 + '" data-deku-ssr="' + key2 + "@!%" + pxScope + '"></span>');
    }
  }
  const gtix = vhtml.indexOf(">");
  const cix = vhtml.indexOf("/>");
  const ix = cix == gtix - 1 ? cix : gtix;
  return vhtml.slice(0, ix) + ' data-deku-ssr="' + id2 + '" ' + vhtml.slice(ix);
};

// output/Data.CatQueue/index.js
var $runtime_lazy6 = function(name16, moduleName, init3) {
  var state3 = 0;
  var val;
  return function(lineNumber) {
    if (state3 === 2)
      return val;
    if (state3 === 1)
      throw new ReferenceError(name16 + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state3 = 1;
    val = init3();
    state3 = 2;
    return val;
  };
};
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
      return new CatQueue(map(functorList)(f)(v.value0), map(functorList)(f)(v.value1));
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
var semigroupCatQueue = {
  append: /* @__PURE__ */ foldl(foldableCatQueue)(snoc3)
};
var empty6 = /* @__PURE__ */ function() {
  return new CatQueue(Nil.value, Nil.value);
}();
var monoidCatQueue = {
  mempty: empty6,
  Semigroup0: function() {
    return semigroupCatQueue;
  }
};
var singleton11 = /* @__PURE__ */ snoc3(empty6);
var fromFoldable4 = function(dictFoldable) {
  return function(f) {
    return foldMap(dictFoldable)(monoidCatQueue)(singleton11)(f);
  };
};
var traversableCatQueue = {
  traverse: function(dictApplicative) {
    return function(f) {
      var $100 = map(dictApplicative.Apply0().Functor0())(foldl(foldableCatQueue)(snoc3)(empty6));
      var $101 = foldl(foldableCatQueue)(function(acc) {
        var $103 = lift2(dictApplicative.Apply0())(snoc3)(acc);
        return function($104) {
          return $103(f($104));
        };
      })(pure(dictApplicative)(empty6));
      return function($102) {
        return $100($101($102));
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
  var state3 = 0;
  var val;
  return function(lineNumber) {
    if (state3 === 2)
      return val;
    if (state3 === 1)
      throw new ReferenceError(name16 + " was needed before it finished initializing (module " + moduleName + ", line " + lineNumber + ")", moduleName, lineNumber);
    state3 = 1;
    val = init3();
    state3 = 2;
    return val;
  };
};
var toSortableDyns = function(a2) {
  var go2 = function(acc) {
    return function(currentDyn) {
      return function($314) {
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
              return go2(append(semigroupArray)(acc)(ar.acc))(currentDyn)(ar.rest);
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
              throw new Error("Failed pattern match at Deku.SSR (line 56, column 34 - line 64, column 41): " + [currentDyn.constructor.name]);
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
              if (v.value0.head instanceof SetText) {
                return Nothing.value;
              }
              ;
              throw new Error("Failed pattern match at Deku.SSR (line 67, column 18 - line 74, column 33): " + [v.value0.head.constructor.name]);
            }();
            return go2(append(semigroupArray)(acc)([{
              pos: pos$prime,
              elt: new Left(v.value0.head)
            }]))(currentDyn)(v.value0.tail);
          }
          ;
          throw new Error("Failed pattern match at Deku.SSR (line 50, column 40 - line 76, column 15): " + [v.constructor.name]);
        }(uncons($314));
      };
    };
  };
  return go2([])(Nothing.value)(a2).acc;
};
var $lazy_sortSortableDyns = /* @__PURE__ */ $runtime_lazy7("sortSortableDyns", "Deku.SSR", function() {
  var $315 = map(functorArray)(function(v) {
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
          a: $lazy_sortSortableDyns(45)(v.elt.value0.a)
        })
      };
    }
    ;
    throw new Error("Failed pattern match at Deku.SSR (line 42, column 5 - line 45, column 81): " + [v.elt.constructor.name]);
  });
  var $316 = sortBy(on(compare(ordMaybe(ordInt)))(function() {
    var $318 = unwrap();
    return function($319) {
      return function(v) {
        return v.pos;
      }($318($319));
    };
  }()));
  return function($317) {
    return $315($316($317));
  };
});
var sortSortableDyns = /* @__PURE__ */ $lazy_sortSortableDyns(39);
var fromSortableDyns = function(arr) {
  return join(bindArray)(mapFlipped(functorArray)(arr)(function() {
    var $320 = unwrap();
    return function($321) {
      return function(v) {
        if (v instanceof Left) {
          return [v.value0];
        }
        ;
        if (v instanceof Right) {
          return append(semigroupArray)([new MakeOpenDynBeacon(v.value0.o)])(append(semigroupArray)(fromSortableDyns(v.value0.a))([new MakeCloseDynBeacon(v.value0.c)]));
        }
        ;
        throw new Error("Failed pattern match at Deku.SSR (line 33, column 26 - line 36, column 33): " + [v.constructor.name]);
      }(function(v) {
        return v.elt;
      }($320($321)));
    };
  }()));
};
var ssr$prime = function(topTag) {
  return function(arr$prime) {
    var setting = function(id2) {
      return function(action2) {
        return $$void(functorStateT(functorIdentity))(modify4(monadStateStateT(monadIdentity))(function(s2) {
          var $76 = {};
          for (var $77 in s2) {
            if ({}.hasOwnProperty.call(s2, $77)) {
              $76[$77] = s2[$77];
            }
            ;
          }
          ;
          $76.idToActions = alter(ordString)(function(v1) {
            if (v1 instanceof Just) {
              return new Just(append(semigroupArray)(v1.value0)([action2]));
            }
            ;
            if (v1 instanceof Nothing) {
              return new Just([action2]);
            }
            ;
            throw new Error("Failed pattern match at Deku.SSR (line 284, column 17 - line 286, column 45): " + [v1.constructor.name]);
          })(id2)(s2.idToActions);
          return $76;
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
          return discard(discardUnit)(bindStateT(monadIdentity))($$void(functorStateT(functorIdentity))(modify4(monadStateStateT(monadIdentity))(function(s2) {
            var $85 = {};
            for (var $86 in s2) {
              if ({}.hasOwnProperty.call(s2, $86)) {
                $85[$86] = s2[$86];
              }
              ;
            }
            ;
            $85.parentToChild = alter(ordString)(function(v1) {
              if (v1 instanceof Just) {
                return new Just(append(semigroupArray)(v1.value0)([id2]));
              }
              ;
              if (v1 instanceof Nothing) {
                return new Just([id2]);
              }
              ;
              throw new Error("Failed pattern match at Deku.SSR (line 271, column 19 - line 273, column 43): " + [v1.constructor.name]);
            })(parent2)(s2.parentToChild);
            return $85;
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
              var $89 = v2.value0.id === id$prime || eq(eqMaybe(eqString))(v2.value0.dynFamily)(new Just(v2.value0.id));
              if ($89) {
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
              var $93 = v2.value0.id === id$prime || eq(eqMaybe(eqString))(v2.value0.dynFamily)(new Just(v2.value0.id));
              if ($93) {
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
              var $97 = v2.value0.id === id$prime || eq(eqMaybe(eqString))(v2.value0.dynFamily)(new Just(v2.value0.id));
              if ($97) {
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
              var $101 = v2.value0.id === id$prime || eq(eqMaybe(eqString))(v2.value0.dynFamily)(new Just(v2.value0.id));
              if ($101) {
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
              var $105 = v2.value0.id === id$prime || eq(eqMaybe(eqString))(v2.value0.dynFamily)(new Just(v2.value0.id));
              if ($105) {
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
            throw new Error("Failed pattern match at Deku.SSR (line 194, column 24 - line 216, column 29): " + [v2.constructor.name]);
          };
        };
      };
      var removeParent = function(id$prime) {
        return function(v2) {
          if (v2 instanceof MakeElement) {
            var $112 = v2.value0.id === id$prime || eq(eqMaybe(eqString))(v2.value0.dynFamily)(new Just(v2.value0.id));
            if ($112) {
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
            var $116 = v2.value0.id === id$prime || eq(eqMaybe(eqString))(v2.value0.dynFamily)(new Just(v2.value0.id));
            if ($116) {
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
            var $120 = v2.value0.id === id$prime || eq(eqMaybe(eqString))(v2.value0.dynFamily)(new Just(v2.value0.id));
            if ($120) {
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
            var $124 = v2.value0.id === id$prime || eq(eqMaybe(eqString))(v2.value0.dynFamily)(new Just(v2.value0.id));
            if ($124) {
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
            var $128 = v2.value0.id === id$prime || eq(eqMaybe(eqString))(v2.value0.dynFamily)(new Just(v2.value0.id));
            if ($128) {
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
          throw new Error("Failed pattern match at Deku.SSR (line 217, column 24 - line 239, column 29): " + [v2.constructor.name]);
        };
      };
      var moveClosingToEnd = function(staging1) {
        return function(staging2) {
          return function(dbc) {
            return function($322) {
              return function(v2) {
                if (v2 instanceof Just && v2.value0.value0 instanceof MakeOpenDynBeacon) {
                  if (eq(eqMaybe(eqString))(v2.value0.value0.value0.dynFamily)(new Just(dbc.id))) {
                    return moveClosingToEnd(snoc3(append(semigroupCatQueue)(staging1)(staging2))(v2.value0.value0))(empty6)(dbc)(v2.value0.value1);
                  }
                  ;
                  if (otherwise) {
                    return moveClosingToEnd(staging1)(snoc3(staging2)(v2.value0.value0))(dbc)(v2.value0.value1);
                  }
                  ;
                }
                ;
                if (v2 instanceof Just && v2.value0.value0 instanceof MakeCloseDynBeacon) {
                  if (eq(eqMaybe(eqString))(v2.value0.value0.value0.dynFamily)(new Just(dbc.id))) {
                    return moveClosingToEnd(snoc3(append(semigroupCatQueue)(staging1)(staging2))(v2.value0.value0))(empty6)(dbc)(v2.value0.value1);
                  }
                  ;
                  if (otherwise) {
                    return moveClosingToEnd(staging1)(snoc3(staging2)(v2.value0.value0))(dbc)(v2.value0.value1);
                  }
                  ;
                }
                ;
                if (v2 instanceof Just && v2.value0.value0 instanceof MakeText) {
                  if (eq(eqMaybe(eqString))(v2.value0.value0.value0.dynFamily)(new Just(dbc.id))) {
                    return moveClosingToEnd(snoc3(append(semigroupCatQueue)(staging1)(staging2))(v2.value0.value0))(empty6)(dbc)(v2.value0.value1);
                  }
                  ;
                  if (otherwise) {
                    return moveClosingToEnd(staging1)(snoc3(staging2)(v2.value0.value0))(dbc)(v2.value0.value1);
                  }
                  ;
                }
                ;
                if (v2 instanceof Just && v2.value0.value0 instanceof MakePursx) {
                  if (eq(eqMaybe(eqString))(v2.value0.value0.value0.dynFamily)(new Just(dbc.id))) {
                    return moveClosingToEnd(snoc3(append(semigroupCatQueue)(staging1)(staging2))(v2.value0.value0))(empty6)(dbc)(v2.value0.value1);
                  }
                  ;
                  if (otherwise) {
                    return moveClosingToEnd(staging1)(snoc3(staging2)(v2.value0.value0))(dbc)(v2.value0.value1);
                  }
                  ;
                }
                ;
                if (v2 instanceof Just && v2.value0.value0 instanceof MakeElement) {
                  if (eq(eqMaybe(eqString))(v2.value0.value0.value0.dynFamily)(new Just(dbc.id))) {
                    return moveClosingToEnd(snoc3(append(semigroupCatQueue)(staging1)(staging2))(v2.value0.value0))(empty6)(dbc)(v2.value0.value1);
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
                if (v2 instanceof Just && v2.value0.value0 instanceof SetText) {
                  return moveClosingToEnd(staging1)(snoc3(staging2)(v2.value0.value0))(dbc)(v2.value0.value1);
                }
                ;
                if (v2 instanceof Nothing) {
                  return append(semigroupCatQueue)(staging1)(append(semigroupCatQueue)(pure(applicativeCatQueue)(new MakeCloseDynBeacon({
                    id: dbc.id + "%-%",
                    parent: dbc.parent,
                    pos: dbc.pos,
                    scope: dbc.scope,
                    dynFamily: dbc.dynFamily
                  })))(staging2));
                }
                ;
                throw new Error("Failed pattern match at Deku.SSR (line 120, column 63 - line 171, column 20): " + [v2.constructor.name]);
              }(uncons3($322));
            };
          };
        };
      };
      var moveClosingsToEnd = function(cl) {
        return function($323) {
          return function(v2) {
            if (v2 instanceof Just && v2.value0.value0 instanceof MakeCloseDynBeacon) {
              return moveClosingsToEnd(moveClosingToEnd(empty6)(empty6)(v2.value0.value0.value0)(cl))(v2.value0.value1);
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
            throw new Error("Failed pattern match at Deku.SSR (line 107, column 45 - line 112, column 20): " + [v2.constructor.name]);
          }(unsnoc3($323));
        };
      };
      var doDeleteFromCache = function(cl) {
        return function(id$prime) {
          return function($324) {
            return function(v2) {
              if (v2 instanceof Just && v2.value0.value0 instanceof MakeElement) {
                var $172 = v2.value0.value0.value0.id === id$prime;
                if ($172) {
                  return doDeleteFromCache(cl)(id$prime)(v2.value0.value1);
                }
                ;
                return doDeleteFromCache(snoc3(cl)(v2.value0.value0))(id$prime)(v2.value0.value1);
              }
              ;
              if (v2 instanceof Just && v2.value0.value0 instanceof MakeText) {
                var $178 = v2.value0.value0.value0.id === id$prime;
                if ($178) {
                  return doDeleteFromCache(cl)(id$prime)(v2.value0.value1);
                }
                ;
                return doDeleteFromCache(snoc3(cl)(v2.value0.value0))(id$prime)(v2.value0.value1);
              }
              ;
              if (v2 instanceof Just && v2.value0.value0 instanceof MakePursx) {
                var $184 = v2.value0.value0.value0.id === id$prime;
                if ($184) {
                  return doDeleteFromCache(cl)(id$prime)(v2.value0.value1);
                }
                ;
                return doDeleteFromCache(snoc3(cl)(v2.value0.value0))(id$prime)(v2.value0.value1);
              }
              ;
              if (v2 instanceof Just && v2.value0.value0 instanceof MakeOpenDynBeacon) {
                var $190 = v2.value0.value0.value0.id === id$prime;
                if ($190) {
                  return doDeleteFromCache(cl)(id$prime)(v2.value0.value1);
                }
                ;
                return doDeleteFromCache(snoc3(cl)(v2.value0.value0))(id$prime)(v2.value0.value1);
              }
              ;
              if (v2 instanceof Just && v2.value0.value0 instanceof MakeCloseDynBeacon) {
                var $196 = v2.value0.value0.value0.id === id$prime;
                if ($196) {
                  return doDeleteFromCache(cl)(id$prime)(v2.value0.value1);
                }
                ;
                return doDeleteFromCache(snoc3(cl)(v2.value0.value0))(id$prime)(v2.value0.value1);
              }
              ;
              if (v2 instanceof Just && v2.value0.value0 instanceof SetProp) {
                var $202 = v2.value0.value0.value0.id === id$prime;
                if ($202) {
                  return doDeleteFromCache(cl)(id$prime)(v2.value0.value1);
                }
                ;
                return doDeleteFromCache(snoc3(cl)(v2.value0.value0))(id$prime)(v2.value0.value1);
              }
              ;
              if (v2 instanceof Just && v2.value0.value0 instanceof SetText) {
                var $208 = v2.value0.value0.value0.id === id$prime;
                if ($208) {
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
              throw new Error("Failed pattern match at Deku.SSR (line 241, column 49 - line 263, column 20): " + [v2.constructor.name]);
            }(uncons3($324));
          };
        };
      };
      var doEliminations = function(cl) {
        return function($325) {
          return function(v2) {
            if (v2 instanceof Just && v2.value0.value0 instanceof RenderableInstruction) {
              return doEliminations(snoc3(cl)(v2.value0.value0.value0))(v2.value0.value1);
            }
            ;
            if (v2 instanceof Just && (v2.value0.value0 instanceof EliminatableInstruction && v2.value0.value0.value0 instanceof SendToPos)) {
              return doEliminations(map(functorCatQueue)(sendPos(v2.value0.value0.value0.value0.id)(v2.value0.value0.value0.value0.pos))(cl))(v2.value0.value1);
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
              return doEliminations(map(functorCatQueue)(removeParent(v2.value0.value0.value0.value0.id))(cl))(v2.value0.value1);
            }
            ;
            if (v2 instanceof Just && (v2.value0.value0 instanceof EliminatableInstruction && v2.value0.value0.value0 instanceof RemoveDynBeacon)) {
              return doEliminations(doDeleteFromCache(empty6)(v2.value0.value0.value0.value0.id)(cl))(v2.value0.value1);
            }
            ;
            if (v2 instanceof Just && (v2.value0.value0 instanceof EliminatableInstruction && v2.value0.value0.value0 instanceof DeleteFromCache)) {
              return doEliminations(doDeleteFromCache(empty6)(v2.value0.value0.value0.value0.id)(cl))(v2.value0.value1);
            }
            ;
            if (v2 instanceof Nothing) {
              return cl;
            }
            ;
            throw new Error("Failed pattern match at Deku.SSR (line 172, column 42 - line 193, column 20): " + [v2.constructor.name]);
          }(uncons3($325));
        };
      };
      var asList = fromFoldable4(foldableArray)(aa);
      var beforeClosingsMoved = doEliminations(empty6)(asList);
      var go2 = moveClosingsToEnd(empty6)(beforeClosingsMoved);
      return go2;
    };
    var arr = instructionsToRenderableInstructions(arr$prime);
    var v = function(x) {
      return {
        parentToChild: mapFlipped(functorMap)(x.parentToChild)(function() {
          var $326 = map(functorArray)(function(v1) {
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
            throw new Error("Failed pattern match at Deku.SSR (line 303, column 23 - line 310, column 45): " + [v1.constructor.name]);
          });
          var $327 = compact(compactableArray);
          var $328 = map(functorArray)(function(i2) {
            return bind(bindMaybe)(lookup2(ordString)(i2)(x.idToActions))(head);
          });
          return function($329) {
            return $326(fromSortableDyns(sortSortableDyns(toSortableDyns($327($328($329))))));
          };
        }()),
        idToActions: x.idToActions
      };
    }(execState(traverse(traversableCatQueue)(applicativeStateT(monadIdentity))(function(i2) {
      if (i2 instanceof MakeElement) {
        return for_(applicativeStateT(monadIdentity))(foldableMaybe)(i2.value0.parent)(function(p2) {
          return making(p2)(i2.value0.id)(i2);
        });
      }
      ;
      if (i2 instanceof MakeText) {
        return for_(applicativeStateT(monadIdentity))(foldableMaybe)(i2.value0.parent)(function(p2) {
          return making(p2)(i2.value0.id)(i2);
        });
      }
      ;
      if (i2 instanceof MakePursx) {
        return for_(applicativeStateT(monadIdentity))(foldableMaybe)(i2.value0.parent)(function(p2) {
          return making(p2)(i2.value0.id)(i2);
        });
      }
      ;
      if (i2 instanceof MakeOpenDynBeacon) {
        return for_(applicativeStateT(monadIdentity))(foldableMaybe)(i2.value0.parent)(function(p2) {
          return making(p2)(i2.value0.id)(i2);
        });
      }
      ;
      if (i2 instanceof MakeCloseDynBeacon) {
        return for_(applicativeStateT(monadIdentity))(foldableMaybe)(i2.value0.parent)(function(p2) {
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
      throw new Error("Failed pattern match at Deku.SSR (line 318, column 19 - line 329, column 45): " + [i2.constructor.name]);
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
      return intercalate2(foldableArray)(monoidString)(" ")(filterMap(filterableArray)(function(v1) {
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
      })(lookup2(ordString)(id2)(v.idToActions));
    };
    var o = function(id2) {
      var elts = fromMaybe([])(lookup2(ordString)(id2)(v.parentToChild));
      return foldMap(foldableArray)(monoidString)(singleElt)(elts);
    };
    var oo = function(id2) {
      return foldl(foldableMap)(function(b2) {
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
          throw new Error("Failed pattern match at Deku.SSR (line 351, column 17 - line 355, column 14): " + [v1.constructor.name]);
        };
      })(o(id2))(v.idToActions);
    };
    return "<" + (topTag + (' data-deku-ssr="deku-root" data-deku-root="' + (rootId + ('">' + (oo(rootId) + ("</" + (topTag + ">")))))));
  };
};

// output/Deku.Toplevel/index.js
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
        ids: function() {
          var $27 = unwrap();
          return function($28) {
            return function(v) {
              return v.ids;
            }($27($28));
          };
        }(),
        disconnectElement: function(v) {
          return function(v1) {
            return v.disconnectElement({
              id: v1.id,
              scope: v1.scope,
              parent: v1.parent,
              scopeEq: eq(eqScope)
            });
          };
        },
        toElt: function(v) {
          return v;
        }
      })(a2)(b2)(coerce()(c));
    };
  };
};
var runSSR$prime = function(topTag) {
  return function(v) {
    return function(children) {
      return map(functorST)(function() {
        var $29 = ssr$prime(topTag);
        return function($30) {
          return function(v1) {
            return v.head + v1;
          }(function(v1) {
            return v1 + v.tail;
          }($29($30)));
        };
      }())(liftST(monadSTST)(function __do3() {
        var seed = newSTRef(0)();
        var instr = newSTRef([])();
        var di = ssrDOMInterpret(seed);
        $$void(functorST)(subscribePure(__internalDekuFlatten4({
          parent: new Just("deku-root"),
          scope: new Local("rootScope"),
          raiseId: function(v1) {
            return pure(applicativeST)(unit);
          },
          ez: true,
          pos: Nothing.value,
          dynFamily: Nothing.value
        })(di)(children))(function(i2) {
          return i2(instr);
        }))();
        return read2(instr)();
      }));
    };
  };
};
var runSSR = /* @__PURE__ */ runSSR$prime("body");

// output/Deku.Example.Docs.SSR/index.js
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
      return div_([p_([text_("Here's an example of SSR in deku.\nAll of the static bits are rendered as HTML,\nand all of the dynamic bits are hydrated on page load.")]), button(click_(attrOnClickEffectUnit)(push2.buttonClicked(unit)))([text_("Click")]), div_([text(alt(altEvent)(pure(applicativeEvent)("Val: 0"))(map(functorEvent)(function() {
        var $2 = append(semigroupString)("Val: ");
        var $3 = show(showInt);
        return function($4) {
          return $2($3($4));
        };
      }())(fold3(eventIsEvent)(function(a2) {
        return function(v) {
          return 1 + a2 | 0;
        };
      })(-1 | 0)(alt(altEvent)(pure(applicativeEvent)(unit))(event.buttonClicked)))))]), div_([input(slider(pure(applicativeEvent)(push2.sliderMoved)))([]), div_([text(alt(altEvent)(pure(applicativeEvent)("Val: 50"))(map(functorEvent)(function() {
        var $5 = append(semigroupString)("Val: ");
        var $6 = show(showNumber);
        return function($7) {
          return $5($6($7));
        };
      }())(event.sliderMoved)))])])]);
    };
  });
}();
var ssrPage = function(v) {
  return makePursx({
    reflectType: function() {
      return "<div>\n  <h1>Server-side rendering</h1>\n\n  <h2>When performance matters!</h2>\n  <p>\n    In web development, it's good practice to send a plain-HTML version of your site over the wire before any JavaScript starts executing. This is called <i>server-side rendering</i>, or SSR, where the server renders HTML in an initial pass before rendering any JavaScript.\n  </p>\n  <p>\n    The most performant form of SSR is pre-rendering HTML and serving them from memory or from a file system. This is Deku's strategy via the following two functions:\n  </p>\n  <ul>\n    <li><code>runSSR</code> generates HTML; and</li>\n    <li><code>hydrate</code> generates JavaScript that will hydrate your HTML with anything that's dynamic. Note that this is <i>partial</i> hydration, meaning it will only hydrate the bits that need hydrating. This means that, for example, you can do CSS animations on load without fear of jank when the JavaScript kicks in.</li>\n  </ul>\n\n  <p>\n    This documentation is generated using SSR, and if you add <code>view-source:</code> before the URL, you'll see the intro page rendered as HTML. If you're reading this documentation on a computer screen, you won't see much of a difference, but if you're reading it on a 3G mobile network, you'll spot the difference immedaitely.\n  </p>\n\n  <h2>A motivating example</h2>\n\n  <p>Here is a small application using SSR. We'll split it up into three files:</p>\n  <ul>\n    <li><code>App.purs</code> has our application logic.</li>\n    <li><code>Build.purs</code> creates a <code>.js</code> file, for example <code>make.js</code>, that will render our HTML.</li>\n    <li><code>Live.purs</code> uses hydration to add dynamic logic to the website.</li>\n  </ul>\n\n  <h3>App</h3>\n  <p>Unlike the previous examples that used <code>runInBody</code>, our application code here has an explicit type annotation <code>Nut</code>. The definition of <code>Nut</code> is <code>type Nut = forall s m lock payload. Korok s m => Domable m lock payload</code>, and in larger projects, you may need to write this type out explicitly, for example if you are working with an <code>Array</code> of <code>Domable</code> and need <code>m</code> to be consistant over the <code>Array</code>.</p>\n  ~code0~\n  <h3>Build</h3>\n  <p>This is the code we use to generate our HTML site. The example below creates a small script that logs our HTML to the command line,but we can also call <code>runSSR</code> from a NodeJS server, in which case we wouldn't <code>log</code> the HTML string but rather we would instead send it over the wire as the response to a request.</p>\n  ~code1~\n  <h3>Live</h3>\n  <p><code>Live.purs</code> can be bundled to generate our dynamic JS. The JS will hydrate our elements instead of replacing them, and will only hydrate elements that potentially will interactive content.</p>\n  ~code2~\n\n  <h3>Result</h3>\n\n  <p>Here is the resulting code from our static-site generation. It is rendered dynamically in your browser, but in production settings, we'd use NodeJS to render or pre-render this HTML.</p>\n\n  ~codegen~\n\n  <p>And here is what the result looks like after hydration.</p>\n\n  <blockquote> ~result~ </blockquote>\n\n  <p>One important thing to note about SSR is that it leaves a lot of things out. For example, it will not respond to send-to-position requests if they are emitted immediately. These are only evaluated on the client once a document is rendered. For this reason, it is recommended to <i>only</i> use SSR for elements that should be statically rendered, like a loading screen or blog. If you need your initial HTML to reflect lots of inserting and deleting of dynamic nodes, deku SSR may not work for you yet.</p>\n\n  <h2>Parting shot</h2>\n  <p>Thanks for checking out Deku! I had a blast writing it, and I hope you enjoy using it for your projects!</p>\n</div>";
    }
  })()()(pursxToElementConsInsert()(pursxToElementConsInsert()(pursxToElementConsInsert()(pursxToElementConsInsert()(pursxToElementConsInsert()(pursxToElementNil)({
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
  }))(px10)({
    code2: nut(pre_([code_([text_(live)])])),
    code1: nut(pre_([code_([text_(build2)])])),
    code0: nut(pre_([code_([text_(app)])])),
    result: nut(app2),
    codegen: nut(pre_([code_([text(makePureEvent(function(k) {
      return applySecond(applyST)(bind(bindST)(runSSR({
        head: '<!DOCTYPE html><html><head><script src="bundle.js" defer><\/script></head>',
        tail: "</html>"
      })(app2))(k))(pure(applicativeST)(pure(applicativeST)(unit)));
    }))])]))
  });
};

// output/Deku.Example.Docs.Scene/index.js
var scene = function(options2) {
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
    throw new Error("Failed pattern match at Deku.Example.Docs.Scene (line 95, column 3 - line 95, column 25): " + [v.constructor.name]);
  };
  var page = function(dpage) {
    return function(i2) {
      return go2(i2)({
        dpage,
        slug: options2.slug
      });
    };
  };
  return bussed(function(push2) {
    return lcmap(profunctorFn)(function(v) {
      return alt(altEvent)(pure(applicativeEvent)(options2.startsWith))(v);
    })(function(event) {
      return div_([div_(map(functorArray)(function(v) {
        return span_([a(oneOfMap(foldableArray)(plusEvent)(pure(applicativeEvent))([attr(attrOnClickCb)(OnClick.value)(cb(function(e) {
          return applySecond(applyEffect)(preventDefault(e))(push2(v.value0));
        })), attr(attrA_StyleString)(Style.value)("cursor:pointer;"), attr(attrA_HrefString)(Href.value)(options2.slug + v.value1.value1.value0)]))([text_(v.value1.value0)]), span(pure(applicativeEvent)(attr(attrSpan_StyleString)(Style.value)(function() {
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
  linkSync,
  symlinkSync,
  readlinkSync,
  realpathSync,
  unlinkSync,
  rmdirSync,
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

// output/Node.FS.Internal/index.js
var mkEffect = unsafeCoerce;

// output/Node.FS.Sync/index.js
var readTextFile = function(encoding2) {
  return function(file) {
    return mkEffect(function(v) {
      return readFileSync(file, {
        encoding: show(showEncoding)(encoding2)
      });
    });
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
var main2 = function __do2() {
  var args = argv();
  var options2 = maybe(pure(applicativeEffect)({
    pageString: "Intro",
    startsWith: Intro.value,
    slug: "/",
    top: true
  }))(function(f) {
    return function __do3() {
      var s2 = readTextFile(UTF8.value)(f)();
      var parsed = either(function(e) {
        return throwException(error("cannot convert string to json: " + (s2 + (" err: " + show(showString)(e)))));
      })(pure(applicativeEffect))(jsonParser(s2))();
      var decoded = either(function(e) {
        return throwException(error("cannot decode json: " + (s2 + (" err: " + show(showJsonDecodeError)(e)))));
      })(pure(applicativeEffect))(decode(object("Info")(record2()(rowListCodecCons(rowListCodecCons(rowListCodecCons(rowListCodecNil)()()({
        reflectSymbol: function() {
          return "top";
        }
      })(refl))()()({
        reflectSymbol: function() {
          return "slug";
        }
      })(refl))()()({
        reflectSymbol: function() {
          return "page";
        }
      })(refl))({
        page: string,
        slug: string,
        top: $$boolean
      })))(parsed))();
      var page = maybe(throwException(error("cannot parse page: " + decoded.page)))(pure(applicativeEffect))(stringToPage(decoded.page))();
      return {
        pageString: decoded.page,
        top: decoded.top,
        startsWith: page,
        slug: decoded.slug
      };
    };
  })(index(args)(2))();
  return bind(bindEffect)(toEffect(runSSR({
    head: '<!DOCTYPE html>\n  <html>\n    <head>\n      <title>Deku documentation</title>\n      <meta charset="UTF-8">\n      <meta name="viewport" content="width=device-width">\n      <link rel="stylesheet" href=' + (function() {
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
    }() + (';\n        main({"startsWith":' + ('"' + (options2.pageString + ('"' + (',"slug":' + ('"' + (options2.slug + '"})();\n      <\/script>\n    </head>')))))))))),
    tail: "</html>"
  })(scene(options2))))(log2)();
};

// <stdin>
main2();
