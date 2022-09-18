{ name = "deku"
, dependencies =
  [ "aff"
  , "arrays"
  , "bolson"
  , "catenable-lists"
  , "control"
  , "effect"
  , "fast-vect"
  , "filterable"
  , "foldable-traversable"
  , "foreign-object"
  , "hyrule"
  , "maybe"
  , "newtype"
  , "ordered-collections"
  , "prelude"
  , "profunctor"
  , "quickcheck"
  , "record"
  , "safe-coerce"
  , "st"
  , "strings"
  , "transformers"
  , "tuples"
  , "unsafe-coerce"
  , "web-dom"
  , "web-events"
  , "web-html"
  , "web-uievents"
  ]
, license = "Apache-2.0"
, packages = ./packages.dhall
, repository = "https://github.com/mikesol/purescript-deku"
, sources = [ "src/**/*.purs" ]
}
