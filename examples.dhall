let conf = ./spago.dhall

in      conf
    //  { sources = conf.sources # [ "examples/**/*.purs" ]
        , dependencies =
              conf.dependencies
            # [  "arrays"
              , "web-html"
              , "filterable"
              , "affjax"
              , "aff"
              , "argonaut-core"
              , "deku-toplevel"
              , "http-methods"
              , "maybe"
              ]
        }
