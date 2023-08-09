{ name = "deku"
, dependencies =
  [ "aff"
  , "arrays"
  , "bolson"
  , "catenable-lists"
  , "control"
  , "css"
  , "debug"
  , "effect"
  , "either"
  , "exceptions"
  , "fast-vect"
  , "filterable"
  , "foldable-traversable"
  , "foreign-object"
  , "hyrule"
  , "lists"
  , "maybe"
  , "newtype"
  , "nonempty"
  , "ordered-collections"
  , "prelude"
  , "profunctor"
  , "record"
  , "safe-coerce"
  , "st"
  , "strings"
  , "stringutils"
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
