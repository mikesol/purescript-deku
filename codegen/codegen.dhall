{ name = "kievit-fragments"
, dependencies =
    [ "effect"
    , "aff"
    , "tuples"
    , "foreign-object"
    , "tuples"
    , "fetch"
    , "argonaut-codecs"
    , "console"
    , "tidy-codegen"
    , "node-buffer"
    , "node-fs-aff"
    , "node-path"
    , "language-cst-parser"
    , "argonaut-core"
    , "argonaut-generic"
    , "either"
    , "foldable-traversable"
    , "maybe"
    , "partial"
    , "prelude"
    , "transformers"
    , "ordered-collections"
    , "arrays"
    , "strings"
    , "debug"
    , "st"
    ]
, sources =
    [ "codegen/**/*.purs"
    ]
, packages = ./../packages.dhall
}