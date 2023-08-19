let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.7-20230227/packages.dhall
        sha256:0168e165b4cdb40ab6f7e01448075680097791c8d98f96d684b20d1eef96f3d0

in  upstream
  with hyrule =
    { dependencies =
      [ "ordered-collections"
      , "unsafe-reference"
      , "js-timers"
      ]
    , repo = "https://github.com/mikesol/purescript-hyrule.git"
    , version = "fantasy-land2"
    }
  with bolson =
    { dependencies =
      [ "hyrule"
      ]
    , repo = "https://github.com/mikesol/purescript-bolson.git"
    , version = "fantasy-land2"
    }
  with tidy =
    { dependencies =
        [ "arrays"
        , "dodo-printer"
        , "foldable-traversable"
        , "lists"
        , "maybe"
        , "ordered-collections"
        , "partial"
        , "prelude"
        , "language-cst-parser"
        , "strings"
        , "tuples"
        ]
      , repo = "https://github.com/natefaubion/purescript-tidy.git"
      , version = "v0.9.0"
      }
  with tidy-codegen =
    { dependencies =
      [ "aff"
      , "ansi"
      , "arrays"
      , "avar"
      , "bifunctors"
      , "console"
      , "control"
      , "dodo-printer"
      , "effect"
      , "either"
      , "enums"
      , "exceptions"
      , "filterable"
      , "foldable-traversable"
      , "free"
      , "identity"
      , "integers"
      , "language-cst-parser"
      , "lazy"
      , "lists"
      , "maybe"
      , "newtype"
      , "node-buffer"
      , "node-child-process"
      , "node-fs-aff"
      , "node-path"
      , "node-process"
      , "node-streams"
      , "ordered-collections"
      , "parallel"
      , "partial"
      , "posix-types"
      , "prelude"
      , "record"
      , "safe-coerce"
      , "st"
      , "strings"
      , "tidy"
      , "transformers"
      , "tuples"
      , "type-equality"
      , "unicode"
      ]
    , repo = "https://github.com/natefaubion/purescript-tidy-codegen"
    , version = "v3.0.0"
    }