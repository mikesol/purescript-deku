let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.2-20220624/packages.dhall
        sha256:08989ed9f53e381f879f1b7012ad7684b1ed64d7164c4ad75e306d3210a46c92

let overrides =
      { bolson =
        { dependencies = [ "prelude" ]
        , repo = "https://github.com/mikesol/purescript-bolson.git"
        , version = "purefunctor"
        }
        , hyrule =
        { dependencies = [ "monoid-extras", "web-uievents", "js-timers", "unsafe-reference" ]
        , repo = "https://github.com/purefunctor/purescript-hyrule.git"
        , version = "pure/zora"
        }
      }

in  upstream // overrides
