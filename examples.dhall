let conf = ./spago.dhall

in      conf
    //  { sources = conf.sources # [ "examples/**/*.purs" ]
        , dependencies =
              conf.dependencies
            # [ "web-html"
              , "filterable"
              , "affjax"
              , "either"
              , "aff"
              , "argonaut-core"
              , "deku-toplevel"
              , "http-methods"
              , "maybe"
              ]
        }
